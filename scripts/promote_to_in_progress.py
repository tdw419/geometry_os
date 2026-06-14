#!/usr/bin/env python3
"""Promote planned phases with all TODO deliverables to in-progress."""

import shutil
import yaml

ROADMAP_PATH = "roadmap_v2.yaml"
PROMOTE_COUNT = 5  # Number of phases to promote

def load_yaml(path):
    with open(path, 'r') as f:
        return yaml.safe_load(f)

def save_yaml(data, path):
    with open(path, 'w') as f:
        yaml.dump(data, f, sort_keys=False, default_flow_style=False, allow_unicode=True)

def main():
    # Load roadmap
    print("Loading roadmap_v2.yaml...")
    data = load_yaml(ROADMAP_PATH)

    if 'phases' not in data:
        print("Error: No 'phases' key in roadmap")
        return 1

    phases = data['phases']

    # Create backup
    backup_path = ROADMAP_PATH + ".bak"
    print(f"Creating backup: {backup_path}")
    shutil.copy2(ROADMAP_PATH, backup_path)

    # Find planned phases with all TODO deliverables and no unmet dependencies
    eligible_phases = []
    phase_map = {p['id']: p for p in phases}

    for p in phases:
        if p.get('status') != 'planned':
            continue

        # Check dependencies
        deps = p.get('dependencies', [])
        deps_met = True
        for dep_id in deps:
            dep_phase = phase_map.get(dep_id)
            if not dep_phase:
                deps_met = False
                break
            if dep_phase.get('status') not in ['done', 'complete']:
                deps_met = False
                break

        if not deps_met:
            continue

        # Check if all deliverables are TODO
        deliverables = p.get('deliverables', [])
        if not deliverables:
            continue  # Skip phases without deliverables

        all_todo = all(d.get('status') == 'todo' for d in deliverables)
        if all_todo:
            eligible_phases.append(p)

    print(f"\nFound {len(eligible_phases)} eligible phases (planned, all deliverables=todo, deps met)")

    if not eligible_phases:
        print("No eligible phases to promote")
        return 0

    # Promote first N phases
    to_promote = eligible_phases[:PROMOTE_COUNT]
    promoted_ids = []

    for p in to_promote:
        phase_id = p['id']
        p['status'] = 'in-progress'
        promoted_ids.append(phase_id)

        # Mark first deliverable as in-progress
        deliverables = p.get('deliverables', [])
        if deliverables:
            deliverables[0]['status'] = 'in-progress'

        print(f"  Promoted {phase_id}: {p.get('title')}")
        print(f"    - Phase status: planned → in-progress")
        print(f"    - First deliverable: {deliverables[0].get('name')} → in-progress")

    # Save
    print(f"\nSaving updated {ROADMAP_PATH}...")
    save_yaml(data, ROADMAP_PATH)

    print(f"\n✓ Promoted {len(promoted_ids)} phases to 'in-progress'")
    print(f"  Backup preserved at: {backup_path}")
    return 0

if __name__ == '__main__':
    exit(main())