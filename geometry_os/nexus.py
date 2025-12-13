
import uuid
import time
import networkx as nx
import numpy as np
import json
import hashlib
from typing import Dict, List, Any, Optional
from dataclasses import dataclass, field
from enum import Enum
from sklearn.feature_extraction.text import TfidfVectorizer
from .persistence import DatabaseManager

@dataclass
class Node:
    """The Atom of State"""
    id: str
    content: str
    type: str = "obj" # obj, trace, policy, agent
    vector: np.array = field(default_factory=lambda: np.array([]))
    metadata: Dict[str, Any] = field(default_factory=dict)
    provenance: str = "" # Signature/Hash

    def __post_init__(self):
        if not self.id:
            self.id = str(uuid.uuid4())

class EdgeType(Enum):
    SEMANTIC = "semantic"
    STRUCTURAL = "structural"
    CAUSAL = "causal" # For traces
    POLICY = "policy"

@dataclass
class Edge:
    """The Atom of Structure"""
    source: str
    target: str
    type: EdgeType
    strength: float = 1.0 # Tensile strength

class Nexus:
    """The Memory Plane (Persistent)"""
    def __init__(self, db_path="nexus.db"):
        self.db = DatabaseManager(db_path)
        self.nodes: Dict[str, Node] = {}
        self.edges: List[Edge] = []
        self.graph = nx.DiGraph()
        self._hydrate_from_db()

    def _hydrate_from_db(self):
        """Load graph structure from disk on boot"""
        raw_nodes = self.db.get_all_nodes()
        for rn in raw_nodes:
            # Reconstruct Node object
            metadata = json.loads(rn['metadata']) if isinstance(rn['metadata'], str) else rn['metadata']
            embedding = np.frombuffer(rn['embedding'], dtype=np.uint8) if rn['embedding'] else np.array([])
            
            node = Node(
                id=rn['id'],
                type=rn['type'],
                content=rn['content'],
                metadata=metadata,
                vector=embedding,
                provenance=rn['provenance']
            )
            self.nodes[node.id] = node
            self.graph.add_node(node.id, type=node.type, content=node.content[:50])
        # Note: Edges hydration omitted for L0 simplicity, but would go here.

    def ingest(self, content: str, type="obj", metadata=None) -> Node:
        node = Node(
            id=str(uuid.uuid4()),
            content=content,
            type=type,
            metadata=metadata or {}
        )
        # Mock embedding 
        node.vector = self._mock_embed(content)
        
        # In-memory update
        self.nodes[node.id] = node
        self.graph.add_node(node.id, type=type, content=content[:50])
        
        # Persist
        self.db.store_node({
            "id": node.id,
            "type": node.type,
            "content": node.content,
            "metadata": node.metadata,
            "vector": node.vector,
            "provenance": node.provenance
        })
        
        return node
    
    def connect(self, source: str, target: str, type: EdgeType, strength=1.0):
        edge = Edge(source, target, type, strength)
        
        # In-memory update
        self.edges.append(edge)
        self.graph.add_edge(source, target, type=type.value, weight=strength)
        
        # Persist
        self.db.store_edge({
            "source": source,
            "target": target,
            "type": type,
            "strength": strength
        })
        return edge

    def _mock_embed(self, text):
        h = hashlib.sha256(text.encode()).digest()
        # Ensure it fits into numpy array correctly
        return np.frombuffer(h, dtype=np.uint8) / 255.0

    def find_relevant(self, query_vector: np.array, k=5):
        # Naive linear scan for L0
        results = []
        for n in self.nodes.values():
            if len(n.vector) == len(query_vector):
                # Ensure dimensions match before dot product
                sim = np.dot(n.vector, query_vector)
                results.append((n, sim))
        results.sort(key=lambda x: x[1], reverse=True)
        return results[:k]
