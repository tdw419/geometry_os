
import sqlite3
import sys
import os
import json

sys.path.append(os.getcwd())
from geometry_os.nexus import Nexus

TARGET_DB = "geometry_os/demos/persistent_demo.db"

def deduplicate():
    print("🧹  Starting Nexus Deduplication...")
    nexus = Nexus(TARGET_DB)
    
    # Get all nodes
    all_nodes = nexus.db.get_all_nodes()
    
    # Fingerprint -> [ids]
    fingerprints = {}
    
    for node in all_nodes:
        # Create a unique signature based on content or key metadata
        # For research nodes, 'concept' + 'domain' is a good key
        raw_meta = node.get("metadata", "{}")
        if isinstance(raw_meta, str):
            try:
                meta = json.loads(raw_meta)
            except:
                meta = {}
        else:
            meta = raw_meta or {}
        
        if meta and meta.get("source") == "knowledge_substrate":
            # It's a research node
            key = f"RESEARCH::{meta.get('domain')}::{meta.get('concept')}"
        elif meta and meta.get("path"):
             # It's a code node
             key = f"CODE::{meta.get('path')}"
        else:
            # Fallback to content hash
            key = f"CONTENT::{hash(node['content'])}"
            
        if key not in fingerprints:
            fingerprints[key] = []
        fingerprints[key].append(node["id"])
        
    # Analyze duplicates
    duplicates_found = 0
    deleted_count = 0
    
    # Open a single connection for the batch deletion
    with sqlite3.connect(TARGET_DB) as conn:
        for key, ids in fingerprints.items():
            if len(ids) > 1:
                duplicates_found += 1
                # Keep the first one, delete the rest
                keep_id = ids[0]
                delete_ids = ids[1:]
                
                print(f"    ⚠️  Duplicate: '{key}' (x{len(ids)}) -> Keeping {keep_id[:8]}")
                
                for del_id in delete_ids:
                    conn.execute("DELETE FROM nodes WHERE id = ?", (del_id,))
                    conn.execute("DELETE FROM edges WHERE source_id = ? OR target_id = ?", (del_id, del_id))
                    deleted_count += 1
        
        conn.commit()
    
    print(f"\n✨  Cleanup Complete.")
    print(f"    Unique Concepts: {len(fingerprints)}")
    print(f"    Duplicates Sets: {duplicates_found}")
    print(f"    Nodes Removed:   {deleted_count}")

if __name__ == "__main__":
    deduplicate()
