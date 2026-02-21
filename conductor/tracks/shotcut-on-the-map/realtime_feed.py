#!/usr/bin/env python3
"""
Real-time Visual Feed Client

Connects to the Shotcut VM Bridge, subscribes to frame updates,
and runs the extraction pipeline in real-time.

Usage:
    python realtime_feed.py [--url ws://localhost:8768] [--interval 200]
"""

from extraction_pipeline import ExtractionPipeline
from memory_ghost import MemoryGhost, GhostRegistry
import asyncio
import json
import base64
import time
import argparse
import sys
from pathlib import Path

# Add current dir to path for imports
sys.path.append(str(Path(__file__).parent))


class RealtimeFeed:
    def __init__(self, bridge_url: str, interval_ms: int = 200, hud_url: str = None, telemetry_enabled: bool = True):
        self.bridge_url = bridge_url
        self.hud_url = hud_url
        self.interval_ms = interval_ms
        self.pipeline = ExtractionPipeline(ascii_width=60, ascii_height=15)
        self.frame_count = 0
        self.start_time = time.time()
        self.hud_ws = None
        self.telemetry_enabled = telemetry_enabled
        self.last_telemetry_time = 0
        self.TELEMETRY_RATE_LIMIT = 30  # Seconds between telemetry pulses
        self.ghost_registry = GhostRegistry()  # Memory Ghost registry

    async def _connect_hud(self):
        """Connect to the Visual Bridge HUD."""
        if not self.hud_url:
            return None
        import websockets
        try:
            self.hud_ws = await websockets.connect(self.hud_url)
            print(f"✅ HUD connected at {self.hud_url}")
        except Exception as e:
            print(f"⚠️  HUD connection failed: {e}")
            self.hud_ws = None

    async def _broadcast_to_hud(self, frame_data: str, result):
        """Broadcast the extraction result to the Visual Bridge."""
        if not self.hud_ws:
            return

        try:
            # Construct SHOTCUT_FRAME_UPDATE message
            msg = {
                "type": "shotcut_frame",
                "frame": frame_data,
                "clusters": [
                    {"label": c.label, "bounds": c.bounds, "element_count": len(c.elements)}
                    for c in result.clusters
                ],
                "widgets": [
                    {"type": w.type.value, "text": w.text, "bbox": w.bbox, "action": w.action}
                    for w in result.widgets
                ],
                "layout": self.serialize_layout(result.layout) if result.layout else None,
                "ghosts": self.ghost_registry.to_broadcast(),
                "diagnostic": {
                    "severity": result.diagnostic.severity,
                    "message": result.diagnostic.message,
                    "tokens": result.diagnostic.tokens,
                    "timestamp": result.diagnostic.timestamp
                } if result.diagnostic else None,
                "metadata": result.metadata,
                "timestamp": time.time()
            }
            await self.hud_ws.send(json.dumps(msg))

            # Send telemetry pulse for WordPress District sync
            await self._send_telemetry_pulse(result, frame_data)

        except Exception as e:
            print(f"⚠️  HUD broadcast failed: {e}")
            self.hud_ws = None  # Reset for reconnection attempt

    def serialize_layout(self, layout):
        """Serialize a LayoutResult to dict for JSON transmission."""
        if layout is None:
            return None
        return {
            "panel_count": len(layout.panels),
            "button_count": len(layout.buttons),
            "line_count": len(layout.lines),
            "panels": layout.panels[:5],  # Limit to 5 for bandwidth
            "buttons": layout.buttons[:10],  # Limit to 10 for bandwidth
            "lines": [
                {"x1": l[0][0], "y1": l[0][1], "x2": l[1][0], "y2": l[1][1]}
                for l in layout.lines[:10]  # Limit to 10 lines
            ]
        }

    async def _send_telemetry_pulse(self, result, frame_data: str = None):
        """
        Send telemetry pulse to Visual Bridge for WordPress District sync.

        This notifies the WordPress district on the Infinite Map that
        significant UI structure has been detected.

        Pulse Types:
        - evolution_event: Significant layout detection
        - diagnostic_pulse: Diagnostic alert (WARNING/CRITICAL)

        Args:
            result: ExtractionResult from pipeline
            frame_data: Optional frame data for context
        """
        if not self.telemetry_enabled or not self.hud_ws:
            return

        # Rate limit telemetry
        if time.time() - self.last_telemetry_time < self.TELEMETRY_RATE_LIMIT:
            return

        # Determine if we should send a pulse
        should_pulse = False
        pulse_type = None
        pulse_data = {}

        # Check for significant layout
        if result.layout and (
            len(result.layout.panels) >= 3 or
            len(result.layout.buttons) >= 5
        ):
            should_pulse = True
            pulse_type = "evolution_event"
            pulse_data = {
                "source": "shotcut_visual_hud",
                "event": "significant_layout_detected",
                "panel_count": len(result.layout.panels),
                "button_count": len(result.layout.buttons),
                "line_count": len(result.layout.lines),
                "frame_number": self.frame_count
            }

        # Check for diagnostic alerts
        elif result.diagnostic and result.diagnostic.severity != "SUCCESS":
            should_pulse = True
            pulse_type = "diagnostic_pulse"
            pulse_data = {
                "source": "shotcut_visual_hud",
                "severity": result.diagnostic.severity,
                "message": result.diagnostic.message,
                "tokens": result.diagnostic.tokens,
                "frame_number": self.frame_count
            }

        if should_pulse:
            try:
                pulse = {
                    "type": pulse_type,
                    "timestamp": time.time(),
                    "data": pulse_data
                }
                await self.hud_ws.send(json.dumps(pulse))
                self.last_telemetry_time = time.time()
                print(f"📡 Telemetry pulse sent: {pulse_type}")
            except Exception as e:
                print(f"⚠️ Telemetry pulse failed: {e}")

    async def run(self):
        import websockets

        await self._connect_hud()

        print(f"🚀 Connecting to VM bridge at {self.bridge_url}...")
        try:
            async with websockets.connect(self.bridge_url) as ws:
                print("✅ Connected. Subscribing to frames...")

                # Subscribe to frames
                subscribe_msg = {
                    "command": "subscribe_frames",
                    "params": {"interval_ms": self.interval_ms}
                }
                await ws.send(json.dumps(subscribe_msg))

                print(f"🎬 Stream started (Target: {1000 / self.interval_ms:.1f} FPS)")
                print("-" * 60)

                async for message in ws:
                    data = json.loads(message)

                    if data.get("type") == "frame":
                        self.frame_count += 1
                        frame_data = data.get("data")

                        # Process frame
                        process_start = time.time()
                        result = self.pipeline.extract_from_base64(frame_data)
                        process_end = time.time()

                        # Calculate latency
                        latency = (process_end - process_start) * 1000
                        fps = self.frame_count / (time.time() - self.start_time)

                        print(
                            f"\n--- Frame #{
                                self.frame_count} | Latency: {
                                latency:.1f}ms | Avg FPS: {
                                fps:.1f} ---")
                        print(result.ascii_view)

                        if result.diagnostic and result.diagnostic.severity != "SUCCESS":
                            print(f"⚠️ DIAGNOSTIC: {result.diagnostic.message}")

                        # Broadcast to HUD if enabled
                        if self.hud_url:
                            if not self.hud_ws:
                                await self._connect_hud()
                            await self._broadcast_to_hud(frame_data, result)
                    else:
                        print(f"Message from bridge: {data}")

        except ConnectionRefusedError:
            print(f"❌ Error: Could not connect to bridge at {self.bridge_url}")
        except Exception as e:
            print(f"❌ Error: {e}")


async def main():
    parser = argparse.ArgumentParser(description="Real-time Visual Feed Client")
    parser.add_argument("--url", default="ws://localhost:8768", help="VM Bridge WebSocket URL")
    parser.add_argument("--hud", default="ws://localhost:8768",
                        help="Visual Bridge HUD WebSocket URL")
    parser.add_argument("--interval", type=int, default=500, help="Frame interval in ms")

    args = parser.parse_args()

    feed = RealtimeFeed(args.url, args.interval, args.hud)
    await feed.run()

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        print("\nFeed stopped.")
