#!/bin/bash
# Geometry OS Kernel Module Test Runner

set -e

echo "═════════════════════════════════════════════════════════════"
echo "  Geometry OS Kernel Module - Phase 3 Test"
echo "═════════════════════════════════════════════════════════════"
echo ""

# Check if module is already loaded
if lsmod | grep -q geometry_os; then
    echo "[*] Module already loaded, unloading first..."
    sudo rmmod geometry_os || true
fi

# Load module
echo "[1] Loading kernel module..."
sudo insmod geometry_os.ko

# Check device
echo "[2] Checking /dev/geometry_os..."
if [ -e /dev/geometry_os ]; then
    ls -la /dev/geometry_os
else
    echo "    ✗ Device not found!"
    sudo rmmod geometry_os
    exit 1
fi

# Check dmesg
echo "[3] Kernel messages:"
sudo dmesg | tail -10 | grep geometry_os || true

# Run test
echo ""
echo "[4] Running userspace test..."
sudo ./test_geom_os

# Unload
echo ""
echo "[5] Unloading module..."
sudo rmmod geometry_os

echo ""
echo "═════════════════════════════════════════════════════════════"
echo "  Phase 3 Test Complete"
echo "═════════════════════════════════════════════════════════════"
