#!/bin/bash
# Run test and capture actual stdout/stderr from the RISC-V program
cd /home/jericho/projects/zion/projects/geometry_os/geometry_os
timeout 60 cargo run --release -- --kernel native/test_syscalls --nographic 2>&1 > /tmp/hypervisor_output.txt &
HV_PID=$!

# Wait for hypervisor to start and run tests
sleep 5

# Check for test results in the output
echo "=== Captured Output ===" > /tmp/test_results.txt
grep -E "(Pixel-Native|TEST|PASS|FAIL|SUMMARY|Total|Passed|Failed)" /tmp/hypervisor_output.txt >> /tmp/test_results.txt 2>/dev/null

# Try to find any raw bytes that might be the write() syscall output
strings /tmp/hypervisor_output.txt | grep -A 5 -B 5 "Pixel" >> /tmp/test_results.txt 2>/dev/null

cat /tmp/test_results.txt

# Wait for process to finish or timeout
wait $HV_PID 2>/dev/null || true

# Try a different approach - check if we can access console output
echo ""
echo "=== Checking for console buffer ==="