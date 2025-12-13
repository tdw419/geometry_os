#!/usr/bin/env python3
"""
Vector File System (VFS) - Core Implementation
Semantic file organization system for CTRM-Powered LLM OS
"""

import asyncio
import json
import os
import hashlib
from typing import Dict, Any, List, Optional, Tuple
from datetime import datetime
import numpy as np

class VectorFileSystem:
    """
    Vector File System - Semantic file organization and retrieval

    Core Features:
    - Semantic indexing of files based on content vectors
    - Hybrid query system (path-based + semantic search)
    - Automatic knowledge linking between related files
    - Integration with CTRM truth management
    """

    def __init__(self, ctrm, vector_interface, db, lm_studio):
        """
        Initialize Vector File System

        Args:
            ctrm: CTRMTruthManager instance for truth management
            vector_interface: CTRMVectorInterface for vector operations
            db: CTRMDatabase instance for persistent storage
            lm_studio: LMStudioIntegration for embedding generation
        """
        self.ctrm = ctrm
        self.vector_interface = vector_interface
        self.db = db
        self.lm_studio = lm_studio

        # VFS configuration
        self.root = "vfs_root"
        self.vfs_metadata_table = "vfs_metadata"
        self.vfs_content_table = "vfs_content"
        self.vfs_index_table = "vfs_semantic_index"

        # Initialize VFS storage
        self._initialize_vfs_storage()

        # Semantic index cache
        self.semantic_index_cache = {}

        # Knowledge graph for file relationships
        self.knowledge_graph = {}

        print("🚀 Vector File System initialized")

    def _initialize_vfs_storage(self):
        """Initialize VFS database tables"""
        try:
            # Create VFS metadata table
            self.db.execute(f"""
                CREATE TABLE IF NOT EXISTS {self.vfs_metadata_table} (
                    file_id TEXT PRIMARY KEY,
                    path TEXT UNIQUE,
                    name TEXT,
                    type TEXT,
                    size INTEGER,
                    created_at TEXT,
                    updated_at TEXT,
                    vector_hash TEXT,
                    confidence REAL,
                    metadata TEXT
                )
            """)

            # Create VFS content table
            self.db.execute(f"""
                CREATE TABLE IF NOT EXISTS {self.vfs_content_table} (
                    file_id TEXT PRIMARY KEY,
                    content TEXT,
                    FOREIGN KEY (file_id) REFERENCES {self.vfs_metadata_table}(file_id)
                )
            """)

            # Create semantic index table
            self.db.execute(f"""
                CREATE TABLE IF NOT EXISTS {self.vfs_index_table} (
                    file_id TEXT,
                    concept TEXT,
                    vector TEXT,
                    similarity REAL,
                    PRIMARY KEY (file_id, concept),
                    FOREIGN KEY (file_id) REFERENCES {self.vfs_metadata_table}(file_id)
                )
            """)

            print("✅ VFS storage tables initialized")

        except Exception as e:
            print(f"❌ Error initializing VFS storage: {e}")
            raise

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

            # Query database for files under this path
            query = f"""
                SELECT * FROM {self.vfs_metadata_table}
                WHERE path LIKE ? OR path = ?
                LIMIT ?
            """
            files = self.db.execute(query, (f"{path}/%", path, limit)).fetchall()

            return [{
                "file_id": file[0],
                "path": file[1],
                "name": file[2],
                "type": file[3],
                "size": file[4],
                "created_at": file[5],
                "updated_at": file[6],
                "confidence": file[8]
            } for file in files]

        except Exception as e:
            print(f"❌ Error in path-based listing: {e}")
            return []

    async def _vfs_semantic_list(self, semantic_query: str, limit: int = 20) -> List[Dict[str, Any]]:
        """List files by semantic similarity"""
        try:
            # Generate query vector
            query_vector, query_hash = await self._generate_content_vector(semantic_query)

            # Find similar vectors using vector interface
            similar_results = await self.vector_interface.llm_find_similar_vectors(
                query_vector=query_vector,
                min_similarity=0.6,
                limit=limit
            )

            # Get file metadata for similar vectors
            results = []
            for vector_result in similar_results.get("similar_vectors", []):
                file_id = vector_result.get("metadata", {}).get("file_id")
                if file_id:
                    file_data = self._get_file_metadata(file_id)
                    if file_data:
                        file_data["similarity"] = vector_result["similarity"]
                        results.append(file_data)

            # Sort by similarity
            results.sort(key=lambda x: x["similarity"], reverse=True)

            return results

        except Exception as e:
            print(f"❌ Error in semantic listing: {e}")
            return []

    def _get_file_metadata(self, file_id: str) -> Optional[Dict[str, Any]]:
        """Get metadata for a specific file"""
        try:
            query = f"""
                SELECT * FROM {self.vfs_metadata_table}
                WHERE file_id = ?
            """
            result = self.db.execute(query, (file_id,)).fetchone()
            if result:
                return {
                    "file_id": result[0],
                    "path": result[1],
                    "name": result[2],
                    "type": result[3],
                    "size": result[4],
                    "created_at": result[5],
                    "updated_at": result[6],
                    "vector_hash": result[7],
                    "confidence": result[8],
                    "metadata": json.loads(result[9]) if result[9] else {}
                }
            return None
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

            # Get file by path
            query = f"""
                SELECT file_id FROM {self.vfs_metadata_table}
                WHERE path = ?
            """
            result = self.db.execute(query, (path,)).fetchone()
            if not result:
                return {"error": "File not found", "path": path}

            file_id = result[0]

            # Get content
            content_query = f"""
                SELECT content FROM {self.vfs_content_table}
                WHERE file_id = ?
            """
            content_result = self.db.execute(content_query, (file_id,)).fetchone()
            if not content_result:
                return {"error": "Content not found", "file_id": file_id}

            response = {
                "file_id": file_id,
                "path": path,
                "content": content_result[0],
                "metadata": self._get_file_metadata(file_id)
            }

            # Add semantic context if provided
            if semantic_context:
                response["semantic_context"] = await self._add_semantic_context(
                    content_result[0], semantic_context
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

            # Prepare file metadata
            file_metadata = {
                "file_id": file_id,
                "path": path,
                "name": os.path.basename(path),
                "type": "text",
                "size": len(content),
                "created_at": timestamp,
                "updated_at": timestamp,
                "confidence": 0.8,  # Default confidence
                "metadata": json.dumps(metadata or {})
            }

            # Store in database
            self.db.execute(f"""
                INSERT OR REPLACE INTO {self.vfs_metadata_table}
                (file_id, path, name, type, size, created_at, updated_at, confidence, metadata)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
            """, (
                file_id, path, file_metadata["name"], file_metadata["type"],
                file_metadata["size"], file_metadata["created_at"],
                file_metadata["updated_at"], file_metadata["confidence"],
                file_metadata["metadata"]
            ))

            # Store content
            self.db.execute(f"""
                INSERT OR REPLACE INTO {self.vfs_content_table}
                (file_id, content)
                VALUES (?, ?)
            """, (file_id, content))

            # Auto-index if enabled
            if auto_index:
                await self._index_file_content(file_id, content)

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
                "metadata": file_metadata
            }

        except Exception as e:
            print(f"❌ Error writing file: {e}")
            return {
                "success": False,
                "error": str(e),
                "path": path
            }

    async def _index_file_content(self, file_id: str, content: str):
        """
        Create semantic index for file content

        Args:
            file_id: File ID to index
            content: File content to analyze
        """
        try:
            # Generate content vector
            vector, vector_hash = await self._generate_content_vector(content)

            # Store vector in vector interface
            vector_result = await self.vector_interface.llm_store_vector(
                vector=vector,
                metadata={
                    "source": "vfs_file",
                    "file_id": file_id,
                    "content_type": "text",
                    "source_system": "vfs"
                }
            )

            # Extract semantic concepts
            concepts = await self._extract_semantic_concepts(content, vector)

            # Store in semantic index
            for concept in concepts:
                self.db.execute(f"""
                    INSERT OR REPLACE INTO {self.vfs_index_table}
                    (file_id, concept, vector, similarity)
                    VALUES (?, ?, ?, ?)
                """, (file_id, concept, json.dumps(vector), 1.0))

            # Update file metadata with vector hash
            self.db.execute(f"""
                UPDATE {self.vfs_metadata_table}
                SET vector_hash = ?, confidence = ?
                WHERE file_id = ?
            """, (vector_hash, 0.9, file_id))

            # Add to knowledge graph
            await self._add_to_knowledge_graph(file_id, vector, concepts)

            print(f"📝 Indexed file {file_id} with {len(concepts)} concepts")

        except Exception as e:
            print(f"❌ Error indexing file content: {e}")

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
            similar_results = await self.vector_interface.llm_find_similar_vectors(
                query_vector=vector,
                min_similarity=0.7,
                limit=5
            )

            # Create knowledge links
            relationships = []
            for similar_vector in similar_results.get("similar_vectors", []):
                similar_file_id = similar_vector.get("metadata", {}).get("file_id")
                if similar_file_id and similar_file_id != file_id:
                    similarity = similar_vector["similarity"]
                    relationships.append({
                        "target_file": similar_file_id,
                        "similarity": similarity,
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
            similar_results = await self.vector_interface.llm_find_similar_vectors(
                query_vector=query_vector,
                min_similarity=0.6,
                limit=limit
            )

            # Process results
            results = []
            for vector_result in similar_results.get("similar_vectors", []):
                file_id = vector_result.get("metadata", {}).get("file_id")
                if file_id:
                    file_data = self._get_file_metadata(file_id)
                    if file_data:
                        file_data["similarity"] = vector_result["similarity"]
                        file_data["relationship"] = vector_result.get("relationship", "semantic_match")
                        results.append(file_data)

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
            # Get all vectors from vector interface
            space_analysis = await self.vector_interface.llm_analyze_vector_space()

            # Get VFS-specific statistics
            total_files = len(self._vfs_path_list(self.root, 10000))
            indexed_files = len([f for f in self._vfs_path_list(self.root, 10000) if f.get("vector_hash")])

            # Create comprehensive analysis
            analysis = {
                "total_files": total_files,
                "indexed_files": indexed_files,
                "indexing_percentage": indexed_files / total_files if total_files > 0 else 0,
                "vector_space_analysis": space_analysis,
                "knowledge_graph_stats": self.vfs_get_knowledge_graph(),
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
            # Find unindexed files
            all_files = self._vfs_path_list(self.root, 10000)
            unindexed_files = [f for f in all_files if not f.get("vector_hash")]

            # Index unindexed files
            for file_data in unindexed_files:
                content_result = self.vfs_read(file_data["path"])
                if content_result.get("content"):
                    await self._index_file_content(file_data["file_id"], content_result["content"])

            print(f"📝 Optimized indexing: {len(unindexed_files)} files indexed")

        except Exception as e:
            print(f"❌ Error optimizing indexing: {e}")

    async def _optimize_semantic_coverage(self):
        """Optimize semantic space coverage"""
        try:
            # Re-analyze all vectors to improve space mapping
            await self.vector_interface.vector_mapper.create_vector_space_map()

            # Update all file vectors with improved embeddings
            all_files = self._vfs_path_list(self.root, 10000)
            for file_data in all_files:
                if file_data.get("vector_hash"):
                    content_result = self.vfs_read(file_data["path"])
                    if content_result.get("content"):
                        await self._index_file_content(file_data["file_id"], content_result["content"])

            print("🎯 Optimized semantic coverage")

        except Exception as e:
            print(f"❌ Error optimizing semantic coverage: {e}")

    async def _optimize_knowledge_linking(self):
        """Optimize knowledge graph linking"""
        try:
            # Rebuild knowledge graph with updated relationships
            all_files = self._vfs_path_list(self.root, 10000)

            for file_data in all_files:
                if file_data.get("vector_hash"):
                    content_result = self.vfs_read(file_data["path"])
                    if content_result.get("content"):
                        # Get the vector for this file
                        vector_result = await self.vector_interface.llm_find_similar_vectors(
                            query_vector=content_result["metadata"]["vector"],
                            min_similarity=0.0,
                            limit=1
                        )

                        if vector_result.get("similar_vectors"):
                            file_vector = vector_result["similar_vectors"][0]["vector"]
                            # Re-extract concepts and rebuild relationships
                            concepts = await self._extract_semantic_concepts(content_result["content"], file_vector)
                            await self._add_to_knowledge_graph(file_data["file_id"], file_vector, concepts)

            print("🧠 Optimized knowledge linking")

        except Exception as e:
            print(f"❌ Error optimizing knowledge linking: {e}")

    # Additional utility methods
    async def vfs_get_file_stats(self) -> Dict[str, Any]:
        """Get statistics about VFS usage"""
        try:
            total_files = len(self._vfs_path_list(self.root, 10000))
            indexed_files = len([f for f in self._vfs_path_list(self.root, 10000) if f.get("vector_hash")])

            return {
                "total_files": total_files,
                "indexed_files": indexed_files,
                "indexing_percentage": indexed_files / total_files if total_files > 0 else 0,
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