#!/bin/bash

# Test script to verify RISC-V ecall detection

cd /home/jericho/projects/zion/projects/geometry_os/geometry_os/systems/infinite_map_rs

# Run the test with RUST_LOG=info to see all debug output
echo "Running test_spatial_alloc_e2e_simple with RUST_LOG=info..."
RUST_LOG=info cargo test --test test_spatial_alloc_e2e_simple 2>&1 | grep -E "(VM.*triggered|Processing Syscall|Spatial allocation|ecall detected|0x123|291|phase 5)"

echo ""
echo "Full output:"
cargo test --test test_spatial_alloc_e2e_simple 2>&1 | tail -80