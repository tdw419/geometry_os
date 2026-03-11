import asyncio
import json
import websockets
import time
import base64
import os

# Configuration
BRIDGE_URL = "ws://127.0.0.1:8768"
SCREENSHOT_DIR = "conductor/tracks/shotcut-on-the-map/screenshots"
OUTPUT_VIDEO_PATH = "/tmp/demo.mp4"

# Color constants
COLOR_RED = "#FF6B6B"
COLOR_BLUE = "#4D96FF"


async def send_command(ws, cmd, params=None):
    if params is None:
        params = {}
    await ws.send(json.dumps({'command': cmd, 'params': params}))
    return json.loads(await ws.recv())


async def capture_state(ws, name):
    res = await send_command(ws, 'screenshot', {})
    if res.get('success'):
        path = os.path.join(SCREENSHOT_DIR, f"{name}.png")
        with open(path, 'wb') as f:
            f.write(base64.b64decode(res['image']))
        print(f"[+] State captured: {name}.png")
    else:
        print(f"[-] Failed to capture state: {res.get('error')}")


async def wait_and_capture(ws, seconds, name):
    print(f"[*] Waiting {seconds}s for '{name}'...")
    time.sleep(seconds)
    await capture_state(ws, name)


async def type_text(ws, text):
    print(f"[*] Typing: {text.strip()}")
    res = await send_command(ws, 'type', {'text': text})
    if not res.get('success'):
        print(f"[-] Typing failed: {res.get('error')}")


async def click_at(ws, x, y, desc=""):
    print(f"[*] Click ({x}, {y}) - {desc}")
    await send_command(ws, 'click', {'x': x, 'y': y, 'button': 'left'})
    time.sleep(0.5)


async def run_demo():
    print("=== Stage 4: Shotcut Automation Demo ===")

    try:
        async with websockets.connect(BRIDGE_URL) as ws:
            # 1. Boot & Login (Assuming VM is fresh or reset)
            # For this demo script, we assume the VM is already running and logged in to Xorg
            # If not, we'd need the boot sequence here.
            # We'll do a quick check via screenshot
            await capture_state(ws, "demo_start_state")

            # 2. Launch Shotcut
            print("\n--- Phase 2: Launch Shotcut ---")
            await type_text(ws, "shotcut --software\n")
            await wait_and_capture(ws, 30, "shotcut_launched")

            # 3. Create Color Clip (File -> Open Other -> Color)
            # Coordinates are estimates based on 1024x768 resolution and standard Shotcut layout
            print("\n--- Phase 3: Create Color Clip ---")
            # Click 'Open Other' (Top toolbar)
            await click_at(ws, 150, 45, "Open Other")
            time.sleep(1)
            # Click 'Color' (Dropdown)
            await click_at(ws, 150, 120, "Select Color")
            time.sleep(2)
            await capture_state(ws, "color_dialog")

            # Confirm Color (Click OK)
            await click_at(ws, 520, 450, "Click OK on Color Dialog")
            time.sleep(2)
            await capture_state(ws, "color_clip_preview")

            # Drag to Timeline (or Append)
            # Shortcut 'a' appends to timeline
            await type_text(ws, "a")
            time.sleep(1)
            await capture_state(ws, "timeline_added")

            # 4. Add Text Overlay (Filters)
            print("\n--- Phase 4: Add Text ---")
            # Click 'Filters' tab (Top middle-right)
            await click_at(ws, 650, 45, "Filters Tab")
            time.sleep(1)
            # Click '+' to add filter (Left side of filter panel)
            await click_at(ws, 50, 200, "Add Filter")
            time.sleep(1)
            # Type 'text' to search
            await type_text(ws, "text")
            time.sleep(1)
            # Select 'Text: Simple'
            await click_at(ws, 100, 250, "Select Text Simple")
            time.sleep(1)

            # Type Text Content (In the text field on the right)
            # We need to click the text field first. Assuming default layout.
            await click_at(ws, 800, 300, "Focus Text Field")
            # Clear existing text (Ctrl+A, Del) - assuming simplified here
            # Just typing new text for now
            await type_text(ws, "Geometry OS Demo\n")
            time.sleep(2)
            await capture_state(ws, "text_added")

            # 5. Export Video
            print("\n--- Phase 5: Export ---")
            # Click 'Export' (Top toolbar)
            await click_at(ws, 900, 45, "Export Tab")
            time.sleep(1)
            # Click 'Export File' button (Bottom of export panel)
            await click_at(ws, 900, 700, "Export File Button")
            time.sleep(2)

            # Type Filename
            await type_text(ws, "/tmp/demo.mp4\n")
            time.sleep(1)
            # Confirm/Save (Enter should handle it if file dialog is focused)
            await capture_state(ws, "export_started")

            # Wait for export
            print("[*] Waiting 15s for export...")
            time.sleep(15)

            # 6. Verify (Check file existence inside VM)
            print("\n--- Phase 6: Verify ---")
            # Switch to terminal (Alt+Tab or assume focus return)
            # For simplicity, we'll try to run a command blindly
            await type_text(ws, "ls -l /tmp/demo.mp4\n")
            time.sleep(2)
            await capture_state(ws, "final_verification")

    except Exception as e:
        print(f"[-] Error: {e}")

if __name__ == "__main__":
    if not os.path.exists(SCREENSHOT_DIR):
        os.makedirs(SCREENSHOT_DIR)
    asyncio.run(run_demo())
