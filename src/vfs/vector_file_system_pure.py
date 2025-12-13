#!/usr/bin/env python3
"""
Vector File System (VFS) - Pure Vector Implementation
AI-native file system that eliminates SQL dependencies
"""

import asyncio
import json
import os
import hashlib
from typing import Dict, Any, List, Optional, Tuple
from datetime import datetime
import numpy as np

from vfs.simple_vector_store import SimpleVectorStore

class VectorFileSystemPure:
    """
    Pure Vector File System - AI-native semantic file organization
    Eliminates all SQL dependencies, using only vector storage

    Core Features:
    - Semantic indexing using SimpleVectorStore
    - Hybrid query system (path-based + semantic search)
    - Automatic knowledge linking between related files
    - Integration with CTRM truth management
    """

    def __init__(self, ctrm, vector_interface, lm_studio):
        """
        Initialize Pure Vector File System

        Args:
            ctrm: CTRMTruthManager instance for truth management
            vector_interface: CTRMVectorInterface for vector operations
            lm_studio: LMStudioIntegration for embedding generation
        """
        self.ctrm = ctrm
        self.vector_interface = vector_interface
        self.lm_studio = lm_studio

        # Initialize pure vector storage
        self.vector_store = SimpleVectorStore("vfs_pure_memory")

        # VFS configuration
        self.root = "vfs_root"

        # Knowledge graph for file relationships
        self.knowledge_graph = {}

        print("🚀 Pure Vector File System initialized")

    def _generate_file_id(self, path: str) -> str:
        """Generate deterministic file ID from path"""
        return hashlib.sha256(path.encode()).hexdigest()

    def _get_current_timestamp(self) -> str:
        """Get current timestamp in ISO format"""
        return datetime.now().isoformat()

    async def _generate_content_vector(self, content: str) -> Tuple[List[float], str]:
        """
        Generate vector embedding for file content

        Args:
            content: File content to embed

        Returns:
            Tuple of (vector, vector_hash)
        """
        try:
            # Get loaded model
            model = await self.lm_studio.get_loaded_model()
            if not model:
                raise Exception("No LLM model available for embedding")

            # Generate embedding
            vector = await self.lm_studio.generate_embedding(model, content)

            # Create vector hash
            vector_hash = hashlib.sha256(str(vector).encode()).hexdigest()

            return vector, vector_hash

        except Exception as e:
            print(f"❌ Error generating content vector: {e}")
            # Fallback: create mock vector
            np.random.seed(hash(content) % 1000)
            mock_vector = list(np.random.randn(1536))
            vector_hash = hashlib.sha256(str(mock_vector).encode()).hexdigest()
            return mock_vector, vector_hash

    async def _extract_semantic_concepts(self, content: str, vector: List[float]) -> List[str]:
        """
        Extract semantic concepts from content using vector analysis

        Args:
            content: File content
            vector: Content vector

        Returns:
            List of semantic concepts
        """
        try:
            # Use vector analytics to identify primary concepts
            analysis = await self.vector_interface.vector_analytics.analyze_vector_for_llm(
                vector, "default"
            )

            concepts = []
            if "primary_concepts" in analysis:
                concepts = [concept["concept"] for concept in analysis["primary_concepts"]]

            # Add basic content-based concepts
            content_lower = content.lower()
            if "class " in content_lower:
                concepts.append("python_class")
            if "def " in content_lower:
                concepts.append("python_function")
            if "import " in content_lower:
                concepts.append("python_module")

            return list(set(concepts))  # Remove duplicates

        except Exception as e:
            print(f"❌ Error extracting semantic concepts: {e}")
            return ["general_content"]

    async def vfs_list(self, path: str = None, semantic_query: str = None, limit: int = 20) -> List[Dict[str, Any]]:
        """
        List files in VFS with optional semantic filtering

        Args:
            path: Traditional path-based listing (optional)
            semantic_query: Semantic query for filtering (optional)
            limit: Maximum number of results

        Returns:
            List of file metadata
        """
        try:
            if semantic_query:
                # Semantic search mode
                return await self._vfs_semantic_list(semantic_query, limit)
            elif path:
                # Path-based listing
                return self._vfs_path_list(path, limit)
            else:
                # List root directory
                return self._vfs_path_list(self.root, limit)

        except Exception as e:
            print(f"❌ Error listing files: {e}")
            return []

    def _vfs_path_list(self, path: str, limit: int = 20) -> List[Dict[str, Any]]:
        """List files by traditional path"""
        try:
            # Normalize path
            if path.startswith("/"):
                path = path[1:]
            if not path.startswith(self.root):
                path = f"{self.root}/{path}" if path else self.root

            # Get all points from vector store
            all_points = self.vector_store.get_all_points()

            # Filter by path
            files = []
            for point in all_points:
                payload = point["payload"]
                if payload.get("type") == "file":
                    file_path = payload.get("path", "")
                    # Check if path matches or is under the requested path
                    if (file_path == path or
                        file_path.startswith(f"{path}/") or
                        file_path.startswith(f"{self.root}/{path}/")):
                        files.append({
                            "file_id": point["id"],
                            "path": file_path,
                            "name": payload.get("name", os.path.basename(file_path)),
                            "type": payload.get("type", "file"),
                            "size": payload.get("size", 0),
                            "created_at": payload.get("created_at", ""),
                            "updated_at": payload.get("updated_at", ""),
                            "confidence": payload.get("confidence", 0.8)
                        })

                        if len(files) >= limit:
                            break

            return files

        except Exception as e:
            print(f"❌ Error in path-based listing: {e}")
            return []

    async def _vfs_semantic_list(self, semantic_query: str, limit: int = 20) -> List[Dict[str, Any]]:
        """List files by semantic similarity"""
        try:
            # Generate query vector
            query_vector, query_hash = await self._generate_content_vector(semantic_query)

            # Find similar vectors using vector store
            similar_results = self.vector_store.semantic_search(
                query_vector=query_vector,
                k=limit,
                filter_func=lambda p: p.get("type") == "file"
            )

            # Process results
            results = []
            for similarity, point_data in similar_results:
                payload = point_data["payload"]
                results.append({
                    "file_id": point_data["id"],
                    "path": payload.get("path", ""),
                    "name": payload.get("name", ""),
                    "type": payload.get("type", "file"),
                    "size": payload.get("size", 0),
                    "created_at": payload.get("created_at", ""),
                    "updated_at": payload.get("updated_at", ""),
                    "confidence": payload.get("confidence", 0.8),
                    "similarity": similarity
                })

            # Sort by similarity
            results.sort(key=lambda x: x["similarity"], reverse=True)

            return results

        except Exception as e:
            print(f"❌ Error in semantic listing: {e}")
            return []

    def _get_file_metadata(self, file_id: str) -> Optional[Dict[str, Any]]:
        """Get metadata for a specific file"""
        try:
            point = self.vector_store.get_point(file_id)
            if not point:
                return None

            payload = point["payload"]
            return {
                "file_id": file_id,
                "path": payload.get("path", ""),
                "name": payload.get("name", ""),
                "type": payload.get("type", "file"),
                "size": payload.get("size", 0),
                "created_at": payload.get("created_at", ""),
                "updated_at": payload.get("updated_at", ""),
                "vector_hash": payload.get("vector_hash", ""),
                "confidence": payload.get("confidence", 0.8),
                "metadata": payload.get("metadata", {})
            }

        except Exception as e:
            print(f"❌ Error getting file metadata: {e}")
            return None

    async def vfs_read(self, path: str, semantic_context: str = None) -> Dict[str, Any]:
        """
        Read file content with optional semantic context

        Args:
            path: File path to read
            semantic_context: Optional context for enhanced understanding

        Returns:
            Dictionary with file content and metadata
        """
        try:
            # Normalize path
            if path.startswith("/"):
                path = path[1:]
            if not path.startswith(self.root):
                path = f"{self.root}/{path}"

            # Find file by path
            file_id = None
            all_points = self.vector_store.get_all_points()
            for point in all_points:
                payload = point["payload"]
                if payload.get("path") == path and payload.get("type") == "file":
                    file_id = point["id"]
                    break

            if not file_id:
                return {"error": "File not found", "path": path}

            # Get content from payload
            point = self.vector_store.get_point(file_id)
            if not point:
                return {"error": "Content not found", "file_id": file_id}

            payload = point["payload"]
            content = payload.get("content", "")

            response = {
                "file_id": file_id,
                "path": path,
                "content": content,
                "metadata": self._get_file_metadata(file_id)
            }

            # Add semantic context if provided
            if semantic_context:
                response["semantic_context"] = await self._add_semantic_context(
                    content, semantic_context
                )

            return response

        except Exception as e:
            print(f"❌ Error reading file: {e}")
            return {"error": str(e), "path": path}

    async def _add_semantic_context(self, content: str, context: str) -> Dict[str, Any]:
        """Add semantic context to file content"""
        try:
            # Generate vectors for content and context
            content_vector, _ = await self._generate_content_vector(content)
            context_vector, _ = await self._generate_content_vector(context)

            # Calculate similarity
            similarity = self.vector_interface.vector_analytics.cosine_similarity(
                content_vector, context_vector
            )

            # Analyze relationship
            relationship = await self.vector_interface.vector_protocol.compare_vectors(
                content_vector, context_vector
            )

            return {
                "similarity": similarity,
                "relationship": relationship.get("relationship", "unknown"),
                "relevance": self.vector_interface.vector_analytics.map_similarity_to_strength(similarity)
            }

        except Exception as e:
            print(f"❌ Error adding semantic context: {e}")
            return {"error": str(e)}

    async def vfs_write(self, path: str, content: str, metadata: Dict[str, Any] = None, auto_index: bool = True) -> Dict[str, Any]:
        """
        Write file with automatic vector indexing

        Args:
            path: File path to write
            content: File content
            metadata: Additional metadata
            auto_index: Whether to create vector embeddings and semantic index

        Returns:
            Dictionary with write result and file metadata
        """
        try:
            # Normalize path
            if path.startswith("/"):
                path = path[1:]
            if not path.startswith(self.root):
                path = f"{self.root}/{path}"

            file_id = self._generate_file_id(path)
            timestamp = self._get_current_timestamp()

            # Prepare file payload
            file_payload = {
                "file_id": file_id,
                "path": path,
                "name": os.path.basename(path),
                "type": "file",
                "size": len(content),
                "content": content,
                "created_at": timestamp,
                "updated_at": timestamp,
                "confidence": 0.8,  # Default confidence
                "metadata": metadata or {}
            }

            # Generate content vector if auto_index enabled
            if auto_index:
                vector, vector_hash = await self._generate_content_vector(content)
                file_payload["vector_hash"] = vector_hash

                # Add vector to store
                self.vector_store.add_point(vector, file_payload)

                # Extract semantic concepts and add to knowledge graph
                concepts = await self._extract_semantic_concepts(content, vector)
                await self._add_to_knowledge_graph(file_id, vector, concepts)

            else:
                # Add to store without vector
                # Use a placeholder vector for storage consistency
                placeholder_vector = list(np.zeros(1536))
                self.vector_store.add_point(placeholder_vector, file_payload)

            # Create CTRM truth about this write operation
            write_truth = await self.ctrm.create_truth(
                statement=f"VFS write operation: {path}",
                context=json.dumps({
                    "file_id": file_id,
                    "path": path,
                    "content_length": len(content),
                    "auto_indexed": auto_index,
                    "timestamp": timestamp
                }),
                confidence=0.9
            )

            return {
                "success": True,
                "file_id": file_id,
                "path": path,
                "content_length": len(content),
                "auto_indexed": auto_index,
                "ctrm_truth_id": write_truth.id,
                "metadata": file_payload
            }

        except Exception as e:
            print(f"❌ Error writing file: {e}")
            return {
                "success": False,
                "error": str(e),
                "path": path
            }

    async def _add_to_knowledge_graph(self, file_id: str, vector: List[float], concepts: List[str]):
        """
        Add file to knowledge graph with semantic relationships

        Args:
            file_id: File ID to add
            vector: File content vector
            concepts: Semantic concepts
        """
        try:
            # Find similar files to create relationships
            similar_results = self.vector_store.semantic_search(
                query_vector=vector,
                k=5,
                filter_func=lambda p: p.get("type") == "file" and p.get("file_id") != file_id
            )

            # Create knowledge links
            relationships = []
            for similarity, point_data in similar_results:
                similar_file_id = point_data["payload"].get("file_id")
                if similar_file_id and similar_file_id != file_id:
                    relationships.append({
                        "target_file": similar_file_id,
                        "similarity": float(similarity),
                        "relationship_type": "semantic_similarity"
                    })

            # Store relationships
            self.knowledge_graph[file_id] = {
                "concepts": concepts,
                "relationships": relationships,
                "vector_hash": hashlib.sha256(str(vector).encode()).hexdigest()
            }

            # Create CTRM truth about knowledge relationships
            await self.ctrm.create_truth(
                statement=f"VFS knowledge relationships for {file_id}",
                context=json.dumps({
                    "file_id": file_id,
                    "concepts": concepts,
                    "relationships": relationships,
                    "timestamp": self._get_current_timestamp()
                }),
                confidence=0.85
            )

        except Exception as e:
            print(f"❌ Error adding to knowledge graph: {e}")

    async def vfs_search(self, semantic_query: str, limit: int = 10) -> Dict[str, Any]:
        """
        Semantic search across entire VFS

        Args:
            semantic_query: Query to search for
            limit: Maximum number of results

        Returns:
            Dictionary with search results and metadata
        """
        try:
            # Generate query vector
            query_vector, query_hash = await self._generate_content_vector(semantic_query)

            # Find similar vectors
            similar_results = self.vector_store.semantic_search(
                query_vector=query_vector,
                k=limit,
                filter_func=lambda p: p.get("type") == "file"
            )

            # Process results
            results = []
            for similarity, point_data in similar_results:
                payload = point_data["payload"]
                file_metadata = {
                    "file_id": point_data["id"],
                    "path": payload.get("path", ""),
                    "name": payload.get("name", ""),
                    "type": payload.get("type", "file"),
                    "size": payload.get("size", 0),
                    "created_at": payload.get("created_at", ""),
                    "updated_at": payload.get("updated_at", ""),
                    "confidence": payload.get("confidence", 0.8),
                    "similarity": float(similarity),
                    "relationship": "semantic_match"
                }
                results.append(file_metadata)

            # Sort by similarity
            results.sort(key=lambda x: x["similarity"], reverse=True)

            # Create CTRM truth about this search
            search_truth = await self.ctrm.create_truth(
                statement=f"VFS semantic search: {semantic_query[:50]}...",
                context=json.dumps({
                    "query": semantic_query,
                    "query_hash": query_hash,
                    "results_found": len(results),
                    "timestamp": self._get_current_timestamp()
                }),
                confidence=0.9
            )

            return {
                "success": True,
                "query": semantic_query,
                "results": results,
                "ctrm_truth_id": search_truth.id,
                "statistics": {
                    "total_results": len(results),
                    "high_confidence": len([r for r in results if r["similarity"] > 0.8]),
                    "medium_confidence": len([r for r in results if 0.6 <= r["similarity"] <= 0.8])
                }
            }

        except Exception as e:
            print(f"❌ Error in VFS search: {e}")
            return {
                "success": False,
                "error": str(e),
                "query": semantic_query
            }

    async def vfs_get_knowledge_graph(self, file_id: str = None) -> Dict[str, Any]:
        """
        Get knowledge graph relationships for a file

        Args:
            file_id: Specific file ID (optional)

        Returns:
            Knowledge graph data
        """
        try:
            if file_id:
                # Get specific file's knowledge graph
                if file_id in self.knowledge_graph:
                    return {
                        "file_id": file_id,
                        "knowledge_graph": self.knowledge_graph[file_id]
                    }
                else:
                    return {"error": "File not found in knowledge graph", "file_id": file_id}
            else:
                # Get summary of entire knowledge graph
                return {
                    "total_files": len(self.knowledge_graph),
                    "total_relationships": sum(len(data["relationships"]) for data in self.knowledge_graph.values()),
                    "concept_distribution": self._analyze_concept_distribution()
                }

        except Exception as e:
            print(f"❌ Error getting knowledge graph: {e}")
            return {"error": str(e)}

    def _analyze_concept_distribution(self) -> Dict[str, int]:
        """Analyze distribution of concepts in knowledge graph"""
        concept_counts = {}
        for file_data in self.knowledge_graph.values():
            for concept in file_data["concepts"]:
                concept_counts[concept] = concept_counts.get(concept, 0) + 1
        return concept_counts

    async def vfs_analyze_space(self) -> Dict[str, Any]:
        """
        Analyze the semantic space of the VFS

        Returns:
            Analysis of VFS semantic organization
        """
        try:
            # Get vector space analysis from vector interface
            space_analysis = await self.vector_interface.llm_analyze_vector_space()

            # Get VFS-specific statistics
            all_points = self.vector_store.get_all_points()
            total_files = len([p for p in all_points if p["payload"].get("type") == "file"])
            indexed_files = len([p for p in all_points if p["payload"].get("type") == "file" and p["payload"].get("vector_hash")])

            # Create comprehensive analysis
            analysis = {
                "total_files": total_files,
                "indexed_files": indexed_files,
                "indexing_percentage": indexed_files / total_files if total_files > 0 else 0,
                "vector_space_analysis": space_analysis,
                "knowledge_graph_stats": await self.vfs_get_knowledge_graph(),
                "concept_distribution": self._analyze_concept_distribution(),
                "timestamp": self._get_current_timestamp()
            }

            # Create CTRM truth about space analysis
            analysis_truth = await self.ctrm.create_truth(
                statement=f"VFS space analysis: {total_files} files, {indexed_files} indexed",
                context=json.dumps(analysis),
                confidence=0.95
            )

            return {
                "analysis": analysis,
                "ctrm_truth_id": analysis_truth.id,
                "recommendations": self._generate_space_recommendations(analysis)
            }

        except Exception as e:
            print(f"❌ Error analyzing VFS space: {e}")
            return {"error": str(e)}

    def _generate_space_recommendations(self, analysis: Dict[str, Any]) -> List[str]:
        """Generate recommendations based on space analysis"""
        recommendations = []

        # Indexing recommendations
        if analysis["indexing_percentage"] < 0.8:
            recommendations.append("increase_indexing_coverage")

        # Space organization recommendations
        if analysis["vector_space_analysis"]["space_analysis"]["coverage_score"] < 0.5:
            recommendations.append("improve_semantic_coverage")

        # Knowledge graph recommendations
        graph_stats = analysis["knowledge_graph_stats"]
        if graph_stats["total_relationships"] < graph_stats["total_files"] * 0.5:
            recommendations.append("enhance_knowledge_linking")

        return recommendations

    async def vfs_optimize(self) -> Dict[str, Any]:
        """
        Optimize VFS performance and organization

        Returns:
            Optimization results and improvements
        """
        try:
            # Analyze current state
            analysis = await self.vfs_analyze_space()

            # Apply optimizations based on recommendations
            optimizations_applied = []

            for recommendation in analysis["recommendations"]:
                if recommendation == "increase_indexing_coverage":
                    await self._optimize_indexing_coverage()
                    optimizations_applied.append("indexing_coverage")
                elif recommendation == "improve_semantic_coverage":
                    await self._optimize_semantic_coverage()
                    optimizations_applied.append("semantic_coverage")
                elif recommendation == "enhance_knowledge_linking":
                    await self._optimize_knowledge_linking()
                    optimizations_applied.append("knowledge_linking")

            # Create optimization report
            report = {
                "analysis": analysis,
                "optimizations_applied": optimizations_applied,
                "timestamp": self._get_current_timestamp()
            }

            # Create CTRM truth about optimization
            optimization_truth = await self.ctrm.create_truth(
                statement=f"VFS optimization completed: {len(optimizations_applied)} improvements applied",
                context=json.dumps(report),
                confidence=0.9
            )

            return {
                "success": True,
                "report": report,
                "ctrm_truth_id": optimization_truth.id
            }

        except Exception as e:
            print(f"❌ Error optimizing VFS: {e}")
            return {"success": False, "error": str(e)}

    async def _optimize_indexing_coverage(self):
        """Optimize file indexing coverage"""
        try:
            # Get all files
            all_points = self.vector_store.get_all_points()
            files = [p for p in all_points if p["payload"].get("type") == "file"]

            # Find unindexed files (those without vector_hash)
            unindexed_files = [p for p in files if not p["payload"].get("vector_hash")]

            # Index unindexed files
            for point in unindexed_files:
                file_id = point["id"]
                payload = point["payload"]
                content = payload.get("content", "")

                if content:
                    # Generate vector and update
                    vector, vector_hash = await self._generate_content_vector(content)
                    payload["vector_hash"] = vector_hash

                    # Update vector in store
                    self.vector_store.update_point(file_id, vector, payload)

                    # Update knowledge graph
                    concepts = await self._extract_semantic_concepts(content, vector)
                    await self._add_to_knowledge_graph(file_id, vector, concepts)

            print(f"📝 Optimized indexing: {len(unindexed_files)} files indexed")

        except Exception as e:
            print(f"❌ Error optimizing indexing: {e}")

    async def _optimize_semantic_coverage(self):
        """Optimize semantic space coverage"""
        try:
            # Re-analyze all vectors to improve space mapping
            await self.vector_interface.vector_mapper.create_vector_space_map()

            # Update all file vectors with improved embeddings
            all_points = self.vector_store.get_all_points()
            files = [p for p in all_points if p["payload"].get("type") == "file"]

            for point in files:
                if point["payload"].get("vector_hash"):
                    file_id = point["id"]
                    payload = point["payload"]
                    content = payload.get("content", "")

                    if content:
                        # Regenerate vector and update
                        vector, vector_hash = await self._generate_content_vector(content)
                        payload["vector_hash"] = vector_hash

                        # Update vector in store
                        self.vector_store.update_point(file_id, vector, payload)

                        # Update knowledge graph
                        concepts = await self._extract_semantic_concepts(content, vector)
                        await self._add_to_knowledge_graph(file_id, vector, concepts)

            print("🎯 Optimized semantic coverage")

        except Exception as e:
            print(f"❌ Error optimizing semantic coverage: {e}")

    async def _optimize_knowledge_linking(self):
        """Optimize knowledge graph linking"""
        try:
            # Rebuild knowledge graph with updated relationships
            all_points = self.vector_store.get_all_points()
            files = [p for p in all_points if p["payload"].get("type") == "file"]

            for point in files:
                if point["payload"].get("vector_hash"):
                    file_id = point["id"]
                    payload = point["payload"]
                    content = payload.get("content", "")

                    if content:
                        # Get the vector for this file
                        vector = point["vector"]

                        # Re-extract concepts and rebuild relationships
                        concepts = await self._extract_semantic_concepts(content, vector)
                        await self._add_to_knowledge_graph(file_id, vector, concepts)

            print("🧠 Optimized knowledge linking")

        except Exception as e:
            print(f"❌ Error optimizing knowledge linking: {e}")

    # Additional utility methods
    async def vfs_get_file_stats(self) -> Dict[str, Any]:
        """Get statistics about VFS usage"""
        try:
            all_points = self.vector_store.get_all_points()
            files = [p for p in all_points if p["payload"].get("type") == "file"]
            indexed_files = [p for p in files if p["payload"].get("vector_hash")]

            return {
                "total_files": len(files),
                "indexed_files": len(indexed_files),
                "indexing_percentage": len(indexed_files) / len(files) if len(files) > 0 else 0,
                "knowledge_graph_size": len(self.knowledge_graph),
                "last_optimized": self._get_current_timestamp()
            }
        except Exception as e:
            print(f"❌ Error getting file stats: {e}")
            return {"error": str(e)}

    async def vfs_health_check(self) -> Dict[str, Any]:
        """Perform health check on VFS"""
        try:
            stats = await self.vfs_get_file_stats()
            space_analysis = await self.vfs_analyze_space()

            if "error" in space_analysis:
                return {"status": "error", "error": f"Space analysis failed: {space_analysis['error']}"}

            health_status = "healthy"
            if stats["indexing_percentage"] < 0.5:
                health_status = "warning"
            if stats["indexing_percentage"] < 0.3:
                health_status = "critical"

            return {
                "status": health_status,
                "stats": stats,
                "space_analysis": space_analysis,
                "recommendations": self._generate_space_recommendations(space_analysis["analysis"])
            }
        except Exception as e:
            print(f"❌ Error in health check: {e}")
            return {"status": "error", "error": str(e)}