#!/usr/bin/env python3
import argparse
import os
import sys
import sqlite3
import json
import uuid
import numpy as np
from datetime import datetime
from pathlib import Path

# Add project root to path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

try:
    from src.vector_llm_tools.omni_geometry import HyperGraphWeaver, GeometricOracle
    from src.resonant_kernel.trace_replayer import TraceReplayer, Trace, ThoughtStep
except ImportError:
    # Fallback if running from a different context
    sys.path.append(os.getcwd())
    from src.vector_llm_tools.omni_geometry import HyperGraphWeaver, GeometricOracle
    from src.resonant_kernel.trace_replayer import TraceReplayer, Trace, ThoughtStep

DB_PATH = "ctrm_llm_os.db"

def init_db():
    """Initialize the database schema if it doesn't exist."""
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    # Create nodes table
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS hyper_graph_nodes (
            id TEXT PRIMARY KEY,
            name TEXT,
            content TEXT,
            vector TEXT,
            file_path TEXT,
            metadata TEXT,
            created_at TEXT,
            updated_at TEXT
        )
    """)
    
    # Create edges table
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS hyper_graph_edges (
            source_id TEXT,
            target_id TEXT,
            strength REAL,
            edge_type TEXT,
            created_at TEXT,
            PRIMARY KEY (source_id, target_id, edge_type)
        )
    """)
    conn.commit()
    conn.close()

def ingest(args):
    """Ingest a directory into the Hyper-Graph."""
    print(f"🔮 Initializing Geometric Ingestion for: {args.path}")
    init_db()
    
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    path = Path(args.path)
    if not path.exists():
        print(f"❌ Path {path} does not exist.")
        return

    files_processed = 0
    # Simple recursive walk
    for root, _, files in os.walk(path):
        for file in files:
            if file.endswith(f".{args.language}") or args.language == "all":
                file_path = os.path.join(root, file)
                try:
                    with open(file_path, 'r', encoding='utf-8') as f:
                        content = f.read()
                    
                    # Mock vector for L0 speed (in L1 this calls an embedding model)
                    # We use a deterministic hash-based vector so it's consistent
                    import hashlib
                    h = hashlib.sha256(content.encode()).hexdigest()
                    vector = [int(h[i:i+2], 16)/255.0 for i in range(0, 64, 2)] # 32-dim mock
                    while len(vector) < 768: vector.extend(vector[:768-len(vector)]) # Pad to 768
                    
                    node_id = str(uuid.uuid4())
                    timestamp = datetime.now().isoformat()
                    
                    cursor.execute("""
                        INSERT OR REPLACE INTO hyper_graph_nodes 
                        (id, name, content, vector, file_path, metadata, created_at, updated_at)
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                    """, (
                        node_id, 
                        file, 
                        content, 
                        json.dumps(vector[:768]), 
                        file_path, 
                        json.dumps({"language": args.language}), 
                        timestamp, 
                        timestamp
                    ))
                    files_processed += 1
                    print(f"  └── Ingested Node: {file} [Tensile Strength: Calculating...]")
                except Exception as e:
                    print(f"  ⚠️ Skipping {file}: {e}")

    conn.commit()
    conn.close()
    
    print(f"\n✨ Ingestion Complete. {files_processed} nodes added to the Lattice.")
    print("🕸️  Weaving connections... (Simulating O(N^2) semantic pass)")
    
    # Trigger Weaver to update edges (using existing tool logic logic)
    try:
        weaver = HyperGraphWeaver(database_path=DB_PATH)
        weaver.weave_connections()
        weaver.close()
    except Exception as e:
        print(f"⚠️  Weaver warning: {e}")

def ask(args):
    """Execute an intent against the geometry."""
    print(f"🧠 Geometric Oracle received intent: '{args.query}'")
    
    # 1. Resolve Intent via Oracle (L0)
    try:
        weaver = HyperGraphWeaver(database_path=DB_PATH)
        oracle = GeometricOracle(weaver)
        resolution = oracle.resolve_intent(args.query)
        weaver.close()
    except Exception as e:
        print(f"⚠️  Oracle error: {e}")
        resolution = {'success': False}

    if not resolution.get('success'):
        print("  ⚠️ No direct node match found. Initiating Deep Trace...")
        context_nodes = []
    else:
        print(f"  📍 Anchored to Node: {resolution['node_name']} (Confidence: {resolution['confidence']})")
        context_nodes = [resolution['node_name']]

    # 2. Replay Trace Reasoning (L0 Killer Feature)
    print("\n⏳ Spinning up TimeBubble (Resonant Kernel)...")
    replayer = TraceReplayer()
    
    # We simulate a "similar past trace" to demonstrate resonance
    past_query = "Refactor logic for optimization"
    past_reasoning = ["Analyze complexity", "Isolate bottleneck", "Refactor loop"]
    replayer.think_and_record(past_query, past_reasoning, "Optimized")
    
    # Now execute the user's intent
    trace = replayer.replay_on_new_query(args.query)
    
    if trace:
        print("\n✅ OPTIMAL PATH COMMITTED TO REALITY:")
        for i, step in enumerate(trace.reasoning):
            print(f"  {i+1}. {step.content}")
        print(f"\nResult: {trace.output}")
    
def main():
    parser = argparse.ArgumentParser(description="OMNI-GEOMETRY CLI: The Interface to the Lattice")
    subparsers = parser.add_subparsers(dest="command", help="Available commands")
    
    # Ingest Command
    parser_ingest = subparsers.add_parser("ingest", help="Ingest codebase into the Lattice")
    parser_ingest.add_argument("path", help="Path to codebase")
    parser_ingest.add_argument("--language", default="all", help="Filter by language (e.g., python)")
    
    # Ask Command
    parser_ask = subparsers.add_parser("ask", help="Execute an intent")
    parser_ask.add_argument("query", help="The intent to execute")
    
    args = parser.parse_args()
    
    if args.command == "ingest":
        ingest(args)
    elif args.command == "ask":
        ask(args)
    else:
        parser.print_help()

if __name__ == "__main__":
    main()
