import json
from typing import List, Dict, Any, Optional
from datetime import datetime
import numpy as np
import sqlite3
import hashlib
import os

class HyperGraphNode:
    """A node in the OMNI-GEOMETRY hyper-graph"""
    def __init__(self, node_id, name, content, vector, metadata, file_path=""):
        self.id = node_id
        self.name = name
        self.content = content
        self.vector = vector
        self.metadata = metadata
        self.file_path = file_path
        self.created_at = datetime.now().isoformat()
        self.updated_at = datetime.now().isoformat()

class HyperGraphEdge:
    """A tensile connection between hyper-graph nodes"""
    def __init__(self, source_id, target_id, strength, edge_type):
        self.source_id = source_id
        self.target_id = target_id
        self.strength = strength  # 0.0 to 1.0
        self.edge_type = edge_type  # semantic, structural, temporal, etc.
        self.created_at = datetime.now().isoformat()

class CTRMDatabase:
    def __init__(self, db_path: str = "ctrm_llm_os.db"):
        self.db_path = db_path
        self.conn = None

    def initialize(self):
        """Initialize database connection and create tables"""
        # Ensure directory exists
        dirname = os.path.dirname(self.db_path)
        if dirname:
            os.makedirs(dirname, exist_ok=True)

        self.conn = sqlite3.connect(self.db_path)
        self.conn.execute("PRAGMA journal_mode=WAL")
        self.conn.execute("PRAGMA synchronous=NORMAL")

        # Create tables
        self._create_tables()

    def _create_tables(self):
        """Create all necessary database tables"""
        # Set row factory to allow name access
        self.conn.row_factory = sqlite3.Row

        # Create ctrm_truths table
        self.conn.execute('''
            CREATE TABLE IF NOT EXISTS ctrm_truths (
                id TEXT PRIMARY KEY,
                statement TEXT NOT NULL,
                embedding BLOB,
                confidence REAL CHECK (confidence >= 0 AND confidence <= 1),
                distance_from_center INTEGER CHECK (distance_from_center >= 0 AND distance_from_center <= 100),
                verification_count INTEGER DEFAULT 0,
                failure_count INTEGER DEFAULT 0,
                token_cost INTEGER,
                importance_score REAL,
                importance_rank INTEGER DEFAULT 0,
                category TEXT,
                dependencies TEXT,
                metadata TEXT,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )
        ''')

        # Create index for spatial queries
        self.conn.execute('''
            CREATE INDEX IF NOT EXISTS idx_ctrm_distance
            ON ctrm_truths(distance_from_center, confidence)
        ''')

        # Create index for importance ranking
        self.conn.execute('''
            CREATE INDEX IF NOT EXISTS idx_ctrm_importance_rank
            ON ctrm_truths(importance_rank)
        ''')

        # Create ctrm_relationships table
        self.conn.execute('''
            CREATE TABLE IF NOT EXISTS ctrm_relationships (
                parent_truth_id TEXT,
                child_truth_id TEXT,
                relationship_type TEXT,
                confidence REAL,
                PRIMARY KEY (parent_truth_id, child_truth_id),
                FOREIGN KEY (parent_truth_id) REFERENCES ctrm_truths(id),
                FOREIGN KEY (child_truth_id) REFERENCES ctrm_truths(id)
            )
        ''')

        # Create ctrm_token_ledger table
        self.conn.execute('''
            CREATE TABLE IF NOT EXISTS ctrm_token_ledger (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                truth_id TEXT,
                operation TEXT,
                token_cost INTEGER,
                timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                model_used TEXT,
                FOREIGN KEY (truth_id) REFERENCES ctrm_truths(id)
            )
        ''')

        # ==========================================
        # OMNI-GEOMETRY TABLES (Assimilation Phase 1)
        # ==========================================

        # Hyper-Graph Nodes
        self.conn.execute('''
            CREATE TABLE IF NOT EXISTS hyper_graph_nodes (
                id TEXT PRIMARY KEY,
                name TEXT NOT NULL,
                content TEXT,
                vector BLOB,
                file_path TEXT,
                metadata TEXT,
                created_at TIMESTAMP,
                updated_at TIMESTAMP
            )
        ''')

        # Hyper-Graph Edges
        self.conn.execute('''
            CREATE TABLE IF NOT EXISTS hyper_graph_edges (
                source_id TEXT,
                target_id TEXT,
                strength REAL,
                edge_type TEXT,
                created_at TIMESTAMP,
                PRIMARY KEY (source_id, target_id, edge_type),
                FOREIGN KEY (source_id) REFERENCES hyper_graph_nodes(id),
                FOREIGN KEY (target_id) REFERENCES hyper_graph_nodes(id)
            )
        ''')

        self.conn.commit()

    # ==================================
    # OMNI-GEOMETRY METHODS
    # ==================================

    def add_hyper_graph_node(self, node: HyperGraphNode):
        """Add a node to the hyper-graph database"""
        # Convert vector to bytes if it's numpy array
        vector_blob = None
        if node.vector is not None:
            if isinstance(node.vector, list):
                vector_blob = np.array(node.vector, dtype=np.float32).tobytes()
            else:
                vector_blob = node.vector.tobytes()

        # Check existing
        cursor = self.conn.execute("SELECT 1 FROM hyper_graph_nodes WHERE id = ?", (node.id,))
        exists = cursor.fetchone()

        if exists:
            self.conn.execute('''
                UPDATE hyper_graph_nodes
                SET name = ?, content = ?, vector = ?, file_path = ?,
                    metadata = ?, updated_at = ?
                WHERE id = ?
            ''', (
                node.name, node.content, vector_blob, node.file_path,
                json.dumps(node.metadata), datetime.now().isoformat(), node.id
            ))
        else:
            self.conn.execute('''
                INSERT INTO hyper_graph_nodes
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
            ''', (
                node.id, node.name, node.content, vector_blob, node.file_path,
                json.dumps(node.metadata), node.created_at, node.updated_at
            ))
        self.conn.commit()

    def add_hyper_graph_edge(self, edge: HyperGraphEdge):
        """Add a tensile connection between nodes"""
        # Upsert edge
        self.conn.execute('''
            INSERT OR REPLACE INTO hyper_graph_edges
            (source_id, target_id, strength, edge_type, created_at)
            VALUES (?, ?, ?, ?, ?)
        ''', (
            edge.source_id, edge.target_id, edge.strength,
            edge.edge_type, edge.created_at
        ))
        self.conn.commit()

    def find_similar_hyper_graph_nodes(self, vector, k=5) -> List[HyperGraphNode]:
        """Find nodes with similar vectors using cosine similarity"""
        cursor = self.conn.execute("SELECT * FROM hyper_graph_nodes WHERE vector IS NOT NULL")
        
        scores = []
        query_vec = np.array(vector, dtype=np.float32)

        for row in cursor.fetchall():
            node_vec = np.frombuffer(row[3], dtype=np.float32)
            
            # Handle dim mismatch
            if len(query_vec) != len(node_vec):
                 max_len = max(len(query_vec), len(node_vec))
                 v1 = np.pad(query_vec, (0, max_len - len(query_vec)))
                 v2 = np.pad(node_vec, (0, max_len - len(node_vec)))
            else:
                 v1, v2 = query_vec, node_vec

            # Cosine sim
            denom = (np.linalg.norm(v1) * np.linalg.norm(v2))
            if denom == 0:
                sim = 0
            else:
                sim = np.dot(v1, v2) / denom
            
            scores.append((row, sim))
        
        # Sort and return top k
        scores.sort(key=lambda x: x[1], reverse=True)
        
        results = []
        for row, score in scores[:k]:
             # Reconstruct node object
             results.append(HyperGraphNode(
                 node_id=row[0],
                 name=row[1],
                 content=row[2],
                 vector=np.frombuffer(row[3], dtype=np.float32),
                 file_path=row[4],
                 metadata=json.loads(row[5])
             ))
        return results

    # ==================================
    # LEGACY CTRM METHODS
    # ==================================

    def store_truth(self, truth: Dict[str, Any]):
        """Store a truth in the database"""
        # Convert embedding to bytes
        embedding_bytes = np.array(truth['embedding'], dtype=np.float32).tobytes() if truth['embedding'] else None

        self.conn.execute('''
            INSERT INTO ctrm_truths (
                id, statement, embedding, confidence, distance_from_center,
                verification_count, failure_count, token_cost, importance_score,
                category, dependencies, metadata, created_at, updated_at
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            ON CONFLICT (id) DO UPDATE SET
                statement = EXCLUDED.statement,
                embedding = EXCLUDED.embedding,
                confidence = EXCLUDED.confidence,
                distance_from_center = EXCLUDED.distance_from_center,
                verification_count = EXCLUDED.verification_count,
                failure_count = EXCLUDED.failure_count,
                token_cost = EXCLUDED.token_cost,
                importance_score = EXCLUDED.importance_score,
                category = EXCLUDED.category,
                dependencies = EXCLUDED.dependencies,
                metadata = EXCLUDED.metadata,
                updated_at = EXCLUDED.updated_at
        ''', (
            truth['id'], truth['statement'], embedding_bytes, truth['confidence'],
            truth['distance_from_center'], truth['verification_count'], truth['failure_count'],
            truth['token_cost'], truth['importance_score'], truth['category'],
            json.dumps(truth['dependencies']), json.dumps(truth['metadata']),
            truth['created_at'], truth['updated_at']
        ))

        self.conn.commit()

    def recalculate_importance_ranks(self):
        """
        Recalculate importance_rank for all truths.
        Rank 0 = closest to center (most important)
        Lower distance_from_center = lower rank number = more important
        """
        self.conn.execute('''
            UPDATE ctrm_truths SET importance_rank = (
                SELECT COUNT(*) FROM ctrm_truths AS t2
                WHERE t2.distance_from_center < ctrm_truths.distance_from_center
            )
        ''')
        self.conn.commit()
        return self.conn.execute('SELECT COUNT(*) FROM ctrm_truths').fetchone()[0]

    def get_truths_by_rank(self, limit: int = 10, offset: int = 0) -> List[Dict[str, Any]]:
        """Get truths ordered by importance rank (most important first)"""
        cursor = self.conn.execute('''
            SELECT * FROM ctrm_truths
            ORDER BY importance_rank ASC
            LIMIT ? OFFSET ?
        ''', (limit, offset))

        results = []
        for row in cursor.fetchall():
            embedding = list(np.frombuffer(row[2], dtype=np.float32)) if row[2] else None
            results.append({
                'id': row[0],
                'statement': row[1],
                'embedding': embedding,
                'confidence': row[3],
                'distance_from_center': row[4],
                'importance_rank': row[14] if len(row) > 14 else 0,
                'verification_count': row[5],
                'failure_count': row[6],
                'category': row[9],
                'created_at': row[12]
            })
        return results

    def get_truth(self, truth_id: str) -> Optional[Dict[str, Any]]:
        """Get a truth by ID"""
        cursor = self.conn.execute('''
            SELECT * FROM ctrm_truths WHERE id = ?
        ''', (truth_id,))

        row = cursor.fetchone()
        if not row:
            return None

        # Convert embedding back to list
        embedding = list(np.frombuffer(row[2], dtype=np.float32)) if row[2] else None

        return {
            'id': row[0],
            'statement': row[1],
            'embedding': embedding,
            'confidence': row[3],
            'distance_from_center': row[4],
            'verification_count': row[5],
            'failure_count': row[6],
            'token_cost': row[7],
            'importance_score': row[8],
            'category': row[9],
            'dependencies': json.loads(row[10]),
            'metadata': json.loads(row[11]),
            'created_at': row[12],
            'updated_at': row[13]
        }

    def query_similar_truths(self, query_embedding: List[float], limit: int = 10) -> List[Dict[str, Any]]:
        """Query similar truths using vector similarity"""
        # For SQLite, we'll use a simple cosine similarity calculation
        # This is a simplified approach - in production you'd want a proper vector database

        # Get all truths with embeddings
        cursor = self.conn.execute('''
            SELECT * FROM ctrm_truths
            WHERE confidence > 0.6 AND embedding IS NOT NULL
        ''')

        results = []
        for row in cursor.fetchall():
            # Convert embedding back to list
            embedding = list(np.frombuffer(row[2], dtype=np.float32)) if row[2] else None
            if not embedding:
                continue

            # Calculate cosine similarity with dimension safety
            query_np = np.array(query_embedding, dtype=np.float32)
            embedding_np = np.array(embedding, dtype=np.float32)

            # Handle dimension mismatches
            if len(query_np) != len(embedding_np):
                # Normalize dimensions by padding or truncating
                max_len = max(len(query_np), len(embedding_np))
                query_np = np.pad(query_np, (0, max_len - len(query_np)))
                embedding_np = np.pad(embedding_np, (0, max_len - len(embedding_np)))

            dot_product = np.dot(query_np, embedding_np)
            norm_query = np.linalg.norm(query_np)
            norm_embedding = np.linalg.norm(embedding_np)

            if norm_query == 0 or norm_embedding == 0:
                similarity = 0.0
            else:
                similarity = dot_product / (norm_query * norm_embedding)

            results.append({
                'id': row[0],
                'statement': row[1],
                'embedding': embedding,
                'confidence': row[3],
                'distance_from_center': row[4],
                'verification_count': row[5],
                'failure_count': row[6],
                'token_cost': row[7],
                'importance_score': row[8],
                'category': row[9],
                'dependencies': json.loads(row[10]),
                'metadata': json.loads(row[11]),
                'created_at': row[12],
                'updated_at': row[13],
                'similarity': similarity
            })

        # Sort by similarity (descending)
        results.sort(key=lambda x: x['similarity'], reverse=True)

        return results[:limit]

    def update_truth(self, truth: Dict[str, Any]):
        """Update a truth in the database"""
        # Convert embedding to bytes
        embedding_bytes = np.array(truth['embedding'], dtype=np.float32).tobytes() if truth['embedding'] else None

        self.conn.execute('''
            UPDATE ctrm_truths SET
                statement = ?,
                embedding = ?,
                confidence = ?,
                distance_from_center = ?,
                verification_count = ?,
                failure_count = ?,
                token_cost = ?,
                importance_score = ?,
                category = ?,
                dependencies = ?,
                metadata = ?,
                updated_at = ?
            WHERE id = ?
        ''', (
            truth['statement'], embedding_bytes, truth['confidence'],
            truth['distance_from_center'], truth['verification_count'], truth['failure_count'],
            truth['token_cost'], truth['importance_score'], truth['category'],
            json.dumps(truth['dependencies']), json.dumps(truth['metadata']),
            truth['updated_at'], truth['id']
        ))

        self.conn.commit()

    def record_token_usage(self, truth_id: str, operation: str, token_cost: int, model_used: str):
        """Record token usage in the ledger"""
        self.conn.execute('''
            INSERT INTO ctrm_token_ledger (truth_id, operation, token_cost, model_used)
            VALUES (?, ?, ?, ?)
        ''', (truth_id, operation, token_cost, model_used))

        self.conn.commit()

    def get_category_spend(self, category: str) -> int:
        """Get total token spend for a category"""
        cursor = self.conn.execute('''
            SELECT COALESCE(SUM(token_cost), 0)
            FROM ctrm_token_ledger
            WHERE operation = ?
        ''', (category,))

        result = cursor.fetchone()
        return result[0] if result else 0

    def get_all_truths(self) -> List[Dict[str, Any]]:
        """Get all truths from the database"""
        cursor = self.conn.execute('''
            SELECT * FROM ctrm_truths
        ''')

        results = []
        for row in cursor.fetchall():
            # Convert embedding back to list
            embedding = list(np.frombuffer(row[2], dtype=np.float32)) if row[2] else None

            results.append({
                'id': row[0],
                'statement': row[1],
                'embedding': embedding,
                'confidence': row[3],
                'distance_from_center': row[4],
                'verification_count': row[5],
                'failure_count': row[6],
                'token_cost': row[7],
                'importance_score': row[8],
                'category': row[9],
                'dependencies': json.loads(row[10]),
                'metadata': json.loads(row[11]),
                'created_at': row[12],
                'updated_at': row[13]
            })

        return results

    def execute(self, query: str, params: tuple = None):
        """Execute a SQL query"""
        if not self.conn:
            raise Exception("Database connection not initialized")
        if params:
            return self.conn.execute(query, params)
        else:
            return self.conn.execute(query)

    def query(self, query: str, params: tuple = None) -> List[Dict[str, Any]]:
        """Execute query and return list of dicts"""
        cursor = self.execute(query, params)
        return [dict(row) for row in cursor.fetchall()]
    
    def close(self):
        """Close database connection"""
        if self.conn:
            self.conn.close()