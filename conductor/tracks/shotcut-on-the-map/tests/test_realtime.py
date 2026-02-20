import importlib.util
import unittest
import asyncio
import json
import base64
import os
import sys
import time
from unittest.mock import MagicMock, patch
from pathlib import Path

# Add project root to path
ROOT_DIR = Path(__file__).resolve().parent.parent.parent.parent.parent
sys.path.insert(0, str(ROOT_DIR))

# Dynamic import for shotcut_vm_bridge.py
bridge_path = ROOT_DIR / "conductor" / "tracks" / "shotcut-on-the-map" / "shotcut_vm_bridge.py"
spec = importlib.util.spec_from_file_location("shotcut_vm_bridge", bridge_path)
shotcut_vm_bridge = importlib.util.module_from_spec(spec)
spec.loader.exec_module(shotcut_vm_bridge)
ShotcutVMBridge = shotcut_vm_bridge.ShotcutVMBridge


class TestRealtimeStreaming(unittest.IsolatedAsyncioTestCase):
    """Tests for the real-time frame streaming capability."""

    def setUp(self):
        self.bridge = ShotcutVMBridge(image_path="test-image.qcow2", port=8888)
        self.bridge.vm.status = "running"
        self.bridge.vm.session_id = "test-session"

    async def test_subscribe_frames_loop(self):
        """Test that subscribe_frames sends multiple frames and then stops."""
        print("\n🧪 Testing Frame Subscription Loop...")

        mock_ws = MagicMock()
        mock_ws.send = MagicMock(return_value=asyncio.Future())
        mock_ws.send.return_value.set_result(None)
        mock_ws.remote_address = ("127.0.0.1", 1234)

        # Mock frame capture
        fake_image = base64.b64encode(b"fake-frame-data").decode()

        async def mock_capture():
            return {"image": fake_image, "format": "jpg", "timestamp": "2024-01-01T00:00:00"}

        self.bridge._capture_frame = mock_capture

        # Run subscribe_frames for a short time
        # We'll use an exception to break the infinite loop in the test
        async def stop_after_n_frames(msg):
            stop_after_n_frames.count += 1
            if stop_after_n_frames.count >= 3:
                raise asyncio.CancelledError("Stop test")

        stop_after_n_frames.count = 0
        mock_ws.send = stop_after_n_frames

        params = {"interval_ms": 10}  # Fast interval for testing

        try:
            await self.bridge.handle_subscribe_frames(params, mock_ws)
        except asyncio.CancelledError:
            pass

        self.assertEqual(stop_after_n_frames.count, 3)
        print(f"✅ Received {stop_after_n_frames.count} frames in subscription loop.")

    async def test_frame_serialization(self):
        """Test the structure of the frame message."""
        print("\n🧪 Testing Frame Serialization...")

        mock_ws = MagicMock()
        mock_ws.remote_address = ("127.0.0.1", 1234)

        sent_messages = []

        async def mock_send(msg):
            sent_messages.append(json.loads(msg))
            raise asyncio.CancelledError("Stop after one")

        mock_ws.send = mock_send

        # Mock frame capture
        fake_image = base64.b64encode(b"hello-world").decode()

        async def mock_capture():
            return {"image": fake_image, "format": "png", "timestamp": "now"}
        self.bridge._capture_frame = mock_capture

        try:
            await self.bridge.handle_subscribe_frames({"interval_ms": 1}, mock_ws)
        except asyncio.CancelledError:
            pass

        self.assertEqual(len(sent_messages), 1)
        frame = sent_messages[0]
        self.assertEqual(frame["type"], "frame")
        self.assertEqual(frame["data"], fake_image)
        self.assertEqual(frame["format"], "png")
        print("✅ Frame serialization verified.")


if __name__ == "__main__":
    unittest.main()
