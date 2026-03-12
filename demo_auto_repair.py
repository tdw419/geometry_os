
import requests
import time
import json

def run_demo():
    base_url = "http://localhost:3000/api/glyph-stratum"
    
    print("\n[PHASE 1: Logical Program Construction]")
    # Alloc -> Store -> Loop -> Call -> Halt
    # We use indices 200, 203, 204, 206, 215 which represent literal words in the font
    program = [
        {"x": 0, "y": 0, "ch": chr(200), "stratum": 1, "rationale": "Memory reservation"},
        {"x": 1, "y": 0, "ch": chr(203), "stratum": 1, "rationale": "Data persistence"},
        {"x": 2, "y": 0, "ch": chr(204), "stratum": 2, "rationale": "Iteration loop"},
        {"x": 3, "y": 0, "ch": chr(206), "stratum": 2, "rationale": "External call"},
        {"x": 4, "y": 0, "ch": chr(215), "stratum": 0, "rationale": "Safe termination"}
    ]
    
    for glyph in program:
        try:
            resp = requests.post(f"{base_url}/place", json=glyph)
            print(f"  Placed {glyph['rationale']} at ({glyph['x']}, {glyph['y']})")
        except Exception as e:
            print(f"  Failed to place glyph: {e}")
            return

    print("\n[PHASE 2: AI Logical Summary]")
    summary = requests.get(f"{base_url}/summary").text
    print(f"  Summary:\n{summary}")

    print("\n[PHASE 3: Simulated Tectonic Fracture (Visual Corruption)]")
    # We "inject" corruption by placing a 'Data' glyph (index 208) where an 'Alloc' (200) should be.
    # To a VLM, this looks like "Data" instead of "Alloc" - a visual mismatch.
    corruption = {"x": 0, "y": 0, "ch": chr(208), "stratum": 1, "rationale": "CORRUPTED_VRAM_CELL"}
    requests.post(f"{base_url}/place", json=corruption)
    print("  Cell (0,0) visually flipped from 'Alloc' to 'Data'!")

    print("\n[PHASE 4: VLM Detection & Auto-Repair]")
    print("  VLM perceives: 'Visual state at (0,0) is incorrect. Correcting...'")
    repair_req = {"x": 0, "y": 0, "expected_opcode": "Alloc"}
    repair_resp = requests.post(f"{base_url}/repair", json=repair_req).json()
    print(f"  Repair Outcome: {repair_resp['repair_outcome']}")

    print("\n[PHASE 5: Final Health Verification]")
    final_summary = requests.get(f"{base_url}/summary").text
    print(f"  Final Summary:\n{final_summary}")
    
    if "Alloc" in final_summary:
         print("\n✅ SUCCESS: Visual state realigned with logical intent. System is healthy.")
    else:
         print("\n❌ FAILURE: Repair failed to restore state.")

if __name__ == "__main__":
    run_demo()
