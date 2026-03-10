#!/usr/bin/env python3
"""
Verification Script for Unified Glass Box Bridge
Demonstrates multi-stream output for Glass Box visualization.

Streams:
- THOUGHT: Daemon thoughts (task status, GVN optimizations)
- TOKEN: LLM token streaming with Hilbert mapping
- GRAVITY: File orb position updates
- TELEMETRY: System health metrics
- RIPPLE: Tectonic physical impulses
"""

import sys
import time
import json
import argparse
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.sisyphus.unified_glass_bridge import (
    UnifiedGlassBridge, StreamType, TransportType
)


def print_header(title):
    print("\n" + "=" * 60)
    print(f"  {title}")
    print("=" * 60)


def print_stream(stream_type, data):
    """Pretty print a stream message."""
    colors = {
        StreamType.THOUGHT: "\033[96m",   # Cyan
        StreamType.TOKEN: "\033[93m",     # Yellow
        StreamType.GRAVITY: "\033[92m",   # Green
        StreamType.TELEMETRY: "\033[94m", # Blue
        StreamType.RIPPLE: "\033[91m",    # Red
    }
    reset = "\033[0m"
    color = colors.get(stream_type, "")
    print(f"{color}[{stream_type.value.upper()}]{reset} {json.dumps(data, indent=2)[:200]}")


def main():
    parser = argparse.ArgumentParser(description="Verify Unified Glass Box Bridge")
    parser.add_argument("--socket", action="store_true", help="Enable socket transport")
    parser.add_argument("--shm", action="store_true", default=True, help="Enable shared memory transport")
    parser.add_argument("--http", action="store_true", help="Enable HTTP transport")
    parser.add_argument("--duration", type=int, default=10, help="Test duration in seconds")
    parser.add_argument("--verbose", "-v", action="store_true", help="Verbose output")
    args = parser.parse_args()

    print_header("Unified Glass Box Bridge - Multi-Stream Verification")

    # Create bridge
    bridge = UnifiedGlassBridge(
        enable_socket=args.socket,
        enable_shm=args.shm,
        enable_http=args.http
    )

    # Subscribe to all streams for visualization
    def on_message(msg):
        if args.verbose:
            print_stream(msg.stream_type, msg.payload)

    for st in StreamType:
        bridge.subscribe(st, on_message)

    print("\n📡 Connecting transports...")
    connected = bridge.connect()
    print(f"   Socket: {'✓' if bridge._socket_bridge else '✗'}")
    print(f"   Shared Memory: {'✓' if bridge._shm else '✗'}")
    print(f"   HTTP: {'✓' if bridge.enable_http else '✗'}")

    if not connected:
        print("\n⚠️  No transports connected. Running in mock mode.")

    print(f"\n🚀 Starting multi-stream output ({args.duration}s)...")
    print("   Press Ctrl+C to stop early\n")

    start_time = time.time()
    iteration = 0

    try:
        while time.time() - start_time < args.duration:
            iteration += 1
            elapsed = time.time() - start_time

            # 1. Stream thoughts every second
            bridge.stream_thought("daemon_heartbeat", {
                "iteration": iteration,
                "elapsed": f"{elapsed:.1f}s",
                "status": "running"
            })

            # 2. Stream tokens (simulating LLM output)
            if iteration % 2 == 0:
                tokens = [
                    ("def", "keyword"),
                    ("process_", "identifier"),
                    ("gravity", "identifier"),
                    ("(", "punctuation"),
                    ("self", "identifier"),
                    (")", "punctuation"),
                    (":", "punctuation"),
                    ("return", "keyword"),
                ]
                for token, ttype in tokens:
                    bridge.stream_token(token, token_type=ttype)

            # 3. Stream gravity updates every 3 seconds
            if iteration % 3 == 0:
                gravity_updates = [
                    {"path": "kernel.rs", "x": 100 + iteration, "y": 150 + iteration, "z": 10},
                    {"path": "app.py", "x": 200 - iteration * 0.5, "y": 250, "z": 50},
                    {"path": "config.json", "x": 300, "y": 350 + iteration * 0.3, "z": 100},
                ]
                bridge.stream_gravity(gravity_updates)

            # 4. Stream telemetry every 5 seconds
            if iteration % 5 == 0:
                bridge.stream_telemetry({
                    "cpu": 45 + (iteration % 10),
                    "memory": 1024 + iteration * 10,
                    "fps": 60 - (iteration % 5),
                    "entropy": 0.75 - (iteration % 10) * 0.01,
                    "uptime": elapsed
                })

            # 5. Stream ripple occasionally
            if iteration % 7 == 0:
                bridge.stream_ripple(
                    x=500 + iteration * 10,
                    y=500,
                    z=50,
                    force=100.0 * (1 if iteration % 2 == 0 else -1),
                    radius=200.0
                )

            # Print progress
            if iteration % 5 == 0:
                stats = bridge.get_stats()
                print(f"⏱️  {elapsed:.1f}s | "
                      f"Thoughts: {stats['thoughts_sent']} | "
                      f"Tokens: {stats['tokens_sent']} | "
                      f"Gravity: {stats['gravity_updates_sent']} | "
                      f"Ripples: {stats['ripples_sent']}")

            time.sleep(1.0)

    except KeyboardInterrupt:
        print("\n\n⏹️  Stopped by user")

    # Print final statistics
    print_header("Multi-Stream Statistics")
    print(bridge.get_stats_summary())

    print("\n📊 Detailed Stats:")
    stats = bridge.get_stats()
    print(json.dumps(stats, indent=2))

    # Cleanup
    bridge.disconnect()
    print("\n✓ Verification complete!")

    return 0


if __name__ == "__main__":
    sys.exit(main())
