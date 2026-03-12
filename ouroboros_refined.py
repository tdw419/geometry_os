
import requests
import time

def run_refined_ouroboros():
    base_url = "http://localhost:3000/api/glyph-stratum"
    
    # Visual Layout (Literal Opcodes)
    # Row 0: Module Export Alloc Store Load Data Data
    # Row 1: Data  Data  Loop  Call  Branch Halt
    seed_layout = [
        # Row 0
        {"x": 0, "y": 0, "ch": chr(212), "stratum": 4, "rationale": "Mod: Ouroboros"},
        {"x": 1, "y": 0, "ch": chr(213), "stratum": 4, "rationale": "Exp: Copy"},
        {"x": 2, "y": 0, "ch": chr(200), "stratum": 1, "rationale": "Alloc: Space"},
        {"x": 3, "y": 0, "ch": chr(203), "stratum": 1, "rationale": "Store: State"},
        {"x": 4, "y": 0, "ch": chr(202), "stratum": 1, "rationale": "Load: Self"},
        {"x": 5, "y": 0, "ch": chr(208), "stratum": 0, "rationale": "Data: BoundsX"},
        {"x": 6, "y": 0, "ch": chr(208), "stratum": 0, "rationale": "Data: BoundsY"},
        
        # Row 1
        {"x": 0, "y": 1, "ch": chr(208), "stratum": 0, "rationale": "Data: TargetX"},
        {"x": 1, "y": 1, "ch": chr(208), "stratum": 0, "rationale": "Data: TargetY"},
        {"x": 2, "y": 1, "ch": chr(204), "stratum": 2, "rationale": "Loop: Replicate"},
        {"x": 3, "y": 1, "ch": chr(206), "stratum": 2, "rationale": "Call: Place"},
        {"x": 4, "y": 1, "ch": chr(205), "stratum": 2, "rationale": "Branch: Done?"},
        {"x": 5, "y": 1, "ch": chr(215), "stratum": 2, "rationale": "Halt"}
    ]

    print("[REFINED OUROBOROS] Phase 1: Planting Refined Seed...")
    for g in seed_layout:
        try:
            requests.post(f"{base_url}/place", json=g)
        except Exception:
            print("  Error: API unreachable.")
            return

    print("\n[REFINED OUROBOROS] Phase 2: Seed Visual Map")
    print(requests.get(f"{base_url}/summary").text)

    # Simulated Execution of the Copy logic
    print("\n[REFINED OUROBOROS] Phase 3: Recursive Replication (0,0) -> (10,0)")
    for y in range(2):
        for x in range(7):
            resp = requests.get(f"{base_url}/query", params={"x": x, "y": y}).json()
            if resp["found"]:
                child = {
                    "x": x + 10, "y": y,
                    "ch": resp["ch"],
                    "stratum": resp["stratum"],
                    "rationale": f"Gen1 from ({x},{y})"
                }
                requests.post(f"{base_url}/place", json=child)
                print(f"  Visual Copy: {resp['opcode']} @ ({child['x']}, {child['y']})")

    print("\n[REFINED OUROBOROS] Phase 4: Final World State")
    print(requests.get(f"{base_url}/summary").text)
    print("\n✅ REFINED REPLICATION COMPLETE. MORPHOLOGY PRESERVED.")

if __name__ == "__main__":
    run_refined_ouroboros()
