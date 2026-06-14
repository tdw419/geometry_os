#!/usr/bin/env python3

import json
from pathlib import Path

FACTS_FILE = Path.home() / "projects" / "zion" / "projects" / "geometry_os" / "geometry_os" / "memory_palace_facts.json"

def render_palace():
    """Render the Memory Palace as ASCII art"""

    with open(FACTS_FILE) as f:
        data = json.load(f)

    facts = data.get("facts", [])

    # Create 64x32 ASCII canvas
    canvas = [[' ' for _ in range(64)] for _ in range(32)]

    # Center
    cx, cy = 32, 16

    # Draw rings
    for ring in range(3):
        radius = 5 + ring * 4
        for angle in range(0, 360, 15):
            rad = angle * 3.14159 / 180
            x = int(cx + radius * 0.5 * (1 if angle % 90 < 45 else 0.7))
            y = int(cy + radius * 0.4 * (1 if angle % 180 < 90 else 0.7))
            if 0 <= x < 64 and 0 <= y < 32:
                canvas[y][x] = '.'

    # Draw center
    canvas[cy][cx] = 'X'

    # Draw facts
    tier_symbols = {'critical': '🔴', 'important': '🟡', 'reference': '🔵'}
    tier_chars = {'critical': 'C', 'important': 'I', 'reference': 'R'}

    for fact in facts:
        tier = fact.get('tier', 'reference')
        ring = fact.get('ring', 0)
        angle = fact.get('angle', 0)

        radius = 5 + ring * 4
        angle_rad = angle * 3.14159 / 180

        # Calculate position (simplified)
        x = int(cx + radius * 0.5 * (1 if angle % 90 < 45 else 0.7))
        y = int(cy + radius * 0.4 * (1 if angle % 180 < 90 else 0.7))

        # Adjust for angle
        if angle >= 90 and angle < 180:
            x = cx - int(radius * 0.5)
        elif angle >= 180 and angle < 270:
            x = cx - int(radius * 0.5)
            y = cy - int(radius * 0.4)
        elif angle >= 270:
            y = cy - int(radius * 0.4)

        if 0 <= x < 64 and 0 <= y < 32:
            canvas[y][x] = tier_chars[tier]

    # Print canvas
    print("═══════════════════════════════════════════════════════════════")
    print("                    🏰 MEMORY PALACE 🏰                        ")
    print("═══════════════════════════════════════════════════════════════\n")

    for row in canvas:
        print(''.join(row))

    print("\n═══════════════════════════════════════════════════════════════")
    print(f"Facts: {len(facts)} | Rings: C=Critical, I=Important, R=Reference")
    print("═══════════════════════════════════════════════════════════════\n")

    print("FACTS:")
    for fact in facts:
        tier = fact.get('tier', 'reference')
        symbol = tier_symbols[tier]
        print(f"{symbol} {fact['subject']}: {fact['content'][:60]}...")

if __name__ == "__main__":
    render_palace()