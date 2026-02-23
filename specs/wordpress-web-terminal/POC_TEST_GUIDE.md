# WordPress Web Terminal - POC Test Guide

This document provides manual testing steps to verify the WordPress Web Terminal integration.

## Prerequisites

1. WordPress running at `wordpress_zone/wordpress/`
2. Python 3.9+ with websockets, aiohttp installed
3. Visual Bridge dependencies available

## Step 1: Start Visual Bridge

Open a terminal and run:

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
python3 systems/visual_shell/api/visual_bridge.py --port 8768
```

Expected output:
```
Visual Bridge starting on port 8768...
WebSocket server started
HTTP API server started on port 8769
```

Leave this terminal running.

## Step 2: Verify Visual Bridge is Running

```bash
# Check if port 8768 is listening
ss -tlnp | grep 8768

# Or test WebSocket connection
python3 -c "
import asyncio
import websockets

async def test():
    try:
        async with websockets.connect('ws://localhost:8768') as ws:
            print('WebSocket connection successful!')
    except Exception as e:
        print(f'Connection failed: {e}')

asyncio.run(test())
"
```

## Step 3: Activate WordPress Plugin

1. Open WordPress Admin: http://localhost/wordpress/wp-admin/
2. Go to **Plugins** menu
3. Find **Geometry OS Web Terminal** in the list
4. Click **Activate**

## Step 4: Access Terminal

1. In WordPress Admin, look for **GO Terminal** in the left sidebar (under Settings or at bottom)
2. Click **GO Terminal** to open the terminal page
3. You should see:
   - A terminal window with dark theme
   - ASCII art "GEOMETRY OS" banner
   - Status indicator showing "Connecting..." then "Connected" (green dot)

## Step 5: Test Terminal I/O

Once connected, type commands in the terminal:

```bash
# Test basic command
ls

# Test echo
echo "Hello from Geometry OS Web Terminal"

# Test working directory
pwd

# Test environment
env | head -5
```

### Expected Results:
- Commands should execute and show output in the terminal
- The status dot should remain green (Connected)
- Output should be color-coded based on terminal ANSI codes

## Step 6: Test Resize

1. Resize your browser window
2. The terminal should automatically resize to fit
3. Run `stty size` to verify new dimensions

## Troubleshooting

### Connection Fails (Red Dot)

1. Check Visual Bridge is running: `ss -tlnp | grep 8768`
2. Check browser console for WebSocket errors (F12 -> Console)
3. Verify no firewall blocking port 8768

### Terminal Shows But No Output

1. Check Visual Bridge logs for PTY spawn errors
2. Verify `/bin/bash` exists and is executable
3. Check file permissions on plugin directory

### Plugin Not Appearing in WordPress

1. Verify plugin files exist:
   ```bash
   ls wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/
   ```
2. Check file permissions (should be readable by web server)
3. Check WordPress debug log: `wordpress/wp-content/debug.log`

## Architecture Overview

```
[Browser xterm.js] <--WebSocket--> [Visual Bridge:8768] <--PTY--> [bash shell]
        |                                  |
   terminal.js                    _handle_terminal_websocket()
                                        |
                                  _spawn_terminal_process()
                                        |
                                  pty.openpty() + os.fork()
```

## Files Modified

- `wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/geometry-os-web-terminal.php` - Main plugin
- `wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/assets/js/terminal.js` - xterm.js WebSocket client
- `wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/assets/css/terminal.css` - Dark theme styles
- `systems/visual_shell/api/visual_bridge.py` - WebSocket server with PTY support

## Success Criteria

POC is complete when:
1. Visual Bridge starts without errors
2. Plugin appears in WordPress admin
3. Terminal page loads with xterm.js
4. WebSocket connects (green status)
5. Commands execute and show output (bidirectional I/O works)
6. `echo "Hello from Geometry OS Web Terminal"` shows expected output
