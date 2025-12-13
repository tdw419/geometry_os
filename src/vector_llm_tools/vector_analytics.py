import asyncio
import json
import numpy as np
from typing import List, Dict, Any
from datetime import datetime
import hashlib

class VectorAnalyticsForLLMs:
    """Tools to help LLMs understand their own vectors better"""

    def __init__(self, ctrm, lm_studio):
        self.ctrm = ctrm
        self.lm_studio = lm_studio

    async def analyze_vector_for_llm(self, vector: List[float], context_llm: str) -> Dict[str, Any]:
        """Give LLM-friendly analysis of what a vector represents"""

        # Basic vector metrics
        metrics = {
            "norm": float(np.linalg.norm(vector)),
            "mean": float(np.mean(vector)),
            "std": float(np.std(vector)),
            "min": float(np.min(vector)),
            "max": float(np.max(vector)),
            "zero_ratio": float(np.sum(np.abs(vector) < 0.001) / len(vector)),
            "dimensionality": len(vector)
        }

        # Ask LLM to interpret its own vector
        interpretation = await self.ask_llm_to_interpret_vector(vector, context_llm, metrics)

        # Store as CTRM truth about vector interpretation
        vector_hash = self.hash_vector(vector)
        interpretation_truth = await self.ctrm.create_truth(
            statement=f"Vector interpretation by {context_llm}: {interpretation['summary']}",
            confidence=interpretation["confidence"],
            vector=vector,  # Store the original vector
            metadata={
                "interpreting_llm": context_llm,
                "interpretation": interpretation,
                "vector_hash": vector_hash,
                "vector_metrics": metrics,
                "analysis_method": "llm_self_interpretation",
                "timestamp": datetime.now().isoformat()
            }
        )

        return {
            **interpretation,
            "vector_hash": vector_hash,
            "ctrm_truth_id": interpretation_truth.id,
            "vector_metrics": metrics
        }

    async def compare_vectors_for_llm(self, vec1: List[float], vec2: List[float]) -> Dict[str, Any]:
        """Give LLM insights into vector relationships"""

        # Calculate similarities
        similarity = float(self.cosine_similarity(vec1, vec2))
        euclidean_dist = float(np.linalg.norm(np.array(vec1) - np.array(vec2)))

        # Ask LLM what this similarity means
        similarity_analysis = await self.ask_llm(
            f"Two vectors have cosine similarity {similarity:.3f} "
            f"and Euclidean distance {euclidean_dist:.3f}. "
            f"What does this level of similarity typically indicate "
            f"in semantic space? Be specific about relationship strength, "
            f"potential semantic overlap, and practical implications."
        )

        # Store as CTRM truth
        comparison_truth = await self.ctrm.create_truth(
            statement=f"Vector comparison: {similarity_analysis['relationship']}",
            confidence=similarity_analysis.get("confidence", 0.8),
            metadata={
                "vector1_hash": self.hash_vector(vec1),
                "vector2_hash": self.hash_vector(vec2),
                "cosine_similarity": similarity,
                "euclidean_distance": euclidean_dist,
                "llm_interpretation": similarity_analysis,
                "relationship_strength": self.map_similarity_to_strength(similarity),
                "recommended_action": self.get_recommendation_from_similarity(similarity),
                "timestamp": datetime.now().isoformat()
            }
        )

        return {
            "cosine_similarity": similarity,
            "euclidean_distance": euclidean_dist,
            "llm_interpretation": similarity_analysis,
            "relationship_strength": self.map_similarity_to_strength(similarity),
            "recommended_action": self.get_recommendation_from_similarity(similarity),
            "ctrm_truth_id": comparison_truth.id
        }

    async def ask_llm_to_interpret_vector(self, vector: List[float], context_llm: str, metrics: Dict) -> Dict[str, Any]:
        """Ask LLM to interpret its own vector"""
        prompt = f"""
        You are analyzing a vector embedding that you or another LLM generated.
        Here are the vector metrics:
        {json.dumps(metrics, indent=2)}

        Please provide a detailed interpretation of what this vector likely represents:
        1. Primary semantic concepts (with estimated strength 0.0-1.0)
        2. Secondary or related concepts
        3. Potential use cases or applications
        4. Quality assessment (high/medium/low)
        5. Confidence in your interpretation (0.0-1.0)

        Respond in JSON format with all required fields.
        """

        model = await self.lm_studio.get_loaded_model()
        if not model:
            return {
                "summary": "Vector analysis unavailable",
                "confidence": 0.5,
                "primary_concepts": [],
                "secondary_concepts": [],
                "use_cases": [],
                "quality": "medium"
            }

        response = await self.lm_studio.generate(model, prompt, max_tokens=500)

        try:
            interpretation = json.loads(response["content"])
            return interpretation
        except (json.JSONDecodeError, KeyError):
            return {
                "summary": f"Vector from {context_llm} with norm {metrics['norm']:.2f}",
                "confidence": 0.7,
                "primary_concepts": [{"concept": "general_knowledge", "strength": 0.6}],
                "secondary_concepts": [{"concept": "language_understanding", "strength": 0.4}],
                "use_cases": ["general_purpose", "knowledge_representation"],
                "quality": "medium"
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