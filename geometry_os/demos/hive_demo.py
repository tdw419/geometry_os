
import asyncio
import time
import os
import sys
import shutil

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

from geometry_os.persistence import DatabaseManager
from geometry_os.federation import FederationServer, FederationClient
from geometry_os.nexus import Nexus
from geometry_os.kernel import trace_step

def run_hive_demo():
    print("🐝  INITIALIZING HIVE MIND SIMULATION (Phase 5)...")

    # 1. Start the Global Hive Server
    hive = FederationServer()
    hive.start()
    time.sleep(1) # Warmup

    # 2. Setup Instance A (The Teacher)
    path_a = "geometry_os/demos/instance_a.db"
    if os.path.exists(path_a): os.remove(path_a)
    db_a = DatabaseManager(path_a)
    client_a = FederationClient(db_a, "alpha_node")
    
    # 3. Setup Instance B (The Student)
    path_b = "geometry_os/demos/instance_b.db"
    if os.path.exists(path_b): os.remove(path_b)
    db_b = DatabaseManager(path_b)
    client_b = FederationClient(db_b, "beta_node")
    
    # 4. Instance A learns a skill (Simulated)
    print("\n📝  Instance A: Learning 'Refactor Auth'...")
    # Manually injecting a high-confidence trace
    trace_data = {
        "id": "trace_auth_123",
        "intent": "Refactor auth.py",
        "steps": [trace_step("think", {}, "done")],
        "outcome": "import os; ...",
        "confidence": 0.98,
        "verified": True
    }
    db_a.store_trace(trace_data)
    
    # 5. Instance A Publishes to Hive
    print("📤  Instance A: Publishing Skills to Hive...")
    count = client_a.publish_local_skills()
    print(f"    -> Published {count} skills.")

    # 6. Instance B Syncs from Hive
    print("\n📥  Instance B: Syncing from Hive...")
    # Verify B has no knowledge of this yet
    existing = db_b.find_trace_by_intent("Refactor auth.py")
    if existing: print("❌  Error: B already knew it?")
    
    # Sync
    imported = client_b.sync_from_hive()
    print(f"    -> Imported {imported} new skills.")
    
    # Verify B now knows it
    learned = db_b.find_trace_by_intent("Refactor auth.py")
    if learned:
        print(f"✨  SUCCESS: Instance B acquired skill '{learned['intent']}' (Conf: {learned['confidence']})")
        print("    -> Lineage: Received from Alpha via Hive")
    else:
        print("❌  FAILURE: Skill not found in B")

if __name__ == "__main__":
    run_hive_demo()
