import asyncio
import json
import numpy as np
from typing import List, Dict, Any
from datetime import datetime
import hashlib

class VectorEvolutionTracker:
    """Track how vectors evolve, optimized for LLM analysis"""

    def __init__(self, ctrm, lm_studio, db):
        self.ctrm = ctrm
        self.lm_studio = lm_studio
        self.db = db

    async def track_vector_lineage(self, vector: List[float], parent_vector: List[float] = None) -> str:
        """Track vector evolution with LLM-friendly metadata"""

        vector_hash = self.hash_vector(vector)

        if parent_vector:
            # Calculate evolution metrics
            evolution = {
                "cosine_similarity": float(self.cosine_similarity(vector, parent_vector)),
                "euclidean_distance": float(np.linalg.norm(np.array(vector) - np.array(parent_vector))),
                "dimension_changes": await self.analyze_dimension_changes(vector, parent_vector)
            }

            # Ask LLM to interpret the evolution
            evolution_interpretation = await self.ask_llm(
                f"Vector evolved with metrics: {evolution}. "
                f"What kind of semantic shift does this represent? "
                f"E.g., refinement, generalization, topic shift, etc. "
                f"Respond with JSON: {{'shift_type': '...', 'confidence': 0.0-1.0, "
                f"'description': '...', 'semantic_impact': '...'}}"
            )

            # Store as CTRM truth
            evolution_truth = await self.ctrm.create_truth(
                statement=f"Vector evolution: {evolution_interpretation['shift_type']}",
                confidence=evolution_interpretation.get("confidence", 0.8),
                vector=vector,
                metadata={
                    "parent_vector_hash": self.hash_vector(parent_vector),
                    "evolution_metrics": evolution,
                    "llm_interpretation": evolution_interpretation,
                    "shift_magnitude": evolution["euclidean_distance"],
                    "vector_hash": vector_hash,
                    "timestamp": datetime.now().isoformat()
                }
            )

        # Always store current vector with hash
        self.db.execute("""
            CREATE TABLE IF NOT EXISTS vector_lineage (
                vector_hash TEXT,
                vector JSON,
                parent_hash TEXT,
                timestamp TIMESTAMP
            )
        """)

        self.db.execute("""
            INSERT OR IGNORE INTO vector_lineage
            (vector_hash, vector, parent_hash, timestamp)
            VALUES (?, ?, ?, ?)
        """, (vector_hash, json.dumps(vector),
            self.hash_vector(parent_vector) if parent_vector else None,
            datetime.now().isoformat()))

        return vector_hash

    async def get_vector_lineage(self, vector_hash: str) -> Dict[str, Any]:
        """Get complete lineage for a vector"""

        # Get vector and its ancestors
        lineage = []
        current_hash = vector_hash

        while current_hash:
            result = self.db.query("""
                SELECT vector_hash, vector, parent_hash, timestamp
                FROM vector_lineage
                WHERE vector_hash = ?
            """, (current_hash,))

            if not result:
                break

            vector_data = result[0]
            vector = json.loads(vector_data["vector"])

            lineage.append({
                "vector_hash": vector_data["vector_hash"],
                "vector": vector,
                "timestamp": vector_data["timestamp"],
                "parent_hash": vector_data["parent_hash"]
            })

            current_hash = vector_data["parent_hash"]

        # Reverse to get chronological order
        lineage.reverse()

        # Get CTRM truths about this lineage
        evolution_truths = await self.ctrm.find_similar_truths(
            f"vector evolution for {vector_hash}",
            limit=10
        )

        return {
            "lineage": lineage,
            "evolution_history": evolution_truths,
            "generations": len(lineage),
            "current_vector_hash": vector_hash
        }

    async def analyze_dimension_changes(self, vec1: List[float], vec2: List[float]) -> Dict[str, Any]:
        """Analyze how individual dimensions changed"""

        if len(vec1) != len(vec2):
            return {
                "error": "vectors_different_dimensions",
                "dimension_count": {"vec1": len(vec1), "vec2": len(vec2)}
            }

        # Calculate changes per dimension
        changes = []
        for i, (v1, v2) in enumerate(zip(vec1, vec2)):
            change = abs(v1 - v2)
            percent_change = change / max(abs(v1), abs(v2), 0.001)
            changes.append({
                "dimension": i,
                "vec1_value": v1,
                "vec2_value": v2,
                "absolute_change": change,
                "percent_change": percent_change,
                "significant": percent_change > 0.5
            })

        # Summary statistics
        significant_changes = sum(1 for c in changes if c["significant"])
        avg_change = sum(c["absolute_change"] for c in changes) / len(changes)
        max_change = max(c["absolute_change"] for c in changes)

        return {
            "dimension_analysis": changes,
            "significant_changes": significant_changes,
            "total_dimensions": len(changes),
            "average_change": avg_change,
            "max_change": max_change,
            "change_distribution": self.analyze_change_distribution([c["absolute_change"] for c in changes])
        }

    async def create_evolution_graph(self, vector_hash: str) -> Dict[str, Any]:
        """Create graph representation of vector evolution"""

        lineage = await self.get_vector_lineage(vector_hash)

        if len(lineage) < 2:
            return {
                "error": "insufficient_lineage",
                "vector_count": len(lineage)
            }

        # Create graph structure
        nodes = []
        edges = []

        for i, entry in enumerate(lineage):
            vector = entry["vector"]
            metrics = {
                "norm": float(np.linalg.norm(vector)),
                "mean": float(np.mean(vector)),
                "std": float(np.std(vector))
            }

            nodes.append({
                "id": entry["vector_hash"],
                "generation": i,
                "timestamp": entry["timestamp"],
                "metrics": metrics,
                "vector": vector
            })

            if i > 0:
                parent = lineage[i-1]
                similarity = float(self.cosine_similarity(vector, parent["vector"]))

                edges.append({
                    "source": parent["vector_hash"],
                    "target": entry["vector_hash"],
                    "similarity": similarity,
                    "relationship": self.map_similarity_to_strength(similarity)
                })

        # Ask LLM to analyze the evolution graph
        graph_analysis = await self.ask_llm(
            f"Vector evolution graph with {len(nodes)} generations and "
            f"{len(edges)} transitions. Average similarity: "
            f"{sum(e['similarity'] for e in edges)/len(edges):.3f}. "
            f"Analyze the evolution pattern and semantic development."
        )

        # Store as CTRM truth
        graph_truth = await self.ctrm.create_truth(
            statement=f"Vector evolution graph: {graph_analysis['pattern']}",
            confidence=graph_analysis.get("confidence", 0.8),
            metadata={
                "vector_hash": vector_hash,
                "graph_analysis": graph_analysis,
                "node_count": len(nodes),
                "edge_count": len(edges),
                "timestamp": datetime.now().isoformat()
            }
        )

        return {
            "nodes": nodes,
            "edges": edges,
            "analysis": graph_analysis,
            "ctrm_truth_id": graph_truth.id,
            "generations": len(nodes)
        }

    async def find_evolution_patterns(self, min_generations: int = 3) -> Dict[str, Any]:
        """Find common evolution patterns across all vectors"""

        # Get all vectors with sufficient lineage
        results = self.db.query("""
            SELECT vector_hash, COUNT(*) as generations
            FROM vector_lineage
            GROUP BY vector_hash
            HAVING COUNT(*) >= ?
        """, (min_generations,))

        patterns = []
        for result in results:
            vector_hash = result["vector_hash"]
            lineage = await self.get_vector_lineage(vector_hash)

            if len(lineage) >= min_generations:
                pattern = await self.analyze_evolution_pattern(lineage)
                patterns.append(pattern)

        # Cluster similar patterns
        pattern_clusters = await self.cluster_similar_patterns(patterns)

        # Store as CTRM truth
        patterns_truth = await self.ctrm.create_truth(
            statement=f"Discovered {len(pattern_clusters)} vector evolution patterns",
            confidence=0.9,
            metadata={
                "pattern_clusters": pattern_clusters,
                "total_vectors_analyzed": len(results),
                "min_generations": min_generations,
                "timestamp": datetime.now().isoformat()
            }
        )

        return {
            "pattern_clusters": pattern_clusters,
            "total_patterns": len(patterns),
            "ctrm_truth_id": patterns_truth.id
        }

    async def analyze_evolution_pattern(self, lineage: List[Dict]) -> Dict[str, Any]:
        """Analyze evolution pattern for a single lineage"""

        similarities = []
        for i in range(1, len(lineage)):
            vec1 = lineage[i-1]["vector"]
            vec2 = lineage[i]["vector"]
            similarities.append(self.cosine_similarity(vec1, vec2))

        avg_similarity = sum(similarities) / len(similarities)
        similarity_std = np.std(similarities)

        # Ask LLM to characterize the pattern
        pattern_analysis = await self.ask_llm(
            f"Vector evolution with {len(lineage)} generations, "
            f"average similarity {avg_similarity:.3f}, "
            f"similarity std {similarity_std:.3f}. "
            f"Characterize the evolution pattern."
        )

        return {
            "lineage_id": lineage[-1]["vector_hash"],
            "generations": len(lineage),
            "average_similarity": avg_similarity,
            "similarity_std": similarity_std,
            "pattern_analysis": pattern_analysis,
            "similarities": similarities
        }

    async def cluster_similar_patterns(self, patterns: List[Dict]) -> List[Dict]:
        """Cluster similar evolution patterns"""

        if not patterns:
            return []

        # Simple clustering based on similarity metrics
        clusters = []
        unclustered = patterns.copy()

        while unclustered:
            # Start new cluster with first unclustered pattern
            cluster_center = unclustered.pop(0)
            cluster = [cluster_center]

            # Find similar patterns
            similar_indices = []
            for i, pattern in enumerate(unclustered):
                if self.pattern_similarity(cluster_center, pattern) > 0.7:
                    cluster.append(pattern)
                    similar_indices.append(i)

            # Remove clustered patterns
            for i in sorted(similar_indices, reverse=True):
                unclustered.pop(i)

            clusters.append({
                "center": cluster_center,
                "members": cluster,
                "size": len(cluster)
            })

        return clusters

    def pattern_similarity(self, pattern1: Dict, pattern2: Dict) -> float:
        """Calculate similarity between two evolution patterns"""

        # Compare average similarity and std
        sim_diff = abs(pattern1["average_similarity"] - pattern2["average_similarity"])
        std_diff = abs(pattern1["similarity_std"] - pattern2["similarity_std"])

        # Simple similarity metric
        similarity = 1.0 - (sim_diff * 0.6 + std_diff * 0.4)

        return max(0.0, min(1.0, similarity))

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

    def analyze_change_distribution(self, changes: List[float]) -> Dict[str, float]:
        """Analyze distribution of changes"""
        return {
            "mean": float(np.mean(changes)),
            "std": float(np.std(changes)),
            "min": float(np.min(changes)),
            "max": float(np.max(changes)),
            "median": float(np.median(changes)),
            "q25": float(np.percentile(changes, 25)),
            "q75": float(np.percentile(changes, 75))
        }

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