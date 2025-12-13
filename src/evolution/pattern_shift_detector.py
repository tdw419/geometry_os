import asyncio
import time
import json
from typing import Dict, Any, List
import numpy as np
from datetime import datetime, timedelta

class PatternShiftDetector:
    def __init__(self, ctrm, token_manager):
        self.ctrm = ctrm
        self.tokens = token_manager
        self.query_history = []
        self.pattern_history = []
        self.last_shift_time = 0
        self.shift_cooldown = 1800  # 30 minutes cooldown between shift detections

    async def detect_sudden_shift(self, time_window_minutes=15) -> Dict[str, Any]:
        """Detect sudden changes in query patterns using CTRM truth anchoring"""

        # Check cooldown period
        current_time = time.time()
        if current_time - self.last_shift_time < self.shift_cooldown:
            return {
                "pattern_shift_detected": False,
                "reason": "cooldown_period",
                "confidence": 0.0,
                "divergence": 0.0
            }

        # Get recent queries
        recent_queries = await self.get_queries(time_window_minutes)
        if len(recent_queries) < 3:  # Need minimum samples
            return {
                "pattern_shift_detected": False,
                "reason": "insufficient_data",
                "confidence": 0.0,
                "divergence": 0.0
            }

        # Get historical patterns
        historical_patterns = await self.get_historical_patterns()

        # Calculate pattern divergence
        divergence = await self.calculate_pattern_divergence(recent_queries, historical_patterns)

        # CTRM confidence in shift detection
        shift_confidence = min(0.95, divergence * 2)  # Scale to confidence

        if shift_confidence > 0.7:
            # Create CTRM truth about pattern shift
            shift_truth = await self.ctrm.create_truth(
                statement=f"Query pattern shift detected: {divergence:.2f} divergence",
                confidence=shift_confidence,
                category="pattern_shift",
                metadata={
                    "divergence_score": divergence,
                    "time_window": time_window_minutes,
                    "sample_size": len(recent_queries),
                    "historical_patterns": len(historical_patterns),
                    "timestamp": datetime.now().isoformat()
                }
            )

            # Update last shift time
            self.last_shift_time = current_time

            return {
                "pattern_shift_detected": True,
                "reason": "significant_divergence",
                "confidence": shift_confidence,
                "divergence": divergence,
                "ctrm_truth_id": shift_truth.id,
                "recommendation": "trigger_rollback_protocol"
            }

        return {
            "pattern_shift_detected": False,
            "reason": "no_significant_divergence",
            "confidence": shift_confidence,
            "divergence": divergence
        }

    async def get_queries(self, time_window_minutes: int) -> List[Dict[str, Any]]:
        """Get recent queries within time window"""
        cutoff_time = datetime.now() - timedelta(minutes=time_window_minutes)

        # Query CTRM for recent user interactions
        recent_truths = await self.ctrm.find_similar_truths(
            "User query processed",
            limit=20
        )

        # Filter by time and extract query data
        recent_queries = []
        for truth in recent_truths:
            try:
                metadata = truth.get("metadata", {})
                context = metadata.get("context", "{}")
                if context:
                    context_data = json.loads(context)
                    query_time_str = context_data.get("timestamp")
                    if query_time_str:
                        query_time = datetime.fromisoformat(query_time_str)
                        if query_time >= cutoff_time:
                            recent_queries.append({
                                "query": context_data.get("query", ""),
                                "timestamp": query_time_str,
                                "model_used": context_data.get("model_used", ""),
                                "token_usage": context_data.get("token_usage", {})
                            })
            except (json.JSONDecodeError, ValueError, KeyError):
                continue

        return recent_queries

    async def get_historical_patterns(self) -> List[Dict[str, Any]]:
        """Get historical query patterns"""
        # Query CTRM for historical patterns
        historical_truths = await self.ctrm.find_similar_truths(
            "query pattern",
            limit=10
        )

        # Extract pattern data
        patterns = []
        for truth in historical_truths:
            try:
                metadata = truth.get("metadata", {})
                context = metadata.get("context", "{}")
                if context:
                    context_data = json.loads(context)
                    patterns.append({
                        "pattern": context_data.get("pattern", ""),
                        "confidence": truth.get("confidence", 0.5),
                        "timestamp": context_data.get("timestamp", "")
                    })
            except (json.JSONDecodeError, ValueError, KeyError):
                continue

        return patterns

    async def calculate_pattern_divergence(self, recent_queries: List[Dict], historical_patterns: List[Dict]) -> float:
        """Calculate divergence between recent queries and historical patterns"""

        if not historical_patterns:
            return 0.0

        # Calculate recent query characteristics
        recent_chars = sum(len(q["query"]) for q in recent_queries) / max(1, len(recent_queries))
        recent_tokens = sum(q["token_usage"].get("total_tokens", 0) for q in recent_queries) / max(1, len(recent_queries))
        recent_models = set(q["model_used"] for q in recent_queries)

        # Calculate historical characteristics
        hist_chars = sum(len(p["pattern"]) for p in historical_patterns) / max(1, len(historical_patterns))
        hist_confidence = sum(p["confidence"] for p in historical_patterns) / max(1, len(historical_patterns))
        hist_models = set(p.get("model", "") for p in historical_patterns)

        # Calculate divergence components
        char_divergence = abs(recent_chars - hist_chars) / max(1, hist_chars)
        token_divergence = abs(recent_tokens - hist_confidence * 100) / max(1, hist_confidence * 100)
        model_divergence = 1.0 - len(recent_models.intersection(hist_models)) / max(1, len(hist_models))

        # Combine divergences with weights
        divergence = (
            char_divergence * 0.3 +
            token_divergence * 0.4 +
            model_divergence * 0.3
        )

        return min(1.0, divergence)

    async def trigger_rollback_protocol(self, reason: str, confidence: float) -> Dict[str, Any]:
        """Trigger rollback protocol based on pattern shift detection"""
        rollback_truth = await self.ctrm.create_truth(
            statement=f"Rollback protocol triggered: {reason}",
            confidence=confidence,
            category="rollback_protocol",
            metadata={
                "reason": reason,
                "confidence": confidence,
                "timestamp": datetime.now().isoformat(),
                "action": "rollback_initiated"
            }
        )

        return {
            "rollback_triggered": True,
            "ctrm_truth_id": rollback_truth.id,
            "confidence": confidence,
            "reason": reason
        }

    async def update_query_patterns(self, query_data: Dict[str, Any]):
        """Update query patterns in CTRM"""
        pattern_truth = await self.ctrm.create_truth(
            statement=f"Query pattern: {query_data.get('query', '')[:50]}...",
            confidence=0.8,
            category="query_pattern",
            metadata={
                "pattern": query_data.get("query", ""),
                "timestamp": query_data.get("timestamp", datetime.now().isoformat()),
                "model_used": query_data.get("model_used", ""),
                "token_usage": query_data.get("token_usage", {})
            }
        )

        return pattern_truth.id