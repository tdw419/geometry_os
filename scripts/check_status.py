#!/usr/bin/env python3
"""Check phase status distribution."""

import yaml

with open('roadmap_v2.yaml', 'r') as f:
    data = yaml.safe_load(f)

# Check all phases
phases = data.get('phases', [])
print(f"Total phases: {len(phases)}")

# Count by status
status_counts = {}
for p in phases:
    status = p.get('status', 'unknown')
    status_counts[status] = status_counts.get(status, 0) + 1

print("\nPhase status distribution:")
for status, count in sorted(status_counts.items()):
    print(f"  {status}: {count}")

# Show phases with status: todo if any
todo_phases = [p for p in phases if p.get('status') == 'todo']
if todo_phases:
    print(f"\nTODO phases:")
    for p in todo_phases:
        print(f"  {p['id']}: {p['title']}")
        print(f"    Dependencies: {p.get('dependencies', [])}")