#!/bin/bash
# Build Cortex Bundle - Create the neural cortex bundle
# This script bundles neural/cortex components for deployment

set -e

echo "=== Building Cortex Bundle ==="

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUNDLE_DIR="$PROJECT_ROOT/dist/cortex_bundle"

echo "[INFO] Creating bundle directory..."
mkdir -p "$BUNDLE_DIR"

# Copy neural system components
if [ -d "$PROJECT_ROOT/systems/neural" ]; then
    echo "[INFO] Bundling neural components..."
    cp -r "$PROJECT_ROOT/systems/neural" "$BUNDLE_DIR/" 2>/dev/null || true
fi

# Copy evolution daemon
if [ -d "$PROJECT_ROOT/systems/evolution_daemon" ]; then
    echo "[INFO] Bundling evolution daemon..."
    cp -r "$PROJECT_ROOT/systems/evolution_daemon" "$BUNDLE_DIR/" 2>/dev/null || true
fi

# Copy visual shell
if [ -d "$PROJECT_ROOT/systems/visual_shell" ]; then
    echo "[INFO] Bundling visual shell..."
    cp -r "$PROJECT_ROOT/systems/visual_shell" "$BUNDLE_DIR/" 2>/dev/null || true
fi

# Copy desktop agent
if [ -d "$PROJECT_ROOT/systems/desktop_agent" ]; then
    echo "[INFO] Bundling desktop agent..."
    cp -r "$PROJECT_ROOT/systems/desktop_agent" "$BUNDLE_DIR/" 2>/dev/null || true
fi

echo "[SUCCESS] Cortex bundle created at $BUNDLE_DIR"
exit 0
