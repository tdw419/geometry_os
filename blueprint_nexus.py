
"""
Optimized Nexus Schema
Designed for Holographic OS (Phase 13+).
Focuses on Quantum-Ready Sparse Storage and Semantic Density.
"""
import sqlite3
import os

def create_optimized_nexus(path="nexus_prime.db"):
    if os.path.exists(path):
        os.remove(path)
        
    with sqlite3.connect(path) as conn:
        # 1. CORE NODES (The Vertices)
        # Replaces 'knowledge_vectors' with a cleaner, polymorphic node structure
        conn.execute("""
            CREATE TABLE nodes (
                id TEXT PRIMARY KEY,
                type TEXT NOT NULL,       -- 'concept', 'file', 'model', 'quantum_state'
                content TEXT,             -- The actual text/code/value
                metadata JSON,            -- Flexible metadata (replaces massive blobs)
                embedding BLOB,           -- 768-dim vector (Quantized to int8 for 4x compression if needed)
                created_at REAL,
                provenance TEXT           -- Source of this truth (e.g., 'Founder', 'DreamCycle #1')
            );
        """)

        # 2. HOLOGRAPHIC EDGES (The Connections)
        # Stores relationships with 'Quantum Strength' (Probability)
        conn.execute("""
            CREATE TABLE edges (
                source_id TEXT,
                target_id TEXT,
                type TEXT,                -- 'defines', 'entangles', 'implements'
                strength REAL,            -- 0.0 to 1.0 (Quantum Probability / Relevance)
                timestamp REAL,
                PRIMARY KEY (source_id, target_id, type),
                FOREIGN KEY(source_id) REFERENCES nodes(id),
                FOREIGN KEY(target_id) REFERENCES nodes(id)
            );
        """)

        # 3. TRACE LOG (The Observability Layer)
        # Replaces 'generated_code' and 'logs' with a unified event stream
        conn.execute("""
            CREATE TABLE traces (
                id TEXT PRIMARY KEY,
                intent TEXT,              -- "Why we did this"
                steps JSON,               -- The chain of thought
                outcome TEXT,
                confidence REAL,
                timestamp REAL,
                verified INTEGER          -- 1 if verified by Founder/Oracle
            );
        """)
        
        # 4. QUANTUM STATE (The Superposition Layer)
        # specialized table for Q-Nodes (Phase 12)
        conn.execute("""
            CREATE TABLE quantum_states (
                node_id TEXT PRIMARY KEY,
                alpha_real REAL,          -- Real part of |0> amplitude
                alpha_imag REAL,          -- Imag part of |0> amplitude
                beta_real REAL,           -- Real part of |1> amplitude
                beta_imag REAL,           -- Imag part of |1> amplitude
                entangled_with TEXT,      -- ID of entangled partner
                FOREIGN KEY(node_id) REFERENCES nodes(id)
            );
        """)
        
        # Optimized Indices for Holographic Retrieval
        conn.execute("CREATE INDEX idx_vector_type ON nodes(type);")
        conn.execute("CREATE INDEX idx_edge_strength ON edges(strength DESC);")
        conn.execute("CREATE INDEX idx_trace_time ON traces(timestamp DESC);")
        
    print(f"✨ Nexus Prime Created at {path}")
    print("   Architecture: Holographic V2 (Quantum-Ready)")

if __name__ == "__main__":
    create_optimized_nexus()
