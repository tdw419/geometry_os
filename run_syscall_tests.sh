#!/bin/bash
# Run syscall test through hypervisor
#
# This boots the compiled test_syscalls binary through the RISC-V hypervisor,
# exercising the pixel-native syscall implementations.

set -e

cd "$(dirname "$0")"

# Check if test binary exists
if [ ! -f "native/test_syscalls" ]; then
    echo "ERROR: native/test_syscalls not found"
    echo "Build it first: cd native && ./build_test_syscalls.sh"
    exit 1
fi

echo "=== Running pixel-native syscall tests through hypervisor ==="
echo ""
echo "Kernel: native/test_syscalls"
echo "Tests: mkdir, rmdir, chdir, getcwd, dup2"
echo ""

# Build hypervisor if needed
echo "Building hypervisor..."
cargo build --quiet --release 2>/dev/null || true

# Run through hypervisor
echo "Launching hypervisor..."
echo ""
cargo run --release -- --cli --user native/test_syscalls