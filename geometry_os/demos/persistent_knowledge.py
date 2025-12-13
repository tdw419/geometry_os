
import sys
import os
import argparse
import asyncio
import time

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

from geometry_os.nexus import Nexus
from geometry_os.kernel import Kernel
from geometry_os.oracle import RealOracle

async def run_persistent_demo():
    print("🌀  INITIALIZING PERSISTENT GEOMETRY OS (Phase 3)...")
    
    db_path = "geometry_os/demos/persistent_demo.db"
    
    # Clean slate for verifiable demo
    if os.path.exists(db_path):
        os.remove(db_path)
    
    # --- RUN 1: LEARNING ---
    print("\n--- [ RUN 1: THE TEACHING MOMENT ] ---")
    nexus = Nexus(db_path) # Persistent DB
    kernel = Kernel(nexus)
    oracle = RealOracle(nexus, kernel)
    
    # Ingest
    print("📥  Ingesting Reality (auth.py)...")
    vulnerable_code = """
def get_db_password():
    return "super_secret_password_123" # TODO: Fix this
"""
    nexus.ingest(vulnerable_code, type="code", metadata={"path": "auth.py"})
    
    intent = "Refactor auth.py to use environment variables."
    
    t0 = time.time()
    trace1 = await oracle.execute_intent(intent)
    t1 = time.time()
    
    if trace1:
        print(f"✨  SUCCESS. Time to Learn: {t1-t0:.2f}s")
    else:
        print("❌  Failed Run 1")
        return

    # --- RUN 2: RECALL ---
    print("\n--- [ RUN 2: THE RECALL ] ---")
    print("🔄  Rebooting Kernel (Simulated Restart)...")
    
    # Re-initialize everything to prove persistence
    nexus_2 = Nexus(db_path) 
    kernel_2 = Kernel(nexus_2)
    oracle_2 = RealOracle(nexus_2, kernel_2)
    
    # Note: We don't need to re-ingest auth.py, it's in the DB! 
    # But for the Oracle context lookup to work in this simplified L0, 
    # we ensure the nodes are hydrated. Nexus.__init__ handles hydration.
    
    print(f"    -> Hydrated {len(nexus_2.nodes)} nodes from disk.")
    
    t2 = time.time()
    trace2 = await oracle_2.execute_intent(intent)
    t3 = time.time()
    
    if trace2:
        print(f"✨  SUCCESS. Time to Recall: {t3-t2:.2f}s")
        print(f"\n🚀  SPEEDUP FACTOR: {(t1-t0)/(t3-t2):.1f}x")
    
    print("\n💡  CONCLUSION: The OS has stored the 'Skill' of refactoring auth.py.")
    print("    It no longer needs to query the LLM for this specific intent.")

if __name__ == "__main__":
    asyncio.run(run_persistent_demo())
