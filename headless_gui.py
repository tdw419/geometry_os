#!/usr/bin/env python3
"""
Headless GUI - Operate Linux GUI without physical display.

Boots a Linux VM, captures the framebuffer, and renders the UI as ASCII
using Florence-2 vision model. Allows agents to operate GUI software
without needing to see the actual screen.

Usage:
    python headless_gui.py boot ./apps/linux/ubuntu-24.04-desktop.qcow2
    python headless_gui.py demo
    python headless_gui.py capture
    python headless_gui.py ascii
    python headless_gui.py click "Firefox"
    python headless_gui.py type "hello world"
"""

import asyncio
import json
import os
import signal
import socket
import subprocess
import sys
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Optional, Tuple

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent))

try:
    from PIL import Image
    import mss
    HAS_MSS = True
except ImportError:
    HAS_MSS = False


@dataclass
class VMConfig:
    """QEMU VM configuration."""
    qcow2_path: str
    memory: str = "4G"
    cpus: int = 2
    vnc_port: int = 5900
    monitor_port: int = 4444
    snapshot: bool = True  # Don't persist changes


class HeadlessGUI:
    """
    Headless GUI operation through vision.

    Provides:
    - Boot Linux VM with virtual display
    - Capture screenshots from VNC
    - Render UI as ASCII using Florence-2
    - Send mouse/keyboard events via QEMU monitor
    """

    def __init__(self, config: VMConfig):
        self.config = config
        self.qemu_process: Optional[subprocess.Popen] = None
        self._vision_model = None

    def boot(self) -> bool:
        """Boot the VM with virtual display."""
        if self.is_running():
            print("VM already running")
            return True

        cmd = [
            "qemu-system-x86_64",
            "-drive", f"file={self.config.qcow2_path},format=qcow2",
            "-m", self.config.memory,
            "-smp", str(self.config.cpus),
            "-usb",                   # Enable USB bus
            "-device", "usb-tablet",  # Absolute coordinates
            "-device", "usb-kbd",     # Reliable keyboard
            "-vnc", f":{self.config.vnc_port - 5900}",
            "-monitor", f"tcp:127.0.0.1:{self.config.monitor_port},server,nowait",
            "-daemonize",
        ]

        if self.config.snapshot:
            cmd.append("-snapshot")

        print(f"Booting VM: {' '.join(cmd)}")

        try:
            result = subprocess.run(cmd, capture_output=True, text=True)
            if result.returncode != 0:
                print(f"QEMU error: {result.stderr}")
                return False

            print(f"VM booted. VNC on :{self.config.vnc_port}")
            print("Waiting for VM to initialize (30s)...")
            time.sleep(30)  # Wait for boot
            return True
        except FileNotFoundError:
            print("QEMU not found. Install: sudo apt install qemu-system-x86")
            return False

    def is_running(self) -> bool:
        """Check if QEMU is running."""
        result = subprocess.run(
            ["pgrep", "-f", f"qemu.*{Path(self.config.qcow2_path).name}"],
            capture_output=True
        )
        return result.returncode == 0

    def stop(self):
        """Stop the VM."""
        if self.qemu_process:
            self.qemu_process.terminate()
            self.qemu_process = None
        else:
            # Kill via process name
            subprocess.run(
                ["pkill", "-f", f"qemu.*{Path(self.config.qcow2_path).name}"]
            )
        print("VM stopped")

    def capture_screenshot(self, output_path: str = "/tmp/vm_screenshot.png") -> Optional[str]:
        """Capture screenshot from VNC using x11vnc or vncdo."""
        # Method 1: Use vncdo if available
        try:
            result = subprocess.run(
                ["vncdo", "-s", f"localhost::{self.config.vnc_port}", "capture", output_path],
                capture_output=True, text=True, timeout=10
            )
            if result.returncode == 0 and Path(output_path).exists():
                return output_path
        except (FileNotFoundError, subprocess.TimeoutExpired):
            pass

        # Method 2: Use gvncviewer screenshot capability
        try:
            result = subprocess.run(
                ["gvnccapture", f"localhost::{self.config.vnc_port}", output_path],
                capture_output=True, text=True, timeout=10
            )
            if result.returncode == 0 and Path(output_path).exists():
                return output_path
        except (FileNotFoundError, subprocess.TimeoutExpired):
            pass

        # Method 3: Use QEMU monitor to dump screen
        try:
            # Send "screendump" command via monitor socket
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(5)
            sock.connect(("127.0.0.1", self.config.monitor_port))

            # QEMU monitor screendump command
            cmd = f'screendump {output_path}\n'
            sock.send(cmd.encode())
            sock.close()

            time.sleep(1)
            if Path(output_path).exists():
                return output_path
        except (socket.error, ConnectionRefusedError) as e:
            print(f"Monitor connection failed: {e}")

        return None

    def get_vision_model(self):
        """Lazy load Florence-2 model."""
        if self._vision_model is None:
            from systems.vision.florence_model import FlorenceModel
            self._vision_model = FlorenceModel()
            self._vision_model.load()
        return self._vision_model

    def render_ascii(self, screenshot_path: str = None) -> str:
        """
        Capture screen and render as ASCII layout.

        Uses Florence-2 to detect UI elements via phrase grounding and OCR,
        rendering them as a text-based representation.
        """
        if screenshot_path is None:
            screenshot_path = self.capture_screenshot()

        if not screenshot_path or not Path(screenshot_path).exists():
            return "Failed to capture screenshot"

        # Load image
        image = Image.open(screenshot_path).convert("RGB")
        width, height = image.size

        # Get vision model
        model = self.get_vision_model()

        print("Detecting UI elements...")
        start = time.time()

        # 1. Detect UI elements using Phrase Grounding
        # We use grounding because standard OD misses specialized desktop elements
        ui_terms = ["icon", "dock", "taskbar", "sidebar", "window", "terminal", "button", "menu", "search", "folder", "trash"]
        
        detections = []
        for term in ui_terms:
            results = model.ground(image, term)
            if results:
                # Add term as class name to result
                for r in results:
                    r.text = term  # Ensure label matches term
                    detections.append(r)

        detect_time = time.time() - start

        # 2. Run OCR for text
        ocr_start = time.time()
        ocr_results = model.ocr(image)
        ocr_time = time.time() - ocr_start

        print(f"Detection: {detect_time:.3f}s, OCR: {ocr_time:.3f}s")

        # 3. Render ASCII Grid
        # Scale: ~10px width per char, ~20px height per char (approx terminal font ratio)
        scale_x = 120 / width  # Target ~120 chars wide
        scale_y = scale_x * 2.0  # Correct aspect ratio for text
        
        chars_per_line = int(width * scale_x)
        lines = int(height * scale_y)
        
        canvas = [[' ' for _ in range(chars_per_line)] for _ in range(lines)]

        # Helper to draw box
        def draw_box(bbox, label):
            x, y, w, h = bbox
            # Convert to grid coords
            x1 = int(x * scale_x)
            y1 = int(y * scale_y)
            x2 = int((x + w) * scale_x)
            y2 = int((y + h) * scale_y)
            
            # Clamp
            x1 = max(0, min(x1, chars_per_line - 1))
            y1 = max(0, min(y1, lines - 1))
            x2 = max(0, min(x2, chars_per_line - 1))
            y2 = max(0, min(y2, lines - 1))
            
            if x2 <= x1 or y2 <= y1: return

            # Draw corners/edges
            canvas[y1][x1] = '┌'
            canvas[y1][x2] = '┐'
            canvas[y2][x1] = '└'
            canvas[y2][x2] = '┘'
            
            for i in range(x1 + 1, x2):
                canvas[y1][i] = '─'
                canvas[y2][i] = '─'
            
            for i in range(y1 + 1, y2):
                canvas[i][x1] = '│'
                canvas[i][x2] = '│'
                
            # Draw label inside
            label_text = f" {label} "
            if len(label_text) < (x2 - x1):
                start_x = x1 + (x2 - x1 - len(label_text)) // 2
                for i, c in enumerate(label_text):
                    if 0 <= start_x + i < chars_per_line:
                        canvas[y1][start_x + i] = c

        # Draw UI elements
        for det in detections:
            draw_box(det.bbox, det.text)

        # Draw text regions (overlay on top)
        for text_result in ocr_results:
            x, y, w, h = text_result.bbox
            text = text_result.text
            if not text.strip(): continue
            
            # Simple heuristic: ignore text that overlaps significantly with small UI elements
            cx = int(x * scale_x)
            cy = int(y * scale_y)
            
            for i, char in enumerate(text):
                if 0 <= cx + i < chars_per_line and 0 <= cy < lines:
                    # Don't overwrite box borders unless necessary
                    if canvas[cy][cx + i] == ' ':
                        canvas[cy][cx + i] = char

        # Convert to string
        border = '+' + '-' * chars_per_line + '+'
        result = [border]
        for row in canvas:
            result.append('|' + ''.join(row) + '|')
        result.append(border)

        return '\n'.join(result)

    def send_mouse_click(self, x: int, y: int, button: int = 1):
        """Send mouse click via QEMU monitor."""
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(5)
            sock.connect(("127.0.0.1", self.config.monitor_port))

            # QEMU monitor mouse_button and mouse_move commands
            # Note: This requires QEMU's human-monitor-interface (HMP)
            commands = [
                f'mouse_move {x} {y}',
                f'mouse_button {button}',
                'mouse_button 0',  # Release
            ]

            for cmd in commands:
                sock.send((cmd + '\n').encode())
                time.sleep(0.1)

            sock.close()
            print(f"Clicked at ({x}, {y})")
            return True
        except Exception as e:
            print(f"Click failed: {e}")
            return False

    def send_key(self, key: str):
        """Send keyboard input via QEMU monitor."""
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(5)
            sock.connect(("127.0.0.1", self.config.monitor_port))

            # QEMU sendkey command
            # Maps common keys to QEMU key names
            key_map = {
                ' ': 'spc',
                '\n': 'ret',
                '\t': 'tab',
                'esc': 'esc',
            }

            qemu_key = key_map.get(key.lower(), key)
            cmd = f'sendkey {qemu_key}\n'
            sock.send(cmd.encode())
            sock.close()
            return True
        except Exception as e:
            print(f"Key send failed: {e}")
            return False

    def type_text(self, text: str):
        """Type a string of text."""
        for char in text:
            self.send_key(char)
            time.sleep(0.05)


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)

    command = sys.argv[1]

    # Default config
    config = VMConfig(
        qcow2_path="./apps/linux/ubuntu-24.04-desktop.qcow2"
    )

    gui = HeadlessGUI(config)

    if command == "boot":
        if len(sys.argv) > 2:
            config.qcow2_path = sys.argv[2]
        success = gui.boot()
        sys.exit(0 if success else 1)

    elif command == "demo":
        # Full demo sequence
        if not gui.is_running():
            print("VM not running. Boot first!")
            return

        print("1. Sending Ctrl+Alt+T to open Terminal...")
        try:
            import subprocess
            subprocess.run(["vncdo", "-s", ":0", "key", "ctrl-alt-t"], check=True)
        except Exception as e:
            print(f"Failed to send keys: {e}")
            # Try QEMU monitor fallback
            # gui.send_key("ctrl-alt-t") # Complex chords hard in raw monitor without exact key codes

        print("2. Waiting 2s for window animation...")
        time.sleep(2)

        print("3. Capturing screen...")
        screenshot = gui.capture_screenshot()
        if not screenshot:
            print("Capture failed")
            return

        print("4. Rendering ASCII layout...")
        print("="*60)
        print(gui.render_ascii())
        print("="*60)

    elif command == "stop":
        gui.stop()

    elif command == "status":
        if gui.is_running():
            print("VM is running")
        else:
            print("VM is not running")

    elif command == "capture":
        path = gui.capture_screenshot()
        if path:
            print(f"Screenshot saved to: {path}")
        else:
            print("Failed to capture screenshot")
            print("\nInstall vncdo for VNC capture:")
            print("  pip install vncdotool")

    elif command == "ascii":
        if not gui.is_running():
            print("VM not running. Boot first with: headless_gui.py boot")
            sys.exit(1)
        ascii_layout = gui.render_ascii()
        print(ascii_layout)

    elif command == "click":
        if len(sys.argv) < 3:
            print("Usage: headless_gui.py click <description|x,y>")
            sys.exit(1)
        target = sys.argv[2]

        if ',' in target:
            x, y = map(int, target.split(','))
            gui.send_mouse_click(x, y)
        else:
            # Use vision to find element
            print(f"Finding '{target}'...")
            screenshot = gui.capture_screenshot()
            if screenshot:
                model = gui.get_vision_model()
                image = Image.open(screenshot).convert("RGB")
                results = model.ground(image, target)
                if results:
                    x, y, w, h = results[0].bbox
                    gui.send_mouse_click(x + w//2, y + h//2)
                else:
                    print(f"'{target}' not found on screen")

    elif command == "type":
        if len(sys.argv) < 3:
            print("Usage: headless_gui.py type <text>")
            sys.exit(1)
        text = sys.argv[2]
        gui.type_text(text)

if __name__ == "__main__":
    main()
