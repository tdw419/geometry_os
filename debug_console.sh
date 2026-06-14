#!/bin/bash

# Debug test - check if geometry_os is receiving commands
set -e

echo "=== Debug Test ==="

# Launch geometry_os
./target/release/geometry_os --cli > /tmp/geos_output.log 2>&1 &
GEOS_PID=$!
sleep 2

# Test basic commands
echo "[1] Testing help..."
echo "help" | nc -U /tmp/geo_cmd.sock | head -3

echo ""
echo "[2] Testing status..."
echo "status" | nc -U /tmp/geo_cmd.sock | head -3

echo ""
echo "[3] Booting QEMU..."
echo "hypervisor_boot arch=riscv64 kernel=$HOME/.geometry_os/fs/linux/rv64/Image ram=256M display=none append=console=ttyS0 root=/dev/vda append=rw disk=$HOME/.geometry_os/vmfs/ubuntu_disk.img" | nc -U /tmp/geo_cmd.sock

sleep 2

echo ""
echo "[4] Checking status after boot..."
echo "status" | nc -U /tmp/geo_cmd.sock | head -5

echo ""
echo "[5] Waiting 35s for boot..."
sleep 35

echo ""
echo "[6] Testing console (should have output)..."
echo "hypervisor_console" | nc -U /tmp/geo_cmd.sock | head -10

echo ""
echo "[7] Testing input..."
echo "hypervisor_input echo test" | nc -U /tmp/geo_cmd.sock

sleep 2

echo ""
echo "[8] Testing console again..."
echo "hypervisor_console" | nc -U /tmp/geo_cmd.sock | head -10

# Cleanup
kill $GEOS_PID 2>/dev/null || true

echo ""
echo "=== Debug Complete ==="