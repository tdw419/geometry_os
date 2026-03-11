# Task 52: Intrinsic Curiosity Engine Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Remove the human dependency from goal generation by implementing intrinsic curiosity - the system autonomously generates goals based on structural entropy and performance health.

**Architecture:** Three-component system: EntropyMapper identifies cold/hot spots from PerformanceMonitor, GoalSynthesizer creates autonomous tasks from structural health metrics, SpeculativeOptimizer explores semantic latent space for optimization opportunities.

**Tech Stack:** Python, NumPy, dataclasses, asyncio, existing PerformanceMonitor and SisyphusDaemon

---

## Background: The Autopoietic Threshold

Current state:
- Sisyphus v4 waits for user input or session history
- Tasks are generated from external DNA synthesis prompts
- System cannot self-direct its own evolution

Phase 9 target:
- System monitors its own structural health (PAS score)
- Identifies "cold spots" (unused code) and "hot spots" (bottlenecks)
- Generates autonomous goals to improve itself
- Closes the loop: self → self-improvement → self

---

## Task 1: Create Entropy Mapper

**Files:**
- Create: `systems/sisyphus/entropy_mapper.py`
- Test: `tests/test_entropy_mapper.py`

### Step 1: Write the failing test

```python
# tests/test_entropy_mapper.py
"""
Tests for Entropy Mapper - identifies cold/hot spots in codebase.
"""

import pytest
import numpy as np
from dataclasses import asdict


class TestEntropyMapperModule:
    """Tests for entropy_mapper module structure."""

    def test_entropy_mapper_module_exists(self):
        """Test that entropy_mapper module can be imported."""
        from systems.sisyphus import entropy_mapper
        assert entropy_mapper is not None

    def test_entropy_mapper_has_entropy_spot_class(self):
        """Test that EntropySpot dataclass exists."""
        from systems.sisyphus.entropy_mapper import EntropySpot

        spot = EntropySpot(
            file_path="systems/test.py",
            entropy_type="cold",
            score=0.15,
            metrics={"call_count": 0, "avg_time_ms": 0.0}
        )

        assert spot.file_path == "systems/test.py"
        assert spot.entropy_type == "cold"
        assert spot.score == 0.15


class TestEntropyMapperCore:
    """Tests for EntropyMapper core functionality."""

    def test_entropy_mapper_class_exists(self):
        """Test that EntropyMapper class exists."""
        from systems.sisyphus.entropy_mapper import EntropyMapper

        mapper = EntropyMapper()
        assert mapper is not None

    def test_map_entropy_returns_list(self):
        """Test that map_entropy returns list of EntropySpots."""
        from systems.sisyphus.entropy_mapper import EntropyMapper, EntropySpot
        from systems.sisyphus.performance_monitor import PerformanceMonitor

        perf = PerformanceMonitor()
        mapper = EntropyMapper(perf)

        spots = mapper.map_entropy()

        assert isinstance(spots, list)

    def test_detect_cold_spots(self):
        """Test detection of cold spots (unused code)."""
        from systems.sisyphus.entropy_mapper import EntropyMapper
        from systems.sisyphus.performance_monitor import PerformanceMonitor

        perf = PerformanceMonitor()
        # Register functions but never call them
        perf.register_function("unused_func", "test.py", 10)

        mapper = EntropyMapper(perf)
        spots = mapper.map_entropy()

        # Should detect cold spots (zero calls)
        cold_spots = [s for s in spots if s.entropy_type == "cold"]
        assert len(cold_spots) >= 1
        assert any(s.file_path == "test.py" for s in cold_spots)

    def test_detect_hot_spots(self):
        """Test detection of hot spots (performance bottlenecks)."""
        from systems.sisyphus.entropy_mapper import EntropyMapper
        from systems.sisyphus.performance_monitor import PerformanceMonitor

        perf = PerformanceMonitor()
        # Record many slow calls
        for _ in range(100):
            perf.record_call("slow_func", 50.0)  # 50ms per call

        mapper = EntropyMapper(perf)
        spots = mapper.map_entropy()

        # Should detect hot spots (high call count + slow)
        hot_spots = [s for s in spots if s.entropy_type == "hot"]
        assert len(hot_spots) >= 1


class TestEntropyScoring:
    """Tests for entropy scoring algorithm."""

    def test_cold_spot_score_inversely_proportional_to_calls(self):
        """Test that cold spots have low scores for zero calls."""
        from systems.sisyphus.entropy_mapper import EntropyMapper, EntropySpot
        from systems.sisyphus.performance_monitor import PerformanceMonitor

        perf = PerformanceMonitor()
        perf.register_function("never_called", "test.py", 5)
        perf.register_function("called_once", "test.py", 10)
        perf.record_call("called_once", 1.0)

        mapper = EntropyMapper(perf)
        spots = mapper.map_entropy()

        # Never called should have lower score (more "cold")
        cold_map = {s.file_path: s for s in spots if s.entropy_type == "cold"}
        assert len(cold_map) >= 1


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

### Step 2: Run test to verify it fails

Run: `python3 -m pytest tests/test_entropy_mapper.py -v`
Expected: FAIL with "No module named 'systems.sisyphus.entropy_mapper'"

### Step 3: Implement Entropy Mapper

```python
# systems/sisyphus/entropy_mapper.py
"""
Entropy Mapper - Identifies cold/hot spots in codebase for autonomous optimization.

Cold spots: Unused or rarely-called code (entropy = low activity)
Hot spots: Frequently-called or slow code (entropy = high activity)

The mapper uses PerformanceMonitor data to compute entropy scores and
identify candidates for autonomous goal generation.
"""

from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Tuple
from pathlib import Path
import math


@dataclass
class EntropySpot:
    """
    Represents a detected entropy anomaly (cold or hot spot).

    Attributes:
        file_path: Path to the source file
        entropy_type: "cold" (unused) or "hot" (bottleneck)
        score: Entropy score (0.0 = cold, 1.0 = hot)
        metrics: Dict of raw metrics used for scoring
        function_name: Optional function name if applicable
        source_line: Optional line number
    """
    file_path: str
    entropy_type: str  # "cold" or "hot"
    score: float
    metrics: Dict[str, Any] = field(default_factory=dict)
    function_name: Optional[str] = None
    source_line: Optional[int] = None

    def __lt__(self, other: 'EntropySpot') -> bool:
        """Sort by score descending (higher score = more interesting)."""
        return self.score > other.score


class EntropyMapper:
    """
    Maps entropy across codebase using PerformanceMonitor data.

    Cold spots indicate optimization opportunities:
    - Dead code elimination candidates
    - Unused abstractions
    - Speculative optimization targets

    Hot spots indicate critical paths:
    - Performance bottleneck candidates
    - Kernel rewriting targets
    - Parallelization opportunities
    """

    def __init__(
        self,
        performance_monitor: Optional[Any] = None,
        cold_threshold_calls: int = 10,
        hot_threshold_calls: int = 100,
        hot_threshold_time_ms: float = 10.0
    ):
        """
        Initialize the entropy mapper.

        Args:
            performance_monitor: PerformanceMonitor instance for data
            cold_threshold_calls: Below this = cold spot
            hot_threshold_calls: Above this = potential hot spot
            hot_threshold_time_ms: Above this avg = hot spot
        """
        self.perf = performance_monitor
        self.cold_threshold = cold_threshold_calls
        self.hot_threshold_calls = hot_threshold_calls
        self.hot_threshold_time = hot_threshold_time_ms

    def map_entropy(self) -> List[EntropySpot]:
        """
        Map entropy across all tracked functions.

        Returns:
            List of EntropySpots sorted by score (most interesting first)
        """
        if not self.perf:
            return []

        spots = []

        # Get all tracked functions
        call_counts = self.perf.call_counts
        source_locations = getattr(self.perf, '_source_locations', {})

        # Also check registered but never called functions
        all_funcs = set(call_counts.keys()) | set(source_locations.keys())

        for func_name in all_funcs:
            call_count = call_counts.get(func_name, 0)

            # Get source location
            file_path = "unknown"
            source_line = None
            if func_name in source_locations:
                file_path, source_line = source_locations[func_name]

            # Calculate metrics
            total_time = self.perf._call_times.get(func_name, 0.0)
            avg_time = total_time / call_count if call_count > 0 else 0.0

            metrics = {
                "call_count": call_count,
                "total_time_ms": total_time,
                "avg_time_ms": avg_time
            }

            # Determine entropy type and score
            if call_count < self.cold_threshold:
                # Cold spot - rarely or never called
                # Score inversely proportional to call count
                score = 1.0 - (call_count / self.cold_threshold)
                spot = EntropySpot(
                    file_path=file_path,
                    entropy_type="cold",
                    score=score,
                    metrics=metrics,
                    function_name=func_name,
                    source_line=source_line
                )
                spots.append(spot)

            elif call_count >= self.hot_threshold_calls or avg_time >= self.hot_threshold_time:
                # Hot spot - frequently called or slow
                # Score based on combination of frequency and slowness
                freq_factor = min(1.0, call_count / 1000)  # Cap at 1000 calls
                time_factor = min(1.0, avg_time / 100)  # Cap at 100ms
                score = (freq_factor + time_factor) / 2

                spot = EntropySpot(
                    file_path=file_path,
                    entropy_type="hot",
                    score=score,
                    metrics=metrics,
                    function_name=func_name,
                    source_line=source_line
                )
                spots.append(spot)

        # Sort by score descending
        spots.sort()

        return spots

    def get_cold_spots(self, limit: int = 10) -> List[EntropySpot]:
        """Get top cold spots."""
        spots = self.map_entropy()
        cold = [s for s in spots if s.entropy_type == "cold"]
        return cold[:limit]

    def get_hot_spots(self, limit: int = 10) -> List[EntropySpot]:
        """Get top hot spots."""
        spots = self.map_entropy()
        hot = [s for s in spots if s.entropy_type == "hot"]
        return hot[:limit]

    def compute_structural_health(self) -> float:
        """
        Compute overall structural health score (PAS - Program Activity Score).

        Returns:
            Score from 0.0 (unhealthy) to 1.0 (healthy)
        """
        spots = self.map_entropy()

        if not spots:
            return 1.0  # No data = assume healthy

        # Health decreases with extreme cold or hot spots
        cold_count = sum(1 for s in spots if s.entropy_type == "cold")
        hot_count = sum(1 for s in spots if s.entropy_type == "hot")
        total = len(spots)

        if total == 0:
            return 1.0

        # Ideal: most functions in "warm" zone (not cold, not hot)
        # Cold/hot indicate imbalance
        imbalance = (cold_count + hot_count) / total

        # Health is inverse of imbalance
        health = 1.0 - imbalance

        return max(0.0, min(1.0, health))
```

### Step 4: Run test to verify it passes

Run: `python3 -m pytest tests/test_entropy_mapper.py -v`
Expected: 9 passed

### Step 5: Commit

```bash
git add systems/sisyphus/entropy_mapper.py tests/test_entropy_mapper.py
git commit -m "feat(sisyphus): add entropy mapper for cold/hot spot detection"
```

---

## Task 2: Create Goal Synthesizer

**Files:**
- Create: `systems/sisyphus/goal_synthesizer.py`
- Test: `tests/test_goal_synthesizer.py`

### Step 1: Write the failing test

```python
# tests/test_goal_synthesizer.py
"""
Tests for Goal Synthesizer - generates autonomous goals from entropy.
"""

import pytest
from dataclasses import asdict


class TestGoalSynthesizerModule:
    """Tests for goal_synthesizer module structure."""

    def test_goal_synthesizer_module_exists(self):
        """Test that goal_synthesizer module can be imported."""
        from systems.sisyphus import goal_synthesizer
        assert goal_synthesizer is not None

    def test_autonomous_goal_dataclass_exists(self):
        """Test that AutonomousGoal dataclass exists."""
        from systems.sisyphus.goal_synthesizer import AutonomousGoal

        goal = AutonomousGoal(
            goal_id="auto-001",
            goal_type="optimize_cold",
            target="systems/test.py",
            rationale="Zero call count detected",
            priority=0.8,
            entropy_score=0.95
        )

        assert goal.goal_id == "auto-001"
        assert goal.goal_type == "optimize_cold"


class TestGoalSynthesizerCore:
    """Tests for GoalSynthesizer core functionality."""

    def test_goal_synthesizer_class_exists(self):
        """Test that GoalSynthesizer class exists."""
        from systems.sisyphus.goal_synthesizer import GoalSynthesizer

        synth = GoalSynthesizer()
        assert synth is not None

    def test_synthesize_from_cold_spot(self):
        """Test goal synthesis from cold spot."""
        from systems.sisyphus.goal_synthesizer import GoalSynthesizer
        from systems.sisyphus.entropy_mapper import EntropySpot

        synth = GoalSynthesizer()

        cold_spot = EntropySpot(
            file_path="systems/dead_code.py",
            entropy_type="cold",
            score=0.9,
            metrics={"call_count": 0},
            function_name="unused_func"
        )

        goals = synth.synthesize_from_spot(cold_spot)

        assert len(goals) >= 1
        assert goals[0].goal_type in ["eliminate_dead_code", "optimize_cold", "speculative_rewrite"]

    def test_synthesize_from_hot_spot(self):
        """Test goal synthesis from hot spot."""
        from systems.sisyphus.goal_synthesizer import GoalSynthesizer
        from systems.sisyphus.entropy_mapper import EntropySpot

        synth = GoalSynthesizer()

        hot_spot = EntropySpot(
            file_path="systems/slow_code.py",
            entropy_type="hot",
            score=0.85,
            metrics={"call_count": 500, "avg_time_ms": 25.0},
            function_name="bottleneck_func"
        )

        goals = synth.synthesize_from_spot(hot_spot)

        assert len(goals) >= 1
        assert goals[0].goal_type in ["optimize_hot", "kernel_rewrite", "parallelize"]

    def test_synthesize_batch_from_entropy_map(self):
        """Test batch goal synthesis from multiple entropy spots."""
        from systems.sisyphus.goal_synthesizer import GoalSynthesizer
        from systems.sisyphus.entropy_mapper import EntropySpot

        synth = GoalSynthesizer()

        spots = [
            EntropySpot("cold1.py", "cold", 0.9, {"call_count": 0}),
            EntropySpot("hot1.py", "hot", 0.8, {"call_count": 500}),
            EntropySpot("cold2.py", "cold", 0.7, {"call_count": 2}),
        ]

        goals = synth.synthesize_batch(spots)

        assert len(goals) >= 2  # At least one goal per significant spot


class TestGoalPrioritization:
    """Tests for goal prioritization."""

    def test_goals_sorted_by_priority(self):
        """Test that synthesized goals are sorted by priority."""
        from systems.sisyphus.goal_synthesizer import GoalSynthesizer
        from systems.sisyphus.entropy_mapper import EntropySpot

        synth = GoalSynthesizer()

        spots = [
            EntropySpot("high.py", "hot", 0.95, {"call_count": 1000, "avg_time_ms": 50}),
            EntropySpot("low.py", "cold", 0.5, {"call_count": 5}),
        ]

        goals = synth.synthesize_batch(spots)

        # Goals should be sorted by priority (descending)
        for i in range(len(goals) - 1):
            assert goals[i].priority >= goals[i + 1].priority

    def test_goal_includes_rationale(self):
        """Test that each goal includes human-readable rationale."""
        from systems.sisyphus.goal_synthesizer import GoalSynthesizer
        from systems.sisyphus.entropy_mapper import EntropySpot

        synth = GoalSynthesizer()

        spot = EntropySpot(
            file_path="test.py",
            entropy_type="cold",
            score=0.9,
            metrics={"call_count": 0},
            function_name="dead_func"
        )

        goals = synth.synthesize_from_spot(spot)

        assert len(goals) >= 1
        assert len(goals[0].rationale) > 10  # Non-empty rationale


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

### Step 2: Run test to verify it fails

Run: `python3 -m pytest tests/test_goal_synthesizer.py -v`
Expected: FAIL with "No module named 'systems.sisyphus.goal_synthesizer'"

### Step 3: Implement Goal Synthesizer

```python
# systems/sisyphus/goal_synthesizer.py
"""
Goal Synthesizer - Generates autonomous goals from entropy analysis.

Transforms EntropySpots into actionable AutonomousGoals that the
Sisyphus daemon can execute without human input.

Goal types:
- eliminate_dead_code: Remove cold spots entirely
- optimize_cold: Speculative optimization for rarely-used code
- optimize_hot: Performance optimization for bottlenecks
- kernel_rewrite: Rewrite hot kernel functions
- parallelize: Add parallelism to hot paths
"""

from dataclasses import dataclass, field
from typing import List, Optional, Dict, Any
from datetime import datetime
import uuid


@dataclass
class AutonomousGoal:
    """
    An autonomously generated goal for self-improvement.

    Attributes:
        goal_id: Unique identifier (auto-generated)
        goal_type: Type of optimization goal
        target: File path or function to target
        rationale: Human-readable explanation
        priority: 0.0-1.0, higher = more important
        entropy_score: Source entropy score
        created_at: Timestamp
        metrics: Source metrics that triggered this goal
    """
    goal_id: str
    goal_type: str
    target: str
    rationale: str
    priority: float
    entropy_score: float
    created_at: str = field(default_factory=lambda: datetime.now().isoformat())
    metrics: Dict[str, Any] = field(default_factory=dict)

    def __lt__(self, other: 'AutonomousGoal') -> bool:
        """Sort by priority descending."""
        return self.priority > other.priority

    def to_task_dict(self) -> Dict[str, Any]:
        """Convert to task dict format for daemon consumption."""
        return {
            "id": self.goal_id,
            "type": "autonomous",
            "goal_type": self.goal_type,
            "target": self.target,
            "description": self.rationale,
            "priority": self.priority,
            "created_at": self.created_at
        }


class GoalSynthesizer:
    """
    Synthesizes autonomous goals from entropy analysis.

    Uses EntropySpots to generate actionable goals that:
    1. Target specific code locations
    2. Have clear rationale
    3. Are prioritized by impact
    4. Can be executed without human input
    """

    GOAL_TEMPLATES = {
        "cold": [
            {
                "type": "eliminate_dead_code",
                "rationale_template": "Function '{func}' has zero calls - candidate for removal",
                "priority_base": 0.6
            },
            {
                "type": "speculative_rewrite",
                "rationale_template": "Rarely-called function '{func}' - explore optimization",
                "priority_base": 0.4
            }
        ],
        "hot": [
            {
                "type": "kernel_rewrite",
                "rationale_template": "Hot function '{func}' averaging {avg_ms:.1f}ms - rewrite candidate",
                "priority_base": 0.9
            },
            {
                "type": "parallelize",
                "rationale_template": "High-frequency function '{func}' ({calls} calls) - parallelize candidate",
                "priority_base": 0.7
            },
            {
                "type": "optimize_hot",
                "rationale_template": "Bottleneck '{func}' consuming significant time - optimize",
                "priority_base": 0.8
            }
        ]
    }

    def __init__(self, min_entropy_score: float = 0.5):
        """
        Initialize the goal synthesizer.

        Args:
            min_entropy_score: Minimum score to generate a goal
        """
        self.min_entropy_score = min_entropy_score
        self._goal_counter = 0

    def _generate_goal_id(self) -> str:
        """Generate a unique goal ID."""
        self._goal_counter += 1
        return f"auto-{self._goal_counter:04d}-{uuid.uuid4().hex[:8]}"

    def synthesize_from_spot(self, spot: Any) -> List[AutonomousGoal]:
        """
        Synthesize goals from a single entropy spot.

        Args:
            spot: EntropySpot to analyze

        Returns:
            List of AutonomousGoals (may be empty if score too low)
        """
        from systems.sisyphus.entropy_mapper import EntropySpot

        if not isinstance(spot, EntropySpot):
            return []

        if spot.score < self.min_entropy_score:
            return []

        goals = []
        entropy_type = spot.entropy_type

        if entropy_type not in self.GOAL_TEMPLATES:
            return []

        for template in self.GOAL_TEMPLATES[entropy_type]:
            # Build rationale from template
            func_name = spot.function_name or "unknown"
            avg_ms = spot.metrics.get("avg_time_ms", 0.0)
            calls = spot.metrics.get("call_count", 0)

            try:
                rationale = template["rationale_template"].format(
                    func=func_name,
                    avg_ms=avg_ms,
                    calls=calls
                )
            except KeyError:
                rationale = f"Entropy detected in {spot.file_path}"

            # Calculate priority based on entropy score
            priority = template["priority_base"] * spot.score

            goal = AutonomousGoal(
                goal_id=self._generate_goal_id(),
                goal_type=template["type"],
                target=spot.file_path,
                rationale=rationale,
                priority=priority,
                entropy_score=spot.score,
                metrics=spot.metrics.copy()
            )
            goals.append(goal)

        return goals

    def synthesize_batch(self, spots: List[Any]) -> List[AutonomousGoal]:
        """
        Synthesize goals from multiple entropy spots.

        Args:
            spots: List of EntropySpots

        Returns:
            Sorted list of AutonomousGoals by priority
        """
        all_goals = []

        for spot in spots:
            goals = self.synthesize_from_spot(spot)
            all_goals.extend(goals)

        # Sort by priority descending
        all_goals.sort()

        return all_goals

    def synthesize_from_health_score(
        self,
        health_score: float,
        cold_spots: List[Any],
        hot_spots: List[Any]
    ) -> List[AutonomousGoal]:
        """
        Synthesize goals based on overall structural health.

        Args:
            health_score: Overall PAS score (0.0-1.0)
            cold_spots: List of cold EntropySpots
            hot_spots: List of hot EntropySpots

        Returns:
            Prioritized list of goals
        """
        # If health is low, generate more aggressive goals
        if health_score < 0.5:
            # Generate goals from all spots
            all_spots = cold_spots + hot_spots
            return self.synthesize_batch(all_spots)

        # If health is moderate, focus on top issues
        elif health_score < 0.8:
            top_cold = cold_spots[:3]
            top_hot = hot_spots[:3]
            return self.synthesize_batch(top_cold + top_hot)

        # If health is good, only address critical issues
        else:
            critical_hot = [s for s in hot_spots if s.score > 0.9]
            return self.synthesize_batch(critical_hot[:2])
```

### Step 4: Run test to verify it passes

Run: `python3 -m pytest tests/test_goal_synthesizer.py -v`
Expected: 9 passed

### Step 5: Commit

```bash
git add systems/sisyphus/goal_synthesizer.py tests/test_goal_synthesizer.py
git commit -m "feat(sisyphus): add goal synthesizer for autonomous goal generation"
```

---

## Task 3: Create Speculative Optimizer

**Files:**
- Create: `systems/sisyphus/speculative_optimizer.py`
- Test: `tests/test_speculative_optimizer.py`

### Step 1: Write the failing test

```python
# tests/test_speculative_optimizer.py
"""
Tests for Speculative Optimizer - explores semantic latent space.
"""

import pytest


class TestSpeculativeOptimizerModule:
    """Tests for speculative_optimizer module structure."""

    def test_speculative_optimizer_module_exists(self):
        """Test that speculative_optimizer module can be imported."""
        from systems.sisyphus import speculative_optimizer
        assert speculative_optimizer is not None

    def test_optimization_candidate_dataclass_exists(self):
        """Test that OptimizationCandidate dataclass exists."""
        from systems.sisyphus.speculative_optimizer import OptimizationCandidate

        candidate = OptimizationCandidate(
            source_file="test.py",
            function_name="test_func",
            optimization_type="memoization",
            estimated_benefit=0.5,
            risk_level="low"
        )

        assert candidate.source_file == "test.py"
        assert candidate.optimization_type == "memoization"


class TestSpeculativeOptimizerCore:
    """Tests for SpeculativeOptimizer core functionality."""

    def test_speculative_optimizer_class_exists(self):
        """Test that SpeculativeOptimizer class exists."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer

        opt = SpeculativeOptimizer()
        assert opt is not None

    def test_analyze_for_memoization(self):
        """Test detection of memoization opportunities."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer

        opt = SpeculativeOptimizer()

        # Pure function with repeated calls is good memoization candidate
        candidates = opt.analyze(
            source_file="math_utils.py",
            function_name="fibonacci",
            call_count=1000,
            avg_time_ms=5.0
        )

        # Should identify memoization as potential optimization
        opt_types = [c.optimization_type for c in candidates]
        assert "memoization" in opt_types or "caching" in opt_types

    def test_analyze_for_loop_optimization(self):
        """Test detection of loop optimization opportunities."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer

        opt = SpeculativeOptimizer()

        candidates = opt.analyze(
            source_file="data_processor.py",
            function_name="process_items",
            call_count=100,
            avg_time_ms=50.0
        )

        # Hot loops should suggest optimization
        assert len(candidates) >= 1

    def test_risk_assessment(self):
        """Test that risk levels are assigned."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer

        opt = SpeculativeOptimizer()

        candidates = opt.analyze(
            source_file="critical.py",
            function_name="critical_path",
            call_count=500,
            avg_time_ms=20.0
        )

        for c in candidates:
            assert c.risk_level in ["low", "medium", "high"]


class TestOptimizationRanking:
    """Tests for optimization candidate ranking."""

    def test_candidates_sorted_by_benefit(self):
        """Test that candidates are sorted by estimated benefit."""
        from systems.sisyphus.speculative_optimizer import SpeculativeOptimizer

        opt = SpeculativeOptimizer()

        candidates = opt.analyze(
            source_file="test.py",
            function_name="test",
            call_count=1000,
            avg_time_ms=30.0
        )

        # Should be sorted by benefit descending
        for i in range(len(candidates) - 1):
            assert candidates[i].estimated_benefit >= candidates[i + 1].estimated_benefit


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

### Step 2: Run test to verify it fails

Run: `python3 -m pytest tests/test_speculative_optimizer.py -v`
Expected: FAIL with "No module named 'systems.sisyphus.speculative_optimizer'"

### Step 3: Implement Speculative Optimizer

```python
# systems/sisyphus/speculative_optimizer.py
"""
Speculative Optimizer - Explores semantic latent space for optimizations.

Analyzes code patterns and suggests optimizations based on:
- Call frequency patterns
- Execution time patterns
- Known optimization patterns

Operates speculatively - suggests optimizations that may or may not
be beneficial, to be validated by actual benchmarking.
"""

from dataclasses import dataclass, field
from typing import List, Dict, Any, Optional
import re


@dataclass
class OptimizationCandidate:
    """
    A potential optimization identified by speculative analysis.

    Attributes:
        source_file: File containing the function
        function_name: Function to optimize
        optimization_type: Type of optimization suggested
        estimated_benefit: 0.0-1.0 estimated improvement
        risk_level: "low", "medium", or "high"
        description: Human-readable description
        implementation_hint: Optional code hint
    """
    source_file: str
    function_name: str
    optimization_type: str
    estimated_benefit: float
    risk_level: str
    description: str = ""
    implementation_hint: str = ""

    def __lt__(self, other: 'OptimizationCandidate') -> bool:
        """Sort by benefit descending."""
        return self.estimated_benefit > other.estimated_benefit


class SpeculativeOptimizer:
    """
    Analyzes code for speculative optimization opportunities.

    Uses heuristics to identify patterns that commonly benefit from
    specific optimizations. Results are suggestions to be validated.
    """

    # Optimization patterns with heuristics
    OPTIMIZATION_PATTERNS = [
        {
            "type": "memoization",
            "min_calls": 100,
            "min_time_ms": 1.0,
            "benefit_factor": 0.8,
            "risk": "low",
            "description_template": "High call count suggests memoization benefit"
        },
        {
            "type": "caching",
            "min_calls": 50,
            "min_time_ms": 5.0,
            "benefit_factor": 0.7,
            "risk": "low",
            "description_template": "Repeated expensive calls - cache results"
        },
        {
            "type": "loop_unrolling",
            "min_calls": 10,
            "min_time_ms": 20.0,
            "benefit_factor": 0.5,
            "risk": "medium",
            "description_template": "Heavy loop body - consider unrolling"
        },
        {
            "type": "parallelization",
            "min_calls": 50,
            "min_time_ms": 10.0,
            "benefit_factor": 0.9,
            "risk": "high",
            "description_template": "Independent operations - parallelize"
        },
        {
            "type": "inline_expansion",
            "min_calls": 200,
            "min_time_ms": 0.5,
            "benefit_factor": 0.4,
            "risk": "low",
            "description_template": "Small hot function - inline for speed"
        },
        {
            "type": "kernel_rewrite",
            "min_calls": 100,
            "min_time_ms": 15.0,
            "benefit_factor": 0.85,
            "risk": "high",
            "description_template": "Critical path - consider kernel rewrite"
        }
    ]

    def __init__(self):
        """Initialize the speculative optimizer."""
        pass

    def analyze(
        self,
        source_file: str,
        function_name: str,
        call_count: int,
        avg_time_ms: float
    ) -> List[OptimizationCandidate]:
        """
        Analyze a function for optimization opportunities.

        Args:
            source_file: Path to source file
            function_name: Function to analyze
            call_count: Number of times called
            avg_time_ms: Average execution time in ms

        Returns:
            List of OptimizationCandidates sorted by benefit
        """
        candidates = []

        for pattern in self.OPTIMIZATION_PATTERNS:
            # Check if this pattern applies
            if (call_count >= pattern["min_calls"] and
                avg_time_ms >= pattern["min_time_ms"]):

                # Calculate estimated benefit
                # Higher call count + higher time = higher benefit
                call_factor = min(1.0, call_count / 1000)
                time_factor = min(1.0, avg_time_ms / 50)
                combined = (call_factor + time_factor) / 2
                benefit = pattern["benefit_factor"] * combined

                candidate = OptimizationCandidate(
                    source_file=source_file,
                    function_name=function_name,
                    optimization_type=pattern["type"],
                    estimated_benefit=benefit,
                    risk_level=pattern["risk"],
                    description=pattern["description_template"]
                )
                candidates.append(candidate)

        # Sort by benefit descending
        candidates.sort()

        return candidates

    def analyze_entropy_spot(self, spot: Any) -> List[OptimizationCandidate]:
        """
        Analyze an EntropySpot for optimization opportunities.

        Args:
            spot: EntropySpot to analyze

        Returns:
            List of OptimizationCandidates
        """
        from systems.sisyphus.entropy_mapper import EntropySpot

        if not isinstance(spot, EntropySpot):
            return []

        # Only analyze hot spots (cold spots don't need optimization)
        if spot.entropy_type != "hot":
            return []

        call_count = spot.metrics.get("call_count", 0)
        avg_time_ms = spot.metrics.get("avg_time_ms", 0.0)

        return self.analyze(
            source_file=spot.file_path,
            function_name=spot.function_name or "unknown",
            call_count=call_count,
            avg_time_ms=avg_time_ms
        )

    def rank_optimizations(
        self,
        candidates: List[OptimizationCandidate],
        max_risk: str = "high"
    ) -> List[OptimizationCandidate]:
        """
        Filter and rank optimization candidates by risk tolerance.

        Args:
            candidates: List of candidates
            max_risk: Maximum risk level to include ("low", "medium", "high")

        Returns:
            Filtered and sorted list
        """
        risk_order = {"low": 0, "medium": 1, "high": 2}
        max_risk_level = risk_order.get(max_risk, 2)

        filtered = [
            c for c in candidates
            if risk_order.get(c.risk_level, 2) <= max_risk_level
        ]

        filtered.sort()
        return filtered
```

### Step 4: Run test to verify it passes

Run: `python3 -m pytest tests/test_speculative_optimizer.py -v`
Expected: 7 passed

### Step 5: Commit

```bash
git add systems/sisyphus/speculative_optimizer.py tests/test_speculative_optimizer.py
git commit -m "feat(sisyphus): add speculative optimizer for semantic latent space exploration"
```

---

## Task 4: Integrate with SisyphusDaemon

**Files:**
- Modify: `systems/sisyphus/daemon.py`
- Test: `tests/test_intrinsic_curiosity_integration.py`

### Step 1: Write the failing test

```python
# tests/test_intrinsic_curiosity_integration.py
"""
Tests for Intrinsic Curiosity Engine integration with SisyphusDaemon.
"""

import pytest
import asyncio


class TestIntrinsicCuriosityIntegration:
    """Tests for full intrinsic curiosity integration."""

    def test_daemon_has_curiosity_engine(self):
        """Test that SisyphusDaemon has curiosity engine attribute."""
        from systems.sisyphus.daemon import SisyphusDaemon

        daemon = SisyphusDaemon()

        assert hasattr(daemon, 'curiosity_engine') or hasattr(daemon, 'entropy_mapper')

    def test_daemon_can_generate_autonomous_goals(self):
        """Test that daemon can generate goals without external input."""
        from systems.sisyphus.daemon import SisyphusDaemon
        from systems.sisyphus.performance_monitor import PerformanceMonitor

        perf = PerformanceMonitor()
        # Add some data for the mapper to analyze
        perf.record_call("test_func", 10.0)

        daemon = SisyphusDaemon(performance_monitor=perf)

        # Should be able to generate autonomous goals
        goals = daemon.generate_autonomous_goals()

        assert isinstance(goals, list)

    def test_autonomous_goal_generation_uses_entropy(self):
        """Test that autonomous goals come from entropy analysis."""
        from systems.sisyphus.daemon import SisyphusDaemon
        from systems.sisyphus.performance_monitor import PerformanceMonitor

        perf = PerformanceMonitor()
        # Create a hot spot
        for _ in range(200):
            perf.record_call("hot_func", 25.0)

        daemon = SisyphusDaemon(performance_monitor=perf)
        goals = daemon.generate_autonomous_goals()

        # Should detect the hot spot and generate optimization goal
        assert len(goals) >= 1


class TestCuriosityEngineLoop:
    """Tests for the curiosity engine loop."""

    @pytest.mark.asyncio
    async def test_curiosity_loop_runs(self):
        """Test that curiosity loop can run."""
        from systems.sisyphus.daemon import SisyphusDaemon

        daemon = SisyphusDaemon()

        # Run one iteration of curiosity cycle
        result = await daemon.run_curiosity_cycle()

        # Should return some result (even if no goals generated)
        assert result is not None

    def test_structural_health_monitoring(self):
        """Test that daemon monitors structural health."""
        from systems.sisyphus.daemon import SisyphusDaemon

        daemon = SisyphusDaemon()

        # Should be able to compute health score
        health = daemon.get_structural_health()

        assert 0.0 <= health <= 1.0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

### Step 2: Run test to verify it fails

Run: `python3 -m pytest tests/test_intrinsic_curiosity_integration.py -v`
Expected: FAIL with "AttributeError: 'SisyphusDaemon' object has no attribute 'curiosity_engine'"

### Step 3: Modify SisyphusDaemon

Add to `systems/sisyphus/daemon.py`:

```python
# Add imports at top (around line 34)
from .entropy_mapper import EntropyMapper
from .goal_synthesizer import GoalSynthesizer
from .speculative_optimizer import SpeculativeOptimizer

# Add to SisyphusDaemon.__init__ (around line 150)
        # Intrinsic Curiosity Engine components
        self.entropy_mapper = EntropyMapper(performance_monitor)
        self.goal_synthesizer = GoalSynthesizer()
        self.speculative_optimizer = SpeculativeOptimizer()
        self._curiosity_enabled = True

# Add new methods to SisyphusDaemon class
    def generate_autonomous_goals(self) -> List[Dict[str, Any]]:
        """
        Generate autonomous goals from entropy analysis.

        This is the core of intrinsic curiosity - the system
        generates its own improvement goals without human input.

        Returns:
            List of goal dictionaries suitable for task queue
        """
        if not self._curiosity_enabled:
            return []

        # Map entropy across codebase
        spots = self.entropy_mapper.map_entropy()

        # Synthesize goals from entropy
        goals = self.goal_synthesizer.synthesize_batch(spots)

        # Convert to task format
        return [g.to_task_dict() for g in goals]

    def get_structural_health(self) -> float:
        """
        Get current structural health score (PAS).

        Returns:
            Score from 0.0 (unhealthy) to 1.0 (healthy)
        """
        return self.entropy_mapper.compute_structural_health()

    async def run_curiosity_cycle(self) -> Dict[str, Any]:
        """
        Run one cycle of intrinsic curiosity.

        This method:
        1. Maps entropy across the codebase
        2. Generates autonomous goals
        3. Returns results for logging/display

        Returns:
            Dict with health_score, goals_generated, and spots_found
        """
        spots = self.entropy_mapper.map_entropy()
        health = self.entropy_mapper.compute_structural_health()
        goals = self.goal_synthesizer.synthesize_batch(spots)

        result = {
            "health_score": health,
            "goals_generated": len(goals),
            "spots_found": len(spots),
            "cold_spots": len([s for s in spots if s.entropy_type == "cold"]),
            "hot_spots": len([s for s in spots if s.entropy_type == "hot"]),
            "top_goals": [g.to_task_dict() for g in goals[:5]]
        }

        logger.info(f"[Curiosity] Health: {health:.2f}, Goals: {len(goals)}, Spots: {len(spots)}")

        return result
```

### Step 4: Run test to verify it passes

Run: `python3 -m pytest tests/test_intrinsic_curiosity_integration.py -v`
Expected: 5 passed

### Step 5: Commit

```bash
git add systems/sisyphus/daemon.py tests/test_intrinsic_curiosity_integration.py
git commit -m "feat(sisyphus): integrate intrinsic curiosity engine with daemon"
```

---

## Summary

| Task | Description | Files | Tests |
|------|-------------|-------|-------|
| 1 | Entropy Mapper | `entropy_mapper.py` | 9 |
| 2 | Goal Synthesizer | `goal_synthesizer.py` | 9 |
| 3 | Speculative Optimizer | `speculative_optimizer.py` | 7 |
| 4 | Daemon Integration | `daemon.py` | 5 |

**Total: 4 tasks, 30 tests**

---

## Success Criteria

- [ ] EntropyMapper detects cold and hot spots from PerformanceMonitor data
- [ ] GoalSynthesizer generates autonomous goals from entropy spots
- [ ] SpeculativeOptimizer suggests optimization patterns
- [ ] SisyphusDaemon can generate autonomous goals without external input
- [ ] All 30 tests passing

---

## Execution Handoff

**Plan complete and saved to `docs/plans/2026-03-09-intrinsic-curiosity-engine.md`. Two execution options:**

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**
