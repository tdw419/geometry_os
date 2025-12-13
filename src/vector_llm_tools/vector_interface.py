import asyncio
import json
import numpy as np
from typing import List, Dict, Any
from datetime import datetime
import hashlib
from .ctrm_neural_cortex import CTRMNeuralCortex

class CTRMVectorInterface:
    """Minimal, optimized vector interface for LLMs"""

    def __init__(self, ctrm, lm_studio, db, vector_analytics, vector_qa, vector_evolution, vector_protocol, vector_mapper):
        self.ctrm = ctrm
        self.lm_studio = lm_studio
        self.db = db
        self.vector_analytics = vector_analytics
        self.vector_qa = vector_qa
        self.vector_evolution = vector_evolution
        self.vector_protocol = vector_protocol
        self.vector_mapper = vector_mapper
        self.neural_cortex = CTRMNeuralCortex(self)

    async def llm_store_vector(self, vector: List[float], metadata: dict) -> Dict[str, Any]:
        """Store vector with LLM-optimized metadata"""

        # Basic validation (for LLM consumption)
        validation = await self.validate_for_llm(vector, metadata)

        if not validation["valid"]:
            return {
                "error": "Vector validation failed",
                "llm_feedback": validation["llm_feedback"],
                "quality_score": validation["quality_score"]
            }

        # Store with vector-native format
        vector_hash = self.hash_vector(vector)

        # Initialize vector lineage table if needed
        self.db.execute("""
            CREATE TABLE IF NOT EXISTS ctrm_vectors (
                vector_hash TEXT PRIMARY KEY,
                vector JSON NOT NULL,
                llm_metadata JSON NOT NULL,
                quality_score REAL NOT NULL,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )
        """)

        self.db.execute("""
            INSERT OR IGNORE INTO ctrm_vectors
            (vector_hash, vector, llm_metadata, quality_score)
            VALUES (?, ?, ?, ?)
        """, (vector_hash, json.dumps(vector),
            json.dumps({
                **metadata,
                "validation_feedback": validation["llm_feedback"],
                "stored_by_llm": metadata.get("source_llm", "unknown"),
                "storage_timestamp": datetime.now().isoformat(),
                "vector_metrics": validation["vector_metrics"]
            }),
            validation["quality_score"]))

        # Create CTRM truth about this vector
        truth = await self.ctrm.create_truth(
            statement=f"Vector stored: {metadata.get('description', 'unnamed vector')}",
            confidence=validation["quality_score"],
            vector=vector,  # Store the actual vector
            metadata={
                "vector_hash": vector_hash,
                "llm_metadata": metadata,
                "validation_results": validation,
                "storage_method": "llm_native",
                "timestamp": datetime.now().isoformat()
            }
        )

        return {
            "vector_hash": vector_hash,
            "truth_id": truth.id,
            "quality_score": validation["quality_score"],
            "llm_feedback": validation["llm_feedback"],
            "vector_metrics": validation["vector_metrics"],
            "status": "stored"
        }

    async def llm_find_similar_vectors(self, query_vector: List[float],
                                      min_similarity: float = 0.7,
                                      limit: int = 10) -> Dict[str, Any]:
        """Find similar vectors with LLM-friendly results"""

        # Initialize vector similarity table if needed
        self.db.execute("""
            CREATE TABLE IF NOT EXISTS vector_similarities (
                query_hash TEXT NOT NULL,
                target_hash TEXT NOT NULL,
                similarity REAL NOT NULL,
                relationship_strength TEXT NOT NULL,
                timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                PRIMARY KEY (query_hash, target_hash)
            )
        """)

        query_hash = self.hash_vector(query_vector)

        # In a real implementation with vector database support:
        # results = await self.db.vector_query(query_vector, min_similarity, limit)

        # For now, simulate with a simple approach
        results = self.db.query("""
            SELECT vector_hash, vector, llm_metadata
            FROM ctrm_vectors
            LIMIT ?
        """, (limit,))

        # Format for LLM consumption
        formatted = []
        for r in results:
            target_vector = json.loads(r["vector"])
            similarity = self.cosine_similarity(query_vector, target_vector)

            if similarity >= min_similarity:
                formatted.append({
                    "vector_hash": r["vector_hash"],
                    "similarity": float(similarity),
                    "llm_metadata": json.loads(r["llm_metadata"]),
                    "relationship_strength": self.map_similarity_to_strength(similarity),
                    "recommended_use": self.get_recommendation_from_similarity(similarity),
                    "vector_metrics": {
                        "norm": float(np.linalg.norm(target_vector)),
                        "dimensionality": len(target_vector)
                    }
                })

                # Store similarity for future reference
                self.db.execute("""
                    INSERT OR REPLACE INTO vector_similarities
                    (query_hash, target_hash, similarity, relationship_strength)
                    VALUES (?, ?, ?, ?)
                """, (query_hash, r["vector_hash"], similarity,
                    self.map_similarity_to_strength(similarity)))

        # Ask LLM to summarize findings
        if formatted:
            summary = await self.ask_llm(
                f"Found {len(formatted)} similar vectors with "
                f"similarities ranging {min(r['similarity'] for r in formatted):.2f} "
                f"to {max(r['similarity'] for r in formatted):.2f}. "
                f"Query vector norm: {np.linalg.norm(query_vector):.2f}. "
                f"What does this suggest about the query vector's semantic position "
                f"and potential relationships?"
            )

            formatted.append({
                "_summary": summary,
                "_query_vector_hash": query_hash,
                "_query_vector_norm": float(np.linalg.norm(query_vector))
            })

        return {
            "similar_vectors": formatted,
            "query_vector_hash": query_hash,
            "min_similarity": min_similarity,
            "limit": limit,
            "found_count": len(formatted),
            "summary": summary if formatted else "No similar vectors found"
        }

    async def llm_analyze_vector_space(self, space_name: str = "default") -> Dict[str, Any]:
        """Analyze the overall vector space with LLM insights"""

        # Get all vectors
        vectors_result = self.db.query("""
            SELECT vector, llm_metadata
            FROM ctrm_vectors
            ORDER BY created_at DESC
            LIMIT 100
        """)

        vectors = []
        labels = []
        for r in vectors_result:
            vectors.append(json.loads(r["vector"]))
            metadata = json.loads(r["llm_metadata"])
            labels.append(metadata.get("description", "unnamed"))

        if not vectors:
            return {"error": "No vectors available for analysis"}

        # Use vector mapper to create space analysis
        space_map = await self.vector_mapper.create_vector_space_map(vectors, labels)

        # Get quality trends
        quality_trends = await self.vector_qa.monitor_vector_quality_trends()

        # Create comprehensive space analysis
        space_analysis = {
            "vector_count": len(vectors),
            "dimensionality": len(vectors[0]) if vectors else 0,
            "space_map": space_map["space_map"],
            "quality_trends": quality_trends,
            "semantic_regions": space_map["space_map"]["semantic_regions"],
            "landmark_vectors": space_map["space_map"]["landmark_vectors"],
            "coverage_score": space_map["space_map"]["space_metrics"]["coverage_score"],
            "timestamp": datetime.now().isoformat()
        }

        # Store as CTRM truth
        analysis_truth = await self.ctrm.create_truth(
            statement=f"Vector space analysis: {len(vectors)} vectors analyzed",
            confidence=0.9,
            metadata={
                "space_analysis": space_analysis,
                "space_name": space_name,
                "analysis_timestamp": datetime.now().isoformat()
            }
        )

        return {
            "space_analysis": space_analysis,
            "ctrm_truth_id": analysis_truth.id,
            "recommendations": self.get_space_recommendations(space_analysis)
        }

    async def validate_for_llm(self, vector: List[float], metadata: dict) -> Dict[str, Any]:
        """Validate vector is suitable for LLM consumption"""

        # Calculate quality metrics
        quality_metrics = self.calculate_quality_metrics(vector)

        # LLM-friendly quality check
        quality_check = await self.ask_llm(
            f"Vector validation for {metadata.get('source_llm', 'unknown')}. "
            f"Metrics: {quality_metrics}. "
            f"Is this a high-quality embedding suitable for LLM operations? "
            f"Respond with JSON: {{'valid': true/false, 'confidence': 0.0-1.0, "
            f"'feedback': '...', 'quality_score': 0.0-1.0}}"
        )

        # Calculate quality score
        quality_score = self.calculate_quality_score(quality_metrics)

        return {
            "valid": quality_check.get("valid", True),
            "quality_score": quality_score,
            "llm_feedback": quality_check.get("feedback", "Vector appears valid"),
            "confidence": quality_check.get("confidence", 0.8),
            "vector_metrics": quality_metrics,
            "recommendation": "use_with_confidence" if quality_score > 0.7 else "use_with_caution"
        }

    async def llm_vector_operation(self, operation: str, **kwargs) -> Dict[str, Any]:
        """Execute LLM vector operation using the protocol"""

        return await self.vector_protocol.llm_vector_rpc(operation, **kwargs)

    async def track_vector_evolution(self, vector: List[float], parent_vector: List[float] = None) -> Dict[str, Any]:
        """Track vector evolution with LLM analysis"""

        vector_hash = await self.vector_evolution.track_vector_lineage(vector, parent_vector)

        # Get lineage
        lineage = await self.vector_evolution.get_vector_lineage(vector_hash)

        return {
            "vector_hash": vector_hash,
            "lineage": lineage,
            "generations": len(lineage["lineage"]),
            "evolution_history": lineage["evolution_history"]
        }

    def calculate_quality_metrics(self, vector: List[float]) -> Dict[str, float]:
        """Calculate comprehensive quality metrics"""
        return {
            "norm": float(np.linalg.norm(vector)),
            "mean": float(np.mean(vector)),
            "std": float(np.std(vector)),
            "min": float(np.min(vector)),
            "max": float(np.max(vector)),
            "zero_ratio": float(np.sum(np.abs(vector) < 0.001) / len(vector)),
            "skewness": float(self.calculate_skewness(vector)),
            "kurtosis": float(self.calculate_kurtosis(vector)),
            "dimensionality": len(vector),
            "sparsity": float(np.sum(np.abs(vector) < 0.1) / len(vector))
        }

    def calculate_quality_score(self, metrics: Dict[str, float]) -> float:
        """Calculate overall quality score (0.0-1.0)"""
        # Ideal ranges for quality
        norm_score = min(1.0, max(0.0, 1.0 - abs(metrics["norm"] - 10.0) / 20.0))
        std_score = min(1.0, max(0.0, metrics["std"] / 0.5))
        zero_penalty = max(0.0, 1.0 - metrics["zero_ratio"] * 2)
        sparsity_penalty = max(0.0, 1.0 - metrics["sparsity"] * 1.5)

        # Combine scores
        quality_score = (
            norm_score * 0.3 +
            std_score * 0.2 +
            zero_penalty * 0.3 +
            sparsity_penalty * 0.2
        )

        return min(1.0, max(0.1, quality_score))

    def calculate_skewness(self, vector: List[float]) -> float:
        """Calculate skewness of vector distribution"""
        mean = np.mean(vector)
        std = np.std(vector)
        if std == 0:
            return 0.0
        return np.mean(((vector - mean) / std) ** 3)

    def calculate_kurtosis(self, vector: List[float]) -> float:
        """Calculate kurtosis of vector distribution"""
        mean = np.mean(vector)
        std = np.std(vector)
        if std == 0:
            return 0.0
        return np.mean(((vector - mean) / std) ** 4) - 3

    def get_space_recommendations(self, space_analysis: Dict[str, Any]) -> List[str]:
        """Get recommendations based on space analysis"""
        recommendations = []

        if space_analysis["coverage_score"] < 0.4:
            recommendations.append("expand_vector_coverage")

        if space_analysis["quality_trends"]["average_quality"] < 0.6:
            recommendations.append("improve_vector_quality")

        if len(space_analysis["semantic_regions"]) < 3:
            recommendations.append("diversify_vector_space")

        if space_analysis["vector_count"] < 50:
            recommendations.append("increase_vector_collection")

        return recommendations

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

    def get_recommendation_from_similarity(self, similarity: float) -> str:
        """Get recommendation based on similarity"""
        if similarity > 0.9:
            return "can_be_used_interchangeably"
        elif similarity > 0.8:
            return "similar_enough_for_most_purposes"
        elif similarity > 0.6:
            return "related_but_different_semantics"
        elif similarity > 0.4:
            return "distantly_related"
        else:
            return "unrelated_different_concepts"

    def hash_vector(self, vector: List[float]) -> str:
        """Generate hash for vector"""
        vector_json = json.dumps(vector, sort_keys=True)
        return hashlib.md5(vector_json.encode()).hexdigest()

    def cosine_similarity(self, vec1: List[float], vec2: List[float]) -> float:
        """Calculate cosine similarity between two vectors with dimension safety"""
        vec1 = np.array(vec1)
        vec2 = np.array(vec2)

        # Handle dimension mismatches
        if len(vec1) != len(vec2):
            # Normalize dimensions by padding or truncating
            max_len = max(len(vec1), len(vec2))
            vec1 = np.pad(vec1, (0, max_len - len(vec1)))
            vec2 = np.pad(vec2, (0, max_len - len(vec2)))

        dot_product = np.dot(vec1, vec2)
        norm1 = np.linalg.norm(vec1)
        norm2 = np.linalg.norm(vec2)
        return dot_product / (norm1 * norm2) if norm1 and norm2 else 0.0

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

    async def store_with_comprehension(self, content: str, vector: List[float], metadata: dict) -> Dict[str, Any]:
        """
        Store vector with neural cortex comprehension (Phase 1).
        """
        return await self.neural_cortex.listen_and_store(content, vector, metadata)

    async def respond_to_query(self, query: str, query_vector: List[float]) -> Dict[str, Any]:
        """
        Respond to query using neural cortex speaking capabilities (Phase 1).
        """
        return await self.neural_cortex.think_and_speak(query, query_vector)