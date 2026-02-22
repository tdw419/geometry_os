#!/usr/bin/env python3
"""
Shotcut Agent - AI-driven video editing agent for Geometry OS

This agent provides a high-level interface for AI-driven video editing
operations using the Shotcut video editor running in a QEMU VM.

Capabilities:
- Boot and manage Shotcut VM
- Capture screenshots for visual analysis
- Perform keyboard and mouse input
- Execute video editing workflows

Usage:
    agent = ShotcutAgent()
    agent.boot()
    agent.launch_shotcut()
    agent.create_title("Hello, World!")
    screenshot = agent.see()
"""

import asyncio
import json
import base64
import time
from pathlib import Path
from typing import Optional, Dict, Any, Tuple
from dataclasses import dataclass
from datetime import datetime
import websockets

# Import Extraction Pipeline
try:
    from extraction_pipeline import ExtractionPipeline
except ImportError:
    # If running from a different directory, try relative import or dynamic path
    import sys
    from pathlib import Path
    sys.path.append(str(Path(__file__).parent))
    from extraction_pipeline import ExtractionPipeline

# Attempt to import OCR
try:
    import pytesseract
    HAS_TESSERACT = True
except ImportError:
    HAS_TESSERACT = False

# Attempt to import PIL
try:
    from PIL import Image
    import io
    HAS_PIL = True
except ImportError:
    HAS_PIL = False


@dataclass
class VMState:
    """VM state information."""
    session_id: str = ""
    status: str = "stopped"
    vnc_port: int = 5900
    ssh_port: int = 2222
    qmp_socket: str = ""


class ShotcutAgent:
    """
    AI-driven video editing agent for Shotcut.

    This class provides a high-level interface for controlling
    the Shotcut video editor through a QEMU virtual machine.
    """

    DEFAULT_BRIDGE_PORT = 8768
    DEFAULT_CARTRIDGE = "ubuntu-24.04-desktop.cartridge.rts.png"

    def __init__(
        self,
        bridge_url: str = None,
        cartridge_path: str = None,
        auto_boot: bool = False
    ):
        """
        Initialize Shotcut Agent.

        Args:
            bridge_url: WebSocket URL for the VM bridge
            cartridge_path: Path to the Shotcut cartridge file
            auto_boot: Automatically boot VM on first operation
        """
        self.bridge_url = bridge_url or f"ws://localhost:{self.DEFAULT_BRIDGE_PORT}"
        self.cartridge_path = cartridge_path
        self.vm = VMState()
        self.auto_boot = auto_boot
        self._last_screenshot = None
        self._screenshot_history = []
        self.pipeline = ExtractionPipeline(ascii_width=80, ascii_height=24)
        self.last_analysis = None

    async def _send_command(self, command: str, params: dict = None) -> dict:
        """
        Send command to VM bridge.

        Args:
            command: Command name
            params: Command parameters

        Returns:
            Response dictionary
        """
        if params is None:
            params = {}

        try:
            async with websockets.connect(self.bridge_url) as ws:
                msg = {"command": command, "params": params}
                await ws.send(json.dumps(msg))
                response = await ws.recv()
                return json.loads(response)
        except ConnectionRefusedError:
            return {"success": False, "error": "Bridge not running"}

    # ==================== VM Management ====================

    async def boot(self, disk_path: str = None) -> dict:
        """
        Boot the Shotcut VM.

        Args:
            disk_path: Path to disk image (uses cartridge default if None)

        Returns:
            Boot response with session info
        """
        if disk_path is None and self.cartridge_path:
            # Load disk path from cartridge
            cartridge_meta = Path(self.cartridge_path).with_suffix('.meta.json')
            if cartridge_meta.exists():
                with open(cartridge_meta) as f:
                    meta = json.load(f)
                    disk_path = meta.get("source", {}).get("disk_path")

        result = await self._send_command("boot", {"disk": True, "disk_path": disk_path})

        if result.get("success"):
            self.vm.session_id = result.get("session_id", "")
            self.vm.status = "running"
            self.vm.vnc_port = result.get("vnc_port", 5900)
            self.vm.ssh_port = result.get("ssh_port", 2222)
            self.vm.qmp_socket = f"/tmp/qemu-qmp-{self.vm.session_id}.sock"

        return result

    async def shutdown(self) -> dict:
        """Shutdown the VM."""
        result = await self._send_command("shutdown", {})
        if result.get("success"):
            self.vm.status = "stopped"
        return result

    async def status(self) -> dict:
        """Get VM status."""
        return await self._send_command("status", {})

    # ==================== Vision (See) ====================

    async def see(self, save_path: str = None) -> Tuple[bytes, str]:
        """
        Capture screenshot from VM.

        Args:
            save_path: Optional path to save screenshot

        Returns:
            Tuple of (image_bytes, ocr_text)
        """
        result = await self._send_command("screenshot", {})

        if not result.get("success"):
            return None, f"Error: {result.get('error')}"

        # Decode image
        img_data = base64.b64decode(result["image"])
        self._last_screenshot = img_data
        self._screenshot_history.append({
            "timestamp": datetime.now().isoformat(),
            "size": len(img_data)
        })

        # Save if path provided
        if save_path:
            with open(save_path, "wb") as f:
                f.write(img_data)

        # OCR
        ocr_text = ""
        if HAS_TESSERACT and HAS_PIL:
            try:
                img = Image.open(io.BytesIO(img_data))
                ocr_text = pytesseract.image_to_string(img)
            except Exception as e:
                ocr_text = f"OCR error: {e}"

        return img_data, ocr_text

    async def visual_see(self) -> Any:
        """
        Capture screenshot and perform semantic analysis.

        Returns:
            ExtractionResult object
        """
        img_data, _ = await self.see()
        if not img_data:
            return None

        self.last_analysis = self.pipeline.extract_from_bytes(img_data)
        return self.last_analysis

    async def visual_click(self, target_text: str, index: int = 0) -> bool:
        """
        Find an element by text and click it.

        Args:
            target_text: Text to search for
            index: Which match to use (if multiple)

        Returns:
            True if element was found and clicked
        """
        analysis = await self.visual_see()
        if not analysis:
            return False

        # Search in widgets first (more accurate)
        matches = [w for w in analysis.widgets if target_text.lower() in w.text.lower()]

        # Fallback to raw elements
        if not matches:
            matches = [e for e in analysis.elements if target_text.lower() in e.text.lower()]

        if not matches:
            print(f"⚠️  Visual Click: Could not find '{target_text}'")
            return False

        target = matches[min(index, len(matches) - 1)]

        # Get center from bbox [x1, y1, x2, y2]
        bbox = getattr(target, 'bbox', None)
        if bbox is None and hasattr(target, 'bounds'):
            bbox = target.bounds

        if bbox:
            center_x = (bbox[0] + bbox[2]) // 2
            center_y = (bbox[1] + bbox[3]) // 2
        else:
            print(f"⚠️  Visual Click: Could not determine coordinates for '{target_text}'")
            return False

        print(f"🎬 Visual Click: Found '{target_text}' at ({center_x}, {center_y})")
        await self.click(center_x, center_y)
        return True

    async def wait_for_text(self, target_text: str, timeout: float = 10.0) -> bool:
        """
        Wait for specific text to appear on screen.
        """
        start = time.time()
        while time.time() - start < timeout:
            analysis = await self.visual_see()
            if any(target_text.lower() in e.text.lower() for e in analysis.elements):
                return True
            await asyncio.sleep(1.0)
        return False

    def get_last_screenshot(self) -> Optional[bytes]:
        """Get the last captured screenshot."""
        return self._last_screenshot

    # ==================== Input (Act) ====================

    async def click(self, x: int, y: int, button: int = 1) -> dict:
        """
        Click at coordinates.

        Args:
            x: X coordinate
            y: Y coordinate
            button: Mouse button (1=left, 2=middle, 3=right)

        Returns:
            Response dict
        """
        return await self._send_command("click", {"x": x, "y": y, "button": button})

    async def type_text(self, text: str) -> dict:
        """
        Type text.

        Args:
            text: Text to type

        Returns:
            Response dict
        """
        return await self._send_command("type", {"text": text})

    async def press_key(self, key: str) -> dict:
        """
        Press a key.

        Args:
            key: Key name (e.g., 'ret', 'tab', 'esc', 'meta')

        Returns:
            Response dict
        """
        return await self._send_command("input", {"key": key})

    # ==================== High-Level Operations ====================

    async def launch_shotcut(self) -> bool:
        """
        Launch Shotcut application.

        Uses Super key + search to launch.

        Returns:
            True if successful
        """
        # Press Super to open app launcher
        await self.press_key("meta")
        await asyncio.sleep(1)

        # Type "shotcut"
        await self.type_text("shotcut")
        await asyncio.sleep(1)

        # Press Enter to launch
        await self.press_key("ret")

        # Wait for app to start
        await asyncio.sleep(3)

        return True

    async def visual_create_title(self, text: str) -> bool:
        """
        Create a title clip using visual feedback for navigation.
        """
        print(f"🎬 Starting Visual Title Creation: '{text}'")

        # 1. Click 'Open Other'
        if not await self.visual_click("Open Other"):
            # Fallback to hardcoded position if text not detected
            await self.click(80, 50)

        # 2. Wait for and click 'Text'
        await asyncio.sleep(0.5)
        if not await self.visual_click("Text"):
            await self.click(80, 150)

        # 3. Wait for Text Dialog
        print("⏳ Waiting for Text dialog...")
        if not await self.wait_for_text("Text", timeout=5.0):
            print("⚠️  Text dialog not detected, continuing anyway...")

        # 4. Click text field and type
        # Text field usually contains default text like "Name" or similar
        # We'll click near the center of the dialog
        await self.click(400, 320)
        await asyncio.sleep(0.2)
        await self.type_text(text)

        # 5. Click OK
        if not await self.visual_click("OK"):
            await self.press_key("ret")

        print("✅ Visual Title Creation complete")
        return True

    async def create_title(
        self,
        text: str,
        duration: float = 5.0,
        position: Tuple[int, int] = (80, 50)
    ) -> bool:
        """
        Create a title clip.

        Args:
            text: Title text
            duration: Duration in seconds
            position: Position of "Open Other" button

        Returns:
            True if successful
        """
        # Click "Open Other" button
        await self.click(*position)
        await asyncio.sleep(0.5)

        # Click "Text" in dropdown (approximate position)
        await self.click(position[0], position[1] + 100)
        await asyncio.sleep(0.5)

        # Click in text field and type
        await self.click(400, 320)
        await asyncio.sleep(0.3)
        await self.type_text(text)
        await asyncio.sleep(0.3)

        # Press Enter to confirm
        await self.press_key("ret")

        return True

    async def open_file(self, file_path: str) -> bool:
        """
        Open a media file.

        Args:
            file_path: Path to file

        Returns:
            True if successful
        """
        # Open file dialog
        await self.press_key("ctrl")  # Ctrl+O
        await asyncio.sleep(0.1)
        await self.type_text("o")
        await asyncio.sleep(0.5)

        # Type file path
        await self.type_text(file_path)
        await asyncio.sleep(0.3)

        # Press Enter
        await self.press_key("ret")

        return True

    async def export_video(
        self,
        output_path: str,
        preset: str = "default"
    ) -> bool:
        """
        Export video project.

        Args:
            output_path: Output file path
            preset: Export preset name

        Returns:
            True if successful
        """
        # Open export dialog (Ctrl+E or menu)
        await self.press_key("ctrl")
        await asyncio.sleep(0.1)
        await self.type_text("e")
        await asyncio.sleep(1)

        # Type output path
        await self.type_text(output_path)
        await asyncio.sleep(0.3)

        # Press Enter to start export
        await self.press_key("ret")

        return True

    # ==================== AI Decision Support ====================

    def analyze_screenshot(self, img_data: bytes = None) -> Dict[str, Any]:
        """
        Analyze screenshot for AI decision-making.

        Args:
            img_data: Image data (uses last screenshot if None)

        Returns:
            Analysis results
        """
        if img_data is None:
            img_data = self._last_screenshot

        if img_data is None:
            return {"error": "No screenshot available"}

        analysis = {
            "size": len(img_data),
            "has_image": HAS_PIL,
            "has_ocr": HAS_TESSERACT
        }

        if HAS_PIL:
            try:
                img = Image.open(io.BytesIO(img_data))
                analysis["dimensions"] = {"width": img.width, "height": img.height}
                analysis["mode"] = img.mode

                # Simple color analysis
                import numpy as np
                arr = np.array(img)
                analysis["mean_color"] = arr.mean(axis=(0, 1)).tolist()
            except Exception as e:
                analysis["image_error"] = str(e)

        return analysis

    async def find_element(
        self,
        element_type: str,
        ocr_text: str = None
    ) -> Optional[Tuple[int, int]]:
        """
        Find UI element by type or text.

        Args:
            element_type: Type of element ('button', 'menu', 'text')
            ocr_text: OCR text to search in

        Returns:
            (x, y) coordinates or None
        """
        # This is a placeholder for more sophisticated element finding
        # In a full implementation, this would use computer vision
        # or accessibility tree parsing

        element_positions = {
            "open_other": (80, 50),
            "text_option": (80, 150),
            "text_field": (400, 320),
            "ok_button": (520, 450)
        }

        return element_positions.get(element_type)


# ==================== Convenience Functions ====================

async def quick_demo():
    """Quick demonstration of Shotcut Agent."""
    agent = ShotcutAgent()

    print("[*] Booting VM...")
    result = await agent.boot()
    print(f"    Boot result: {result.get('success')}")

    if not result.get("success"):
        print(f"    Error: {result.get('error')}")
        return

    print("[*] Waiting for VM to boot...")
    await asyncio.sleep(30)

    print("[*] Taking screenshot...")
    img, text = await agent.see("demo_screenshot.png")
    print(f"    Screenshot size: {len(img)} bytes")
    print(f"    OCR text: {text[:100]}...")

    print("[*] Launching Shotcut...")
    await agent.launch_shotcut()

    print("[*] Creating title...")
    await agent.create_title("Hello from AI!")

    print("[*] Final screenshot...")
    await agent.see("final_result.png")

    print("\n✅ Demo complete!")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description='Shotcut Agent - AI Video Editing')
    parser.add_argument('--demo', action='store_true', help='Run quick demo')
    parser.add_argument('--boot', action='store_true', help='Boot VM')
    parser.add_argument('--see', action='store_true', help='Take screenshot')
    parser.add_argument('--launch', action='store_true', help='Launch Shotcut')
    parser.add_argument('--title', type=str, help='Create title with text')
    parser.add_argument('-o', '--output', type=str, default='screenshot.png', help='Output file')

    args = parser.parse_args()

    async def main():
        agent = ShotcutAgent()

        if args.demo:
            await quick_demo()
            return

        if args.boot:
            result = await agent.boot()
            print(json.dumps(result, indent=2))
            return

        if args.see:
            img, text = await agent.see(args.output)
            print(f"Screenshot saved: {args.output}")
            print(f"OCR: {text}")
            return

        if args.launch:
            await agent.launch_shotcut()
            print("Shotcut launched")
            return

        if args.title:
            await agent.create_title(args.title)
            print(f"Title created: {args.title}")
            return

        # Default: show help
        parser.print_help()

    asyncio.run(main())
