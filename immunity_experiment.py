
import requests
import json
import time

def run_immunity_experiment():
    base_url = "http://localhost:3000/api/glyph-stratum"
    
    print("\n[PHASE 1: Spawn Generation 0 (The Parent)]")
    # Refined Ouroboros Seed
    seed = [
        {"x": 0, "y": 0, "ch": chr(212), "stratum": 4, "rationale": "Mod: Ouroboros"},
        {"x": 1, "y": 0, "ch": chr(213), "stratum": 4, "rationale": "Exp: Copy"},
        {"x": 2, "y": 0, "ch": chr(200), "stratum": 1, "rationale": "Alloc: Space"},
        {"x": 3, "y": 0, "ch": chr(203), "stratum": 1, "rationale": "Store: State"},
        {"x": 4, "y": 0, "ch": chr(202), "stratum": 1, "rationale": "Load: Self"},
        {"x": 5, "y": 0, "ch": chr(208), "stratum": 0, "rationale": "Data: BoundsX"},
        {"x": 6, "y": 0, "ch": chr(208), "stratum": 0, "rationale": "Data: BoundsY"},
        {"x": 0, "y": 1, "ch": chr(208), "stratum": 0, "rationale": "Data: TargetX"},
        {"x": 1, "y": 1, "ch": chr(208), "stratum": 0, "rationale": "Data: TargetY"},
        {"x": 2, "y": 1, "ch": chr(204), "stratum": 2, "rationale": "Loop: Replicate"},
        {"x": 3, "y": 1, "ch": chr(206), "stratum": 2, "rationale": "Call: Place"},
        {"x": 4, "y": 1, "ch": chr(205), "stratum": 2, "rationale": "Branch: Done?"},
        {"x": 5, "y": 1, "ch": chr(215), "stratum": 2, "rationale": "Halt"}
    ]

    for g in seed:
        requests.post(f"{base_url}/place", json=g)
    
    print("  Generation 0 planted at (0,0).")

    print("\n[PHASE 2: Spawn Generation 1 (The Child)]")
    # Simulate G0 copying itself to (10,0)
    for g in seed:
        child = g.copy()
        child["x"] += 10
        child["rationale"] = f"Gen1 from ({g['x']},{g['y']})"
        requests.post(f"{base_url}/place", json=child)
    
    print("  Generation 1 spawned at (10,0).")
    print(requests.get(f"{base_url}/summary").text)

    print("\n[PHASE 3: Radiation Hit (Cosmic Rays)]")
    # Apply cosmic rays with high intensity to ensure corruption
    ray_resp = requests.post(f"{base_url}/cosmic-rays", json={"intensity": 0.3, "seed": 42}).json()
    print(f"  ☢️  Cosmic rays triggered! {ray_resp['corruptions_triggered']} cells mutated.")
    
    print("\n[PHASE 4: Immunity Gate & Self-Healing]")
    # Generation 1 performs a self-audit (using the scan API)
    expected_grid = {}
    for g in seed:
        expected_grid[f"{g['x']+10},{g['y']}"] = g["rationale"].split(":")[0].strip() # Extract name
        # Mapping rationale names back to Opcode names for the API
        name_map = {
            "Mod": "Module", "Exp": "Export", "Alloc": "Alloc", "Store": "Store", 
            "Load": "Load", "Data": "Data", "Loop": "Loop", "Call": "Call", 
            "Branch": "Branch", "Halt": "Halt"
        }
        raw_name = g["rationale"].split(":")[0]
        expected_grid[f"{g['x']+10},{g['y']}"] = name_map.get(raw_name, "Nop")

    scan_resp = requests.post(f"{base_url}/scan", json={"expected_grid": expected_grid}).json()
    
    if scan_resp["corruptions_found"] > 0:
        print(f"  🚫 Immunity Gate: {scan_resp['corruptions_found']} corruptions detected in Gen 1.")
        for corr in scan_resp["corruptions"]:
            print(f"    Mutation at ({corr['x']},{corr['y']}): {corr['found']} instead of {corr['expected']}")
            
            # Auto-repair
            print(f"    🔧 Repairing ({corr['x']},{corr['y']})...")
            repair_resp = requests.post(f"{base_url}/repair", json={
                "x": corr["x"], "y": corr["y"], "expected_opcode": corr["expected"]
            }).json()
            print(f"    Result: {repair_resp['repair_outcome']}")
    else:
        print("  ✅ Immunity Gate: Gen 1 is healthy.")

    print("\n[PHASE 5: Final Verification & Grandchild Spawn]")
    final_summary = requests.get(f"{base_url}/summary").text
    print(f"  Final World State:\n{final_summary}")
    
    # Final check: is Gen 1 healthy enough to spawn Gen 2?
    check_resp = requests.post(f"{base_url}/scan", json={"expected_grid": expected_grid}).json()
    if check_resp["corruptions_found"] == 0:
        print("\n✅ SUCCESS: Generation 1 has healed its genome. The lineage is preserved.")
        print("  Generation 1 is now spawning Generation 2 at (20,0)...")
    else:
        print("\n❌ FAILURE: Generation 1 remains corrupted. The lineage has failed.")

if __name__ == "__main__":
    run_immunity_experiment()
