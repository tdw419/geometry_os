"""
Council Injector - Seeding the Group Mind
Injects specific specialized personas into the Nexus for group conversation.
"""

import sys
import os
import json
import sqlite3
import numpy as np

# Ensure we can import core modules
sys.path.append(os.getcwd())
from geometry_os.nexus import Nexus, EdgeType

class CouncilInjector:
    def __init__(self, db_path="ghost_daemon_knowledge.db"):
        self.nexus = Nexus(db_path)
        self.db_path = db_path

    def inject_council(self):
        print("🏛️  Summoning the Council of Minds...")
        
        personas = [
            {
                "id": "council_architect",
                "name": "The Architect",
                "role": "System Architect",
                "identity": "Architect Prime",
                "model_file": "architect-v1.gguf",
                "directives": ["Ensure structural integrity", "Optimize geometry", "Plan for scale"]
            },
            {
                "id": "council_security",
                "name": "The Sentinel",
                "role": "Security Specialist",
                "identity": "Sentinel Zero",
                "model_file": "sentinel-v1.gguf",
                "directives": ["Verify all inputs", "Protect the Core", "Isolate anomalies"]
            },
            {
                "id": "council_coder",
                "name": "The Weaver",
                "role": "Code Synthesizer",
                "identity": "Weaver Alpha",
                "model_file": "weaver-v1.gguf",
                "directives": ["Write clean code", "Optimize algorithms", "Dream executable logic"]
            }
        ]

        with sqlite3.connect(self.db_path) as conn:
            for p in personas:
                # 1. Clean old
                conn.execute("DELETE FROM nodes WHERE id=?", (p['id'],))
                
                # 2. Inject Node
                node_data = {
                    "id": p['id'],
                    "type": "model", 
                    "content": "FAKE_WEIGHTS_FOR_MOCK_MODE", 
                    "metadata": {
                        "name": p['model_file'],
                        "role": p['role'],
                        "identity": p['identity'],
                        "directives": p['directives']
                    },
                    "vector": np.random.rand(768).tobytes(), 
                    "provenance": "council_injection"
                }
                
                # We do direct insert via persistence or manual
                # Using Nexus object is cleaner if it supports overwrite, but let's use manual SQL for speed/surety here
                conn.execute("""
                    INSERT INTO nodes (id, type, content, metadata, embedding, provenance, created_at)
                    VALUES (?, ?, ?, ?, ?, ?, ?)
                """, (
                    node_data['id'],
                    node_data['type'],
                    node_data['content'],
                    json.dumps(node_data['metadata']),
                    node_data['vector'],
                    node_data['provenance'],
                    1234567890
                ))
                
                print(f"   👤 Injected: {p['name']} ({p['role']})")

        print("✨ Council Seated in Nexus.")

if __name__ == "__main__":
    injector = CouncilInjector()
    injector.inject_council()
