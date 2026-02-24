#!/usr/bin/env python3
"""
Gravity Report - Tectonic Introspection for World of Rectification

Analyzes the codebase and generates a "Spatial Shift" report showing:
- Axion Core files (gravity wells at center)
- High-value files (should gravitate toward center)
- Stale files (husks drifting to periphery)
- Recommended spatial movements
"""

import os
import sys
import json
import math
from pathlib import Path
from datetime import datetime, timedelta
from collections import defaultdict

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.visual_shell.swarm.evolution.value_evaluator import ValueEvaluator


def get_file_stats(project_root: Path) -> dict:
    """Get basic stats for all files in the project."""
    stats = {}

    # Key directories to analyze
    key_dirs = [
        "systems",
        "specs",
        "docs",
        "apps",
    ]

    # Key root files
    root_files = [
        "NORTH_STAR.md",
        "ARCHITECTURE.md",
        "OPERATIONS.md",
        "ROADMAP.md",
        "AGENTS.md",
        "pyproject.toml",
    ]

    for file_name in root_files:
        file_path = project_root / file_name
        if file_path.exists():
            stat = file_path.stat()
            stats[file_name] = {
                "path": str(file_path),
                "size": stat.st_size,
                "modified": stat.st_mtime,
                "is_root": True,
            }

    for dir_name in key_dirs:
        dir_path = project_root / dir_name
        if not dir_path.exists():
            continue

        for file_path in dir_path.rglob("*.py"):
            rel_path = file_path.relative_to(project_root)
            stat = file_path.stat()
            stats[str(rel_path)] = {
                "path": str(file_path),
                "size": stat.st_size,
                "modified": stat.st_mtime,
                "is_root": False,
            }

    return stats


def compute_staleness(modified_time: float, max_days: int = 30) -> float:
    """Compute staleness score (0-1) based on time since modification."""
    age_seconds = datetime.now().timestamp() - modified_time
    age_days = age_seconds / (24 * 3600)

    # Staleness increases with age, saturating at max_days
    return min(1.0, age_days / max_days)


def analyze_gravity(project_root: Path) -> dict:
    """Run the gravity analysis."""
    evaluator = ValueEvaluator()
    file_stats = get_file_stats(project_root)

    results = {
        "axion_core": [],
        "high_value": [],
        "stale_husks": [],
        "all_files": [],
    }

    now = datetime.now().timestamp()

    for file_name, stats in file_stats.items():
        # Compute staleness
        staleness = compute_staleness(stats["modified"])

        # For root files, use Axion Core values
        if evaluator.is_axion_core(file_name):
            score = evaluator.evaluate(
                file_path=file_name,
                access_count=0,
                dependent_count=0,
                coverage=1.0,
                complexity=0.0,
                staleness=0.0,
            )
            results["axion_core"].append({
                "file": file_name,
                "value": score.composite_score,
                "position": "(0, 0)",  # Axion Core at center
            })
        else:
            # Estimate value based on size and staleness
            # Larger files that are stale = higher improvement potential
            size_factor = min(1.0, stats["size"] / 50000)  # Normalize by 50KB

            score = evaluator.evaluate(
                file_path=file_name,
                access_count=0,  # Would need git history for real data
                dependent_count=0,  # Would need import analysis
                coverage=0.5,  # Assume medium coverage
                complexity=size_factor,
                staleness=staleness,
            )

            file_result = {
                "file": file_name,
                "value": round(score.composite_score, 3),
                "staleness": round(staleness, 3),
                "size_kb": round(stats["size"] / 1024, 1),
            }

            results["all_files"].append(file_result)

            # Categorize
            if staleness > 0.8:
                results["stale_husks"].append(file_result)
            elif score.composite_score > 0.5:
                results["high_value"].append(file_result)

    # Sort by value
    results["high_value"].sort(key=lambda x: x["value"], reverse=True)
    results["stale_husks"].sort(key=lambda x: x["staleness"], reverse=True)
    results["all_files"].sort(key=lambda x: x["value"], reverse=True)

    return results


def print_report(results: dict):
    """Print the gravity report."""
    print("=" * 70)
    print("       WORLD OF RECTIFICATION - GRAVITY REPORT")
    print("       Tectonic Introspection Mode")
    print("=" * 70)
    print()

    # Axion Core
    print("✦ AXION CORE (Gravity Wells at Center)")
    print("-" * 40)
    for item in results["axion_core"]:
        print(f"  [{item['value']:.2f}] {item['file']:30s} @ {item['position']}")
    print()

    # High Value Files
    print("⚡ HIGH VALUE FILES (Gravitating to Center)")
    print("-" * 40)
    for item in results["high_value"][:10]:
        print(f"  [{item['value']:.3f}] {item['file']:50s} ({item['size_kb']:.1f}KB)")
    if len(results["high_value"]) > 10:
        print(f"  ... and {len(results['high_value']) - 10} more")
    print()

    # Stale Husks
    print("🜚 STALE HUSKS (Drifting to Periphery)")
    print("-" * 40)
    for item in results["stale_husks"][:10]:
        print(f"  [staleness: {item['staleness']:.2f}] {item['file']:45s}")
    if len(results["stale_husks"]) > 10:
        print(f"  ... and {len(results['stale_husks']) - 10} more")
    print()

    # Summary
    print("=" * 70)
    print("SUMMARY")
    print("-" * 40)
    print(f"  Axion Core Files:    {len(results['axion_core'])}")
    print(f"  High Value Files:    {len(results['high_value'])}")
    print(f"  Stale Husks:         {len(results['stale_husks'])}")
    print(f"  Total Analyzed:      {len(results['all_files']) + len(results['axion_core'])}")
    print()

    # Recommended Actions
    print("RECOMMENDED TECTONIC SHIFTS")
    print("-" * 40)
    print("  1. Axion Core files anchored at (0, 0) - MAXIMUM GRAVITY")
    print("  2. High value files should orbit close to center")
    print("  3. Stale husks identified for potential rectification:")
    for item in results["stale_husks"][:3]:
        print(f"     → {item['file']} (staleness: {item['staleness']:.2f})")
    print()
    print("  Run: ./evolution_ctl.sh introspect  for detailed analysis")
    print("=" * 70)


def main():
    project_root = Path(__file__).parent.parent
    results = analyze_gravity(project_root)
    print_report(results)

    # Also save JSON report
    report_path = project_root / ".geometry" / "gravity_report.json"
    report_path.parent.mkdir(exist_ok=True)
    with open(report_path, "w") as f:
        json.dump(results, f, indent=2)
    print(f"\nReport saved to: {report_path}")


if __name__ == "__main__":
    main()
