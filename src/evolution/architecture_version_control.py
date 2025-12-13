import asyncio
import time
import json
import hashlib
from typing import Dict, Any, List
from datetime import datetime

class ArchitectureVersionControl:
    def __init__(self, ctrm, token_manager):
        self.ctrm = ctrm
        self.tokens = token_manager
        self.version_history = []
        self.current_version = None
        self.max_history = 50  # Keep last 50 versions

    async def commit_architecture(self, architecture: Dict[str, Any], ctrm_analysis: Dict[str, Any]) -> Dict[str, Any]:
        """Commit architecture with CTRM truth anchor"""

        # Generate architecture hash
        arch_hash = self.hash_architecture(architecture)

        # Create CTRM truth for this version
        version_truth = await self.ctrm.create_truth(
            statement=f"Architecture version {len(self.version_history) + 1}: {arch_hash}",
            context=json.dumps({
                "confidence": ctrm_analysis.get("confidence", 0.5),
                "distance_from_center": 30,  # Experimental zone
                "category": "architecture_version",
                "architecture_hash": arch_hash,
                "ctrm_analysis": ctrm_analysis,
                "performance_metrics": await self.get_current_metrics(),
                "timestamp": datetime.now().isoformat(),
                "version_id": f"v{len(self.version_history) + 1}"
            })
        )

        # Store version
        version_data = {
            "version_id": f"v{len(self.version_history) + 1}",
            "architecture": architecture,
            "architecture_hash": arch_hash,
            "ctrm_truth_id": version_truth.id,
            "timestamp": datetime.now().isoformat(),
            "performance_baseline": await self.get_current_metrics(),
            "ctrm_analysis": ctrm_analysis
        }

        self.version_history.append(version_data)

        # Keep history size limited
        if len(self.version_history) > self.max_history:
            self.version_history = self.version_history[-self.max_history:]

        self.current_version = version_data

        return {
            "version_id": version_data["version_id"],
            "ctrm_truth_id": version_truth.id,
            "architecture_hash": arch_hash,
            "confidence": version_truth.confidence
        }

    async def rollback_if_needed(self, new_performance: Dict[str, Any], pattern_shift_detected: bool = False) -> Dict[str, Any]:
        """Smart rollback based on CTRM confidence"""

        if not self.current_version:
            return {
                "rollback_executed": False,
                "reason": "no_current_version",
                "confidence": 0.0
            }

        # Calculate performance delta
        baseline = self.current_version["performance_baseline"]
        performance_delta = await self.calculate_delta(new_performance, baseline)

        # CTRM analysis of whether to rollback
        rollback_analysis = {
            "performance_degradation": performance_delta < -0.1,  # >10% worse
            "pattern_shift_detected": pattern_shift_detected,
            "confidence_in_measurement": await self.get_measurement_confidence(),
            "ctrm_truths_supporting_rollback": await self.find_rollback_supporting_truths()
        }

        # Decision logic with confidence thresholds
        should_rollback = False
        rollback_confidence = 0.0

        if pattern_shift_detected:
            # Pattern shift overrides performance - always rollback
            should_rollback = True
            rollback_confidence = 0.95
        elif performance_delta < -0.2:  # >20% degradation
            should_rollback = True
            rollback_confidence = 0.85
        elif performance_delta < -0.1:  # >10% degradation
            # Check CTRM for similar situations
            similar_truths = await self.ctrm.find_similar_truths(
                "performance degradation rollback",
                limit=5
            )
            # Filter by confidence manually
            similar_truths = [
                truth for truth in similar_truths
                if truth.get("confidence", 0.5) >= 0.7
            ]
            if similar_truths and len(similar_truths) > 2:
                should_rollback = True
                rollback_confidence = 0.75

        if should_rollback:
            rollback_result = await self.execute_rollback(rollback_confidence, rollback_analysis)
            return {
                "rollback_executed": True,
                "confidence": rollback_confidence,
                "reason": rollback_result["reason"],
                "rolled_back_to": rollback_result["rolled_back_to"]
            }

        return {
            "rollback_executed": False,
            "confidence": 0.0,
            "reason": "no_rollback_needed",
            "performance_delta": performance_delta
        }

    async def execute_rollback(self, confidence: float, analysis: Dict[str, Any]) -> Dict[str, Any]:
        """Execute rollback to previous stable version"""

        if len(self.version_history) < 2:
            return {
                "rollback_executed": False,
                "reason": "insufficient_history",
                "confidence": 0.0
            }

        # Find the most recent stable version (not the current one)
        for i in range(len(self.version_history) - 2, -1, -1):
            version = self.version_history[i]
            version_truth = await self.ctrm.get_truth(version["ctrm_truth_id"])

            if version_truth and version_truth.get("confidence", 0.5) > 0.7:
                # This is a stable version, rollback to it
                rollback_truth = await self.ctrm.create_truth(
                    statement=f"Rollback executed: {version['version_id']} (confidence: {confidence:.2f})",
                    context=json.dumps({
                        "confidence": confidence,
                        "category": "rollback_execution",
                        "rolled_back_from": self.current_version["version_id"],
                        "rolled_back_to": version["version_id"],
                        "reason": analysis.get("reason", "performance_degradation"),
                        "performance_delta": analysis.get("performance_delta", 0.0),
                        "timestamp": datetime.now().isoformat()
                    })
                )

                # Update current version
                self.current_version = version

                return {
                    "rollback_executed": True,
                    "rolled_back_to": version["version_id"],
                    "confidence": confidence,
                    "reason": analysis.get("reason", "performance_degradation"),
                    "ctrm_truth_id": rollback_truth.id
                }

        return {
            "rollback_executed": False,
            "reason": "no_stable_version_found",
            "confidence": 0.0
        }

    async def get_current_metrics(self) -> Dict[str, Any]:
        """Get current performance metrics"""
        # Query CTRM for recent performance truths
        performance_truths = await self.ctrm.find_similar_truths(
            "performance metrics",
            limit=5
        )

        metrics = {
            "token_efficiency": 0.0,
            "confidence_scores": [],
            "success_rate": 0.8,
            "timestamp": datetime.now().isoformat()
        }

        for truth in performance_truths:
            try:
                metadata = truth.get("metadata", {})
                context = metadata.get("context", "{}")
                if context:
                    context_data = json.loads(context)
                    if "efficiency" in context_data:
                        metrics["token_efficiency"] = max(metrics["token_efficiency"], context_data["efficiency"])
                    if "confidence" in context_data:
                        metrics["confidence_scores"].append(context_data["confidence"])
            except (json.JSONDecodeError, ValueError, KeyError):
                continue

        if metrics["confidence_scores"]:
            metrics["avg_confidence"] = sum(metrics["confidence_scores"]) / len(metrics["confidence_scores"])
        else:
            metrics["avg_confidence"] = 0.7

        return metrics

    async def calculate_delta(self, new_metrics: Dict[str, Any], baseline_metrics: Dict[str, Any]) -> float:
        """Calculate performance delta between new and baseline metrics"""

        # Calculate weighted delta
        efficiency_delta = new_metrics.get("token_efficiency", 0.0) - baseline_metrics.get("token_efficiency", 0.0)
        confidence_delta = new_metrics.get("avg_confidence", 0.7) - baseline_metrics.get("avg_confidence", 0.7)
        success_delta = new_metrics.get("success_rate", 0.8) - baseline_metrics.get("success_rate", 0.8)

        # Combine with weights
        delta = (
            efficiency_delta * 0.4 +
            confidence_delta * 0.3 +
            success_delta * 0.3
        )

        return delta

    async def get_measurement_confidence(self) -> float:
        """Get confidence in performance measurements"""
        # Query CTRM for measurement confidence
        measurement_truths = await self.ctrm.find_similar_truths(
            "measurement confidence",
            limit=3
        )

        if measurement_truths:
            avg_confidence = sum(t.get("confidence", 0.7) for t in measurement_truths) / len(measurement_truths)
            return min(0.9, avg_confidence)
        else:
            return 0.75

    async def find_rollback_supporting_truths(self) -> List[Dict[str, Any]]:
        """Find CTRM truths that support rollback decisions"""
        rollback_truths = await self.ctrm.find_similar_truths(
            "rollback decision",
            limit=5
        )
        # Filter by confidence manually
        rollback_truths = [
            truth for truth in rollback_truths
            if truth.get("confidence", 0.5) >= 0.7
        ]

        return rollback_truths

    def hash_architecture(self, architecture: Dict[str, Any]) -> str:
        """Generate hash for architecture state"""
        arch_json = json.dumps(architecture, sort_keys=True)
        return hashlib.md5(arch_json.encode()).hexdigest()

    async def get_version_history(self) -> List[Dict[str, Any]]:
        """Get version history"""
        return self.version_history

    async def get_current_version(self) -> Dict[str, Any]:
        """Get current version"""
        return self.current_version