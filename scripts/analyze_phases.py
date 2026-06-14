#!/usr/bin/env python3
"""Analyze phase statuses comprehensively."""

import yaml

with open('roadmap_v2.yaml', 'r') as f:
    data = yaml.safe_load(f)

phases = data.get('phases', [])
print(f"Total phases: {len(phases)}\n")

# Count by phase status
status_counts = {}
for p in phases:
    status = p.get('status', 'unknown')
    status_counts[status] = status_counts.get(status, 0) + 1

print("Phase status distribution:")
for status, count in sorted(status_counts.items()):
    print(f"  {status}: {count}")

# Check deliverable status for planned phases
planned_phases = [p for p in phases if p.get('status') == 'planned']
print(f"\n\nPlanned phases with TODO deliverables:")

count = 0
for p in planned_phases:
    deliverables = p.get('deliverables', [])
    todo_deliverables = [d for d in deliverables if d.get('status') == 'todo']
    
    if todo_deliverables:
        count += 1
        print(f"\n  {p['id']}: {p['title']}")
        print(f"    Dependencies: {p.get('dependencies', [])}")
        print(f"    TODO deliverables: {len(todo_deliverables)}")
        for d in todo_deliverables[:3]:  # Show first 3
            print(f"      - {d.get('name')}")

print(f"\n\nTotal planned phases with TODO deliverables: {count}")