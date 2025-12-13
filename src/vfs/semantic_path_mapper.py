#!/usr/bin/env python3
"""
Semantic Path Mapper - AI-native path resolution for Vector File System
Converts traditional paths to semantic clusters
"""

import os
import hashlib
import numpy as np
from typing import Dict, Any, List, Optional, Tuple
from datetime import datetime

class SemanticPathMapper:
    """
    Maps traditional paths to semantic clusters in Vector File System
    Enables AI-native navigation without rigid directory hierarchies
    """

    def __init__(self, vector_store, vector_interface):
        """
        Initialize Semantic Path Mapper

        Args:
            vector_store: SimpleVectorStore instance
            vector_interface: CTRMVectorInterface for vector operations
        """
        self.vector_store = vector_store
        self.vector_interface = vector_interface

        # Path cache: traditional path → semantic cluster ID
        self.path_cache = {}

        # Semantic cluster definitions
        self.cluster_definitions = {}

        print("🧭 Semantic Path Mapper initialized")

    def _generate_cluster_id(self, semantic_query: str) -> str:
        """Generate deterministic cluster ID from semantic query"""
        return hashlib.sha256(semantic_query.encode()).hexdigest()

    async def _infer_semantic(self, path_component: str) -> str:
        """
        Infer semantic meaning from path component

        Args:
            path_component: Path component (directory or filename)

        Returns:
            Semantic interpretation
        """
        try:
            # Generate embedding for the path component
            vector = await self.vector_interface.vector_analytics.generate_embedding(
                path_component, "path_component"
            )

            # Analyze the vector to extract semantic meaning
            analysis = await self.vector_interface.vector_analytics.analyze_vector_for_llm(
                vector, "path_analysis"
            )

            # Extract semantic concepts
            concepts = []
            if "primary_concepts" in analysis:
                concepts = [concept["concept"] for concept in analysis["primary_concepts"]]

            # Create semantic description
            semantic_desc = path_component
            if concepts:
                semantic_desc = f"{path_component} ({', '.join(concepts)})"

            return semantic_desc

        except Exception as e:
            print(f"⚠️  Error inferring semantic meaning: {e}")
            return path_component

    async def resolve_path(self, traditional_path: str) -> str:
        """
        Convert traditional path to semantic cluster ID

        Args:
            traditional_path: Traditional filesystem path (e.g., "/src/utils.py")

        Returns:
            Semantic cluster ID
        """
        try:
            # Check cache first
            if traditional_path in self.path_cache:
                return self.path_cache[traditional_path]

            # Normalize path
            if traditional_path.startswith("/"):
                traditional_path = traditional_path[1:]

            # Split path components
            components = traditional_path.split('/')
            semantic_context = []

            # Analyze each component semantically
            for component in components:
                if component and '.' not in component:  # Likely directory
                    semantic_component = await self._infer_semantic(component)
                    semantic_context.append(semantic_component)
                elif component:  # File with extension
                    # Extract filename without extension for semantic analysis
                    filename_without_ext = os.path.splitext(component)[0]
                    semantic_component = await self._infer_semantic(filename_without_ext)
                    semantic_context.append(semantic_component)

            # Create semantic query from context
            semantic_query = " ".join(semantic_context)

            # Check if this semantic cluster already exists
            cluster_id = self._generate_cluster_id(semantic_query)

            # Check if cluster exists in vector store
            existing_cluster = None
            all_points = self.vector_store.get_all_points()
            for point in all_points:
                payload = point["payload"]
                if (payload.get("type") == "semantic_cluster" and
                    payload.get("cluster_id") == cluster_id):
                    existing_cluster = point
                    break

            if not existing_cluster:
                # Create new semantic cluster
                cluster_vector = await self.vector_interface.vector_analytics.generate_embedding(
                    semantic_query, "cluster_definition"
                )

                cluster_payload = {
                    "type": "semantic_cluster",
                    "cluster_id": cluster_id,
                    "semantic_query": semantic_query,
                    "traditional_paths": [traditional_path],
                    "created_at": datetime.now().isoformat(),
                    "updated_at": datetime.now().isoformat()
                }

                self.vector_store.add_point(list(cluster_vector), cluster_payload)

                # Store cluster definition
                self.cluster_definitions[cluster_id] = {
                    "semantic_query": semantic_query,
                    "traditional_paths": [traditional_path],
                    "vector_hash": hashlib.sha256(str(cluster_vector).encode()).hexdigest()
                }

            # Cache the mapping
            self.path_cache[traditional_path] = cluster_id

            return cluster_id

        except Exception as e:
            print(f"❌ Error resolving path: {e}")
            # Fallback: use path hash as cluster ID
            fallback_id = hashlib.sha256(traditional_path.encode()).hexdigest()
            self.path_cache[traditional_path] = fallback_id
            return fallback_id

    async def get_semantic_cluster(self, cluster_id: str) -> Optional[Dict[str, Any]]:
        """
        Get information about a semantic cluster

        Args:
            cluster_id: Semantic cluster ID

        Returns:
            Cluster information or None if not found
        """
        try:
            # Check cluster definitions first
            if cluster_id in self.cluster_definitions:
                return self.cluster_definitions[cluster_id]

            # Search in vector store
            all_points = self.vector_store.get_all_points()
            for point in all_points:
                payload = point["payload"]
                if (payload.get("type") == "semantic_cluster" and
                    payload.get("cluster_id") == cluster_id):
                    return {
                        "semantic_query": payload.get("semantic_query", ""),
                        "traditional_paths": payload.get("traditional_paths", []),
                        "vector_hash": payload.get("vector_hash", ""),
                        "created_at": payload.get("created_at", ""),
                        "updated_at": payload.get("updated_at", "")
                    }

            return None

        except Exception as e:
            print(f"❌ Error getting semantic cluster: {e}")
            return None

    async def find_files_in_cluster(self, cluster_id: str) -> List[Dict[str, Any]]:
        """
        Find all files that belong to a semantic cluster

        Args:
            cluster_id: Semantic cluster ID

        Returns:
            List of file metadata
        """
        try:
            # Get cluster information
            cluster_info = await self.get_semantic_cluster(cluster_id)
            if not cluster_info:
                return []

            # Get cluster vector
            cluster_vector = None
            all_points = self.vector_store.get_all_points()
            for point in all_points:
                payload = point["payload"]
                if (payload.get("type") == "semantic_cluster" and
                    payload.get("cluster_id") == cluster_id):
                    cluster_vector = point["vector"]
                    break

            if not cluster_vector:
                return []

            # Find files that belong to this cluster
            cluster_files = []

            # Method 1: Find files with traditional paths in this cluster
            traditional_paths = cluster_info.get("traditional_paths", [])
            for path in traditional_paths:
                # Find file by path
                file_id = None
                for point in all_points:
                    payload = point["payload"]
                    if payload.get("path") == path and payload.get("type") == "file":
                        file_id = point["id"]
                        break

                if file_id:
                    point = self.vector_store.get_point(file_id)
                    if point:
                        payload = point["payload"]
                        cluster_files.append({
                            "file_id": file_id,
                            "path": path,
                            "name": payload.get("name", os.path.basename(path)),
                            "type": payload.get("type", "file"),
                            "size": payload.get("size", 0),
                            "semantic_coherence": 1.0,  # Direct match
                            "cluster_fit": "exact"
                        })

            # Method 2: Find semantically similar files
            similar_results = self.vector_store.semantic_search(
                query_vector=list(cluster_vector),
                k=20,
                filter_func=lambda p: p.get("type") == "file"
            )

            for similarity, point_data in similar_results:
                payload = point_data["payload"]
                file_id = point_data["id"]
                path = payload.get("path", "")

                # Check if this file is already in our results
                existing_file = next((f for f in cluster_files if f["file_id"] == file_id), None)
                if existing_file:
                    # Update with semantic similarity
                    existing_file["semantic_coherence"] = max(existing_file["semantic_coherence"], similarity)
                    existing_file["cluster_fit"] = "semantic"
                else:
                    cluster_files.append({
                        "file_id": file_id,
                        "path": path,
                        "name": payload.get("name", os.path.basename(path)),
                        "type": payload.get("type", "file"),
                        "size": payload.get("size", 0),
                        "semantic_coherence": similarity,
                        "cluster_fit": "semantic"
                    })

            # Sort by coherence (exact matches first, then semantic)
            cluster_files.sort(key=lambda x: (-x["semantic_coherence"], x["cluster_fit"] == "exact"))

            return cluster_files

        except Exception as e:
            print(f"❌ Error finding files in cluster: {e}")
            return []

    async def list_directory_semantic(self, path: str) -> List[Dict[str, Any]]:
        """
        List directory contents using semantic clustering

        Args:
            path: Directory path to list

        Returns:
            List of files/directories with semantic information
        """
        try:
            # Resolve the directory path to a semantic cluster
            cluster_id = await self.resolve_path(path)

            # Get files in this cluster
            files = await self.find_files_in_cluster(cluster_id)

            # Organize results
            result = []
            for file_info in files:
                result.append({
                    "name": file_info["name"],
                    "path": file_info["path"],
                    "type": file_info["type"],
                    "size": file_info["size"],
                    "semantic_coherence": file_info["semantic_coherence"],
                    "cluster_fit": file_info["cluster_fit"],
                    "file_id": file_info["file_id"]
                })

            return result

        except Exception as e:
            print(f"❌ Error listing directory semantically: {e}")
            return []

    async def create_semantic_alias(self, original_path: str, alias_path: str):
        """
        Create a semantic alias - multiple paths pointing to same semantic cluster

        Args:
            original_path: Original file path
            alias_path: Alternative path for the same content
        """
        try:
            # Resolve original path to cluster
            cluster_id = await self.resolve_path(original_path)

            # Get cluster information
            cluster_info = await self.get_semantic_cluster(cluster_id)
            if not cluster_info:
                return False

            # Add alias path to cluster
            traditional_paths = cluster_info.get("traditional_paths", [])
            if alias_path not in traditional_paths:
                traditional_paths.append(alias_path)

                # Update cluster in vector store
                all_points = self.vector_store.get_all_points()
                for point in all_points:
                    payload = point["payload"]
                    if (payload.get("type") == "semantic_cluster" and
                        payload.get("cluster_id") == cluster_id):
                        payload["traditional_paths"] = traditional_paths
                        payload["updated_at"] = datetime.now().isoformat()
                        self.vector_store.update_point(point["id"], None, payload)
                        break

                # Update cluster definition
                self.cluster_definitions[cluster_id]["traditional_paths"] = traditional_paths

                # Cache the alias path
                self.path_cache[alias_path] = cluster_id

            return True

        except Exception as e:
            print(f"❌ Error creating semantic alias: {e}")
            return False

    async def get_path_aliases(self, path: str) -> List[str]:
        """
        Get all alias paths for a given path

        Args:
            path: Original path

        Returns:
            List of alias paths
        """
        try:
            # Resolve path to cluster
            cluster_id = await self.resolve_path(path)

            # Get cluster information
            cluster_info = await self.get_semantic_cluster(cluster_id)
            if not cluster_info:
                return []

            traditional_paths = cluster_info.get("traditional_paths", [])
            return [p for p in traditional_paths if p != path]

        except Exception as e:
            print(f"❌ Error getting path aliases: {e}")
            return []

    def get_stats(self) -> Dict[str, Any]:
        """
        Get statistics about semantic path mapping

        Returns:
            Dictionary with mapping statistics
        """
        try:
            return {
                "cached_paths": len(self.path_cache),
                "semantic_clusters": len(self.cluster_definitions),
                "total_aliases": sum(len(info["traditional_paths"]) - 1
                                    for info in self.cluster_definitions.values()),
                "last_updated": datetime.now().isoformat()
            }

        except Exception as e:
            print(f"❌ Error getting stats: {e}")
            return {"error": str(e)}

    def clear_cache(self):
        """Clear the path cache"""
        try:
            self.path_cache = {}
            return True
        except Exception as e:
            print(f"❌ Error clearing cache: {e}")
            return False