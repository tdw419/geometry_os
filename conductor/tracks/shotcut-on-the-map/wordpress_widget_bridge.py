"""
WordPress Widget Bridge - Semantic Content in Interactive UI

Extends the UITransmuter to support WordPress content widgets that can be
rendered in the interactive visual shell.

Widget Types:
- journal: Recent execution logs (posts)
- metric: Real-time system metrics
- program: Reference documentation (pages)

Usage:
    from wordpress_widget_bridge import WordPressWidgetBridge

    bridge = WordPressWidgetBridge()
    widgets = bridge.fetch_recent_posts(limit=5)
    wgsl = transmuter.transmute({'widgets': widgets})
"""

import json
import os
import sys
from datetime import datetime
from typing import List, Dict, Any, Optional

# WordPress zone path
WP_ZONE = os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(__file__))), "wordpress_zone")


class WordPressWidgetBridge:
    """
    Bridges WordPress semantic content to UI widgets.

    Reads from:
    - telemetry/ directory for recent events
    - WordPress database (via publish_to_wp) for posts/pages

    Outputs:
    - Widget JSON format compatible with UITransmuter
    """

    def __init__(self, wp_zone_path: str = WP_ZONE):
        self.wp_zone = wp_zone_path
        self.telemetry_dir = os.path.join(wp_zone_path, "telemetry")

    def fetch_recent_events(self, limit: int = 10) -> List[Dict[str, Any]]:
        """
        Fetch recent telemetry events (simulated WordPress posts).

        Returns widgets compatible with UITransmuter format.
        """
        widgets = []

        if not os.path.exists(self.telemetry_dir):
            return widgets

        # Read recent telemetry files
        files = sorted(
            [f for f in os.listdir(self.telemetry_dir) if f.endswith('.json')],
            reverse=True
        )[:limit]

        for i, filename in enumerate(files):
            filepath = os.path.join(self.telemetry_dir, filename)
            try:
                with open(filepath, 'r') as f:
                    event = json.load(f)

                # Convert to widget format
                widget = self._event_to_widget(event, i)
                if widget:
                    widgets.append(widget)
            except Exception as e:
                print(f"Error reading {filename}: {e}")

        return widgets

    def _event_to_widget(self, event: Dict, index: int) -> Optional[Dict[str, Any]]:
        """Convert telemetry event to widget format."""
        event_type = event.get("type", "unknown")
        data = event.get("data", {})
        timestamp = event.get("timestamp", "")

        if event_type == "evolution_event":
            # Geometric execution event
            return {
                "type": "journal",
                "text": data.get("program", "unknown"),
                "bbox": self._calculate_bbox(index, "journal"),
                "action": f"execution:{data.get('program', 'unknown')}",
                "metadata": {
                    "steps": data.get("steps", 0),
                    "halted": data.get("halted", False),
                    "registers_used": data.get("non_zero_registers", 0),
                    "timestamp": timestamp
                }
            }

        elif event_type == "diagnostic_pulse":
            # Breakthrough or important event
            return {
                "type": "metric",
                "text": data.get("title", "breakthrough"),
                "bbox": self._calculate_bbox(index, "metric"),
                "action": f"breakthrough:{data.get('title', '')}",
                "metadata": {
                    "metrics": data.get("metrics", {}),
                    "timestamp": timestamp
                }
            }

        return None

    def _calculate_bbox(self, index: int, widget_type: str) -> List[float]:
        """Calculate widget bounding box based on type and index."""
        # Layout grid: 4 columns, widgets placed in rows
        col = index % 4
        row = index // 4

        # Base dimensions by type
        if widget_type == "journal":
            width, height = 0.15, 0.08
        elif widget_type == "metric":
            width, height = 0.12, 0.06
        else:
            width, height = 0.1, 0.05

        # Position (normalized 0-1)
        x = 0.05 + col * (width + 0.02)
        y = 0.05 + row * (height + 0.02)

        return [x, y, width, height]

    def fetch_mock_widgets(self) -> List[Dict[str, Any]]:
        """
        Generate mock widgets for testing when WordPress is unavailable.
        """
        return [
            {
                "type": "panel",
                "text": "GEOMETRIC EXECUTIONS",
                "bbox": [0.02, 0.02, 0.20, 0.40],
                "action": None,
                "index": 0
            },
            {
                "type": "button",
                "text": "hello.pasm",
                "bbox": [0.03, 0.05, 0.18, 0.08],
                "action": "load_program:hello.pasm",
                "index": 1
            },
            {
                "type": "button",
                "text": "multiply.pasm",
                "bbox": [0.03, 0.14, 0.18, 0.08],
                "action": "load_program:multiply.pasm",
                "index": 2
            },
            {
                "type": "panel",
                "text": "WORDPRESS FEED",
                "bbox": [0.78, 0.02, 0.20, 0.50],
                "action": None,
                "index": 3
            },
            {
                "type": "journal",
                "text": "Execution #42: PAS Score 0.99",
                "bbox": [0.79, 0.05, 0.18, 0.10],
                "action": "view_post:42",
                "index": 4
            },
            {
                "type": "journal",
                "text": "Breakthrough: Fitness 0.95",
                "bbox": [0.79, 0.16, 0.18, 0.10],
                "action": "view_post:41",
                "index": 5
            },
            {
                "type": "metric",
                "text": "Registers: r1=10 r2=20",
                "bbox": [0.25, 0.85, 0.50, 0.10],
                "action": None,
                "index": 6
            },
            {
                "type": "playhead",
                "text": "PC=3",
                "bbox": [0.50, 0.50, 0.01, 0.30],
                "action": None,
                "index": 7
            },
        ]

    def generate_telemetry_summary(self) -> Dict[str, Any]:
        """Generate a summary of recent telemetry for HUD display."""
        events = self.fetch_recent_events(20)

        executions = [e for e in events if e.get("type") == "journal"]
        breakthroughs = [e for e in events if e.get("type") == "metric"]

        return {
            "total_events": len(events),
            "executions": len(executions),
            "breakthroughs": len(breakthroughs),
            "last_event": events[0].get("metadata", {}).get("timestamp", "") if events else "none",
            "widgets_generated": len(events)
        }


def demo():
    """Demo: Generate widgets from WordPress content."""
    bridge = WordPressWidgetBridge()

    print("=== Recent Telemetry Events ===")
    events = bridge.fetch_recent_events(5)
    for event in events:
        print(f"  - {event.get('type')}: {event.get('text')}")
        print(f"    bbox: {event.get('bbox')}")
        print(f"    action: {event.get('action')}")

    if not events:
        print("  (No events found, using mock data)")
        print("\n=== Mock Widgets ===")
        mock = bridge.fetch_mock_widgets()
        for w in mock[:5]:
            print(f"  - [{w['type']}] {w['text']}")

    print("\n=== Summary ===")
    summary = bridge.generate_telemetry_summary()
    for key, val in summary.items():
        print(f"  {key}: {val}")


if __name__ == "__main__":
    demo()
