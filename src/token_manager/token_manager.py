from typing import List, Dict, Any
import json
import time
from datetime import datetime

class TokenManager:
    def __init__(self, daily_budget: int = 100000):
        self.daily_budget = daily_budget
        self.spent_today = 0
        self.budget_categories = {
            "evolution": 0.40,      # 40% for architecture evolution
            "verification": 0.30,   # 30% for truth verification
            "inference": 0.20,      # 20% for user queries
            "maintenance": 0.10     # 10% for system maintenance
        }
        self.category_spending = {
            "evolution": 0,
            "verification": 0,
            "inference": 0,
            "maintenance": 0
        }
        self.efficiency_tracker = TokenEfficiencyTracker()

    async def spend_tokens(self, operation: str, estimated_cost: int, improvement: float = 0.0) -> bool:
        """Check if tokens can be spent, and record if so"""
        category = self.categorize_operation(operation)
        category_budget = self.daily_budget * self.budget_categories[category]
        category_spent = self.category_spending[category]

        if category_spent + estimated_cost > category_budget:
            return False  # Budget exceeded

        if self.spent_today + estimated_cost > self.daily_budget:
            return False  # Overall budget exceeded

        # Check conservation mode for non-critical operations
        if self.efficiency_tracker.is_in_conservation_mode() and estimated_cost > 1000:
            if operation not in ["verification", "critical_evolution"]:
                print(f"⚠️  Conservation mode: blocking {operation} with {estimated_cost} tokens")
                return False

        # Record spending
        self.category_spending[category] += estimated_cost
        self.spent_today += estimated_cost

        # Track efficiency if improvement is provided
        if improvement > 0:
            await self.efficiency_tracker.record_efficiency(operation, estimated_cost, improvement)

        return True

    async def prioritize_operations(self, operations: List[Dict], ctrm) -> List[Dict]:
        """Prioritize operations based on CTRM confidence and token efficiency"""
        prioritized = []
        for op in operations:
            # Calculate expected value per token
            truth = await ctrm.get_truth(op["truth_id"])

            if truth:
                expected_value = (
                    truth["confidence"] * 0.4 +
                    truth["importance_score"] * 0.3 +
                    (1 - truth["distance_from_center"] / 100) * 0.3
                )

                value_per_token = expected_value / op["estimated_tokens"]

                prioritized.append({
                    **op,
                    "value_per_token": value_per_token,
                    "priority_score": value_per_token * expected_value
                })

        return sorted(prioritized, key=lambda x: x["priority_score"], reverse=True)

    def categorize_operation(self, operation: str) -> str:
        """Categorize operation for budgeting"""
        if "evolution" in operation.lower():
            return "evolution"
        elif "verify" in operation.lower():
            return "verification"
        elif "inference" in operation.lower() or "query" in operation.lower():
            return "inference"
        else:
            return "maintenance"

    async def reset_daily_budget(self):
        """Reset daily token budget"""
        self.spent_today = 0
        self.category_spending = {
            "evolution": 0,
            "verification": 0,
            "inference": 0,
            "maintenance": 0
        }

    async def get_budget_status(self) -> Dict[str, Any]:
        """Get current budget status"""
        return {
            "total_budget": self.daily_budget,
            "total_spent": self.spent_today,
            "remaining": self.daily_budget - self.spent_today,
            "categories": {
                cat: {
                    "budget": self.daily_budget * self.budget_categories[cat],
                    "spent": self.category_spending[cat],
                    "remaining": self.daily_budget * self.budget_categories[cat] - self.category_spending[cat]
                }
                for cat in self.budget_categories
            }
        }

    async def has_budget_for(self, operation: str, estimated_cost: int) -> bool:
        """Check if there's budget for a specific operation"""
        category = self.categorize_operation(operation)
        category_budget = self.daily_budget * self.budget_categories[category]
        category_spent = self.category_spending[category]

        return (category_spent + estimated_cost <= category_budget and
                self.spent_today + estimated_cost <= self.daily_budget)

    async def get_available_budget(self, category: str = None) -> int:
        """Get available budget for a specific category or overall"""
        if category:
            category_budget = self.daily_budget * self.budget_categories.get(category, 0)
            category_spent = self.category_spending.get(category, 0)
            return max(0, category_budget - category_spent)
        else:
            return max(0, self.daily_budget - self.spent_today)

    async def get_category_available_budget(self, operation: str) -> int:
        """Get available budget for a specific operation category"""
        category = self.categorize_operation(operation)
        return await self.get_available_budget(category)

    async def get_efficiency_status(self) -> Dict[str, Any]:
        """Get current efficiency status"""
        return await self.efficiency_tracker.get_efficiency_report()

    def is_in_conservation_mode(self) -> bool:
        """Check if in conservation mode"""
        return self.efficiency_tracker.is_in_conservation_mode()

class TokenEfficiencyTracker:
    def __init__(self):
        self.efficiency_history = []
        self.low_efficiency_threshold = 0.00001  # More reasonable minimum efficiency
        self.conservation_mode = False
        self.consecutive_low_efficiency = 0
        self.token_budget = 5000  # Tokens per hour
        self.tokens_used_this_hour = 0
        self.last_hour_reset = time.time()
        self.last_high_efficiency_cycle = 0
        self.efficiency_recovery_threshold = 0.00005  # Threshold to exit conservation mode

    async def record_efficiency(self, operation: str, tokens_spent: int, improvement: float):
        """Record token efficiency for an operation"""
        # Apply realistic efficiency calculation
        if tokens_spent <= 100:
            efficiency = 0.001  # Baseline efficiency for small operations
        else:
            efficiency = improvement / tokens_spent

        # Apply reasonable bounds
        efficiency = max(efficiency, 1e-6)  # At least 0.000001
        efficiency = min(efficiency, 0.01)  # At most 0.01 improvement per token

        self.efficiency_history.append({
            "operation": operation,
            "tokens_spent": tokens_spent,
            "improvement": improvement,
            "efficiency": efficiency,
            "timestamp": datetime.now().isoformat()
        })

        # Remove old entries (keep last 100)
        if len(self.efficiency_history) > 100:
            self.efficiency_history = self.efficiency_history[-100:]

        # Record token usage for hourly budget
        self.tokens_used_this_hour += tokens_spent

        # Reset hourly budget
        if time.time() - self.last_hour_reset > 3600:
            self.tokens_used_this_hour = 0
            self.last_hour_reset = time.time()

        # Check if we should enter/exit conservation mode
        if tokens_spent > 1000:  # Only for significant operations
            if efficiency < self.low_efficiency_threshold:
                self.consecutive_low_efficiency += 1
            else:
                self.consecutive_low_efficiency = 0

            # Only enter conservation mode if consistently inefficient
            if self.consecutive_low_efficiency > 3:  # Reduced from 5 to be more responsive
                self.conservation_mode = True
                print(f"⚠️  Low efficiency detected: {efficiency:.6f}, entering conservation mode")
            elif efficiency > self.efficiency_recovery_threshold and self.conservation_mode:
                # Require sustained recovery before exiting conservation mode
                self.last_high_efficiency_cycle += 1
                if self.last_high_efficiency_cycle >= 2:  # Need 2 consecutive good cycles
                    self.conservation_mode = False
                    self.last_high_efficiency_cycle = 0
                    print(f"🌱 Efficiency recovered: {efficiency:.6f}, exiting conservation mode")
            else:
                self.last_high_efficiency_cycle = 0

        return efficiency

    def get_current_efficiency(self) -> float:
        """Get current average efficiency"""
        if not self.efficiency_history:
            return 0.0
        recent_efficiency = self.efficiency_history[-10:] if len(self.efficiency_history) > 10 else self.efficiency_history
        avg_efficiency = sum(entry["efficiency"] for entry in recent_efficiency) / len(recent_efficiency)
        return avg_efficiency

    def is_in_conservation_mode(self) -> bool:
        """Check if in conservation mode"""
        return self.conservation_mode

    async def get_efficiency_report(self) -> Dict[str, Any]:
        """Get comprehensive efficiency report with dashboard metrics"""
        if not self.efficiency_history:
            return {"status": "no_data"}

        total_tokens = sum(entry["tokens_spent"] for entry in self.efficiency_history)
        total_improvement = sum(entry["improvement"] for entry in self.efficiency_history)
        avg_efficiency = total_improvement / total_tokens if total_tokens > 0 else 0

        # Calculate recent trends (last 10 operations)
        recent_history = self.efficiency_history[-10:] if len(self.efficiency_history) > 10 else self.efficiency_history
        recent_avg_efficiency = sum(entry["efficiency"] for entry in recent_history) / len(recent_history) if recent_history else 0

        # Calculate efficiency categories
        high_efficiency_ops = sum(1 for entry in self.efficiency_history if entry["efficiency"] > 0.001)
        medium_efficiency_ops = sum(1 for entry in self.efficiency_history if 0.0001 <= entry["efficiency"] <= 0.001)
        low_efficiency_ops = sum(1 for entry in self.efficiency_history if entry["efficiency"] < 0.0001)

        # Calculate token efficiency ratio
        efficiency_ratio = (avg_efficiency / self.low_efficiency_threshold) if self.low_efficiency_threshold > 0 else 0

        # Determine trend direction
        if len(self.efficiency_history) > 5:
            old_avg = sum(entry["efficiency"] for entry in self.efficiency_history[:-5]) / len(self.efficiency_history[:-5])
            new_avg = sum(entry["efficiency"] for entry in self.efficiency_history[-5:]) / 5
            trend_direction = "improving" if new_avg > old_avg else "declining"
        else:
            trend_direction = "stable"

        return {
            "total_operations": len(self.efficiency_history),
            "total_tokens_spent": total_tokens,
            "total_improvement": total_improvement,
            "average_efficiency": avg_efficiency,
            "recent_average_efficiency": recent_avg_efficiency,
            "conservation_mode": self.conservation_mode,
            "efficiency_ratio": efficiency_ratio,
            "efficiency_categories": {
                "high_efficiency": high_efficiency_ops,
                "medium_efficiency": medium_efficiency_ops,
                "low_efficiency": low_efficiency_ops
            },
            "recent_trend": trend_direction,
            "consecutive_low_efficiency_cycles": self.consecutive_low_efficiency,
            "efficiency_health_score": min(1.0, max(0.0, efficiency_ratio)),
            "recommendations": self.get_efficiency_recommendations(avg_efficiency, efficiency_ratio)
        }

    def get_efficiency_recommendations(self, avg_efficiency: float, efficiency_ratio: float) -> List[str]:
        """Generate efficiency improvement recommendations"""
        recommendations = []

        # Use dynamic thresholds for recommendations
        critical_threshold = self.low_efficiency_threshold * 0.5  # 50% of low threshold
        warning_threshold = self.low_efficiency_threshold * 0.8  # 80% of low threshold

        if avg_efficiency < critical_threshold:
            recommendations.append(f"CRITICAL: Token efficiency extremely low ({avg_efficiency:.6f}) - consider pausing evolution")
        elif avg_efficiency < warning_threshold:
            recommendations.append(f"WARNING: Token efficiency low ({avg_efficiency:.6f}) - optimize verification frequency")

        if efficiency_ratio < 0.5:
            recommendations.append("Reduce truth verification frequency for high-confidence truths")
        elif efficiency_ratio < 1.0:
            recommendations.append("Implement progressive verification based on confidence levels")

        if self.conservation_mode:
            recommendations.append("CONSERVATION_MODE: Focus on high-value, low-cost operations only")
        else:
            recommendations.append("NORMAL_MODE: Continue current evolution strategy")

        return recommendations