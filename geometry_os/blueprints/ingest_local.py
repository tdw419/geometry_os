"""
Local Model Ingestor
Scans a local directory for GGUF models and registers them in the Nexus
as 'local_model_pointer' nodes.
"""

import sys
import os
import json
import time
import sqlite3
import numpy as np
from pathlib import Path

# Ensure we can import core modules
sys.path.append(os.getcwd())
from geometry_os.nexus import Nexus

class LocalModelIngestor:
    def __init__(self, db_path="ghost_daemon_knowledge.db"):
        self.nexus = Nexus(db_path)
        self.db_path = db_path

    def scan_and_ingest(self, root_path: str):
        print(f"🔍 Scanning for Neural Weights in: {root_path}")
        
        root = Path(root_path)
        if not root.exists():
            print(f"❌ Path not found: {root_path}")
            return

        gguf_files = list(root.rglob("*.gguf"))
        print(f"   Found {len(gguf_files)} potential cortex nodes.")
        
        for file_path in gguf_files:
            self._ingest_file(file_path)

    def _ingest_file(self, file_path: Path):
        # Extract metadata from path structure
        # typically: owner/model-name/file.gguf
        parts = file_path.parts
        file_name = file_path.name
        
        try:
            # Simple heuristic for naming
            model_name = file_path.parent.name
            owner = file_path.parent.parent.name if len(parts) > 2 else "unknown"
            
            node_id = f"local_{model_name}_{file_name}"
            
            # Check if exists
            if self._node_exists(node_id):
                print(f"   ⏭️  Skipping existing node: {model_name}")
                return

            size_bytes = file_path.stat().st_size
            
            node_data = {
                "id": node_id,
                "type": "local_model_pointer",
                "content": json.dumps({
                    "path": str(file_path.absolute()),
                    "size_bytes": size_bytes,
                    "format": "gguf"
                }),
                "metadata": {
                    "name": model_name,
                    "filename": file_name,
                    "owner": owner,
                    "role": "Local Intelligence",
                    "path": str(file_path),
                    "is_local": True
                },
                "vector": np.random.rand(768).tobytes(),
                "provenance": "local_ingestor"
            }
            
            self._store_node(node_data)
            print(f"   ✅ Ingested: {model_name} ({self._human_bytes(size_bytes)})")
            
        except Exception as e:
            print(f"   ⚠️  Failed to ingest {file_name}: {e}")

    def _node_exists(self, node_id):
        with sqlite3.connect(self.db_path) as conn:
            cursor = conn.execute("SELECT 1 FROM nodes WHERE id=?", (node_id,))
            return cursor.fetchone() is not None

    def _store_node(self, node_data):
        with sqlite3.connect(self.db_path) as conn:
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
                time.time()
            ))

    def _human_bytes(self, size):
        for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
            if size < 1024:
                return f"{size:.1f} {unit}"
            size /= 1024
        return f"{size:.1f} PB"

if __name__ == "__main__":
    ingestor = LocalModelIngestor()
    path = sys.argv[1] if len(sys.argv) > 1 else "/home/jericho/zion/ai/llms/models"
    ingestor.scan_and_ingest(path)
