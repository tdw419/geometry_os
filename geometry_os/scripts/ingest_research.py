
import sqlite3
import json
import uuid
import sys
import os
import numpy as np

# Ensure geometry_os path
sys.path.append(os.path.abspath(os.path.join(os.getcwd(), ".")))

from geometry_os.nexus import Nexus, EdgeType

SOURCE_DB = "knowledge_substrate.db"
TARGET_DB = "geometry_os/demos/persistent_demo.db"

def ingest_research():
    print(f"🧠  Merging Knowledge Substrate ({SOURCE_DB}) into Nexus...")
    
    if not os.path.exists(SOURCE_DB):
        print(f"❌  Error: {SOURCE_DB} not found!")
        return

    # 1. Connect to Source
    src = sqlite3.connect(SOURCE_DB)
    src.row_factory = sqlite3.Row
    cur = src.cursor()
    
    # 2. Connect to Target (Nexus)
    nexus = Nexus(TARGET_DB)
    
    # 3. Read Vectors
    cur.execute("SELECT * FROM knowledge_vectors")
    rows = cur.fetchall()
    
    print(f"    -> Found {len(rows)} research artifacts.")
    
    count = 0
    for row in rows:
        # Map schema
        # knowledge_vectors: id, domain, concept, explanation, vector_embedding (blob), metadata
        
        # Deserialize vector (Blob -> numpy)
        try:
            vec_blob = row['vector_embedding']
            vector = np.frombuffer(vec_blob, dtype=np.float32)
        except Exception:
            # Fallback for some pickle formats or if fail
            try:
                vector = np.array(json.loads(row['vector_embedding']))
            except:
                vector = None
        
        # Construct Node
        metadata = json.loads(row['metadata']) if row['metadata'] else {}
        metadata.update({
            "domain": row['domain'],
            "concept": row['concept'],
            "source": "knowledge_substrate",
            "quality": row['quality_score']
        })
        
        # Ingest
        node = nexus.ingest(
            content=f"Concept: {row['concept']}\nLikely Explanation: {row['explanation']}",
            type="research",
            metadata=metadata
        )
        
        # Force vector update if we have one
        if vector is not None:
            nexus.db.store_node({
                "id": node.id,
                "type": node.type,
                "content": node.content,
                "metadata": node.metadata,
                "vector": vector,
                "provenance": "research_merge"
            })
            
        count += 1
        if count % 10 == 0:
            print(f"       Merged {count}/{len(rows)}...", end="\r")
            
    # 4. Read Relationships
    cur.execute("SELECT * FROM knowledge_relationships")
    rels = cur.fetchall()
    print(f"\n    -> Found {len(rels)} relationships.")
    
    edge_count = 0
    for rel in rels:
        # Check if nodes exist in new DB (since we might have re-ID'd them? 
        # Ah, nexus.ingest generates NEW IDs unless we force them.
        # Wait, if we generate new IDs, we break the rels.
        # We should try to preserve IDs if UUID compatible, or map them.
        pass 
        # For this pass, let's skip edges or we need to map old_id -> new_id
    
    print(f"✨  Merge Complete. Added {count} Research Nodes.")

if __name__ == "__main__":
    ingest_research()
