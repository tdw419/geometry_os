
import sys
import os
import argparse
import asyncio

# Ensure project root is in path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

from geometry_os.nexus import Nexus, EdgeType
from geometry_os.kernel import Kernel, trace_step
from geometry_os.oracle import Oracle, RealOracle

async def run_demo(use_real_brain: bool = False):
    print("🌀  INITIALIZING GEOMETRIC TRACE OS (Phase 2)...")
    
    # 1. Initialize Substrate
    nexus = Nexus()
    kernel = Kernel(nexus)
    print("✅  Kernel Online (The Watcher)")
    print("✅  Nexus Online (The Memory Plane)")

    if use_real_brain:
        try:
            oracle = RealOracle(nexus, kernel)
            print("🧠  Oracle Online (Real Neural Substrate)")
        except ImportError as e:
            print(f"⚠️  Failed to load RealOracle: {e}")
            print("    -> Falling back to Simulation")
            oracle = Oracle(nexus, kernel)
    else:
        oracle = Oracle(nexus, kernel)
        print("💻  Oracle Online (Simulated)")

    # 2. Ingest "Reality" (Vulnerable Codebase)
    vulnerable_code = """
def get_db_password():
    # TODO: Change this!
    return "super_secret_password_123"

def connect():
    pwd = get_db_password()
    print(f"Connecting with {pwd}")
"""
    code_node = nexus.ingest(vulnerable_code, type="code", metadata={"path": "auth.py", "version": 1})
    print(f"📥  Ingested artifact: auth.py (Node {code_node.id[:8]})")

    # 3. User Intent
    intent = "Refactor auth.py to use environment variables for security."
    print(f"\n🎯  USER INTENT: '{intent}'")

    # 4. Execution
    trace = await oracle.execute_intent(intent)

    if trace:
        print(f"\n✨  SUCCESS: Intent executed safely. Trace ID: {trace.id[:8]}")
        
        # Determine which node is v2
        # In a real system we'd follow the edges. Here we search for the latest version.
        v2_node = None
        for n in nexus.nodes.values():
            if n.metadata.get("version") == 2:
                v2_node = n
                break
        
        if v2_node:
            print("\n--- [ ARTIFACT: auth.py (v2) ] ---")
            print(v2_node.content.strip())
            print("----------------------------------")
    else:
        print("\n❌  FAILURE: Execution aborted or refused.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="G-OS: First Undeniable Demo")
    parser.add_argument("--use-lmstudio", action="store_true", help="Use real LLM via LM Studio")
    args = parser.parse_args()

    asyncio.run(run_demo(args.use_lmstudio))
