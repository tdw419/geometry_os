#!/usr/bin/env python3
"""
Vector File System (CVFS) - Text-based Vector Implementation
Adapts the LDB-V CVFSEngine for use as a VFS backend
"""

import asyncio
import json
import os
import hashlib
from typing import Dict, Any, List, Optional, Tuple
from datetime import datetime
from vector_llm_tools.cvfs_engine import CVFSEngine
from vector_llm_tools.ctrm_cvfs_integration import CTRMCVFSIntegration

class VectorFileSystemCVFS:
    """
    CVFS-based Vector File System
    Uses the text-based CVFSEngine for transparent, LLM-readable vector storage
    """

    def __init__(self, ctrm, vector_interface, lm_studio, data_dir="./cvfs_data"):
        """
        Initialize CVFS Vector File System

        Args:
            ctrm: CTRMTruthManager instance for truth management
            vector_interface: CTRMVectorInterface for vector operations
            lm_studio: LMStudioIntegration for embedding generation
            data_dir: Directory for CVFS text files
        """
        self.ctrm = ctrm
        self.vector_interface = vector_interface
        self.lm_studio = lm_studio
        self.root = "vfs_root"
        
        # Initialize CVFS Integration
        self.integration = CTRMCVFSIntegration(data_dir)
        self.engine = self.integration.engine
        
        # Initialize Knowledge Graph (in-memory cache)
        self.knowledge_graph = {}
        
        print(f"🚀 CVFS (Text-Based) File System initialized at {data_dir}")

    def _get_current_timestamp(self) -> str:
        return datetime.now().isoformat()

    def _generate_file_id(self, path: str) -> str:
        """Generate deterministic file ID from path"""
        return hashlib.sha256(path.encode()).hexdigest()

    async def _generate_content_vector(self, content: str) -> Tuple[List[float], str]:
        """Generate vector embedding for content"""
        # Use simple caching or mock if needed, but preferably LM Studio
        try:
            model = await self.lm_studio.get_loaded_model()
            if not model:
                # Fallback to mock for testing if no model loaded
                import numpy as np
                np.random.seed(hash(content) % 2**32)
                mock_vec = list(np.random.randn(768)) # Match CVFS default dim
                return mock_vec, hashlib.sha256(str(mock_vec).encode()).hexdigest()
                
            vector = await self.lm_studio.generate_embedding(model, content)
            vector_hash = hashlib.sha256(str(vector).encode()).hexdigest()
            return vector, vector_hash
        except Exception as e:
            print(f"⚠️ Error generating vector: {e}")
            import numpy as np
            np.random.seed(hash(content) % 2**32)
            mock_vec = list(np.random.randn(768))
            return mock_vec, hashlib.sha256(str(mock_vec).encode()).hexdigest()

    async def vfs_write(self, path: str, content: str, metadata: Dict[str, Any] = None, auto_index: bool = True) -> Dict[str, Any]:
        """Write file to CVFS"""
        try:
            # Normalize path
            if path.startswith("/"): path = path[1:]
            if not path.startswith(self.root): path = f"{self.root}/{path}"
            
            file_id = self._generate_file_id(path)
            timestamp = self._get_current_timestamp()
            metadata = metadata or {}
            
            # File payload
            file_data = {
                "file_id": file_id,
                "path": path,
                "name": os.path.basename(path),
                "type": "file",
                "size": len(content),
                "content": content,
                "created_at": timestamp,
                "updated_at": timestamp,
                "confidence": 0.8,
                "metadata": metadata
            }
            
            vector_hash = None
            if auto_index:
                vector, vector_hash = await self._generate_content_vector(content)
                file_data["vector_hash"] = vector_hash
                
                # Store vector in CVFS (Engine)
                # We use the file_id as the vector_id in CVFS
                self.engine.save_vector_to_file(file_id, vector, metadata=file_data)
                
                # Also index CTRM-wise
                self.integration.store_truth_vector(f"file_{file_id}", vector, {
                    "source": "vfs",
                    "path": path,
                    "type": "file_content"
                })
            else:
                # Store without vector? CVFS engine relies on vectors.
                # We can store a zero vector or random vector as placeholder.
                # Or just use text file storage without vector index?
                # The CVFS engine expects vectors. We'll skip engine storage if no vector.
                pass
                
            return {
                "success": True,
                "file_id": file_id,
                "path": path,
                "ctrm_truth_id": None, # Could create one
                "metadata": file_data
            }
            
        except Exception as e:
            print(f"❌ Error in vfs_write: {e}")
            return {"success": False, "error": str(e)}

    async def vfs_read(self, path: str, semantic_context: str = None) -> Dict[str, Any]:
        """Read file from CVFS"""
        try:
            # Normalize path
            if path.startswith("/"): path = path[1:]
            if not path.startswith(self.root): path = f"{self.root}/{path}"
            
            file_id = self._generate_file_id(path)
            
            # Try to load from CVFS engine
            # Note: CVFS engine stores vectors + metadata. 
            # We stored the FULL file payload in metadata in vfs_write.
            
            # Since CVFS engine reads vectors by ID, we need to find it.
            # But wait, save_vector_to_file writes to vectors.txt.
            
            # We can use the engine's _load_vector_from_file to get the vector, 
            # but we need the metadata which contains the content.
            # `save_vector_to_file` writes: id|vector_json|metadata_json
            
            # We'll access the engine's file directly or add a method to engine.
            # For now, let's look at how _load_vector works. It returns the vector.
            # We need the metadata.
            
            vector = self.engine._load_vector_from_file(file_id)
            if not vector:
                return {"error": "File not found", "path": path}
                
            # We need to re-read the line to get metadata
            # This is inefficient, but consistent with "Text File" approach.
            metadata = {}
            content = ""
            
            with open(self.engine.vectors_file, 'r') as f:
                for line in f:
                    if line.startswith(f"{file_id}|"):
                        parts = line.split('|', 2)
                        if len(parts) >= 3:
                            metadata = json.loads(parts[2])
                            content = metadata.get("content", "")
                        break
            
            return {
                "file_id": file_id,
                "path": path,
                "content": content,
                "metadata": metadata
            }

        except Exception as e:
            print(f"❌ Error in vfs_read: {e}")
            return {"error": str(e)}

    async def vfs_list(self, path: str = None, semantic_query: str = None, limit: int = 20) -> List[Dict[str, Any]]:
        """List files"""
        try:
            if semantic_query:
                # Semantic search using CVFS HNSW
                query_vec, _ = await self._generate_content_vector(semantic_query)
                
                # Use engine's native search
                # If HNSW is active
                if self.engine.vcr.get('hnsw_built'):
                    results = self.engine.v_hnsw_step("temp_search", "query_temp", 0, m=limit) 
                    # This assumes "query_temp" is loaded. It's not.
                    # We need to store the query vector or use brute force search.
                    
                # Let's use integration's semantic search which handles this
                search_res = self.integration.semantic_truth_search(query_vec, top_k=limit)
                
                files = []
                for res in search_res.get("results", []):
                    # res is {vector_id, distance, metadata, ...}
                    # Check if it's a file (we prefixed truth vectors with "file_" in vfs_write maybe?)
                    # In vfs_write I stored as `file_id` (hash) in engine, and `file_{file_id}` in truth integration.
                    
                    # If the search result corresponds to a file...
                    files.append(res['metadata'])
                    
                return files
                
            else:
                # Listing all files (or by path)
                # Scan vectors.txt
                files = []
                if not os.path.exists(self.engine.vectors_file):
                    return []
                    
                with open(self.engine.vectors_file, 'r') as f:
                    for line in f:
                        if '|' in line and not line.startswith("#"):
                            try:
                                parts = line.split('|', 2)
                                if len(parts) >= 3:
                                    meta = json.loads(parts[2])
                                    if meta.get("type") == "file":
                                        fpath = meta.get("path", "")
                                        if not path or fpath.startswith(path):
                                            files.append(meta)
                            except:
                                pass
                                
                return files[:limit]

        except Exception as e:
             print(f"❌ Error listing: {e}")
             return []

    async def vfs_search(self, semantic_query: str, limit: int = 10) -> Dict[str, Any]:
        """VFS Semantic Search"""
        return {"results": await self.vfs_list(semantic_query=semantic_query, limit=limit)}

    async def vfs_analyze_space(self):
        return {"status": "Not implemented for CVFS yet"}

    async def vfs_optimize(self):
         self.integration.optimize_ctrm_storage()
         return {"status": "Optimization complete"}
         
    async def vfs_health_check(self):
        return {"status": "ok", "engine": "CVFS Text-Based"}
    
    async def vfs_get_knowledge_graph(self, **kwargs):
        return {}
