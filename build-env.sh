ROOT=$PWD
PROFILE=$ROOT/profile
TOOLCHAIN=$ROOT/toolchain

export GIT_SSL_CAINFO=/etc/ssl/certs/ca-certificates.crt
export SSL_CERT_DIR=/etc/ssl/certs
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
export GUIX_LD_WRAPPER_ALLOW_IMPURITIES=y

export PATH=$PROFILE/bin:$PROFILE/sbin
export C_INCLUDE_PATH=$PROFILE/include
export CPLUS_INCLUDE_PATH=$PROFILE/include
export LIBRARY_PATH=$PROFILE/lib

export ACLOCAL_PATH=$PROFILE/share/aclocal
export BASH_LOADABLES_PATH=$PROFILE/lib/bash
export CMAKE_PREFIX_PATH=$PROFILE/
export GIT_EXEC_PATH=$PROFILE/libexec/git-core
export TERMINFO_DIRS=$PROFILE/share/terminfo
export PKG_CONFIG_PATH=$PROFILE/lib/pkgconfig
export PYTHONPATH=$PROFILE/lib/python2.7/site-packages
export INFOPATH=$PROFILE/share/info

##
GCC_LIB=$(dirname $(dirname $(readlink profile/lib/libgcc_s.so.1)))
export PATH=$TOOLCHAIN/bin:$PATH
export LIBRARY_PATH=$TOOLCHAIN/lib:$GCC_LIB/lib:$LIBRARY_PATH
## (libgcc_s.so.1) needed to run bootstrap cargo and bootstrap rustc
## (libLLVM-6.0svn.so) needed to build rustc
export LD_LIBRARY_PATH=$TOOLCHAIN/lib:$GCC_LIB/lib
export RUST_BACKTRACE=1
