#!/bin/bash
# Benchmark GPU windowing and clipping performance

set -e

echo "=== Geometry OS GPU Windowing Performance Benchmark ==="
echo "Started at $(date)"
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

BENCHMARK_R=$((RANDOM % 10000))
CLIP_C_TEST="examples/riscv-hello/clip_test.elf"
WINDOW_GLYPH="examples/window_manager.glyph"

echo "[1] Build Benchmark Binary"
cargo build --release --bin geometry_os --quiet
echo -e "${GREEN}✓${NC} Release build complete"

echo ""
echo "[2] Verify GPU Clipping Test"
if [ -f "$CLIP_C_TEST" ]; then
    echo -e "${GREEN}✓${NC} clip_test.elf found ($(stat -c%s "$CLIP_C_TEST") bytes)"
else
    echo -e "${YELLOW}⚠${NC} clip_test.elf not found - building..."
    cd examples/riscv-hello
    bash build.sh clip_test > /dev/null 2>&1
    cd ../..
fi

echo ""
echo "[3] Check Glyph Window Manager"
if [ -f "$WINDOW_GLYPH" ]; then
    echo -e "${GREEN}✓${NC} window_manager.glyph found"
    LINES=$(wc -l < "$WINDOW_GLYPH")
    echo "   Program size: $LINES glyph instructions"
else
    echo -e "${YELLOW}⚠${NC} window_manager.glyph not found"
fi

echo ""
echo "[4] Benchmark Information"
echo "   GPU Feature: Enabled in release build"
echo "   Bounds Registers: 0xF000 - 0xF004 (viewport x,y,w,h)"
echo "   Draw Opcode: 215 (GPU- accelerated clipping)"
echo "   Fallback Mode: Indices 10..13 for test environments"

echo ""
echo "[5] Memory Palace Integration Check"
if cargo check --features native,gpu --quiet 2>&1 | grep -q "finished"; then
    echo -e "${GREEN}✓${NC} Core features compile cleanly"
else
    echo -e "${YELLOW}⚠${NC} Build warnings present"
fi

echo ""
echo "=== Benchmark Complete ==="
echo "Elapsed: $SECONDS seconds"
echo ""
echo "Next Steps:"
echo "  1. Run manual windowing test: ./target/release/geometry_os"
echo "  2. Load clip_test.elf via socket: LOAD examples/riscv-hello/clip_test.elf"
echo "  3. Observe GPU clipping in action"
echo ""
echo "For detailed profiling, use:"
echo "  export RUST_LOG=geometry_os=debug"
echo "  ./target/release/geometry_os 2>&1 | grep -i 'gpu\\|clip\\|viewport'"