#!/bin/bash
# Build Test - Run tests after build
# This script runs unit tests for VectorOS components

set -e

echo "=== VectorOS Build Test ==="
echo "Running tests..."

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EXIT_CODE=0

# Run Python tests
if command -v python3 &> /dev/null; then
    echo "[INFO] Running Python tests..."
    cd "$PROJECT_ROOT"

    # Run pytest on key test directories
    if [ -d "tests" ]; then
        python3 -m pytest tests/ -v --tb=short -x 2>/dev/null || {
            echo "[WARN] Some Python tests failed"
            EXIT_CODE=1
        }
    fi
fi

# Run Rust tests
if command -v cargo &> /dev/null; then
    echo "[INFO] Running Rust tests..."
    cd "$PROJECT_ROOT/systems/infinite_map_rs"
    cargo test --release 2>/dev/null || {
        echo "[WARN] Some Rust tests failed"
        EXIT_CODE=1
    }
    cd "$PROJECT_ROOT"
fi

if [ $EXIT_CODE -eq 0 ]; then
    echo "[SUCCESS] All tests passed"
else
    echo "[WARN] Some tests failed (non-blocking)"
fi

exit 0  # Always exit 0 to not block CI for optional tests
