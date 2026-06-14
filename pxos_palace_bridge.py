#!/usr/bin/env python3
"""
pxOS Memory Palace Bridge

Reactive Memory Palace rendering using pxOS (Pixel Operating System).

Architecture:
  memory_palace_facts.json → pxos_palace_bridge.py → pxOS cells → PNG output

Advantages over GeOS assembly:
  - No assembly needed for features
  - Reactive auto-updates when facts change
  - PNG export
  - Browser viewer
  - HTTP API for integration
"""

import json
import socket
import math
from pathlib import Path
from datetime import datetime

FACTS_FILE = Path.home() / "projects" / "zion" / "projects" / "geometry_os" / "geometry_os" / "memory_palace_facts.json"
PXOS_HOST = "localhost"
PXOS_PORT = 8080  # Use 8080 instead of 3839 (occupied by OpenClaw)

# pxOS canvas dimensions
WIDTH = 480
HEIGHT = 240
CENTER_X = WIDTH // 2
CENTER_Y = HEIGHT // 2

# Ring configuration
BASE_RADIUS = 30
RING_SPACING = 25

# Tier colors (pxOS named colors or RGB)
TIER_COLORS = {
    "critical": [0xff, 0x00, 0x00],    # Red
    "important": [0xff, 0xff, 0x00],   # Yellow
    "reference": [0x00, 0x00, 0xff],    # Blue
}


def send_pxos_command(endpoint, data=None, method="GET"):
    """Send command to pxOS server."""
    import urllib.request
    import urllib.error

    url = f"http://{PXOS_HOST}:{PXOS_PORT}{endpoint}"

    try:
        if data and method == "POST":
            req = urllib.request.Request(
                url,
                data=json.dumps(data).encode(),
                headers={"Content-Type": "application/json"},
                method="POST"
            )
        else:
            req = urllib.request.Request(url, method=method)

        with urllib.request.urlopen(req, timeout=5) as response:
            return json.loads(response.read().decode())
    except urllib.error.URLError as e:
        print(f"✗ pxOS error: {e}")
        return None
    except Exception as e:
        print(f"✗ Error: {e}")
        return None


def load_facts():
    """Load facts from JSON file."""
    if not FACTS_FILE.exists():
        print(f"✗ Facts file not found: {FACTS_FILE}")
        return []

    with open(FACTS_FILE) as f:
        data = json.load(f)

    return data.get("facts", [])


def facts_to_cells(facts):
    """Convert facts to pxOS cells."""
    cells = {
        "title": "MEMORY PALACE",
        "fact_count": len(facts),
        "last_updated": datetime.now().strftime("%H:%M:%S"),
    }

    # Add each fact as a cell
    for i, fact in enumerate(facts):
        cells[f"fact_{i}_tier"] = fact.get("tier", "reference")
        cells[f"fact_{i}_angle"] = fact.get("angle", 0)
        cells[f"fact_{i}_ring"] = fact.get("ring", 0)
        cells[f"fact_{i}_subject"] = fact.get("subject", "")
        cells[f"fact_{i}_content"] = fact.get("content", "")

        # Calculate position (cell coordinates)
        ring = fact.get("ring", 0)
        angle = fact.get("angle", 0)
        radius = BASE_RADIUS + (ring * RING_SPACING)

        # Convert angle to radians
        angle_rad = math.radians(angle)

        # Calculate pixel position
        px = CENTER_X + radius * math.cos(angle_rad)
        py = CENTER_Y + radius * math.sin(angle_rad)

        # Convert to cell coordinates (6x10 pixels per cell)
        col = int(px / 6)
        row = int(py / 10)

        cells[f"fact_{i}_col"] = col
        cells[f"fact_{i}_row"] = row

    return cells


def build_template(fact_count):
    """Build pxOS template for Memory Palace rendering."""

    # Draw title
    template = [
        {"fn": "TEXT", "args": [1, 0, "title"]},
    ]

    # Draw concentric rings
    for ring in range(3):
        radius_cells = (BASE_RADIUS + ring * RING_SPACING) / 6  # Convert to cell units
        template.append({
            "fn": "CIRCLE",
            "args": [CENTER_X // 6, CENTER_Y // 10, radius_cells, [0x60, 0x60, 0x60], False]
        })

    # Draw center dot
    template.append({
        "fn": "CIRCLE",
        "args": [CENTER_X // 6, CENTER_Y // 10, 2, [0xff, 0xff, 0xff], True]
    })

    # Draw each fact
    for i in range(fact_count):
        # Draw colored dot
        template.append({
            "fn": "CIRCLE",
            "args": [f"fact_{i}_col", f"fact_{i}_row", 1.5, f"fact_{i}_tier_color", True]
        })

        # Draw subject label (next to dot)
        template.append({
            "fn": "TEXT",
            "args": [f"fact_{i}_col_label", f"fact_{i}_row_label", f"fact_{i}_subject"]
        })

    # Draw footer
    template.append({
        "fn": "TEXT",
        "args": [1, 23, "footer"]
    })

    return template


def setup_colors(facts):
    """Set up tier color mappings in cells."""
    color_cells = {}

    for i, fact in enumerate(facts):
        tier = fact.get("tier", "reference")
        color_cells[f"fact_{i}_tier_color"] = TIER_COLORS.get(tier, [0x80, 0x80, 0x80])

        # Label position (slightly offset from dot)
        color_cells[f"fact_{i}_col_label"] = f"fact_{i}_col + 2"
        color_cells[f"fact_{i}_row_label"] = f"fact_{i}_row"

    return color_cells


def render_palace():
    """Render Memory Palace in pxOS."""
    print("🏰 pxOS Memory Palace Bridge")
    print("="*60)

    # Load facts
    facts = load_facts()
    print(f"✓ Loaded {len(facts)} facts")

    # Convert to cells
    cells = facts_to_cells(facts)
    cells["footer"] = f"Facts: {len(facts)} | Updated: {cells['last_updated']}"

    # Add color mappings
    cells.update(setup_colors(facts))

    # Send cells to pxOS
    print("📊 Sending cells to pxOS...")
    result = send_pxos_command("/api/v1/cells", cells, "POST")
    if result and result.get("ok"):
        print(f"✓ Updated {len(cells)} cells")
    else:
        print("✗ Failed to update cells")
        return

    # Build and set template
    print("🎨 Setting up render template...")
    template = build_template(len(facts))
    result = send_pxos_command("/api/v1/template", template, "POST")
    if result and result.get("ok"):
        print(f"✓ Template set with {len(template)} formulas")
    else:
        print("✗ Failed to set template")
        return

    # Get rendered PNG
    print("📸 Rendering PNG...")
    result = send_pxos_command("/api/v1/render")

    if result:
        # Save PNG
        output_path = Path.cwd() / "memory_palace_pxos.png"
        with open(output_path, "wb") as f:
            f.write(result)

        print(f"✓ Saved to {output_path}")
        print()
        print("View options:")
        print(f"  1. Open: {output_path}")
        print(f"  2. Browser: http://{PXOS_HOST}:{PXOS_PORT}/viewer/viewer.html")
        print(f"  3. API: curl http://{PXOS_HOST}:{PXOS_PORT}/api/v1/render -o palace.png")
    else:
        print("✗ Failed to render")


def watch_mode():
    """Watch facts file and auto-re-render on changes."""
    import time

    print("🔄 Watch mode enabled")
    print("   Press Ctrl+C to stop")
    print()

    last_modified = 0

    try:
        while True:
            if FACTS_FILE.exists():
                mtime = FACTS_FILE.stat().st_mtime

                if mtime > last_modified:
                    print(f"📝 [{datetime.now().strftime('%H:%M:%S')}] Facts changed, re-rendering...")
                    render_palace()
                    last_modified = mtime

            time.sleep(1)
    except KeyboardInterrupt:
        print("\n🛑 Watch mode stopped")


if __name__ == "__main__":
    import sys

    if len(sys.argv) > 1 and sys.argv[1] == "watch":
        watch_mode()
    else:
        render_palace()