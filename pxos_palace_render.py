#!/usr/bin/env python3
"""
Memory Palace pxOS Renderer

Direct rendering using pxOS's formula engine via Node.js.

This bypasses the need for pxOS server and renders directly to PNG.
"""

import json
import subprocess
import math
from pathlib import Path
from datetime import datetime

FACTS_FILE = Path.home() / "projects" / "zion" / "projects" / "geometry_os" / "geometry_os" / "memory_palace_facts.json"
PXOS_PATH = Path("/home/jericho/zion/projects/ascii_world/ascii_world")

# Canvas dimensions
WIDTH = 480
HEIGHT = 240
CENTER_X = WIDTH // 2
CENTER_Y = HEIGHT // 2

# Ring configuration
BASE_RADIUS = 30
RING_SPACING = 25


def load_facts():
    """Load facts from JSON file."""
    if not FACTS_FILE.exists():
        print(f"✗ Facts file not found: {FACTS_FILE}")
        return []

    with open(FACTS_FILE) as f:
        data = json.load(f)

    return data.get("facts", [])


def render_palace_nodejs(facts):
    """Render palace using Node.js + pxOS formula engine."""

    # Build cells
    cells = {
        "title": "MEMORY PALACE",
        "fact_count": len(facts),
        "last_updated": datetime.now().strftime("%H:%M:%S"),
    }

    # Tier colors
    tier_colors = {
        "critical": [0xff, 0, 0],
        "important": [0xff, 0xff, 0],
        "reference": [0, 0, 0xff],
    }

    # Calculate positions for each fact
    for i, fact in enumerate(facts):
        tier = fact.get("tier", "reference")
        ring = fact.get("ring", 0)
        angle = fact.get("angle", 0)

        # Calculate pixel position
        radius = BASE_RADIUS + (ring * RING_SPACING)
        angle_rad = math.radians(angle)

        px = CENTER_X + radius * math.cos(angle_rad)
        py = CENTER_Y + radius * math.sin(angle_rad)

        # Convert to cell coordinates
        col = int(px / 6)
        row = int(py / 10)

        cells[f"fact_{i}_tier"] = tier
        cells[f"fact_{i}_col"] = col
        cells[f"fact_{i}_row"] = row
        cells[f"fact_{i}_subject"] = fact.get("subject", "")
        cells[f"fact_{i}_color"] = tier_colors.get(tier, [0x80, 0x80, 0x80])

    # Build Node.js script
    script = f"""
import {{ PixelFormulaEngine }} from '{PXOS_PATH}/sync/pixel-formula-engine.js';
import {{ writeFileSync }} from 'fs';

const engine = new PixelFormulaEngine({WIDTH}, {HEIGHT});

// Set cells
engine.setCells({json.dumps(cells)});

// Clear
engine.clear();

// Draw title
engine.TEXT(1, 0, 'title');

// Draw rings
"""

    # Draw concentric rings
    for ring in range(3):
        radius_cells = (BASE_RADIUS + ring * RING_SPACING) / 6
        script += f"""
engine.CIRCLE({CENTER_X // 6}, {CENTER_Y // 10}, {radius_cells}, [0x60, 0x60, 0x60], false);
"""

    # Draw center
    script += f"""
// Draw center
engine.CIRCLE({CENTER_X // 6}, {CENTER_Y // 10}, 2, [0xff, 0xff, 0xff], true);

"""

    # Draw facts
    for i, fact in enumerate(facts):
        script += f"""
// Fact {i}
engine.CIRCLE(engine.resolveValue('fact_{i}_col'), engine.resolveValue('fact_{i}_row'), 1.5, engine.resolveValue('fact_{i}_color'), true);
engine.TEXT(engine.resolveValue('fact_{i}_col') + 2, engine.resolveValue('fact_{i}_row'), 'fact_{i}_subject');
"""

    # Footer
    script += f"""
// Footer
engine.TEXT(1, 23, `Facts: ${{engine.resolveValue('fact_count')}} | Updated: ${{engine.resolveValue('last_updated')}}`);

// Export to PNG
const png = await engine.toPNG();
writeFileSync('memory_palace_pxos.png', png);
console.log('✓ Saved to memory_palace_pxos.png');
"""

    # Write and execute
    script_path = Path.cwd() / "_render_palace.mjs"
    with open(script_path, "w") as f:
        f.write(script)

    # Run with Node.js
    result = subprocess.run(
        ["node", str(script_path)],
        capture_output=True,
        text=True,
        cwd=Path.cwd()
    )

    if result.returncode == 0:
        print(result.stdout)
        return Path.cwd() / "memory_palace_pxos.png"
    else:
        print(f"✗ Error rendering:")
        print(result.stderr)
        return None


def main():
    print("🏰 Memory Palace pxOS Renderer")
    print("="*60)

    facts = load_facts()
    print(f"✓ Loaded {len(facts)} facts")

    output_path = render_palace_nodejs(facts)

    if output_path and output_path.exists():
        print(f"✓ Rendered to {output_path}")
        print()
        print("View options:")
        print(f"  1. Open: {output_path}")
        print(f"  2. Preview: xdg-open {output_path}")
    else:
        print("✗ Failed to render")


if __name__ == "__main__":
    main()