#!/bin/bash
# Test script for xv6 native fork/wait/exit functionality
#
# Prerequisites:
# 1. Geometry OS server must be running with MCP connection
# 2. disk.img must contain /fork_test program
# 3. geos_native.elf must be built with kfork(), kwait(), kexit()

set -e

echo "=== xv6 Native Fork Test ==="
echo ""

# Build the native kernel
echo "Step 1: Building native kernel..."
cd /home/jericho/projects/zion/projects/geometry_os/geometry_os/native
make clean > /dev/null 2>&1
make 2>&1 | grep -E "(error|built successfully)" || true

echo ""
echo "Step 2: Verifying kernel symbols..."
echo "Checking for fork/wait/exit implementations..."

# Check if kfork exists in the binary
if riscv64-unknown-elf-objdump -t build/geos_native.elf | grep -q "<kfork>"; then
    echo "  ✓ kfork found in kernel"
else
    echo "  ✗ kfork NOT found in kernel"
    exit 1
fi

# Check if kwait exists in the binary
if riscv64-unknown-elf-objdump -t build/geos_native.elf | grep -q "<kwait>"; then
    echo "  ✓ kwait found in kernel"
else
    echo "  ✗ kwait NOT found in kernel"
    exit 1
fi

# Check if kexit exists in the binary
if riscv64-unknown-elf-objdump -t build/geos_native.elf | grep -q "<kexit>"; then
    echo "  ✓ kexit found in kernel"
else
    echo "  ✗ kexit NOT found in kernel"
    exit 1
fi

echo ""
echo "Step 3: Checking for user program..."
if [ -f "../conductor/tracks/xv6-rv32/user/_fork_test" ]; then
    echo "  ✓ /fork_test exists in user directory"
    ls -lh ../conductor/tracks/xv6-rv32/user/_fork_test
else
    echo "  ✗ /fork_test NOT found"
    exit 1
fi

echo ""
echo "Step 4: Analyzing kfork implementation..."
riscv64-unknown-elf-objdump -d build/geos_native.elf | grep -A 10 "<kfork>:" | head -15

echo ""
echo "Step 5: Analyzing kexit implementation..."
riscv64-unknown-elf-objdump -d build/geos_native.elf | grep -A 10 "<kexit>:" | head -15

echo ""
echo "Step 6: Analyzing kwait implementation..."
riscv64-unknown-elf-objdump -d build/geos_native.elf | grep -A 10 "<kwait>:" | head -15

echo ""
echo "=== Build Verification Complete ==="
echo ""
echo "To run the actual fork test, you need to:"
echo "1. Ensure Geometry OS server is running and connected"
echo "2. Run: mcp_geo_riscv_run(elf_path='native/build/geos_native.elf')"
echo "3. The kernel will load /fork_test from disk.img"
echo "4. Expected output:"
echo "   - forktest: starting"
echo "   - forktest: parent waiting for child (PID N)"
echo "   - forktest: child running (PID M)"
echo "   - forktest: child exiting with status 42"
echo "   - forktest: child exited with status 42"
echo "   - forktest: parent exiting"
echo ""
echo "If you see these messages, fork/wait/exit is working correctly!"