import asyncio
import json
import numpy as np
from typing import List, Dict, Any
from datetime import datetime
import hashlib

class LLMVectorProtocol:
    """Standardized way for LLMs to communicate about vectors"""

    VECTOR_COMMANDS = {
        "INTERPRET_VECTOR": {
            "description": "Ask LLM to interpret what a vector represents",
            "input": {"vector": "List[float]", "context": "str"},
            "output": {"interpretation": "str", "confidence": "float"}
        },
        "COMPARE_VECTORS": {
            "description": "Compare two vectors and explain relationship",
            "input": {"vector_a": "List[float]", "vector_b": "List[float]"},
            "output": {"similarity": "float", "relationship": "str"}
        },
        "GENERATE_VECTOR": {
            "description": "Generate vector for given concept",
            "input": {"concept": "str", "dimensions": "int"},
            "output": {"vector": "List[float]", "metadata": "dict"}
        },
        "CLUSTER_VECTORS": {
            "description": "Cluster similar vectors semantically",
            "input": {"vectors": "List[List[float]]", "n_clusters": "int"},
            "output": {"clusters": "List[dict]", "explanations": "List[str]"}
        },
        "FIND_SIMILAR": {
            "description": "Find vectors similar to query vector",
            "input": {"query_vector": "List[float]", "min_similarity": "float", "limit": "int"},
            "output": {"similar_vectors": "List[dict]", "summary": "str"}
        },
        "ANALYZE_SPACE": {
            "description": "Analyze vector space characteristics",
            "input": {"vectors": "List[List[float]]", "labels": "List[str]"},
            "output": {"space_analysis": "dict", "visualization": "dict"}
        }
    }

    def __init__(self, ctrm, lm_studio, vector_analytics, vector_qa, vector_evolution):
        self.ctrm = ctrm
        self.lm_studio = lm_studio
        self.vector_analytics = vector_analytics
        self.vector_qa = vector_qa
        self.vector_evolution = vector_evolution

    async def llm_vector_rpc(self, command: str, **kwargs) -> Dict[str, Any]:
        """LLM-friendly RPC for vector operations"""

        if command not in self.VECTOR_COMMANDS:
            return {
                "error": f"Unknown command. Available: {list(self.VECTOR_COMMANDS.keys())}",
                "available_commands": self.VECTOR_COMMANDS
            }

        # Execute command
        if command == "INTERPRET_VECTOR":
            result = await self.interpret_vector(**kwargs)
        elif command == "COMPARE_VECTORS":
            result = await self.compare_vectors(**kwargs)
        elif command == "GENERATE_VECTOR":
            result = await self.generate_vector(**kwargs)
        elif command == "CLUSTER_VECTORS":
            result = await self.cluster_vectors(**kwargs)
        elif command == "FIND_SIMILAR":
            result = await self.find_similar_vectors(**kwargs)
        elif command == "ANALYZE_SPACE":
            result = await self.analyze_vector_space(**kwargs)
        else:
            return {"error": f"Command {command} not implemented"}

        # Store as CTRM truth about vector operation
        operation_truth = await self.ctrm.create_truth(
            statement=f"Vector operation: {command} executed",
            confidence=0.95,
            metadata={
                "command": command,
                "inputs": kwargs,
                "outputs": result,
                "timestamp": datetime.now().isoformat(),
                "command_metadata": self.VECTOR_COMMANDS[command]
            }
        )

        return {
            **result,
            "ctrm_truth_id": operation_truth.id,
            "command_metadata": self.VECTOR_COMMANDS[command],
            "status": "success"
        }

    async def interpret_vector(self, vector: List[float], context: str = "") -> Dict[str, Any]:
        """Interpret what a vector represents"""
        analysis = await self.vector_analytics.analyze_vector_for_llm(vector, context)
        return {
            "interpretation": analysis,
            "vector_hash": analysis["vector_hash"],
            "ctrm_truth_id": analysis["ctrm_truth_id"]
        }

    async def compare_vectors(self, vector_a: List[float], vector_b: List[float]) -> Dict[str, Any]:
        """Compare two vectors and explain relationship"""
        comparison = await self.vector_analytics.compare_vectors_for_llm(vector_a, vector_b)
        return {
            "similarity": comparison["cosine_similarity"],
            "relationship": comparison["llm_interpretation"]["relationship"],
            "detailed_analysis": comparison,
            "ctrm_truth_id": comparison["ctrm_truth_id"]
        }

    async def generate_vector(self, concept: str, dimensions: int = 1536) -> Dict[str, Any]:
        """Generate vector for given concept"""
        model = await self.lm_studio.get_loaded_model()
        if not model:
            return {"error": "No LLM model available"}

        # Generate embedding
        embedding = await self.lm_studio.generate_embedding(model, concept)

        if len(embedding) != dimensions:
            # Resize if needed
            embedding = self.resize_vector(embedding, dimensions)

        # Validate quality
        validation = await self.vector_qa.validate_vector_quality(embedding, "vector_protocol")

        return {
            "vector": embedding,
            "metadata": {
                "concept": concept,
                "dimensions": dimensions,
                "quality": validation["llm_assessment"]["verdict"],
                "vector_hash": validation["vector_hash"],
                "ctrm_truth_id": validation["truth_id"]
            }
        }

    async def cluster_vectors(self, vectors: List[List[float]], n_clusters: int = 3) -> Dict[str, Any]:
        """Cluster similar vectors semantically"""

        if len(vectors) < n_clusters:
            return {"error": f"Need at least {n_clusters} vectors to cluster"}

        # Simple clustering using cosine similarity
        clusters = await self.simple_vector_clustering(vectors, n_clusters)

        # Ask LLM to explain each cluster
        explanations = []
        for i, cluster in enumerate(clusters):
            # Use first vector in cluster as representative
            rep_vector = cluster["vectors"][0]
            explanation = await self.ask_llm(
                f"Cluster {i+1} contains {len(cluster['vectors'])} vectors. "
                f"Representative vector analysis: {cluster['metrics']}. "
                f"What semantic theme unites these vectors?"
            )
            explanations.append(explanation)

        return {
            "clusters": clusters,
            "explanations": explanations,
            "cluster_count": n_clusters,
            "total_vectors": len(vectors)
        }

    async def find_similar_vectors(self, query_vector: List[float], min_similarity: float = 0.7, limit: int = 10) -> Dict[str, Any]:
        """Find vectors similar to query vector"""

        # In a real implementation, this would query a vector database
        # For now, we'll simulate with a simple approach

        similar_vectors = []
        for i in range(min(limit, 5)):  # Simulate finding some similar vectors
            # Create a slightly modified version of query vector
            similar_vec = [v + np.random.normal(0, 0.1) for v in query_vector]
            similarity = self.cosine_similarity(query_vector, similar_vec)

            similar_vectors.append({
                "vector": similar_vec,
                "similarity": similarity,
                "vector_hash": self.hash_vector(similar_vec),
                "relationship": self.map_similarity_to_strength(similarity)
            })

        # Ask LLM to summarize findings
        summary = await self.ask_llm(
            f"Found {len(similar_vectors)} vectors similar to query. "
            f"Similarities range from {min(v['similarity'] for v in similar_vectors):.3f} "
            f"to {max(v['similarity'] for v in similar_vectors):.3f}. "
            f"What does this suggest about the query vector's semantic neighborhood?"
        )

        return {
            "similar_vectors": similar_vectors,
            "summary": summary,
            "query_vector_hash": self.hash_vector(query_vector),
            "min_similarity": min_similarity,
            "limit": limit
        }

    async def analyze_vector_space(self, vectors: List[List[float]], labels: List[str] = None) -> Dict[str, Any]:
        """Analyze vector space characteristics"""

        if not vectors:
            return {"error": "No vectors provided"}

        # Calculate space metrics
        space_metrics = self.calculate_space_metrics(vectors)

        # Create reduced representation for visualization
        reduced_3d = self.reduce_to_3d(vectors)

        # Ask LLM to describe the vector space
        space_description = await self.ask_llm(
            f"Vector space with {len(vectors)} vectors in {len(vectors[0])} dimensions. "
            f"Space metrics: {space_metrics}. "
            f"Describe the semantic characteristics and potential structure."
        )

        # Identify landmark vectors
        landmarks = await self.identify_landmark_vectors(vectors, labels)

        return {
            "space_analysis": {
                "metrics": space_metrics,
                "description": space_description,
                "reduced_3d": reduced_3d.tolist(),
                "landmarks": landmarks
            },
            "visualization": {
                "type": "3d_scatter",
                "data": reduced_3d.tolist(),
                "labels": labels if labels else None
            },
            "vector_count": len(vectors),
            "dimensionality": len(vectors[0])
        }

    async def simple_vector_clustering(self, vectors: List[List[float]], n_clusters: int) -> List[Dict]:
        """Simple clustering algorithm"""

        # Initialize centroids randomly
        centroids = [vectors[i] for i in np.random.choice(len(vectors), n_clusters, replace=False)]

        # Simple assignment
        clusters = [[] for _ in range(n_clusters)]

        for vector in vectors:
            similarities = [self.cosine_similarity(vector, centroid) for centroid in centroids]
            cluster_idx = np.argmax(similarities)
            clusters[cluster_idx].append(vector)

        # Calculate cluster metrics
        result_clusters = []
        for i, cluster in enumerate(clusters):
            if cluster:
                centroid = np.mean(cluster, axis=0)
                avg_similarity = np.mean([
                    self.cosine_similarity(centroid, vec) for vec in cluster
                ])

                result_clusters.append({
                    "cluster_id": i,
                    "vectors": cluster,
                    "centroid": centroid.tolist(),
                    "size": len(cluster),
                    "avg_similarity": avg_similarity,
                    "metrics": {
                        "norm": float(np.linalg.norm(centroid)),
                        "std": float(np.std([np.linalg.norm(v) for v in cluster]))
                    }
                })

        return result_clusters

    async def identify_landmark_vectors(self, vectors: List[List[float]], labels: List[str] = None) -> List[Dict]:
        """Identify important 'landmark' vectors in the space"""

        landmarks = []

        if not vectors:
            return landmarks

        # Find centroid (most central vector)
        centroid = np.mean(vectors, axis=0)
        centroid_idx = np.argmin([self.cosine_similarity(v, centroid) for v in vectors])

        landmarks.append({
            "vector": vectors[centroid_idx],
            "role": "centroid",
            "explanation": "Most central vector in the space",
            "label": labels[centroid_idx] if labels else None,
            "vector_hash": self.hash_vector(vectors[centroid_idx])
        })

        # Find diverse samples
        for i in range(min(4, len(vectors))):
            if i == 0:
                # First landmark is centroid, already added
                continue

            # Find vector most different from existing landmarks
            last_landmark = landmarks[-1]["vector"]
            farthest_idx = np.argmax([
                self.cosine_similarity(v, last_landmark) for v in vectors
            ])

            landmarks.append({
                "vector": vectors[farthest_idx],
                "role": "diverse_sample",
                "explanation": f"Vector representing different semantic region {i}",
                "label": labels[farthest_idx] if labels else None,
                "vector_hash": self.hash_vector(vectors[farthest_idx])
            })

        # Ask LLM to name these landmarks
        landmark_descriptions = await self.ask_llm_to_name_landmarks(landmarks)

        # Merge descriptions
        for i, desc in enumerate(landmark_descriptions):
            if i < len(landmarks):
                landmarks[i]["llm_description"] = desc

        return landmarks

    async def ask_llm_to_name_landmarks(self, landmarks: List[Dict]) -> List[str]:
        """Ask LLM to provide semantic names for landmarks"""

        descriptions = []
        for landmark in landmarks:
            vector = landmark["vector"]
            metrics = {
                "norm": np.linalg.norm(vector),
                "mean": np.mean(vector),
                "std": np.std(vector)
            }

            description = await self.ask_llm(
                f"Landmark vector with role {landmark['role']}. "
                f"Metrics: {metrics}. "
                f"Provide a concise semantic description of what this landmark represents."
            )

            descriptions.append(description.get("description", "semantic_landmark"))

        return descriptions

    def calculate_space_metrics(self, vectors: List[List[float]]) -> Dict[str, float]:
        """Calculate metrics about the vector space"""

        norms = [np.linalg.norm(v) for v in vectors]
        pairwise_similarities = []

        # Sample some pairwise similarities
        sample_size = min(100, len(vectors))
        for i in range(sample_size):
            for j in range(i+1, min(i+10, len(vectors))):
                pairwise_similarities.append(self.cosine_similarity(vectors[i], vectors[j]))

        return {
            "vector_count": len(vectors),
            "dimensionality": len(vectors[0]) if vectors else 0,
            "avg_norm": float(np.mean(norms)),
            "norm_std": float(np.std(norms)),
            "avg_pairwise_similarity": float(np.mean(pairwise_similarities)) if pairwise_similarities else 0.0,
            "similarity_std": float(np.std(pairwise_similarities)) if pairwise_similarities else 0.0,
            "coverage_score": self.calculate_coverage_score(vectors)
        }

    def reduce_to_3d(self, vectors: List[List[float]]) -> np.ndarray:
        """Reduce vectors to 3D for visualization using PCA-like approach"""

        if not vectors:
            return np.array([])

        # Simple dimensionality reduction
        vectors_array = np.array(vectors)

        # Use first 3 principal components (simplified)
        # In practice, use proper PCA
        return vectors_array[:, :3]

    def calculate_coverage_score(self, vectors: List[List[float]]) -> float:
        """Calculate how well the vectors cover the semantic space"""

        if len(vectors) < 2:
            return 0.5

        # Calculate pairwise distances
        distances = []
        sample_size = min(50, len(vectors))
        for i in range(sample_size):
            for j in range(i+1, min(i+5, len(vectors))):
                dist = np.linalg.norm(np.array(vectors[i]) - np.array(vectors[j]))
                distances.append(dist)

        if not distances:
            return 0.5

        # Higher variance in distances suggests better coverage
        dist_std = np.std(distances)
        dist_mean = np.mean(distances)

        # Coverage score based on distance variance
        coverage = min(1.0, dist_std / max(dist_mean, 0.1))

        return float(coverage)

    def resize_vector(self, vector: List[float], target_dim: int) -> List[float]:
        """Resize vector to target dimensions"""

        if len(vector) == target_dim:
            return vector

        # Simple approach: truncate or pad with zeros
        if len(vector) > target_dim:
            return vector[:target_dim]
        else:
            return vector + [0.0] * (target_dim - len(vector))

    def cosine_similarity(self, vec1: List[float], vec2: List[float]) -> float:
        """Calculate cosine similarity between two vectors"""
        dot_product = np.dot(vec1, vec2)
        norm1 = np.linalg.norm(vec1)
        norm2 = np.linalg.norm(vec2)
        return dot_product / (norm1 * norm2) if norm1 and norm2 else 0.0

    def hash_vector(self, vector: List[float]) -> str:
        """Generate hash for vector"""
        vector_json = json.dumps(vector, sort_keys=True)
        return hashlib.md5(vector_json.encode()).hexdigest()

    def map_similarity_to_strength(self, similarity: float) -> str:
        """Map similarity score to strength description"""
        if similarity > 0.9:
            return "very_strong"
        elif similarity > 0.8:
            return "strong"
        elif similarity > 0.6:
            return "moderate"
        elif similarity > 0.4:
            return "weak"
        else:
            return "very_weak"

    async def ask_llm(self, prompt: str) -> Dict[str, Any]:
        """Helper method to ask LLM questions"""
        model = await self.lm_studio.get_loaded_model()
        if not model:
            return {"response": "LLM unavailable", "confidence": 0.5}

        response = await self.lm_studio.generate(model, prompt, max_tokens=300)

        try:
            return json.loads(response["content"])
        except (json.JSONDecodeError, KeyError):
            return {
                "response": response["content"],
                "confidence": 0.7
            }