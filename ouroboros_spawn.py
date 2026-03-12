
import requests
import json
import time

def spawn_ouroboros():
    base_url = "http://localhost:3000/api/glyph-stratum"
    
    # Define the Ouroboros Seed at (0,0)
    # We use chr(index) where index 200-215 are our literal text glyphs
    seed = [
        # Row 0: SUBSTRATE (Configuration Data)
        {"x": 0, "y": 0, "ch": chr(208), "stratum": 0, "rationale": "Width=6"},
        {"x": 1, "y": 0, "ch": chr(208), "stratum": 0, "rationale": "Height=5"},
        {"x": 2, "y": 0, "ch": chr(208), "stratum": 0, "rationale": "OriginX=0"},
        {"x": 3, "y": 0, "ch": chr(208), "stratum": 0, "rationale": "OriginY=0"},
        {"x": 4, "y": 0, "ch": chr(208), "stratum": 0, "rationale": "TargetX=10"},
        {"x": 5, "y": 0, "ch": chr(208), "stratum": 0, "rationale": "TargetY=0"},
        
        # Row 1: MEMORY (Data Movement)
        {"x": 0, "y": 1, "ch": chr(200), "stratum": 1, "rationale": "Alloc Replication Buffer"},
        {"x": 1, "y": 1, "ch": chr(202), "stratum": 1, "rationale": "Load Self-State"},
        {"x": 2, "y": 1, "ch": chr(203), "stratum": 1, "rationale": "Store Child-State"},
        
        # Row 2: LOGIC (The Replication Loop)
        {"x": 0, "y": 2, "ch": chr(206), "stratum": 2, "rationale": "Call Scanner"},
        {"x": 1, "y": 2, "ch": chr(204), "stratum": 2, "rationale": "Loop: For y in Height"},
        {"x": 2, "y": 2, "ch": chr(205), "stratum": 2, "rationale": "Branch: If Glyph Exists"},
        {"x": 3, "y": 2, "ch": chr(206), "stratum": 2, "rationale": "Call: Place at Target"},
        {"x": 4, "y": 2, "ch": chr(215), "stratum": 2, "rationale": "Halt Replicator"},
        
        # Row 3: SPEC (Type Definitions)
        {"x": 0, "y": 3, "ch": chr(209), "stratum": 3, "rationale": "Type: Organism"},
        {"x": 1, "y": 3, "ch": chr(210), "stratum": 3, "rationale": "Ptr: GenomeStart"},
        
        # Row 4: INTENT (High-level Goal)
        {"x": 0, "y": 4, "ch": chr(212), "stratum": 4, "rationale": "Module: Ouroboros_v1"},
        {"x": 1, "y": 4, "ch": chr(213), "stratum": 4, "rationale": "Export: Self_Replicate"}
    ]

    print("[OUROBOROS] Phase 1: Planting Seed at (0,0)...")
    for g in seed:
        try:
            requests.post(f"{base_url}/place", json=g)
        except Exception:
            print("  Error: Ensure compositor is running with API on port 3000.")
            return

    print("\n[OUROBOROS] Phase 2: Seed Verification")
    summary = requests.get(f"{base_url}/summary").text
    print(summary)

    # REPLICATION EXECUTION (Simulating the Ouroboros running itself)
    print("\n[OUROBOROS] Phase 3: Recursive Replication Start")
    width, height = 6, 5
    target_x, target_y = 10, 0
    
    for y in range(height):
        for x in range(width):
            # The Ouroboros "sees" its own glyph via the query API
            resp = requests.get(f"{base_url}/query", params={"x": x, "y": y}).json()
            if resp["found"]:
                # The Ouroboros "copies" itself to the target location
                child_glyph = {
                    "x": x + target_x,
                    "y": y + target_y,
                    "ch": resp["ch"],
                    "stratum": resp["stratum"],
                    "rationale": f"Replicated Child from ({x},{y})"
                }
                requests.post(f"{base_url}/place", json=child_glyph)
                print(f"  Copied {resp['opcode']} -> ({child_glyph['x']}, {child_glyph['y']})")

    print("\n[OUROBOROS] Phase 4: World Summary (Original + Child)")
    final_world = requests.get(f"{base_url}/summary").text
    print(final_world)
    
    if "Replicated Child" in requests.get(f"{base_url}/query", params={"x": 10, "y": 0}).json().get("rationale", ""):
        print("\n✅ THE OUROBOROS HAS REPLICATED. THE GEOMETRIC PROBE IS ACTIVE.")
    else:
        print("\n❌ Replication failed.")

if __name__ == "__main__":
    spawn_ouroboros()
