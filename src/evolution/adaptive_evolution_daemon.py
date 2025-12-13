import asyncio
import json
import time
from typing import Dict, Any
from datetime import datetime, timedelta

class AdaptiveEvolutionDaemon:
    def __init__(self, ctrm, token_manager, pattern_detector, version_control, conflict_resolver):
        self.ctrm = ctrm
        self.tokens = token_manager
        self.pattern_detector = pattern_detector
        self.version_control = version_control
        self.conflict_resolver = conflict_resolver
        self.base_frequency = 5  # Base cycle frequency in seconds
        self.current_adaptation = {
            "cycle_frequency": self.base_frequency,
            "evolution_aggressiveness": 0.5,
            "rollback_readiness": 0.3,
            "validation_intensity": 0.7
        }
        self.last_adaptation_time = 0
        self.adaptation_cooldown = 300  # 5 minutes cooldown

    async def adapt_evolution_cycle(self, pattern_shift_detected: bool = False) -> Dict[str, Any]:
        """Dynamically adapt evolution based on current conditions"""

        # Check cooldown period
        current_time = time.time()
        if current_time - self.last_adaptation_time < self.adaptation_cooldown and not pattern_shift_detected:
            return self.current_adaptation

        # Get current system state from CTRM
        system_state_truths = await self.ctrm.find_similar_truths(
            "system_state",
            limit=10
        )

        # Calculate adaptation parameters
        adaptation = {
            "cycle_frequency": self.base_frequency,
            "evolution_aggressiveness": 0.5,  # Default
            "rollback_readiness": 0.3,  # Default
            "validation_intensity": 0.7  # Default
        }

        # Adjust based on pattern shifts
        if pattern_shift_detected:
            # Slow down evolution, increase validation
            adaptation.update({
                "cycle_frequency": self.base_frequency * 2,  # Half frequency
                "evolution_aggressiveness": 0.2,  # More conservative
                "rollback_readiness": 0.8,  # Ready to rollback
                "validation_intensity": 0.9  # Intensive validation
            })

            # Create CTRM truth about adaptation
            adaptation_truth = await self.ctrm.create_truth(
                statement="Evolution adapted: pattern shift detected",
                context=json.dumps({
                    "confidence": 0.85,
                    "category": "evolution_adaptation",
                    "adaptation": adaptation,
                    "reason": "pattern_shift_detected",
                    "timestamp": datetime.now().isoformat()
                })
            )

            self.last_adaptation_time = current_time
            self.current_adaptation = adaptation

            return adaptation

        # Adjust based on recent failures
        recent_failures = await self.get_recent_failure_count(hours=1)
        if recent_failures > 2:
            adaptation.update({
                "evolution_aggressiveness": max(0.1, adaptation["evolution_aggressiveness"] - 0.2),
                "validation_intensity": min(1.0, adaptation["validation_intensity"] + 0.2)
            })

        # Adjust based on token efficiency
        efficiency_status = await self.tokens.get_efficiency_status()
        if efficiency_status.get("conservation_mode", False):
            adaptation.update({
                "cycle_frequency": self.base_frequency * 1.5,
                "evolution_aggressiveness": 0.3,
                "validation_intensity": 0.8
            })
        elif efficiency_status.get("average_efficiency", 0) > 0.002:
            adaptation.update({
                "cycle_frequency": max(3, self.base_frequency * 0.8),
                "evolution_aggressiveness": min(0.7, adaptation["evolution_aggressiveness"] + 0.1)
            })

        # Adjust based on confidence trends
        confidence_trend = await self.get_confidence_trend()
        if confidence_trend < -0.1:  # Confidence decreasing
            adaptation.update({
                "evolution_aggressiveness": max(0.2, adaptation["evolution_aggressiveness"] - 0.1),
                "validation_intensity": min(0.9, adaptation["validation_intensity"] + 0.1)
            })
        elif confidence_trend > 0.1:  # Confidence increasing
            adaptation.update({
                "evolution_aggressiveness": min(0.8, adaptation["evolution_aggressiveness"] + 0.1)
            })

        # Create CTRM truth about adaptation
        adaptation_truth = await self.ctrm.create_truth(
            statement="Evolution adapted: dynamic parameters",
            context=json.dumps({
                "confidence": 0.8,
                "category": "evolution_adaptation",
                "adaptation": adaptation,
                "reason": "dynamic_adaptation",
                "timestamp": datetime.now().isoformat()
            })
        )

        self.last_adaptation_time = current_time
        self.current_adaptation = adaptation

        return adaptation

    async def get_recent_failure_count(self, hours: int = 1) -> int:
        """Get count of recent evolution failures"""
        cutoff_time = datetime.now() - timedelta(hours=hours)

        # Query CTRM for recent failures
        failure_truths = await self.ctrm.find_similar_truths(
            "evolution failure",
            limit=10
        )

        recent_failures = 0
        for truth in failure_truths:
            try:
                metadata = truth.get("metadata", {})
                context = metadata.get("context", "{}")
                if context:
                    context_data = json.loads(context)
                    failure_time_str = context_data.get("timestamp")
                    if failure_time_str:
                        failure_time = datetime.fromisoformat(failure_time_str)
                        if failure_time >= cutoff_time:
                            recent_failures += 1
            except (json.JSONDecodeError, ValueError, KeyError):
                continue

        return recent_failures

    async def get_confidence_trend(self) -> float:
        """Get confidence trend from recent evolution cycles"""
        # Query CTRM for recent confidence truths
        confidence_truths = await self.ctrm.find_similar_truths(
            "confidence score",
            limit=10
        )

        if len(confidence_truths) < 3:
            return 0.0

        # Calculate trend
        confidences = [t.get("confidence", 0.7) for t in confidence_truths]
        trend = (confidences[-1] - confidences[0]) / len(confidences)

        return trend

    async def get_current_adaptation(self) -> Dict[str, Any]:
        """Get current adaptation parameters"""
        return self.current_adaptation

    async def apply_adaptation_to_cycle(self, evolution_cycle_params: Dict[str, Any]) -> Dict[str, Any]:
        """Apply current adaptation to evolution cycle parameters"""

        adaptation = self.current_adaptation

        # Adjust cycle parameters based on adaptation
        adapted_params = evolution_cycle_params.copy()

        # Apply aggressiveness to token budgets
        if "analysis_budget" in adapted_params:
            adapted_params["analysis_budget"] = int(adapted_params["analysis_budget"] * adaptation["evolution_aggressiveness"])
        if "evolution_budget" in adapted_params:
            adapted_params["evolution_budget"] = int(adapted_params["evolution_budget"] * adaptation["evolution_aggressiveness"])
        if "validation_budget" in adapted_params:
            adapted_params["validation_budget"] = int(adapted_params["validation_budget"] * adaptation["validation_intensity"])

        # Apply validation intensity to validation thresholds
        if "validation_threshold" in adapted_params:
            adapted_params["validation_threshold"] = max(0.6, adapted_params["validation_threshold"] - (1 - adaptation["validation_intensity"]) * 0.2)

        return adapted_params

    async def check_adaptation_stability(self) -> Dict[str, Any]:
        """Check if current adaptation is stable"""

        # Check for oscillation patterns
        adaptation_truths = await self.ctrm.find_similar_truths(
            "evolution adaptation",
            limit=5
        )

        if len(adaptation_truths) < 3:
            return {
                "stable": True,
                "reason": "insufficient_history",
                "confidence": 0.9
            }

        # Check for oscillation in aggressiveness
        aggressiveness_values = []
        for truth in adaptation_truths:
            try:
                metadata = truth.get("metadata", {})
                context = metadata.get("context", "{}")
                if context:
                    context_data = json.loads(context)
                    adaptation = context_data.get("adaptation", {})
                    aggressiveness_values.append(adaptation.get("evolution_aggressiveness", 0.5))
            except (json.JSONDecodeError, ValueError, KeyError):
                continue

        if len(aggressiveness_values) >= 3:
            # Check for oscillation pattern
            oscillation_score = 0
            for i in range(1, len(aggressiveness_values)):
                delta = aggressiveness_values[i] - aggressiveness_values[i-1]
                oscillation_score += abs(delta)

            avg_oscillation = oscillation_score / (len(aggressiveness_values) - 1)

            if avg_oscillation > 0.2:  # Significant oscillation
                return {
                    "stable": False,
                    "reason": "aggressiveness_oscillation",
                    "confidence": 0.8,
                    "oscillation_score": avg_oscillation
                }

        return {
            "stable": True,
            "reason": "no_oscillation_detected",
            "confidence": 0.9
        }

    async def stabilize_adaptation(self) -> Dict[str, Any]:
        """Stabilize adaptation when oscillation is detected"""

        # Reset to more conservative settings
        stabilized_adaptation = {
            "cycle_frequency": self.base_frequency * 1.2,
            "evolution_aggressiveness": 0.4,
            "rollback_readiness": 0.5,
            "validation_intensity": 0.8
        }

        # Create CTRM truth about stabilization
        stabilization_truth = await self.ctrm.create_truth(
            statement="Evolution adaptation stabilized",
            context=json.dumps({
                "confidence": 0.85,
                "category": "evolution_stabilization",
                "previous_adaptation": self.current_adaptation,
                "new_adaptation": stabilized_adaptation,
                "reason": "oscillation_detected",
                "timestamp": datetime.now().isoformat()
            })
        )

        self.current_adaptation = stabilized_adaptation
        self.last_adaptation_time = time.time()

        return {
            "stabilized": True,
            "new_adaptation": stabilized_adaptation,
            "ctrm_truth_id": stabilization_truth.id
        }