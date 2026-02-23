#!/bin/bash
# POC Verification Script for WordPress Web Terminal
# Run from project root: bash specs/wordpress-web-terminal/verify_poc.sh

echo "=========================================="
echo "WordPress Web Terminal - POC Verification"
echo "=========================================="

PASS=0
FAIL=0

# 1. Check Visual Bridge file exists
echo ""
echo "1. Checking Visual Bridge..."
if [ -f "systems/visual_shell/api/visual_bridge.py" ]; then
    echo "   [PASS] Visual Bridge file exists"
    PASS=$((PASS + 1))
else
    echo "   [FAIL] Visual Bridge file NOT found"
    FAIL=$((FAIL + 1))
fi

if grep -q "_handle_terminal_websocket" systems/visual_shell/api/visual_bridge.py 2>/dev/null; then
    echo "   [PASS] Visual Bridge has terminal WebSocket handler"
    PASS=$((PASS + 1))
else
    echo "   [FAIL] Visual Bridge missing terminal support"
    FAIL=$((FAIL + 1))
fi

if grep -q "pty.openpty" systems/visual_shell/api/visual_bridge.py 2>/dev/null; then
    echo "   [PASS] Visual Bridge has PTY spawn support"
    PASS=$((PASS + 1))
else
    echo "   [FAIL] Visual Bridge missing PTY support"
    FAIL=$((FAIL + 1))
fi

# 2. Check WordPress Plugin
echo ""
echo "2. Checking WordPress Plugin..."
PLUGIN_DIR="wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal"

if [ -d "$PLUGIN_DIR" ]; then
    echo "   [PASS] Plugin directory exists"
    PASS=$((PASS + 1))
else
    echo "   [FAIL] Plugin directory NOT found: $PLUGIN_DIR"
    FAIL=$((FAIL + 1))
fi

if [ -f "$PLUGIN_DIR/geometry-os-web-terminal.php" ]; then
    echo "   [PASS] Main PHP file exists"
    PASS=$((PASS + 1))
else
    echo "   [FAIL] Main PHP file NOT found"
    FAIL=$((FAIL + 1))
fi

if [ -f "$PLUGIN_DIR/assets/js/terminal.js" ]; then
    echo "   [PASS] terminal.js exists"
    PASS=$((PASS + 1))
else
    echo "   [FAIL] terminal.js NOT found"
    FAIL=$((FAIL + 1))
fi

if [ -f "$PLUGIN_DIR/assets/css/terminal.css" ]; then
    echo "   [PASS] terminal.css exists"
    PASS=$((PASS + 1))
else
    echo "   [FAIL] terminal.css NOT found"
    FAIL=$((FAIL + 1))
fi

# 3. Check Python Dependencies
echo ""
echo "3. Checking Python Dependencies..."
if python3 -c "import websockets; import aiohttp; import pty" 2>/dev/null; then
    echo "   [PASS] Python dependencies available"
    PASS=$((PASS + 1))
else
    echo "   [FAIL] Python dependencies missing"
    FAIL=$((FAIL + 1))
fi

# 4. Check Network
echo ""
echo "4. Checking Network..."
if ss -tlnp 2>/dev/null | grep -q ":8768"; then
    echo "   [WARN] Port 8768 already in use (Visual Bridge may be running)"
else
    echo "   [PASS] Port 8768 available"
    PASS=$((PASS + 1))
fi

echo ""
echo "=========================================="
echo "Summary: $PASS passed, $FAIL failed"
echo "=========================================="

if [ $FAIL -eq 0 ]; then
    echo ""
    echo "All checks passed! Infrastructure is ready for testing."
    echo ""
    echo "Next steps:"
    echo "1. Start Visual Bridge:"
    echo "   python3 systems/visual_shell/api/visual_bridge.py --port 8768"
    echo ""
    echo "2. Activate plugin in WordPress Admin"
    echo ""
    echo "3. Navigate to 'GO Terminal' in WordPress admin menu"
    echo ""
    echo "4. Test command: echo 'Hello from Geometry OS Web Terminal'"
    exit 0
else
    echo ""
    echo "Some checks failed. Fix the issues above before testing."
    exit 1
fi
