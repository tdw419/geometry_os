#!/usr/bin/env python3
"""Find phases with status: todo at the phase level."""

import yaml

with open('roadmap_v2.yaml', 'r') as f:
    data = yaml.safe_load(f)
    
phases = data.get('phases', [])
todo_phases = []

for p in phases:
    if p.get('status') == 'todo':
        todo_phases.append({
            'id': p.get('id'),
            'title': p.get('title'),
            'dependencies': p.get('dependencies', [])
        })

print(f"Found {len(todo_phases)} TODO phases at phase level:")
for p in todo_phases:
    print(f"  {p['id']}: {p['title']}")
    print(f"    Dependencies: {p['dependencies']}")