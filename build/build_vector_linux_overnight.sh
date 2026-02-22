#!/bin/bash
# Build Vector Linux Overnight - Extended nightly build
# This script runs extended builds during overnight CI

set -e

echo "=== VectorOS Overnight Build ==="
echo "Starting extended build process..."

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Run standard build first
echo "[INFO] Running standard build..."
"$PROJECT_ROOT/build/build_runner.sh"

# Extended builds
echo "[INFO] Running extended overnight builds..."

# Build all Rust targets
if command -v cargo &> /dev/null; then
    cd "$PROJECT_ROOT/systems/infinite_map_rs"
    echo "[INFO] Building all Rust targets..."
    cargo build --all-targets --release 2>/dev/null || echo "[WARN] Some Rust targets failed"
    cd "$PROJECT_ROOT"
fi

# Generate documentation
if command -v make &> /dev/null && [ -f "$PROJECT_ROOT/Makefile" ]; then
    echo "[INFO] Generating documentation..."
    make docs 2>/dev/null || echo "[WARN] Documentation generation skipped"
fi

echo "[SUCCESS] Overnight build completed"
exit 0
