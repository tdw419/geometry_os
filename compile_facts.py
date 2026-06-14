#!/usr/bin/env python3

import json
import struct
from pathlib import Path

FACTS_FILE = Path.home() / "projects" / "zion" / "projects" / "geometry_os" / "geometry_os" / "memory_palace_facts.json"
BINARY_FILE = Path.home() / "projects" / "zion" / "projects" / "geometry_os" / "geometry_os" / "programs" / "memory_palace.dat"

def compile_facts():
    """Compile facts.json to binary format for GeOS to read.

    Binary format:
    u32: fact_count
    For each fact:
        u32: tier (0=critical, 1=important, 2=reference)
        u32: angle
        u32: ring
    """

    with open(FACTS_FILE) as f:
        data = json.load(f)

    facts = data.get("facts", [])

    # Tier mapping
    tier_map = {"critical": 0, "important": 1, "reference": 2}

    # Write binary
    with open(BINARY_FILE, "wb") as f:
        # Header: magic + version + count
        f.write(struct.pack("<II", 0xDEADBEEF, 1))  # magic, version
        f.write(struct.pack("<I", len(facts)))      # fact_count

        # Each fact
        for fact in facts:
            tier = tier_map.get(fact.get("tier", "reference"), 2)
            angle = fact.get("angle", 0)
            ring = fact.get("ring", 0)
            f.write(struct.pack("<III", tier, angle, ring))

    print(f"✓ Compiled {len(facts)} facts to {BINARY_FILE}")
    print(f"  Size: {BINARY_FILE.stat().st_size} bytes")

if __name__ == "__main__":
    compile_facts()