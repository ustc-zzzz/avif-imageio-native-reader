cmake_minimum_required(VERSION 3.24)

# set cmake toolchain
set(CMAKE_SYSTEM_NAME Darwin)
set(CMAKE_SYSTEM_PROCESSOR arm64)
set(CMAKE_OSX_ARCHITECTURES arm64)

# set xcode clang as compiler
set(CMAKE_C_COMPILER xcrun)
set(CMAKE_C_COMPILER_ARG1 clang)
set(CMAKE_C_COMPILER_ARG2 -arch)
set(CMAKE_C_COMPILER_ARG3 arm64)
set(CMAKE_CXX_COMPILER xcrun)
set(CMAKE_CXX_COMPILER_ARG1 clang++)
set(CMAKE_CXX_COMPILER_ARG2 -arch)
set(CMAKE_CXX_COMPILER_ARG3 arm64)
set(CMAKE_BUILD_TYPE=MinSizeRel)

# set ar, ranlib, and ld manually
execute_process(
  COMMAND xcrun --find ar
  OUTPUT_VARIABLE AVIF_IMAGEIO_AR
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
set(CMAKE_AR "${AVIF_IMAGEIO_AR}")
execute_process(
  COMMAND xcrun --find ranlib
  OUTPUT_VARIABLE AVIF_IMAGEIO_RANLIB
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
set(CMAKE_RANLIB "${AVIF_IMAGEIO_RANLIB}")
execute_process(
  COMMAND xcrun --find ld
  OUTPUT_VARIABLE AVIF_IMAGEIO_LD
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
set(CMAKE_EXE_LINKER_FLAGS "-fuse-ld=${AVIF_IMAGEIO_LD}")
set(CMAKE_C_COMPILER_TARGET aarch64-apple-darwin)
set(CMAKE_CXX_COMPILER_TARGET aarch64-apple-darwin)

# adjust how cmake searches for programs
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE NEVER)

# set macos minimum target
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.16")
