#!/usr/bin/env python3
"""Promote eligible TODO phases to Planned status."""

import sys
import shutil
import yaml

ROADMAP_PATH = "roadmap_v2.yaml"
BACKUP_SUFFIX = ".bak"
PROMOTE_COUNT = 5  # Number of phases to promote

def load_yaml(path):
    with open(path, 'r') as f:
        return yaml.safe_load(f)

def save_yaml(data, path):
    with open(path, 'w') as f:
        yaml.dump(data, f, sort_keys=False, default_flow_style=False, allow_unicode=True)

def check_dependencies(phase_data, all_phases_map):
    deps = phase_data.get('dependencies', [])
    if not deps:
        return True
    
    for dep_id in deps:
        # Handle dependencies that might be phase IDs (e.g., 'phase-A') or just IDs
        # Try to find the phase in the map
        target_phase = None
        if dep_id in all_phases_map:
            target_phase = all_phases_map[dep_id]
        else:
            # Try looking up by ID in list
            for p in all_phases_map.values():
                if p.get('id') == dep_id:
                    target_phase = p
                    break
        
        if target_phase:
            status = target_phase.get('status', '').lower()
            if status not in ['done', 'complete']:
                return False
        else:
            # Dependency not found, assume unmet for safety
            print(f"  Warning: Dependency '{dep_id}' not found in roadmap.")
            return False
    return True

def main():
    # Load roadmap
    data = load_yaml(ROADMAP_PATH)
    
    # Create backup
    backup_path = ROADMAP_PATH + BACKUP_SUFFIX
    shutil.copy2(ROADMAP_PATH, backup_path)
    print(f"Backup created at {backup_path}")

    if 'phases' not in data:
        print("Error: No 'phases' key in roadmap")
        return 1

    phases = data['phases']
    # Build a map of phases by ID for easy dependency lookup
    phases_map = {p['id']: p for p in phases}

    # Find eligible phases
    todo_phases = []
    for p in phases:
        if p.get('status', '').lower() == 'todo':
            if check_dependencies(p, phases_map):
                todo_phases.append(p)

    if not todo_phases:
        print("No eligible TODO phases found (all have unmet dependencies).")
        return 0

    print(f"Found {len(todo_phases)} eligible TODO phases.")

    # Promote top N
    to_promote = todo_phases[:PROMOTE_COUNT]
    promoted_ids = []

    for p in to_promote:
        old_status = p.get('status')
        p['status'] = 'planned'
        promoted_ids.append(p.get('id'))
        print(f"Promoted {p.get('id')}: {p.get('title')} from {old_status} to planned")

    # Save
    save_yaml(data, ROADMAP_PATH)
    print(f"\nUpdated {ROADMAP_PATH}. Promoted {len(promoted_ids)} phases.")

if __name__ == '__main__':
    main()