
import sqlite3
import json
import time
import uuid
import numpy as np
from typing import List, Dict, Any, Optional

class DatabaseManager:
    def __init__(self, db_path="nexus.db"):
        self.db_path = db_path
        self._initialize_schema()

    def get_connection(self):
        return sqlite3.connect(self.db_path)

    def _initialize_schema(self):
        with self.get_connection() as conn:
            cursor = conn.cursor()
            
            # Nodes Table
            cursor.execute('''
            CREATE TABLE IF NOT EXISTS nodes (
                id TEXT PRIMARY KEY,
                type TEXT NOT NULL,
                content TEXT,
                metadata JSON,
                embedding BLOB,
                created_at REAL,
                provenance TEXT
            )
            ''')

            # Edges Table
            cursor.execute('''
            CREATE TABLE IF NOT EXISTS edges (
                source_id TEXT,
                target_id TEXT,
                type TEXT,
                strength REAL,
                timestamp REAL,
                PRIMARY KEY (source_id, target_id, type),
                FOREIGN KEY(source_id) REFERENCES nodes(id),
                FOREIGN KEY(target_id) REFERENCES nodes(id)
            )
            ''')

            # Traces Table
            cursor.execute('''
            CREATE TABLE IF NOT EXISTS traces (
                id TEXT PRIMARY KEY,
                intent TEXT,
                steps JSON,
                outcome TEXT,
                confidence REAL,
                timestamp REAL,
                verified INTEGER
            )
            ''')
            
            conn.commit()

    def store_node(self, node_data: Dict):
        with self.get_connection() as conn:
            cursor = conn.cursor()
            # Serialize metadata
            meta_json = json.dumps(node_data.get("metadata", {}))
            embedding_blob = node_data.get("vector", np.array([])).tobytes()
            
            cursor.execute('''
            INSERT OR REPLACE INTO nodes (id, type, content, metadata, embedding, created_at, provenance)
            VALUES (?, ?, ?, ?, ?, ?, ?)
            ''', (
                node_data["id"], 
                node_data["type"], 
                node_data["content"], 
                meta_json, 
                embedding_blob, 
                time.time(),
                node_data.get("provenance", "")
            ))
            conn.commit()

    def store_edge(self, edge_data: Dict):
        with self.get_connection() as conn:
            cursor = conn.cursor()
            cursor.execute('''
            INSERT OR REPLACE INTO edges (source_id, target_id, type, strength, timestamp)
            VALUES (?, ?, ?, ?, ?)
            ''', (
                edge_data["source"],
                edge_data["target"],
                edge_data["type"].value,
                edge_data["strength"],
                time.time()
            ))
            conn.commit()

    def store_trace(self, trace_data: Dict):
        with self.get_connection() as conn:
            cursor = conn.cursor()
            steps_json = json.dumps([
                {"tool": s.tool, "args": s.args, "result": s.result} 
                for s in trace_data["steps"]
            ])
            
            cursor.execute('''
            INSERT OR REPLACE INTO traces (id, intent, steps, outcome, confidence, timestamp, verified)
            VALUES (?, ?, ?, ?, ?, ?, ?)
            ''', (
                trace_data["id"],
                trace_data["intent"],
                steps_json,
                trace_data["outcome"],
                trace_data["confidence"],
                time.time(),
                1 if trace_data.get("verified") else 0
            ))
            conn.commit()

    def find_trace_by_intent(self, intent: str) -> Optional[Dict]:
        """Simple string match for L0. Real version would use vector similarity."""
        with self.get_connection() as conn:
            cursor = conn.cursor()
            cursor.execute('SELECT * FROM traces WHERE intent = ? ORDER BY confidence DESC LIMIT 1', (intent,))
            row = cursor.fetchone()
            if row:
                return {
                    "id": row[0],
                    "intent": row[1],
                    "steps": json.loads(row[2]),
                    "outcome": row[3],
                    "confidence": row[4],
                    "timestamp": row[5]
                }
        return None

    def get_all_nodes(self):
        with self.get_connection() as conn:
            cursor = conn.cursor()
            cursor.execute('SELECT * FROM nodes')
            columns = [col[0] for col in cursor.description]
            return [dict(zip(columns, row)) for row in cursor.fetchall()]
