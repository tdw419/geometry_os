#!/bin/bash
# Build syscall test program for RISC-V hypervisor

set -e

cd "$(dirname "$0")"

echo "=== Building pixel-native syscall test suite ==="

# Check for cross-compiler
if ! command -v riscv64-unknown-elf-gcc &> /dev/null; then
    echo "ERROR: riscv64-unknown-elf-gcc not found"
    echo "Install with: sudo apt install gcc-riscv64-unknown-elf"
    exit 1
fi

# Build test_syscalls as 32-bit RISC-V (matching hypervisor expectations)
echo "Compiling test_syscalls_entry.S..."
riscv64-unknown-elf-gcc \
    -c \
    -march=rv32imac_zicsr \
    -mabi=ilp32 \
    -o test_syscalls_entry.o \
    test_syscalls_entry.S

echo "Compiling test_syscalls.c..."
riscv64-unknown-elf-gcc \
    -static \
    -Os \
    -nostdlib \
    -fno-builtin \
    -fno-stack-protector \
    -ffreestanding \
    -march=rv32imac_zicsr \
    -mabi=ilp32 \
    -c \
    -o test_syscalls.o \
    test_syscalls.c

echo "Linking test_syscalls..."
riscv64-unknown-elf-gcc \
    -march=rv32imac_zicsr \
    -mabi=ilp32 \
    -nostdlib \
    -T test_syscalls.ld \
    -o test_syscalls \
    test_syscalls_entry.o \
    test_syscalls.o

if [ $? -eq 0 ]; then
    echo "✓ Built: native/test_syscalls"
    
    # Verify the ELF format
    echo ""
    echo "Binary verification:"
    file test_syscalls
    riscv64-unknown-elf-readelf -h test_syscalls | grep -E "Class|Machine|Entry"
    
    echo ""
    echo "Run through hypervisor:"
    echo "  cargo run -- --kernel native/test_syscalls"
else
    echo "✗ Build failed"
    exit 1
fi