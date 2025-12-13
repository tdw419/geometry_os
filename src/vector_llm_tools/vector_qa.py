import asyncio
import json
import numpy as np
from typing import List, Dict, Any
from datetime import datetime
import hashlib

class VectorQAForLLMs:
    """Ensure vectors maintain quality for LLM usage"""

    def __init__(self, ctrm, lm_studio):
        self.ctrm = ctrm
        self.lm_studio = lm_studio

    async def validate_vector_quality(self, vector: List[float], source_llm: str) -> Dict[str, Any]:
        """Validate vector is suitable for LLM consumption"""

        # Calculate quality metrics
        quality_metrics = self.calculate_quality_metrics(vector)

        # LLM-friendly quality check
        quality_check = await self.ask_llm(
            f"Vector from {source_llm} has metrics: {quality_metrics}. "
            f"Is this a high-quality embedding? Consider norms, distribution, outliers. "
            f"Respond with JSON: {{'verdict': 'high_quality'/'medium_quality'/'low_quality', "
            f"'confidence': 0.0-1.0, 'reasoning': '...', 'recommendation': '...'}}"
        )

        # Calculate quality score
        quality_score = self.calculate_quality_score(quality_metrics)

        # Create CTRM truth about vector quality
        vector_hash = self.hash_vector(vector)
        quality_truth = await self.ctrm.create_truth(
            statement=f"Vector quality assessment: {quality_check['verdict']}",
            confidence=quality_check.get("confidence", 0.8),
            vector=vector,
            metadata={
                "source_llm": source_llm,
                "quality_metrics": quality_metrics,
                "quality_check": quality_check,
                "quality_score": quality_score,
                "vector_hash": vector_hash,
                "timestamp": datetime.now().isoformat()
            }
        )

        return {
            "quality_score": quality_score,
            "llm_assessment": quality_check,
            "truth_id": quality_truth.id,
            "passed": quality_check.get("verdict") == "high_quality",
            "vector_hash": vector_hash,
            "recommendation": quality_check.get("recommendation", "use_with_caution")
        }

    async def batch_validate_vectors(self, vectors: List[List[float]], source_llm: str) -> Dict[str, Any]:
        """Validate multiple vectors efficiently"""

        results = []
        for vector in vectors:
            validation = await self.validate_vector_quality(vector, source_llm)
            results.append(validation)

        # Create summary CTRM truth
        avg_quality = sum(r["quality_score"] for r in results) / len(results)
        high_quality_count = sum(1 for r in results if r["passed"])

        summary_truth = await self.ctrm.create_truth(
            statement=f"Batch vector validation: {high_quality_count}/{len(results)} high quality",
            confidence=0.9,
            metadata={
                "batch_size": len(results),
                "high_quality_count": high_quality_count,
                "average_quality": avg_quality,
                "source_llm": source_llm,
                "timestamp": datetime.now().isoformat()
            }
        )

        return {
            "individual_results": results,
            "batch_summary": {
                "total_vectors": len(results),
                "high_quality_count": high_quality_count,
                "average_quality": avg_quality,
                "summary_truth_id": summary_truth.id
            }
        }

    async def monitor_vector_quality_trends(self, time_window_hours: int = 24) -> Dict[str, Any]:
        """Monitor vector quality trends over time"""

        # Query recent vector quality truths
        quality_truths = await self.ctrm.find_similar_truths(
            "vector quality assessment",
            limit=100
        )

        # Analyze trends
        trends = self.analyze_quality_trends(quality_truths)

        # Create trend analysis CTRM truth
        trend_truth = await self.ctrm.create_truth(
            statement=f"Vector quality trend: {trends['trend_direction']}",
            confidence=0.85,
            metadata={
                "trend_analysis": trends,
                "time_window_hours": time_window_hours,
                "timestamp": datetime.now().isoformat()
            }
        )

        return {
            **trends,
            "ctrm_truth_id": trend_truth.id,
            "recommendation": self.get_trend_recommendation(trends)
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

    def analyze_quality_trends(self, quality_truths: List[Dict]) -> Dict[str, Any]:
        """Analyze quality trends from CTRM truths"""
        if not quality_truths:
            return {
                "trend_direction": "insufficient_data",
                "average_quality": 0.7,
                "quality_range": [0.6, 0.8],
                "improvement_rate": 0.0
            }

        # Extract quality scores
        quality_scores = []
        timestamps = []
        for truth in quality_truths:
            try:
                metadata = truth.get("metadata", {})
                if "quality_score" in metadata:
                    quality_scores.append(metadata["quality_score"])
                    timestamps.append(truth.get("created_at", datetime.now()))
            except (KeyError, TypeError):
                continue

        if len(quality_scores) < 3:
            return {
                "trend_direction": "stable",
                "average_quality": sum(quality_scores) / len(quality_scores) if quality_scores else 0.7,
                "quality_range": [min(quality_scores) if quality_scores else 0.6, max(quality_scores) if quality_scores else 0.8],
                "improvement_rate": 0.0
            }

        # Calculate trend
        avg_quality = sum(quality_scores) / len(quality_scores)
        quality_range = [min(quality_scores), max(quality_scores)]

        # Simple linear trend
        if len(quality_scores) > 1:
            time_deltas = [(t - timestamps[0]).total_seconds() / 3600 for t in timestamps]
            slope, _ = np.polyfit(time_deltas, quality_scores, 1)
            improvement_rate = slope
        else:
            improvement_rate = 0.0

        # Determine trend direction
        if improvement_rate > 0.01:
            trend_direction = "improving"
        elif improvement_rate < -0.01:
            trend_direction = "declining"
        else:
            trend_direction = "stable"

        return {
            "trend_direction": trend_direction,
            "average_quality": avg_quality,
            "quality_range": quality_range,
            "improvement_rate": improvement_rate,
            "sample_size": len(quality_scores)
        }

    def get_trend_recommendation(self, trends: Dict[str, Any]) -> str:
        """Get recommendation based on quality trends"""
        if trends["trend_direction"] == "improving":
            return "vector_quality_improving_continue_current_approach"
        elif trends["trend_direction"] == "declining":
            return "vector_quality_declining_investigate_causes"
        elif trends["average_quality"] < 0.6:
            return "low_vector_quality_review_generation_process"
        else:
            return "stable_vector_quality_maintain_monitoring"

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

    def hash_vector(self, vector: List[float]) -> str:
        """Generate hash for vector"""
        vector_json = json.dumps(vector, sort_keys=True)
        return hashlib.md5(vector_json.encode()).hexdigest()