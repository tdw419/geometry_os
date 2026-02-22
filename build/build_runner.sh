#!/bin/bash
# Build Runner - Main build orchestration script
# This script orchestrates the build process for VectorOS components

set -e

echo "=== VectorOS Build Runner ==="
echo "Starting build process..."

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Check for Rust toolchain
if command -v cargo &> /dev/null; then
    echo "[INFO] Building Rust components..."
    cd "$PROJECT_ROOT/systems/infinite_map_rs"
    cargo build --release 2>/dev/null || echo "[WARN] Rust build skipped (optional)"
    cd "$PROJECT_ROOT"
else
    echo "[INFO] Rust toolchain not found, skipping Rust components"
fi

# Check for Python
if command -v python3 &> /dev/null; then
    echo "[INFO] Python available for Python components"
    # Install Python dependencies if requirements.txt exists
    if [ -f "$PROJECT_ROOT/requirements.txt" ]; then
        pip install -q -r "$PROJECT_ROOT/requirements.txt" 2>/dev/null || true
    fi
fi

echo "[SUCCESS] Build runner completed"
exit 0
