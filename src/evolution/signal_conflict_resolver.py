import asyncio
import json
from typing import Dict, Any, List
from datetime import datetime

class SignalConflictResolver:
    def __init__(self, ctrm, token_manager):
        self.ctrm = ctrm
        self.tokens = token_manager

    async def resolve_conflicts(self, optimization_signals: List[Dict[str, Any]]) -> Dict[str, Any]:
        """Resolve conflicting optimization signals using CTRM"""

        conflicts = []

        # Group signals by type
        performance_signals = [s for s in optimization_signals if s["type"] == "performance"]
        pattern_signals = [s for s in optimization_signals if s["type"] == "pattern"]
        resource_signals = [s for s in optimization_signals if s["type"] == "resource"]

        # Check for conflicts
        if performance_signals and pattern_signals:
            # Performance says optimize, pattern says rollback
            performance_trend = await self.analyze_trend(performance_signals)
            pattern_trend = await self.analyze_trend(pattern_signals)

            if (performance_trend["direction"] == "improve" and
                pattern_trend["direction"] == "deteriorate"):

                conflicts.append({
                    "type": "performance_vs_pattern",
                    "performance_confidence": performance_trend["confidence"],
                    "pattern_confidence": pattern_trend["confidence"],
                    "description": "Performance improving but patterns shifting"
                })

        if performance_signals and resource_signals:
            # Performance vs resource allocation conflict
            performance_trend = await self.analyze_trend(performance_signals)
            resource_trend = await self.analyze_trend(resource_signals)

            if (performance_trend["direction"] == "improve" and
                resource_trend["direction"] == "deteriorate"):

                conflicts.append({
                    "type": "performance_vs_resource",
                    "performance_confidence": performance_trend["confidence"],
                    "resource_confidence": resource_trend["confidence"],
                    "description": "Performance improving but resources constrained"
                })

        # Query CTRM for resolution guidance
        resolution_truths = await self.ctrm.find_similar_truths(
            "signal conflict resolution",
            limit=5
        )
        # Filter by confidence manually
        resolution_truths = [
            truth for truth in resolution_truths
            if truth.get("confidence", 0.5) >= 0.8
        ]

        # Apply CTRM-learned resolution strategies
        resolution = await self.apply_ctrm_resolution(
            conflicts,
            resolution_truths
        )

        # Create CTRM truth about this conflict resolution
        resolution_truth = await self.ctrm.create_truth(
            statement=f"Signal conflict resolved: {resolution['decision']}",
            context=json.dumps({
                "confidence": resolution["confidence"],
                "category": "conflict_resolution",
                "conflicts": conflicts,
                "resolution": resolution,
                "signals_analyzed": len(optimization_signals),
                "timestamp": datetime.now().isoformat()
            })
        )

        return {
            "conflicts_detected": len(conflicts) > 0,
            "conflicts": conflicts,
            "resolution": resolution,
            "ctrm_truth_id": resolution_truth.id,
            "confidence": resolution["confidence"]
        }

    async def analyze_trend(self, signals: List[Dict[str, Any]]) -> Dict[str, Any]:
        """Analyze trend from optimization signals"""
        if not signals:
            return {
                "direction": "neutral",
                "confidence": 0.5,
                "magnitude": 0.0
            }

        # Calculate average trend
        avg_trend = sum(s.get("trend", 0.0) for s in signals) / len(signals)
        avg_confidence = sum(s.get("confidence", 0.5) for s in signals) / len(signals)

        # Determine direction
        if avg_trend > 0.1:
            direction = "improve"
        elif avg_trend < -0.1:
            direction = "deteriorate"
        else:
            direction = "neutral"

        return {
            "direction": direction,
            "confidence": avg_confidence,
            "magnitude": abs(avg_trend)
        }

    async def apply_ctrm_resolution(self, conflicts: List[Dict[str, Any]], resolution_truths: List[Dict[str, Any]]) -> Dict[str, Any]:
        """Apply CTRM-learned resolution strategies"""

        if not conflicts:
            return {
                "decision": "no_conflicts",
                "confidence": 1.0,
                "action": "proceed_with_optimization"
            }

        # Default resolution strategy
        resolution = {
            "decision": "conservative_optimization",
            "confidence": 0.7,
            "action": "reduce_optimization_aggressiveness"
        }

        # Apply CTRM-learned strategies
        for conflict in conflicts:
            conflict_type = conflict["type"]

            # Find relevant resolution truths
            relevant_truths = [
                t for t in resolution_truths
                if conflict_type in t.get("statement", "").lower()
            ]

            if relevant_truths:
                # Use the highest confidence resolution
                best_truth = max(relevant_truths, key=lambda x: x.get("confidence", 0.5))
                resolution_confidence = best_truth.get("confidence", 0.7)

                # Parse resolution from truth statement
                statement = best_truth.get("statement", "").lower()

                if "rollback" in statement:
                    resolution = {
                        "decision": "rollback_recommended",
                        "confidence": resolution_confidence,
                        "action": "trigger_rollback_protocol"
                    }
                elif "pause" in statement or "stop" in statement:
                    resolution = {
                        "decision": "pause_optimization",
                        "confidence": resolution_confidence,
                        "action": "pause_evolution_cycles"
                    }
                elif "conservative" in statement:
                    resolution = {
                        "decision": "conservative_optimization",
                        "confidence": resolution_confidence,
                        "action": "reduce_optimization_aggressiveness"
                    }
                elif "aggressive" in statement:
                    resolution = {
                        "decision": "aggressive_optimization",
                        "confidence": resolution_confidence,
                        "action": "increase_optimization_aggressiveness"
                    }

        return resolution

    async def detect_optimization_conflicts(self, evolution_result: Dict[str, Any]) -> List[Dict[str, Any]]:
        """Detect conflicts in evolution results"""

        conflicts = []
        optimization_signals = []

        # Extract signals from evolution result
        validation = evolution_result.get("validation", {})
        if validation:
            if validation.get("valid", False):
                optimization_signals.append({
                    "type": "performance",
                    "trend": validation.get("improvement_score", 0.0),
                    "confidence": validation.get("confidence_in_validation", 0.7),
                    "source": "evolution_validation"
                })
            else:
                optimization_signals.append({
                    "type": "performance",
                    "trend": -validation.get("improvement_score", 0.0),
                    "confidence": validation.get("confidence_in_validation", 0.7),
                    "source": "evolution_validation"
                })

        # Check for pattern shift signals
        pattern_shift_truths = await self.ctrm.find_similar_truths(
            "pattern shift",
            limit=3
        )

        if pattern_shift_truths:
            avg_confidence = sum(t.get("confidence", 0.5) for t in pattern_shift_truths) / len(pattern_shift_truths)
            optimization_signals.append({
                "type": "pattern",
                "trend": -0.5,  # Negative trend for pattern shifts
                "confidence": avg_confidence,
                "source": "pattern_shift_detection"
            })

        # Check for resource constraints
        resource_truths = await self.ctrm.find_similar_truths(
            "token budget",
            limit=3
        )

        if resource_truths:
            avg_confidence = sum(t.get("confidence", 0.5) for t in resource_truths) / len(resource_truths)
            optimization_signals.append({
                "type": "resource",
                "trend": -0.3 if any("low" in t.get("statement", "").lower() for t in resource_truths) else 0.2,
                "confidence": avg_confidence,
                "source": "resource_analysis"
            })

        return optimization_signals

    async def resolve_evolution_conflicts(self, evolution_result: Dict[str, Any]) -> Dict[str, Any]:
        """Resolve conflicts in evolution results"""

        # Detect conflicts
        optimization_signals = await self.detect_optimization_conflicts(evolution_result)

        # Resolve conflicts
        resolution = await self.resolve_conflicts(optimization_signals)

        return resolution