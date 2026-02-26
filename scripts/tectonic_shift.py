#!/usr/bin/env python3
"""
Tectonic Shift - Apply Foveated Knowledge Gravity to reorganize the codebase.

Usage:
    python3 scripts/tectonic_shift.py --dry-run    # Preview changes
    python3 scripts/tectonic_shift.py --apply      # Actually move files
    python3 scripts/tectonic_shift.py --status     # Show migration history

The Tectonic Shift aligns the physical file structure with the spatial map:
- Axion Core files stay at root (fovea)
- High-staleness files migrate to /archive/husks/
- Active files remain in their districts
"""

import argparse
import json
import sys
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.evolution_daemon.tectonic_engine import MigrationManager


def load_gravity_data() -> dict:
    """Load the latest gravity report."""
    gravity_path = Path(__file__).parent.parent / ".geometry" / "gravity_report.json"
    if not gravity_path.exists():
        print("❌ No gravity report found. Run: python3 scripts/gravity_report.py")
        sys.exit(1)

    with open(gravity_path) as f:
        return json.load(f)


def main():
    parser = argparse.ArgumentParser(description="Tectonic Shift - Codebase Reorganization")
    parser.add_argument("--dry-run", action="store_true", help="Preview changes without applying")
    parser.add_argument("--apply", action="store_true", help="Apply migrations (dangerous!)")
    parser.add_argument("--status", action="store_true", help="Show migration history")
    parser.add_argument("--limit", type=int, default=10, help="Max migrations to process")
    args = parser.parse_args()

    project_root = Path(__file__).parent.parent
    manager = MigrationManager(project_root)

    if args.status:
        summary = manager.get_migration_summary()
        print("=== TECTONIC SHIFT STATUS ===")
        print(f"Total Migrations: {summary['total_migrations']}")
        print(f"Successful: {summary['successful']}")
        print(f"Failed: {summary['failed']}")
        if summary['history']:
            print("\nRecent Migrations:")
            for h in summary['history']:
                status = "✅" if h.get('success') else "❌"
                print(f"  {status} {h['plan']['source']} → {h['plan']['target']}")
        return

    # Load gravity data
    gravity_data = load_gravity_data()

    print("=== TECTONIC SHIFT ===")
    print()

    # Generate migration plans
    plans = manager.generate_migration_plans(gravity_data)

    if not plans:
        print("✨ No files need migration. The codebase is well-organized.")
        return

    print(f"📋 Generated {len(plans)} migration plans:")
    print()

    for i, plan in enumerate(plans[:args.limit]):
        print(f"{i+1}. {plan.source_path}")
        print(f"   → {plan.target_path}")
        print(f"   Reason: {plan.reason}")
        print(f"   Type: {plan.file_type}")
        print()

    # Apply or preview
    if args.apply:
        print("⚠️  APPLYING MIGRATIONS (This will move files!)")
        confirm = input("Type 'YES' to confirm: ")
        if confirm != "YES":
            print("Aborted.")
            return

        results = manager.apply_migrations(plans, dry_run=False, limit=args.limit)

        success_count = sum(1 for r in results if r.success)
        print(f"\n✅ Completed: {success_count}/{len(results)} migrations")

        for result in results:
            if not result.success:
                print(f"❌ Failed: {result.plan.source_path}: {result.error}")

    elif args.dry_run:
        print("=== DRY RUN (No files will be moved) ===")
        results = manager.apply_migrations(plans, dry_run=True, limit=args.limit)
        print(f"\nWould migrate {len(results)} files")
        print("\nTo apply for real, run: python3 scripts/tectonic_shift.py --apply")

    else:
        print("Run with --dry-run to preview or --apply to execute")


if __name__ == "__main__":
    main()
