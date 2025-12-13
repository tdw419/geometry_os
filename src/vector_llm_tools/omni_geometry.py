#!/usr/bin/env python3
"""
OMNI-GEOMETRY Production Toolset
Production-hardened HyperGraphWeaver and GeometricOracle for daemon integration

This module provides the core geometric intelligence that will be assimilated
into the Evolution Daemon, enabling it to think in hyper-graphs instead of files.
"""

import os
import json
import hashlib
import numpy as np
from typing import List, Dict, Any, Optional, Tuple
from datetime import datetime
import uuid
import sqlite3
from sklearn.metrics.pairwise import cosine_similarity
import logging
from pathlib import Path

# Configure logging
logger = logging.getLogger(__name__)

class HyperGraphWeaver:
    """
    Production Hyper-Graph Weaver
    Manages the hyper-graph structure and performs geometric operations
    """

    def __init__(self, database_path: str = "ctrm_llm_os.db"):
        """
        Initialize the Hyper-Graph Weaver

        Args:
            database_path: Path to the CTRM database containing hyper-graph tables
        """
        self.database_path = database_path
        self.conn = None
        self._connect_to_database()

        # Cache for performance optimization
        self.node_cache = {}
        self.vector_cache = {}

        logger.info("🌌 HyperGraphWeaver initialized")
        logger.info(f"📊 Database: {self.database_path}")

    def _connect_to_database(self):
        """Establish database connection"""
        try:
            self.conn = sqlite3.connect(self.database_path)
            self.conn.execute("PRAGMA journal_mode=WAL")  # Better for concurrent access
            self.conn.execute("PRAGMA synchronous=NORMAL")  # Balance between safety and speed
            logger.info("🔗 Database connection established")
        except Exception as e:
            logger.error(f"❌ Database connection failed: {str(e)}")
            raise

    def _ensure_tables_exist(self):
        """Ensure hyper-graph tables exist"""
        cursor = self.conn.cursor()

        # Check for required tables
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = [table[0] for table in cursor.fetchall()]

        required_tables = ['hyper_graph_nodes', 'hyper_graph_edges']

        for table in required_tables:
            if table not in tables:
                raise RuntimeError(f"Required table {table} not found in database")

    def get_node_count(self) -> int:
        """Get the total number of nodes in the hyper-graph"""
        cursor = self.conn.cursor()
        cursor.execute("SELECT COUNT(*) FROM hyper_graph_nodes")
        return cursor.fetchone()[0]

    def get_edge_count(self) -> int:
        """Get the total number of edges in the hyper-graph"""
        cursor = self.conn.cursor()
        cursor.execute("SELECT COUNT(*) FROM hyper_graph_edges")
        return cursor.fetchone()[0]

    def get_node_by_id(self, node_id: str) -> Optional[Dict]:
        """Get a node by its ID"""
        # Check cache first
        if node_id in self.node_cache:
            return self.node_cache[node_id]

        cursor = self.conn.cursor()
        cursor.execute("SELECT * FROM hyper_graph_nodes WHERE id = ?", (node_id,))
        row = cursor.fetchone()

        if row:
            node = {
                'id': row[0],
                'name': row[1],
                'content': row[2],
                'vector': json.loads(row[3]),
                'file_path': row[4],
                'metadata': json.loads(row[5]),
                'created_at': row[6],
                'updated_at': row[7]
            }
            # Cache the node
            self.node_cache[node_id] = node
            return node

        return None

    def get_vector_by_id(self, node_id: str) -> Optional[np.array]:
        """Get a vector by node ID (cached)"""
        # Check vector cache first
        if node_id in self.vector_cache:
            return self.vector_cache[node_id]

        node = self.get_node_by_id(node_id)
        if node:
            vector = np.array(node['vector'])
            # Cache the vector
            self.vector_cache[node_id] = vector
            return vector

        return None

    def find_similar_nodes(self, query_vector: np.array, limit: int = 5, threshold: float = 0.3) -> List[Tuple[str, float]]:
        """
        Find nodes similar to a query vector

        Args:
            query_vector: The query vector to compare against
            limit: Maximum number of results to return
            threshold: Minimum similarity score to consider

        Returns:
            List of (node_id, similarity_score) tuples
        """
        # Get all node vectors
        cursor = self.conn.cursor()
        cursor.execute("SELECT id, vector FROM hyper_graph_nodes")
        nodes = cursor.fetchall()

        similarities = []

        for node_id, vector_json in nodes:
            try:
                node_vector = np.array(json.loads(vector_json))

                # Calculate cosine similarity
                similarity = cosine_similarity(
                    [query_vector],
                    [node_vector]
                )[0][0]

                if similarity >= threshold:
                    similarities.append((node_id, similarity))

            except Exception as e:
                logger.warning(f"⚠️  Failed to process node {node_id}: {str(e)}")
                continue

        # Sort by similarity (descending) and limit results
        similarities.sort(key=lambda x: x[1], reverse=True)
        return similarities[:limit]

    def find_nodes_by_content(self, search_term: str, limit: int = 10) -> List[Dict]:
        """
        Find nodes containing specific content

        Args:
            search_term: Term to search for in node content
            limit: Maximum number of results

        Returns:
            List of matching nodes
        """
        cursor = self.conn.cursor()
        cursor.execute("""
            SELECT id, name, file_path
            FROM hyper_graph_nodes
            WHERE content LIKE ?
            LIMIT ?
        """, (f'%{search_term}%', limit))

        results = []
        for row in cursor.fetchall():
            results.append({
                'id': row[0],
                'name': row[1],
                'file_path': row[2]
            })

        return results

    def get_connected_nodes(self, node_id: str, edge_type: str = 'semantic') -> List[Tuple[str, float]]:
        """
        Get nodes connected to a specific node

        Args:
            node_id: The source node ID
            edge_type: Type of edges to consider

        Returns:
            List of (target_node_id, strength) tuples
        """
        cursor = self.conn.cursor()
        cursor.execute("""
            SELECT target_id, strength
            FROM hyper_graph_edges
            WHERE source_id = ? AND edge_type = ?
        """, (node_id, edge_type))

        return cursor.fetchall()

    def get_connection_strength_stats(self) -> Dict:
        """Get statistics about connection strengths"""
        cursor = self.conn.cursor()

        cursor.execute("""
            SELECT
                AVG(strength) as avg_strength,
                MIN(strength) as min_strength,
                MAX(strength) as max_strength,
                COUNT(*) as total_connections
            FROM hyper_graph_edges
        """)

        result = cursor.fetchone()

        return {
            'average_strength': result[0],
            'minimum_strength': result[1],
            'maximum_strength': result[2],
            'total_connections': result[3]
        }

    def weave_connections(self, node_id: str = None, force: bool = False) -> int:
        """
        Weave new connections for a node or rebuild all connections

        Args:
            node_id: Specific node ID to weave connections for (None for all)
            force: Force reweaving even if connections exist

        Returns:
            Number of new connections created
        """
        logger.info("🧶 Starting connection weaving process")

        if node_id:
            logger.info(f"🎯 Weaving connections for node: {node_id}")
            return self._weave_connections_for_node(node_id, force)
        else:
            logger.info("🌐 Rebuilding all connections")
            return self._rebuild_all_connections()

    def _weave_connections_for_node(self, node_id: str, force: bool = False) -> int:
        """Weave connections for a specific node"""
        source_node = self.get_node_by_id(node_id)
        if not source_node:
            logger.warning(f"⚠️  Node {node_id} not found")
            return 0

        source_vector = np.array(source_node['vector'])
        connections_created = 0

        # Get all other nodes
        cursor = self.conn.cursor()
        cursor.execute("SELECT id, vector FROM hyper_graph_nodes WHERE id != ?", (node_id,))
        other_nodes = cursor.fetchall()

        for target_id, vector_json in other_nodes:
            try:
                target_vector = np.array(json.loads(vector_json))

                # Calculate similarity
                similarity = cosine_similarity(
                    [source_vector],
                    [target_vector]
                )[0][0]

                # Only create meaningful connections
                if similarity > 0.3:
                    # Check if connection already exists
                    cursor.execute("""
                        SELECT 1 FROM hyper_graph_edges
                        WHERE source_id = ? AND target_id = ? AND edge_type = 'semantic'
                    """, (node_id, target_id))

                    if not cursor.fetchone() or force:
                        # Create new connection
                        cursor.execute("""
                            INSERT INTO hyper_graph_edges
                            VALUES (?, ?, ?, ?, ?)
                        """, (node_id, target_id, similarity, 'semantic', datetime.now().isoformat()))
                        connections_created += 1

                        # Create bidirectional connection
                        cursor.execute("""
                            INSERT INTO hyper_graph_edges
                            VALUES (?, ?, ?, ?, ?)
                        """, (target_id, node_id, similarity, 'semantic', datetime.now().isoformat()))
                        connections_created += 1

            except Exception as e:
                logger.warning(f"⚠️  Failed to create connection {node_id} -> {target_id}: {str(e)}")
                continue

        self.conn.commit()
        logger.info(f"✨ Created {connections_created} new connections for node {node_id}")
        return connections_created

    def _rebuild_all_connections(self) -> int:
        """Rebuild all connections in the hyper-graph"""
        # Clear existing connections
        cursor = self.conn.cursor()
        cursor.execute("DELETE FROM hyper_graph_edges")
        self.conn.commit()

        logger.info("🧹 Cleared existing connections")

        # Get all nodes
        cursor.execute("SELECT id, vector FROM hyper_graph_nodes")
        nodes = cursor.fetchall()

        total_connections = 0

        for i, (source_id, source_vector_json) in enumerate(nodes):
            try:
                source_vector = np.array(json.loads(source_vector_json))

                for j, (target_id, target_vector_json) in enumerate(nodes):
                    if source_id == target_id:
                        continue

                    try:
                        target_vector = np.array(json.loads(target_vector_json))
                        similarity = cosine_similarity([source_vector], [target_vector])[0][0]

                        if similarity > 0.3:
                            # Create bidirectional connections
                            cursor.execute("""
                                INSERT INTO hyper_graph_edges
                                VALUES (?, ?, ?, ?, ?)
                            """, (source_id, target_id, similarity, 'semantic', datetime.now().isoformat()))

                            cursor.execute("""
                                INSERT INTO hyper_graph_edges
                                VALUES (?, ?, ?, ?, ?)
                            """, (target_id, source_id, similarity, 'semantic', datetime.now().isoformat()))

                            total_connections += 2

                    except Exception as e:
                        logger.warning(f"⚠️  Failed to process connection {source_id} -> {target_id}: {str(e)}")
                        continue

            except Exception as e:
                logger.error(f"❌ Failed to process node {source_id}: {str(e)}")
                continue

            if (i + 1) % 10 == 0:
                self.conn.commit()
                logger.info(f"📊 Processed {i + 1}/{len(nodes)} nodes...")

        self.conn.commit()
        logger.info(f"🎉 Rebuilt {total_connections} connections")
        return total_connections

    def get_graph_summary(self) -> Dict:
        """Get a summary of the hyper-graph state"""
        return {
            'nodes': self.get_node_count(),
            'edges': self.get_edge_count(),
            'connection_stats': self.get_connection_strength_stats(),
            'last_updated': datetime.now().isoformat()
        }

    def find_execution_path(self, intent: str) -> Optional[str]:
        """
        Find the best node to execute an intent (geometric intent resolution)

        Args:
            intent: The intent to execute

        Returns:
            Best matching node ID or None
        """
        # This is a simplified version - in production we'd use proper intent embedding
        # For now, we'll search for nodes containing intent keywords
        keywords = intent.lower().split()
        best_match = None
        best_score = 0

        for keyword in keywords:
            if len(keyword) < 3:  # Skip short words
                continue

            matches = self.find_nodes_by_content(keyword, limit=5)

            for match in matches:
                # Simple scoring based on keyword matches
                content = self.get_node_by_id(match['id'])['content'].lower()
                score = content.count(keyword)

                if score > best_score:
                    best_score = score
                    best_match = match['id']

        return best_match

    def close(self):
        """Close database connection"""
        if self.conn:
            self.conn.close()
            logger.info("🔌 Database connection closed")

class GeometricOracle:
    """
    Geometric Oracle for Intent Interface
    Provides natural language interface to the hyper-graph
    """

    def __init__(self, weaver: HyperGraphWeaver):
        """
        Initialize the Geometric Oracle

        Args:
            weaver: HyperGraphWeaver instance
        """
        self.weaver = weaver
        logger.info("🔮 GeometricOracle initialized")

    def resolve_intent(self, intent: str) -> Dict:
        """
        Resolve an intent to a geometric location

        Args:
            intent: Natural language intent

        Returns:
            Resolution result with node ID and confidence
        """
        logger.info(f"🎯 Resolving intent: {intent}")

        # Find best matching node
        node_id = self.weaver.find_execution_path(intent)

        if node_id:
            node = self.weaver.get_node_by_id(node_id)
            return {
                'success': True,
                'node_id': node_id,
                'node_name': node['name'],
                'file_path': node['file_path'],
                'confidence': 0.85,  # Placeholder - would be calculated in production
                'method': 'semantic_search'
            }
        else:
            return {
                'success': False,
                'error': 'No matching node found',
                'confidence': 0.0
            }

    def get_related_concepts(self, concept: str, limit: int = 5) -> List[Dict]:
        """
        Get concepts related to a given concept

        Args:
            concept: The concept to find relations for
            limit: Maximum number of results

        Returns:
            List of related concepts
        """
        # Find nodes containing the concept
        nodes = self.weaver.find_nodes_by_content(concept, limit=limit)

        results = []
        for node in nodes:
            # Get connected nodes
            connections = self.weaver.get_connected_nodes(node['id'])

            for conn_id, strength in connections:
                connected_node = self.weaver.get_node_by_id(conn_id)
                if connected_node:
                    results.append({
                        'concept': connected_node['name'],
                        'related_to': node['name'],
                        'strength': strength,
                        'file_path': connected_node['file_path']
                    })

                    # Limit results
                    if len(results) >= limit:
                        return results

        return results

    def get_graph_health(self) -> Dict:
        """Get overall health metrics for the hyper-graph"""
        summary = self.weaver.get_graph_summary()

        # Calculate health metrics
        avg_strength = summary['connection_stats']['average_strength']
        node_count = summary['nodes']
        edge_count = summary['edges']

        # Simple health calculation
        connectivity_ratio = edge_count / max(1, node_count)
        health_score = min(1.0, (avg_strength * connectivity_ratio) * 0.5 + 0.5)

        return {
            'health_score': round(health_score, 3),
            'connectivity': round(connectivity_ratio, 3),
            'coherence': round(avg_strength, 3),
            'nodes': node_count,
            'connections': edge_count,
            'status': 'healthy' if health_score > 0.7 else 'degraded'
        }

def create_intent_vector(intent: str) -> np.array:
    """
    Create a vector embedding for an intent (simplified version)
    In production, this would use proper embedding models
    """
    # Simple hash-based vector for demo purposes
    hash_obj = hashlib.sha256(intent.encode())
    hash_hex = hash_obj.hexdigest()

    # Convert hex to numerical vector (32 dimensions)
    vector = []
    for i in range(0, len(hash_hex), 8):
        chunk = hash_hex[i:i+8]
        num = int(chunk, 16) / (16**8)  # Normalize to 0-1
        vector.append(num)

    # Pad to 32 dimensions
    while len(vector) < 32:
        vector.append(0.0)

    return np.array(vector)

def test_omni_geometry():
    """Test the OMNI-GEOMETRY toolset"""
    print("🧪 Testing OMNI-GEOMETRY Toolset")
    print("=" * 40)

    try:
        # Initialize weaver
        weaver = HyperGraphWeaver()
        print(f"✅ Weaver initialized")
        print(f"📊 Nodes: {weaver.get_node_count()}")
        print(f"🔗 Edges: {weaver.get_edge_count()}")

        # Test intent resolution
        oracle = GeometricOracle(weaver)

        # Test some intents
        test_intents = [
            "analyze security",
            "manage tokens",
            "process truth",
            "handle vectors"
        ]

        for intent in test_intents:
            result = oracle.resolve_intent(intent)
            if result['success']:
                print(f"🎯 {intent} -> {result['node_name']} (confidence: {result['confidence']})")
            else:
                print(f"❌ {intent} -> No match found")

        # Test graph health
        health = oracle.get_graph_health()
        print(f"\n💖 Graph Health: {health['status']} ({health['health_score']})")
        print(f"   Connectivity: {health['connectivity']}")
        print(f"   Coherence: {health['coherence']}")

        weaver.close()
        print("\n✅ OMNI-GEOMETRY toolset test complete!")

    except Exception as e:
        print(f"❌ Test failed: {str(e)}")
        raise

if __name__ == "__main__":
    test_omni_geometry()
