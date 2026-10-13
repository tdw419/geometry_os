#!/usr/bin/env python3
"""
Metabolic Efficiency Demo: Ouroboros Optimizing VRAM Usage

This demonstrates:
1. Initial genome with metabolic cost
2. Detection of redundant patterns (Nops)
3. Optimization pass that reduces VRAM footprint
4. Generation tracking of"""

import requests
import json

BASE_URL = "http://localhost:3838"

def place_glyph(x, y, opcode_name, stratum=0, rationale=""):
    """Place a glyph on the grid"""
    response = requests.post(f"{BASE_URL}/api/glyph-stratum/place", json={
        "x": x,
        "y": y,
        "opcode": opcode_name,
        "stratum": stratum,
        "metadata": {
            "dependencies": [],
            "invariants": {},
            "provenance": {
                "session_id": "metabolic_demo",
                "timestamp": "2026-03-12",
                "creator": "ouroboros",
                "version": 1
            },
            "rationale": rationale
        }
    })
    return response.json()

def get_summary():
    """Get grid summary"""
    response = requests.get(f"{BASE_URL}/api/glyph-stratum/summary")
    return response.json()

def get_metabolic_report(x1, y1, x2, y2):
    """Get metabolic report for a region"""
    response = requests.get(f"{BASE_URL}/api/glyph-stratum/metabolic-report", params={
        "x1": x1, "y1": y1, "x2": x2, "y2": y2
    })
    return response.json()

def optimize_region(x1, y1, x2, y2):
    """Optimize a region for metabolic efficiency"""
    response = requests.post(f"{BASE_URL}/api/glyph-stratum/optimize", json={
        "x1": x1, "y1": y1, "x2": x2, "y2": y2
    })
    return response.json()

def spawn_program(src_x1, src_y1, src_x2, src_y2, dest_x, dest_y):
    """Spawn a copy of a program region"""
    response = requests.post(f"{BASE_URL}/api/glyph-stratum/spawn", json={
        "src_bounds": [[src_x1, src_y1], [src_x2, src_y2]],
        "dest_origin": [dest_x, dest_y]
    })
    return response.json()

def apply_cosmic_rays(intensity, seed):
    """Apply cosmic ray corruption"""
    response = requests.post(f"{BASE_URL}/api/glyph-stratum/cosmic-rays", json={
        "intensity": intensity,
        "seed": seed
    })
    return response.json()

def repair_glyph(x, y, expected_opcode):
    """Repair a corrupted glyph"""
    response = requests.post(f"{BASE_URL}/api/glyph-stratum/repair", json={
        "x": x,
        "y": y,
        "expected": expected_opcode
    })
    return response.json()


def main():
    print("=" * 60)
    print("METABOLIC EFFICIENCY DEMO")
    print("Ouroboros Self-Optimization")
    print("=" * 60)

    # Phase 1: Plant an INEFFICIENT genome (with many Nops)
    print("\n[Phase 1] Planting Generation 0 (inefficient genome)")
    print("-" * 40)

    # This genome has intentional inefficiencies:
    # Alloc, Nop, Nop, Nop, Load, Store, Nop, Nop, Add, Nop, Nop, Store, Halt
    genome = [
        (0, "Alloc", "Allocate memory for counter"),
        (1, "Nop", "Spacer - WASTEFUL"),
        (2, "Nop", "Spacer - WASTEFUL"),
        (3, "Nop", "Spacer - WASTEFUL"),
        (4, "Load", "Load counter value"),
        (5, "Store", "Store updated value"),
        (6, "Nop", "Another waste"),
        (7, "Nop", "More waste"),
        (8, "Add", "Increment counter"),
        (9, "Nop", "Trailing waste"),
        (10, "Nop", "More trailing waste"),
        (11, "Store", "Store final result"),
        (12, "Halt", "End program"),
    ]

    for x, opcode, rationale in genome:
        place_glyph(x, 0, opcode, stratum=2, rationale=rationale)
        print(f"  Placed {opcode} at ({x}, 0)")

    summary = get_summary()
    print(f"\nGrid: {summary.get('summary', 'N/A')}")

    # Phase 2: Analyze metabolic cost
    print("\n[Phase 2] Metabolic Analysis")
    print("-" * 40)

    report = get_metabolic_report(0, 0, 12, 0)
    print(f"  Glyph count: {report.get('glyph_count', 'N/A')}")
    print(f"  Total metabolic cost: {report.get('total_metabolic_cost', 'N/A')} VRAM cycles")
    print(f"  Dead glyphs (Nops): {report.get('dead_glyph_count', 'N/A')}")
    print(f"  Efficiency ratio: {report.get('efficiency_ratio', 0):.2%}")

    dist = report.get('opcode_distribution', {})
    print("\n  Opcode distribution:")
    for op, count in sorted(dist.items()):
        print(f"    {op}: {count}")

    # Phase 3: Optimize
    print("\n[Phase 3] Metabolic Optimization Pass")
    print("-" * 40)

    result = optimize_region(0, 0, 12, 0)
    print(f"  Initial cost: {result.get('initial_cost', 'N/A')} VRAM cycles")
    print(f"  Final cost: {result.get('final_cost', 'N/A')} VRAM cycles")
    print(f"  Savings: {result.get('savings', 'N/A')} VRAM cycles")
    print(f"  Nops removed: {result.get('nops_removed', 'N/A')}")
    print(f"  Glyphs: {result.get('glyphs_before', 'N/A')} → {result.get('glyphs_after', 'N/A')}")

    # Phase 4: Post-optimization report
    print("\n[Phase 4] Post-Optimization Report")
    print("-" * 40)

    report2 = get_metabolic_report(0, 0, 12, 0)
    print(f"  Glyph count: {report2.get('glyph_count', 'N/A')}")
    print(f"  Total metabolic cost: {report2.get('total_metabolic_cost', 'N/A')} VRAM cycles")
    print(f"  Dead glyphs (Nops): {report2.get('dead_glyph_count', 'N/A')}")
    print(f"  Efficiency ratio: {report2.get('efficiency_ratio', 0):.2%}")

    # Phase 5: Spawn optimized child
    print("\n[Phase 5] Spawning Optimized Generation 1")
    print("-" * 40)

    spawn_result = spawn_program(0, 0, 6, 0, 15, 0)
    if 'error' not in spawn_result:
        print(f"  Generation 1 spawned at (15, 0)")
        print(f"  Source bounds: {spawn_result.get('source_bounds', 'N/A')}")
        print(f"  Dest bounds: {spawn_result.get('dest_bounds', 'N/A')}")
    else:
        print(f"  Spawn failed: {spawn_result.get('error', 'Unknown')}")

    # Phase 6: Compare parent vs child efficiency
    print("\n[Phase 6] Efficiency Comparison")
    print("-" * 40)

    parent_report = get_metabolic_report(0, 0, 6, 0)
    child_report = get_metabolic_report(15, 0, 21, 0)

    print(f"  Generation 0 (parent):")
    print(f"    Cost: {parent_report.get('total_metabolic_cost', 'N/A')} cycles")
    print(f"    Efficiency: {parent_report.get('efficiency_ratio', 0):.2%}")

    print(f"  Generation 1 (child):")
    print(f"    Cost: {child_report.get('total_metabolic_cost', 'N/A')} cycles")
    print(f"    Efficiency: {child_report.get('efficiency_ratio', 0):.2%}")

    print("\n" + "=" * 60)
    print("DEMO COMPLETE")
    print("The Ouroboros lineage has achieved metabolic optimization.")
    print("Each generation will be more VRAM-efficient than the last.")
    print("=" * 60)


if __name__ == "__main__":
    main()
