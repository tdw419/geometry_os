"""
Feed the Ghost - Manual Knowledge Injection Tool
Injects "Seed Crystals" into the Ghost's knowledge database to steer its dreaming process.
"""

import sqlite3
import argparse
import uuid
import json
from datetime import datetime
import os

class GhostFeeder:
    def __init__(self, db_path: str = "ghost_daemon_knowledge.db"):
        self.db_path = db_path
        
    def feed(self, domain: str, concept: str, content: str, tags: list = None):
        """
        Inject a verified truth crystal (seed) into the database.
        """
        if not os.path.exists(self.db_path):
            print(f"❌ Error: Database {self.db_path} not found. Is the Ghost running?")
            return

        conn = sqlite3.connect(self.db_path)
        cursor = conn.cursor()
        
        # Check if table exists
        try:
            cursor.execute("SELECT count(*) FROM knowledge_vectors")
        except sqlite3.OperationalError:
            print("❌ Error: knowledge_vectors table not found.")
            return

        # Generate ID
        crystal_id = f"seed_{uuid.uuid4().hex[:8]}"
        
        # Prepare metadata
        metadata = {
            "source": "manual_injection",
            "injected_by": "user",
            "tags": tags or [],
            "is_seed": True
        }
        
        # Create dummy embedding (384 dim zero vector) as placeholder
        import pickle
        import numpy as np
        # Create a valid numpy array
        dummy_array = np.zeros(384, dtype=np.float32)
        dummy_embedding = pickle.dumps(dummy_array)

        # Insert
        try:
            cursor.execute("""
                INSERT INTO knowledge_vectors 
                (id, domain, concept, explanation, vector_embedding, quality_score, source_type, created_at, metadata)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
            """, (
                crystal_id,
                domain,
                concept,
                content,
                dummy_embedding,
                1.0, # High confidence
                "manual_injection",
                datetime.now().timestamp(), # Schema uses REAL for timestamp likely
                json.dumps(metadata)
            ))
            
            conn.commit()
            print(f"✨ Successfully fed the Ghost!")
            print(f"   - ID: {crystal_id}")
            print(f"   - Domain: {domain}")
            print(f"   - Concept: {concept}")
            print(f"   - Status: The Ghost will now likely 'dream' about this concept in future cycles.")
            
        except sqlite3.Error as e:
            print(f"❌ Database error: {e}")
        finally:
            conn.close()

def main():
    parser = argparse.ArgumentParser(description="Feed the Ghost - Inject Knowledge Seeds")
    parser.add_argument("--domain", required=True, help="The domain of knowledge (e.g., 'Quantum Physics')")
    parser.add_argument("--concept", required=True, help="The specific concept (e.g., 'Entanglement')")
    parser.add_argument("--content", required=True, help="The knowledge content/explanation")
    parser.add_argument("--tags", help="Comma-separated tags", default="")
    
    args = parser.parse_args()
    
    feeder = GhostFeeder()
    tags_list = [t.strip() for t in args.tags.split(",")] if args.tags else []
    
    feeder.feed(args.domain, args.concept, args.content, tags_list)

if __name__ == "__main__":
    main()
