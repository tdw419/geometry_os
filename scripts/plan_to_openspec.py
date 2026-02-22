#!/usr/bin/env python3
"""
Plan to OpenSpec Converter

Converts docs/plans/*.md files to OpenSpec change folder structure.

Usage:
    python3 scripts/plan_to_openspec.py docs/plans/2026-02-08-pixelrts-v2-implementation.md

Output:
    openspec/changes/pixelrts-v2/
    ├── proposal.md
    ├── tasks.md
    └── specs/<domain>/spec.md
"""

import sys
import re
import argparse
from pathlib import Path
from typing import Optional


def parse_plan(plan_path: str) -> dict:
    """Parse a plan file into structured components."""
    content = Path(plan_path).read_text()

    # Extract goal
    goal_match = re.search(r'\*\*Goal:\*\*\s*(.+?)(?:\n|$)', content)
    goal = goal_match.group(1) if goal_match else "TBD"

    # Extract architecture
    arch_match = re.search(r'\*\*Architecture:\*\*\s*(.+?)(?:\n|$)', content)
    architecture = arch_match.group(1) if arch_match else "TBD"

    # Extract tech stack
    tech_match = re.search(r'\*\*Tech Stack:\*\*\s*(.+?)(?:\n|$)', content)
    tech_stack = tech_match.group(1) if tech_match else "TBD"

    # Extract tasks
    tasks = []
    task_pattern = r'## Task (\d+):\s*(.+?)\n\n\*\*Files:\*\*\n(.+?)\n'
    for match in re.finditer(task_pattern, content, re.DOTALL):
        task_num = match.group(1)
        task_title = match.group(2)
        files_section = match.group(3)

        # Parse files
        files = []
        for line in files_section.split('\n'):
            if line.startswith('- '):
                files.append(line[2:])

        tasks.append({
            'number': task_num,
            'title': task_title,
            'files': files
        })

    # Extract change name from filename
    filename = Path(plan_path).stem
    # Remove date prefix (YYYY-MM-DD-)
    change_name = re.sub(r'^\d{4}-\d{2}-\d{2}-', '', filename)

    return {
        'goal': goal,
        'architecture': architecture,
        'tech_stack': tech_stack,
        'tasks': tasks,
        'change_name': change_name,
        'source_path': plan_path
    }


def generate_proposal(plan: dict) -> str:
    """Generate proposal.md from parsed plan."""
    return f"""# {plan['change_name'].replace('-', ' ').title()}

## Summary

{plan['goal']}

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

{plan['architecture']}

## Tech Stack

{plan['tech_stack']}

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `{plan['source_path']}`
"""


def generate_tasks(plan: dict) -> str:
    """Generate tasks.md from parsed plan."""
    lines = [f"# {plan['change_name'].replace('-', ' ').title()} - Tasks", ""]

    for task in plan['tasks']:
        lines.append(f"## {task['number']}. {task['title']}")
        lines.append("")

        for file in task['files']:
            # Convert file line to checkbox format
            if 'Create:' in file:
                lines.append(f"- [ ] Create `{file.replace('Create: ', '')}`")
            elif 'Modify:' in file:
                lines.append(f"- [ ] Modify `{file.replace('Modify: ', '')}`")
            else:
                lines.append(f"- [ ] {file}")

        lines.append("")

    return "\n".join(lines)


def generate_spec_delta(plan: dict, domain: str = "core") -> str:
    """Generate spec delta from parsed plan."""
    # Extract key requirements from goal
    return f"""# Delta for {domain}

## ADDED Requirements

### Requirement: {plan['change_name'].replace('-', ' ').title()}
The system SHALL implement {plan['change_name'].replace('-', ' ')}.

#### Scenario: Implementation Complete
- **WHEN** all tasks are completed
- **THEN** the implementation SHALL match the architecture specification
- **AND** tests SHALL pass
"""


def convert_plan_to_openspec(plan_path: str, output_dir: str = "openspec/changes", dry_run: bool = False):
    """Convert a plan file to OpenSpec change folder."""
    plan = parse_plan(plan_path)

    # Create change directory
    change_dir = Path(output_dir) / plan['change_name']

    if dry_run:
        print(f"[DRY RUN] Would create: {change_dir}/")
        print(f"[DRY RUN]   - proposal.md")
        print(f"[DRY RUN]   - tasks.md")
        print(f"[DRY RUN]   - specs/core/spec.md")
        return change_dir

    change_dir.mkdir(parents=True, exist_ok=True)

    # Generate proposal.md
    proposal_path = change_dir / "proposal.md"
    proposal_path.write_text(generate_proposal(plan))
    print(f"Created: {proposal_path}")

    # Generate tasks.md
    tasks_path = change_dir / "tasks.md"
    tasks_path.write_text(generate_tasks(plan))
    print(f"Created: {tasks_path}")

    # Generate spec delta (default domain)
    specs_dir = change_dir / "specs" / "core"
    specs_dir.mkdir(parents=True, exist_ok=True)
    spec_path = specs_dir / "spec.md"
    spec_path.write_text(generate_spec_delta(plan))
    print(f"Created: {spec_path}")

    print(f"\nOpenSpec change created: {change_dir}")
    print(f"\nNext steps:")
    print(f"  1. Review and edit {change_dir}/proposal.md")
    print(f"  2. Refine tasks in {change_dir}/tasks.md")
    print(f"  3. Update spec delta in {change_dir}/specs/core/spec.md")
    print(f"  4. Run: openspec validate {plan['change_name']}")

    return change_dir


def batch_migrate_plans(plans_dir: str, output_dir: str = "openspec/changes", dry_run: bool = False) -> dict:
    """
    Batch migrate all plan files from a directory.

    Args:
        plans_dir: Directory containing .md plan files
        output_dir: Output directory for OpenSpec changes
        dry_run: If True, preview changes without writing

    Returns:
        Dict with 'converted', 'skipped', 'errors' counts and 'errors_list'
    """
    plans_path = Path(plans_dir)

    if not plans_path.exists():
        print(f"Error: Plans directory not found: {plans_dir}")
        sys.exit(1)

    # Find all .md files, excluding README.md
    plan_files = [f for f in plans_path.glob("*.md") if f.name != "README.md"]

    if not plan_files:
        print(f"No plan files found in {plans_dir}")
        return {"converted": 0, "skipped": 0, "errors": 0, "errors_list": []}

    results = {
        "converted": 0,
        "skipped": 0,
        "errors": 0,
        "errors_list": []
    }

    print(f"Found {len(plan_files)} plan file(s) in {plans_dir}")
    print(f"Output directory: {output_dir}")
    if dry_run:
        print("*** DRY RUN MODE - No files will be written ***")
    print("-" * 60)

    for plan_file in sorted(plan_files):
        try:
            print(f"\nProcessing: {plan_file.name}")
            convert_plan_to_openspec(str(plan_file), output_dir, dry_run=dry_run)
            results["converted"] += 1
        except Exception as e:
            error_msg = f"{plan_file.name}: {e}"
            print(f"Error: {error_msg}")
            results["errors"] += 1
            results["errors_list"].append(error_msg)

    # Print summary
    print("\n" + "=" * 60)
    print("BATCH MIGRATION SUMMARY")
    print("=" * 60)
    print(f"Converted: {results['converted']}")
    print(f"Skipped:   {results['skipped']}")
    print(f"Errors:    {results['errors']}")

    if results["errors_list"]:
        print("\nErrors encountered:")
        for error in results["errors_list"]:
            print(f"  - {error}")

    return results


def main():
    parser = argparse.ArgumentParser(
        description="Convert docs/plans/*.md files to OpenSpec change folder structure.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Convert a single plan
  python3 scripts/plan_to_openspec.py docs/plans/2026-02-08-pixelrts-v2-implementation.md

  # Batch convert all plans (dry run)
  python3 scripts/plan_to_openspec.py --batch --dry-run

  # Batch convert all plans
  python3 scripts/plan_to_openspec.py --batch --output-dir openspec/changes

  # Convert with custom output directory
  python3 scripts/plan_to_openspec.py docs/plans/PLAN.md --output-dir custom/output
        """
    )

    parser.add_argument(
        "plan",
        nargs="?",
        help="Path to a single plan file (required if not using --batch)"
    )

    parser.add_argument(
        "--batch",
        action="store_true",
        help="Batch mode: convert all .md files in docs/plans/ (except README.md)"
    )

    parser.add_argument(
        "--plans-dir",
        default="docs/plans",
        help="Directory containing plan files (default: docs/plans)"
    )

    parser.add_argument(
        "--output-dir",
        default="openspec/changes",
        help="Output directory for OpenSpec changes (default: openspec/changes)"
    )

    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Preview changes without writing files"
    )

    args = parser.parse_args()

    if args.batch:
        # Batch mode
        batch_migrate_plans(args.plans_dir, args.output_dir, args.dry_run)
    elif args.plan:
        # Single file mode
        if not Path(args.plan).exists():
            print(f"Error: Plan file not found: {args.plan}")
            sys.exit(1)
        convert_plan_to_openspec(args.plan, args.output_dir, args.dry_run)
    else:
        # No arguments given
        parser.print_help()
        sys.exit(1)


if __name__ == "__main__":
    main()
