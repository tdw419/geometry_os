#!/bin/bash
# G-Shell AppImage Builder
# Creates a portable Linux AppImage from the Python CLI

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENT_HARNESS="$SCRIPT_DIR/agent-harness"
BUILD_DIR="$SCRIPT_DIR/build"
DIST_DIR="$SCRIPT_DIR/dist"

echo "=== G-Shell AppImage Builder ==="

# Check dependencies
command -v python3 >/dev/null || { echo "Error: python3 required"; exit 1; }
command -v pip >/dev/null || { echo "Error: pip required"; exit 1; }

# Install PyInstaller if needed
pip show pyinstaller >/dev/null 2>&1 || pip install pyinstaller

# Create build directories
mkdir -p "$BUILD_DIR" "$DIST_DIR"

# Step 1: Build standalone binary with PyInstaller
echo ""
echo "[1/4] Building standalone binary with PyInstaller..."

cd "$AGENT_HARNESS"

pyinstaller --onefile \
    --name g-shell \
    --console \
    --clean \
    --distpath "$DIST_DIR" \
    --workpath "$BUILD_DIR" \
    --add-data "cli_anything/gshell:cli_anything/gshell" \
    cli_anything/gshell/gshell_cli.py

# Step 2: Download appimagetool if not present
echo ""
echo "[2/4] Preparing AppImage tooling..."

APPIMAGETOOL="$BUILD_DIR/appimagetool"
if [ ! -f "$APPIMAGETOOL" ]; then
    ARCH=$(uname -m)
    wget -q "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-${ARCH}.AppImage" -O "$APPIMAGETOOL"
    chmod +x "$APPIMAGETOOL"
fi

# Step 3: Create AppDir structure
echo ""
echo "[3/4] Creating AppDir structure..."

APPDIR="$BUILD_DIR/G-Shell.AppDir"
mkdir -p "$APPDIR/usr/bin"
mkdir -p "$APPDIR/usr/lib"
mkdir -p "$APPDIR/usr/share/applications"
mkdir -p "$APPDIR/usr/share/icons/hicolor/256x256/apps"

# Copy binary
cp "$DIST_DIR/g-shell" "$APPDIR/usr/bin/"

# Create desktop entry
cat > "$APPDIR/usr/share/applications/g-shell.desktop" << 'EOF'
[Desktop Entry]
Name=G-Shell
Comment=AI-Native Terminal with Spatial Computing
Exec=g-shell
Icon=g-shell
Terminal=true
Type=Application
Categories=TerminalEmulator;System;
StartupNotify=true
EOF

# Create AppRun
cat > "$APPDIR/AppRun" << 'EOF'
#!/bin/bash
SELF=$(readlink -f "$0")
HERE=${SELF%/*}
export PATH="$HERE/usr/bin:$PATH"
export LD_LIBRARY_PATH="$HERE/usr/lib:$LD_LIBRARY_PATH"
exec "$HERE/usr/bin/g-shell" "$@"
EOF
chmod +x "$APPDIR/AppRun"

# Create icon (placeholder - use Python logo for now)
if [ -f "$SCRIPT_DIR/g-shell.png" ]; then
    cp "$SCRIPT_DIR/g-shell.png" "$APPDIR/usr/share/icons/hicolor/256x256/apps/g-shell.png"
    cp "$SCRIPT_DIR/g-shell.png" "$APPDIR/g-shell.png"
else
    # Create a simple icon
    convert -size 256x256 xc:#2E86AB "$APPDIR/g-shell.png" 2>/dev/null || \
        cp /usr/share/icons/hicolor/256x256/apps/terminal.png "$APPDIR/g-shell.png" 2>/dev/null || \
        echo "Icon not created - using placeholder"
fi

# Symlink for AppImage
ln -sf usr/share/applications/g-shell.desktop "$APPDIR/g-shell.desktop"
ln -sf g-shell.png "$APPDIR/.DirIcon"

# Step 4: Build AppImage
echo ""
echo "[4/4] Building AppImage..."

ARCH=$(uname -m)
OUTPUT="$DIST_DIR/G-Shell-${ARCH}.AppImage"

ARCH=x86_64 "$APPIMAGETOOL" "$APPDIR" "$OUTPUT" 2>/dev/null || {
    echo "AppImage creation failed, but standalone binary is available at:"
    echo "  $DIST_DIR/g-shell"
    exit 0
}

echo ""
echo "=== Build Complete ==="
echo ""
echo "AppImage: $OUTPUT"
echo "Binary:  $DIST_DIR/g-shell"
echo ""
echo "Usage:"
echo "  chmod +x $OUTPUT"
echo "  ./$OUTPUT --help"
