#!/usr/bin/env python3
"""
SimpleVectorStore - Pure vector-native storage for CTRM-Powered LLM OS
AI-native storage system that eliminates SQL dependencies
"""

import json
import os
import hashlib
import numpy as np
from typing import Dict, Any, List, Optional, Tuple
from datetime import datetime
import msgpack

class SimpleVectorStore:
    """
    Pure vector-native storage system
    Replaces SQL database with efficient vector storage
    """

    def __init__(self, memory_file: str = "vfs_memory"):
        """
        Initialize vector store

        Args:
            memory_file: Base filename for storage (without extension)
        """
        self.memory_file = memory_file
        self.vectors_file = f"{memory_file}.vectors.npy"
        self.payloads_file = f"{memory_file}.payloads.msgpack"
        self.index_file = f"{memory_file}.index.json"

        # In-memory data
        self.vectors = np.array([])  # N x D matrix
        self.payloads = []  # Parallel array of payloads
        self.index = {}  # Vector ID to index mapping

        # Load existing data
        self._load_data()

    def _load_data(self):
        """Load data from persistent storage"""
        try:
            # Load vectors
            if os.path.exists(self.vectors_file):
                self.vectors = np.load(self.vectors_file, allow_pickle=True)

            # Load payloads
            if os.path.exists(self.payloads_file):
                with open(self.payloads_file, 'rb') as f:
                    self.payloads = msgpack.unpack(f, raw=False)

            # Load index
            if os.path.exists(self.index_file):
                with open(self.index_file, 'r') as f:
                    self.index = json.load(f)

            print(f"📊 Loaded {len(self.vectors)} vectors from storage")

        except Exception as e:
            print(f"⚠️  Error loading data: {e}")
            # Initialize empty storage
            self.vectors = np.array([])
            self.payloads = []
            self.index = {}

    def _persist(self):
        """Save data to persistent storage"""
        try:
            # Ensure directory exists
            dirname = os.path.dirname(self.memory_file)
            if dirname:
                os.makedirs(dirname, exist_ok=True)

            # Save vectors as efficient binary
            if len(self.vectors) > 0:
                np.save(self.vectors_file, self.vectors)

            # Save payloads as msgpack for fast serialization
            with open(self.payloads_file, 'wb') as f:
                msgpack.pack(self.payloads, f)

            # Save index
            with open(self.index_file, 'w') as f:
                json.dump(self.index, f)

        except Exception as e:
            print(f"❌ Error persisting data: {e}")

    def _generate_id(self, vector: List[float], payload: Dict[str, Any]) -> str:
        """Generate deterministic ID for vector"""
        # Create hash of vector + payload
        combined = str(vector) + json.dumps(payload, sort_keys=True)
        return hashlib.sha256(combined.encode()).hexdigest()

    def add_point(self, vector: List[float], payload: Dict[str, Any]) -> str:
        """
        Add a vector with associated metadata

        Args:
            vector: Vector embedding
            payload: Associated metadata

        Returns:
            Generated point ID
        """
        try:
            # Generate ID
            point_id = self._generate_id(vector, payload)

            # Check if already exists
            if point_id in self.index:
                existing_idx = self.index[point_id]
                # Update existing payload
                self.payloads[existing_idx] = payload
                # Update vector if different
                if not np.array_equal(self.vectors[existing_idx], vector):
                    self.vectors[existing_idx] = np.array(vector)
                self._persist()
                return point_id

            # Add new point
            vector_np = np.array(vector, dtype=np.float32)

            # Handle first vector
            if len(self.vectors) == 0:
                self.vectors = np.array([vector_np])
            else:
                self.vectors = np.vstack([self.vectors, vector_np])

            self.payloads.append(payload)
            self.index[point_id] = len(self.payloads) - 1

            # Persist changes
            self._persist()

            return point_id

        except Exception as e:
            print(f"❌ Error adding point: {e}")
            raise

    def get_point(self, point_id: str) -> Optional[Dict[str, Any]]:
        """
        Get a point by ID

        Args:
            point_id: Point ID to retrieve

        Returns:
            Point data or None if not found
        """
        try:
            if point_id not in self.index:
                return None

            idx = self.index[point_id]
            return {
                "id": point_id,
                "vector": list(self.vectors[idx]),
                "payload": self.payloads[idx]
            }

        except Exception as e:
            print(f"❌ Error getting point: {e}")
            return None

    def semantic_search(self, query_vector: List[float], k: int = 10, filter_func=None) -> List[Tuple[float, Dict[str, Any]]]:
        """
        Find similar vectors using cosine similarity

        Args:
            query_vector: Query vector
            k: Maximum number of results
            filter_func: Optional filter function for payloads

        Returns:
            List of (similarity_score, point_data) tuples
        """
        try:
            if len(self.vectors) == 0:
                return []

            query_np = np.array(query_vector, dtype=np.float32)

            # Calculate cosine similarities
            similarities = []
            for i, vector in enumerate(self.vectors):
                # Apply filter if provided
                if filter_func and not filter_func(self.payloads[i]):
                    continue

                # Calculate cosine similarity
                dot_product = np.dot(query_np, vector)
                norm_query = np.linalg.norm(query_np)
                norm_vector = np.linalg.norm(vector)

                if norm_query == 0 or norm_vector == 0:
                    similarity = 0.0
                else:
                    similarity = dot_product / (norm_query * norm_vector)

                similarities.append((similarity, i))

            # Sort by similarity (descending)
            similarities.sort(reverse=True, key=lambda x: x[0])

            # Get top k results
            results = []
            for similarity, idx in similarities[:k]:
                point_id = list(self.index.keys())[idx]
                results.append((
                    similarity,
                    {
                        "id": point_id,
                        "vector": list(self.vectors[idx]),
                        "payload": self.payloads[idx]
                    }
                ))

            return results

        except Exception as e:
            print(f"❌ Error in semantic search: {e}")
            return []

    def update_point(self, point_id: str, vector: List[float] = None, payload: Dict[str, Any] = None):
        """
        Update an existing point

        Args:
            point_id: Point ID to update
            vector: New vector (optional)
            payload: New payload (optional)
        """
        try:
            if point_id not in self.index:
                raise ValueError(f"Point {point_id} not found")

            idx = self.index[point_id]

            # Update vector if provided
            if vector is not None:
                vector_np = np.array(vector, dtype=np.float32)
                self.vectors[idx] = vector_np

            # Update payload if provided
            if payload is not None:
                self.payloads[idx] = payload

            # Persist changes
            self._persist()

        except Exception as e:
            print(f"❌ Error updating point: {e}")
            raise

    def delete_point(self, point_id: str):
        """
        Delete a point from the store

        Args:
            point_id: Point ID to delete
        """
        try:
            if point_id not in self.index:
                return

            idx = self.index[point_id]

            # Remove from vectors and payloads
            self.vectors = np.delete(self.vectors, idx, axis=0)
            del self.payloads[idx]

            # Rebuild index
            new_index = {}
            for i, (pid, old_idx) in enumerate(self.index.items()):
                if old_idx < idx:
                    new_index[pid] = i
                elif old_idx > idx:
                    new_index[pid] = i - 1

            self.index = new_index

            # Persist changes
            self._persist()

        except Exception as e:
            print(f"❌ Error deleting point: {e}")
            raise

    def get_all_points(self) -> List[Dict[str, Any]]:
        """
        Get all points in the store

        Returns:
            List of all point data
        """
        try:
            return [
                {
                    "id": point_id,
                    "vector": list(self.vectors[i]),
                    "payload": self.payloads[i]
                }
                for point_id, i in self.index.items()
            ]

        except Exception as e:
            print(f"❌ Error getting all points: {e}")
            return []

    def get_stats(self) -> Dict[str, Any]:
        """
        Get statistics about the vector store

        Returns:
            Dictionary with storage statistics
        """
        try:
            return {
                "total_points": len(self.vectors),
                "vector_dimension": len(self.vectors[0]) if len(self.vectors) > 0 else 0,
                "storage_size": os.path.getsize(self.vectors_file) + os.path.getsize(self.payloads_file) if os.path.exists(self.vectors_file) else 0,
                "last_updated": datetime.now().isoformat()
            }

        except Exception as e:
            print(f"❌ Error getting stats: {e}")
            return {"error": str(e)}

    def clear(self):
        """Clear all data from the store"""
        try:
            self.vectors = np.array([])
            self.payloads = []
            self.index = {}

            # Remove files
            for file in [self.vectors_file, self.payloads_file, self.index_file]:
                if os.path.exists(file):
                    os.remove(file)

        except Exception as e:
            print(f"❌ Error clearing store: {e}")
            raise