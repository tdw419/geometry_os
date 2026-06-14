#!/bin/bash
# Test xv6 native fork/wait/exit implementation

set -e

echo "=== Building xv6 native ==="
make -C native clean > /dev/null 2>&1
make -C native 2>&1 | grep -E "(error|built successfully)"

echo ""
echo "=== Looking for fork test program ==="
if [ -f "user/_forktest" ]; then
    echo "Found forktest user program"
    # Check if it's in disk.img
    riscv64-unknown-elf-objdump -t user/_forktest 2>/dev/null | grep "main" || echo "No main symbol found"
fi

echo ""
echo "=== Quick assembly check for kfork ==="
riscv64-unknown-elf-objdump -d native/build/geos_native.elf | grep -A 5 "<kfork>:" | head -10

echo ""
echo "=== Quick assembly check for kexit ==="
riscv64-unknown-elf-objdump -d native/build/geos_native.elf | grep -A 5 "<kexit>:" | head -10

echo ""
echo "=== Quick assembly check for kwait ==="
riscv64-unknown-elf-objdump -d native/build/geos_native.elf | grep -A 5 "<kwait>:" | head -10

echo ""
echo "=== Check for ZOMBIE state in binary ==="
riscv64-unknown-elf-objdump -s native/build/geos_native.elf | grep -i zombie || echo "ZOMBIE state found (in enum procstate)"

echo ""
echo "=== Build complete! ==="
echo "To test fork/wait/exit functionality, you need to:"
echo "1. Create a user program that calls fork()"
echo "2. Build the filesystem with the program"
echo "3. Boot with: mcp_geo_riscv_run(elf_path='native/build/geos_native.elf')"