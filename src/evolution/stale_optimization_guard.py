import asyncio
import time
import json
from typing import Dict, Any
from datetime import datetime, timedelta

class StaleOptimizationGuard:
    def __init__(self, ctrm, token_manager):
        self.ctrm = ctrm
        self.tokens = token_manager
        self.truth_ttl_minutes = 30  # Default TTL for optimization truths

    async def check_optimization_freshness(self, optimization_truth_id: str) -> Dict[str, Any]:
        """Check if optimization is stale based on CTRM truths"""

        optimization_truth = await self.ctrm.get_truth(optimization_truth_id)
        if not optimization_truth:
            return {"stale": True, "reason": "truth_not_found"}

        # Check timestamp
        created_at = optimization_truth["created_at"]
        if isinstance(created_at, str):
            created_at = datetime.fromisoformat(created_at)
        age_seconds = time.time() - created_at.timestamp()

        if age_seconds > self.truth_ttl_minutes * 60:
            # Truth is stale, but check if it's still valid
            recent_similar = await self.ctrm.find_similar_truths(
                optimization_truth["statement"],
                limit=3
            )
            # Filter by time manually
            recent_similar = []
            for truth in recent_similar:
                created_at = truth["created_at"]
                if isinstance(created_at, str):
                    created_at = datetime.fromisoformat(created_at)
                if time.time() - created_at.timestamp() < 300:  # Last 5 minutes
                    recent_similar.append(truth)

            if not recent_similar:
                return {
                    "stale": True,
                    "reason": "no_recent_similar_patterns",
                    "age_seconds": age_seconds,
                    "confidence": optimization_truth["confidence"]
                }

        # Check pattern consistency
        created_at = optimization_truth["created_at"]
        if isinstance(created_at, str):
            created_at = datetime.fromisoformat(created_at)
        pattern_changed = await self.check_pattern_changes_since(
            created_at.timestamp()
        )

        if pattern_changed["changed"]:
            return {
                "stale": True,
                "reason": "pattern_shift_detected",
                "pattern_change_confidence": pattern_changed["confidence"],
                "recommendation": "regenerate_optimization"
            }

        # Check performance relevance
        performance_relevant = await self.check_performance_relevance(
            optimization_truth
        )

        if not performance_relevant["relevant"]:
            return {
                "stale": True,
                "reason": "performance_irrelevant",
                "current_performance": performance_relevant["current"],
                "optimization_performance": performance_relevant["optimization"]
            }

        return {"stale": False, "confidence": optimization_truth["confidence"]}

    async def check_pattern_changes_since(self, timestamp: float) -> Dict[str, Any]:
        """Check if patterns have changed since a given timestamp"""

        # Get pattern shift truths since timestamp
        pattern_shift_truths = await self.ctrm.find_similar_truths(
            "pattern shift",
            limit=5
        )
        # Filter by time manually
        filtered_truths = []
        for truth in pattern_shift_truths:
            created_at = truth["created_at"]
            if isinstance(created_at, str):
                created_at = datetime.fromisoformat(created_at)
            if created_at.timestamp() > timestamp:
                filtered_truths.append(truth)
        pattern_shift_truths = filtered_truths

        if pattern_shift_truths:
            avg_confidence = sum(t["confidence"] for t in pattern_shift_truths) / len(pattern_shift_truths)
            return {
                "changed": True,
                "confidence": avg_confidence,
                "shift_count": len(pattern_shift_truths)
            }

        return {
            "changed": False,
            "confidence": 0.0,
            "shift_count": 0
        }

    async def check_performance_relevance(self, optimization_truth: Dict[str, Any]) -> Dict[str, Any]:
        """Check if optimization is still relevant to current performance"""

        # Get current performance metrics
        current_performance_truths = await self.ctrm.find_similar_truths(
            "performance metrics",
            limit=3
        )

        if not current_performance_truths:
            return {"relevant": True, "reason": "no_current_metrics"}

        # Extract performance data
        current_performance = {
            "token_efficiency": 0.0,
            "confidence": 0.7,
            "success_rate": 0.8
        }

        for truth in current_performance_truths:
            try:
                metadata = truth.get("metadata", {})
                context = metadata.get("context", "{}")
                if context:
                    context_data = json.loads(context)
                    if "efficiency" in context_data:
                        current_performance["token_efficiency"] = max(current_performance["token_efficiency"], context_data["efficiency"])
                    if "confidence" in context_data:
                        current_performance["confidence"] = max(current_performance["confidence"], context_data["confidence"])
                    if "success_rate" in context_data:
                        current_performance["success_rate"] = max(current_performance["success_rate"], context_data["success_rate"])
            except (json.JSONDecodeError, ValueError, KeyError):
                continue

        # Extract optimization performance from metadata
        optimization_performance = {
            "token_efficiency": 0.0,
            "confidence": 0.7,
            "success_rate": 0.8
        }

        try:
            metadata = optimization_truth.get("metadata", {})
            context = metadata.get("context", "{}")
            if context:
                context_data = json.loads(context)
                if "efficiency" in context_data:
                    optimization_performance["token_efficiency"] = context_data["efficiency"]
                if "confidence" in context_data:
                    optimization_performance["confidence"] = context_data["confidence"]
                if "success_rate" in context_data:
                    optimization_performance["success_rate"] = context_data["success_rate"]
        except (json.JSONDecodeError, ValueError, KeyError):
            pass

        # Calculate relevance score
        efficiency_delta = abs(current_performance["token_efficiency"] - optimization_performance["token_efficiency"])
        confidence_delta = abs(current_performance["confidence"] - optimization_performance["confidence"])
        success_delta = abs(current_performance["success_rate"] - optimization_performance["success_rate"])

        relevance_score = 1.0 - (
            efficiency_delta * 0.4 +
            confidence_delta * 0.3 +
            success_delta * 0.3
        )

        return {
            "relevant": relevance_score > 0.7,
            "relevance_score": relevance_score,
            "current": current_performance,
            "optimization": optimization_performance
        }

    async def prevent_stale_application(self, optimization: Dict[str, Any]) -> Dict[str, Any]:
        """Prevent application of stale optimizations"""

        # Handle different optimization structures
        truth_id = optimization.get("ctrm_truth_id")
        if not truth_id and optimization.get("source_truths"):
            # For evolution results, use the first source truth
            truth_id = optimization["source_truths"][0]

        if not truth_id:
            # If no truth ID is available, return the optimization as-is
            return optimization

        freshness_check = await self.check_optimization_freshness(truth_id)

        if freshness_check["stale"]:
            # Generate fresh optimization
            fresh_optimization = await self.generate_fresh_optimization(
                optimization,
                reason=freshness_check["reason"]
            )

            # Create CTRM truth about stale prevention
            stale_prevention_truth = await self.ctrm.create_truth(
                statement=f"Stale optimization prevented: {freshness_check['reason']}",
                context=json.dumps({
                    "confidence": 0.9,
                    "category": "stale_prevention",
                    "stale_optimization": optimization,
                    "freshness_check": freshness_check,
                    "fresh_optimization": fresh_optimization,
                    "timestamp": datetime.now().isoformat()
                })
            )

            return fresh_optimization

        return optimization

    async def generate_fresh_optimization(self, stale_optimization: Dict[str, Any], reason: str) -> Dict[str, Any]:
        """Generate fresh optimization based on current conditions"""

        # Get current system state
        current_state_truths = await self.ctrm.find_similar_truths(
            "system state",
            limit=5
        )

        # Generate new optimization based on current state
        fresh_optimization = {
            "objective": stale_optimization["objective"],
            "changes_made": [],
            "estimated_improvement": stale_optimization.get("estimated_improvement", 0.1) * 0.8,  # Conservative estimate
            "ctrm_truth_id": None,
            "freshly_generated": True,
            "reason_for_refresh": reason,
            "timestamp": datetime.now().isoformat()
        }

        # Add changes based on current state
        for truth in current_state_truths:
            if truth["confidence"] > 0.8:
                fresh_optimization["changes_made"].append(
                    f"Optimized based on high-confidence truth: {truth['statement'][:50]}..."
                )

        # Create CTRM truth for fresh optimization
        stale_optimization_id = stale_optimization.get("ctrm_truth_id")
        if not stale_optimization_id and stale_optimization.get("source_truths"):
            # For evolution results, use the first source truth
            stale_optimization_id = stale_optimization["source_truths"][0]

        fresh_truth = await self.ctrm.create_truth(
            statement=f"Fresh optimization generated: {fresh_optimization['objective'].get('description', '')[:50]}...",
            context=json.dumps({
                "confidence": 0.8,
                "category": "fresh_optimization",
                "reason": reason,
                "stale_optimization_id": stale_optimization_id,
                "changes": fresh_optimization["changes_made"],
                "timestamp": datetime.now().isoformat()
            })
        )

        fresh_optimization["ctrm_truth_id"] = fresh_truth.id

        return fresh_optimization

    async def set_optimization_ttl(self, ttl_minutes: int):
        """Set TTL for optimization truths"""
        self.truth_ttl_minutes = ttl_minutes

        # Create CTRM truth about TTL change
        await self.ctrm.create_truth(
            statement=f"Optimization TTL set to {ttl_minutes} minutes",
            context=json.dumps({
                "confidence": 0.9,
                "category": "system_configuration",
                "ttl_minutes": ttl_minutes,
                "timestamp": datetime.now().isoformat()
            })
        )

        return {"ttl_set": True, "new_ttl_minutes": ttl_minutes}

    async def check_system_health_for_staleness(self) -> Dict[str, Any]:
        """Check overall system health for potential staleness issues"""

        # Check for stale truths in CTRM
        all_truths = await self.ctrm.db.get_all_truths()
        stale_count = 0
        total_truths = len(all_truths)

        for truth in all_truths:
            created_at = truth["created_at"]
            if isinstance(created_at, str):
                created_at = datetime.fromisoformat(created_at)
            age_seconds = time.time() - created_at.timestamp()
            if age_seconds > self.truth_ttl_minutes * 60:
                stale_count += 1

        stale_percentage = stale_count / max(1, total_truths)

        # Create health report
        health_truth = await self.ctrm.create_truth(
            statement=f"System health check: {stale_percentage:.1%} truths potentially stale",
            context=json.dumps({
                "confidence": 0.8,
                "category": "system_health",
                "stale_count": stale_count,
                "total_truths": total_truths,
                "stale_percentage": stale_percentage,
                "timestamp": datetime.now().isoformat()
            })
        )

        return {
            "stale_percentage": stale_percentage,
            "stale_count": stale_count,
            "total_truths": total_truths,
            "health_status": "good" if stale_percentage < 0.3 else "warning" if stale_percentage < 0.5 else "critical",
            "ctrm_truth_id": health_truth.id
        }