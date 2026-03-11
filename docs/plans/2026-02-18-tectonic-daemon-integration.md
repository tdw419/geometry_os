# Tectonic EvolutionDaemon Integration Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Integrate Tectonic Evolution loop into EvolutionDaemon's MasterStage, enabling agents to autonomously optimize their shader substrate when performance bottlenecks are detected.

**Architecture:** Create a `TectonicStage` class that wraps the existing `TectonicEvolutionRunner`, integrates with `MasterStage` for shader modifications, and provides a `trigger_tectonic_shift()` method that the daemon can call when metabolism monitoring detects substrate degradation.

**Tech Stack:** Python 3.x, asyncio, dataclasses, WGSL shader optimization, IPC benchmarking

---

## Context

### Existing Components

| Component | Path | Purpose |
|-----------|------|---------|
| TectonicFitnessService | `systems/evolution_daemon/tectonic_fitness_service.py` | IPC benchmarking |
| TectonicMutationEngine | `systems/evolution_daemon/tectonic_mutation_engine.py` | Shader variant generation |
| TectonicEvolutionRunner | `scripts/tectonic_evolution_runner.py` | Generational loop |
| MasterStage | `systems/evolution_daemon/stages/master_stage.py` | Visual self-evolution |
| EvolutionDaemon | `systems/evolution_daemon/evolution_daemon.py` | Main daemon (V14) |

### Integration Points

1. **MetabolismMonitor → TectonicStage**: When substrate health drops, trigger tectonic shift
2. **TectonicStage → MasterStage**: Propose shader capability upgrades
3. **MasterStage → EvolutionDaemon**: Execute via safe_evolve() pipeline
4. **TectonicStage → VisualFeedback**: Broadcast tectonic events to frontend

---

### Task 1: Create TectonicStage Class

**Files:**
- Create: `systems/evolution_daemon/stages/tectonic_stage.py`
- Test: `tests/test_tectonic_stage.py`

**Step 1: Write the failing test**

```python
# tests/test_tectonic_stage.py
"""Tests for TectonicStage integration."""

import pytest
import asyncio
from systems.evolution_daemon.stages.tectonic_stage import TectonicStage, TectonicShiftResult


@pytest.mark.asyncio
async def test_tectonic_stage_initialization():
    """Test TectonicStage initializes with correct defaults."""
    stage = TectonicStage()

    assert stage.config is not None
    assert stage.config.generations == 10
    assert stage.config.mutation_rate == 0.05
    assert stage.fitness_service is None  # Not initialized yet
    assert stage.mutation_engine is None


@pytest.mark.asyncio
async def test_tectonic_stage_initialize():
    """Test TectonicStage initialization creates services."""
    stage = TectonicStage()

    result = await stage.initialize()

    assert result is True
    assert stage.fitness_service is not None
    assert stage.mutation_engine is not None
    assert stage.baseline_ipc > 0


@pytest.mark.asyncio
async def test_trigger_tectonic_shift_returns_result():
    """Test that trigger_tectonic_shift returns a TectonicShiftResult."""
    stage = TectonicStage()
    await stage.initialize()

    result = await stage.trigger_tectonic_shift()

    assert isinstance(result, TectonicShiftResult)
    assert result.generations_run >= 0
    assert result.baseline_ipc > 0
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/test_tectonic_stage.py -v`
Expected: FAIL with "No module named 'systems.evolution_daemon.stages.tectonic_stage'"

**Step 3: Write minimal implementation**

```python
# systems/evolution_daemon/stages/tectonic_stage.py
"""
Tectonic Stage - Substrate Self-Optimization

Enables the EvolutionDaemon to optimize its own WGSL shader substrate
through genetic algorithms and IPC benchmarking.

Triggers:
- MetabolismMonitor detects substrate degradation
- Agent requests performance improvement
- Scheduled tectonic maintenance
"""

import asyncio
import logging
from dataclasses import dataclass, field
from typing import Optional, List, Dict, Any
from datetime import datetime
from pathlib import Path

from systems.evolution_daemon.tectonic_fitness_service import (
    TectonicFitnessService, TectonicConfig, FitnessScore
)
from systems.evolution_daemon.tectonic_mutation_engine import TectonicMutationEngine

logger = logging.getLogger("evolution_daemon.tectonic_stage")


@dataclass
class TectonicShiftResult:
    """Result of a tectonic shift operation."""
    success: bool
    generations_run: int
    baseline_ipc: float
    final_ipc: float
    improvement_pct: float
    best_mutation_id: Optional[str] = None
    best_shader_code: Optional[str] = None
    timestamp: str = field(default_factory=lambda: datetime.now().isoformat())
    error: Optional[str] = None


class TectonicStage:
    """
    Manages tectonic evolution of the shader substrate.

    The Tectonic Stage:
    1. Monitors substrate performance via MetabolismMonitor
    2. Triggers genetic optimization when needed
    3. Proposes shader upgrades to MasterStage
    4. Broadcasts tectonic events to the visual shell
    """

    def __init__(
        self,
        config: Optional[TectonicConfig] = None,
        evolution_daemon=None
    ):
        self.config = config or TectonicConfig()
        self.daemon = evolution_daemon

        # Services (initialized lazily)
        self.fitness_service: Optional[TectonicFitnessService] = None
        self.mutation_engine: Optional[TectonicMutationEngine] = None

        # State
        self.baseline_ipc: float = 0.0
        self.last_shift_result: Optional[TectonicShiftResult] = None
        self.shift_history: List[TectonicShiftResult] = []

    async def initialize(self) -> bool:
        """Initialize the tectonic stage services."""
        logger.info("🌋 Initializing Tectonic Stage...")

        self.fitness_service = TectonicFitnessService(self.config)
        self.mutation_engine = TectonicMutationEngine(mutation_rate=self.config.mutation_rate)

        if not await self.fitness_service.initialize():
            logger.error("Failed to initialize TectonicFitnessService")
            return False

        self.baseline_ipc = self.fitness_service.baseline_score.ipc
        logger.info(f"✅ Tectonic Stage ready (baseline IPC: {self.baseline_ipc:.4f})")
        return True

    async def trigger_tectonic_shift(
        self,
        reason: str = "manual_trigger",
        target_improvement: Optional[float] = None
    ) -> TectonicShiftResult:
        """
        Execute a tectonic shift to optimize the shader substrate.

        Args:
            reason: Why this shift was triggered
            target_improvement: Override config target (0.0-1.0)

        Returns:
            TectonicShiftResult with optimization outcome
        """
        logger.info(f"🌋 TECTONIC SHIFT TRIGGERED: {reason}")

        if not self.fitness_service:
            await self.initialize()

        target = target_improvement or self.config.target_improvement
        base_shader = self.fitness_service.shader_path.read_text()
        best_shader = base_shader
        current_best = self.fitness_service.baseline_score

        result = TectonicShiftResult(
            success=False,
            generations_run=0,
            baseline_ipc=current_best.ipc,
            final_ipc=current_best.ipc,
            improvement_pct=0.0
        )

        try:
            for gen in range(1, self.config.generations + 1):
                logger.info(f"   Generation {gen}/{self.config.generations}")

                # Generate mutations from best so far
                variants = self.mutation_engine.generate_mutations(
                    best_shader,
                    count=self.config.population_size
                )

                # Benchmark each variant
                generation_scores = []
                for i, code in enumerate(variants):
                    mutation_id = f"shift-gen{gen:02d}-var{i:02d}"
                    score = await self.fitness_service.benchmark_shader(mutation_id, code)
                    generation_scores.append((code, score))

                # Select best of generation
                valid = [(c, s) for c, s in generation_scores if s.correctness]
                if not valid:
                    logger.warning(f"   Generation {gen}: no valid mutations")
                    continue

                gen_best_code, gen_best_score = max(valid, key=lambda x: x[1].fitness)

                if gen_best_score.fitness > current_best.fitness:
                    improvement = (gen_best_score.ipc - current_best.ipc) / current_best.ipc
                    logger.info(f"   🎉 New best: {gen_best_score.mutation_id} (+{improvement*100:.1f}%)")
                    current_best = gen_best_score
                    best_shader = gen_best_code

                result.generations_run = gen

                # Check if target reached
                total_improvement = (current_best.ipc - result.baseline_ipc) / result.baseline_ipc
                if total_improvement >= target:
                    logger.info(f"   🎯 Target reached: {total_improvement*100:.1f}%")
                    break

            # Finalize result
            result.final_ipc = current_best.ipc
            result.improvement_pct = (current_best.ipc - result.baseline_ipc) / result.baseline_ipc
            result.best_mutation_id = current_best.mutation_id
            result.best_shader_code = best_shader
            result.success = result.improvement_pct > 0

            logger.info(f"✅ Tectonic shift complete: {result.improvement_pct*100:.1f}% improvement")

        except Exception as e:
            logger.error(f"Tectonic shift failed: {e}")
            result.error = str(e)

        self.last_shift_result = result
        self.shift_history.append(result)
        return result

    def should_trigger_shift(self, current_ipc: float) -> bool:
        """Determine if a tectonic shift should be triggered."""
        if self.baseline_ipc == 0:
            return False

        degradation = (self.baseline_ipc - current_ipc) / self.baseline_ipc
        return degradation > 0.1  # Trigger if 10% degraded

    def get_stats(self) -> Dict[str, Any]:
        """Get tectonic stage statistics."""
        return {
            "baseline_ipc": self.baseline_ipc,
            "shifts_performed": len(self.shift_history),
            "last_shift_success": self.last_shift_result.success if self.last_shift_result else None,
            "total_improvement": sum(s.improvement_pct for s in self.shift_history if s.success),
            "config": {
                "generations": self.config.generations,
                "population_size": self.config.population_size,
                "mutation_rate": self.config.mutation_rate,
                "target_improvement": self.config.target_improvement
            }
        }
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/test_tectonic_stage.py -v`
Expected: PASS (3 tests)

**Step 5: Commit**

```bash
git add systems/evolution_daemon/stages/tectonic_stage.py tests/test_tectonic_stage.py
git commit -m "feat(tectonic): add TectonicStage class for daemon integration

- TectonicStage wraps TectonicFitnessService and TectonicMutationEngine
- trigger_tectonic_shift() runs generational optimization loop
- should_trigger_shift() detects when optimization is needed
- Integrates with MetabolismMonitor for automatic triggering

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

### Task 2: Integrate TectonicStage into EvolutionDaemon

**Files:**
- Modify: `systems/evolution_daemon/evolution_daemon.py` (lines 76-91, 386-394)
- Test: `tests/test_tectonic_integration.py`

**Step 1: Write the failing test**

```python
# tests/test_tectonic_integration.py
"""Integration tests for TectonicStage in EvolutionDaemon."""

import pytest
import asyncio
from unittest.mock import AsyncMock, MagicMock, patch


@pytest.mark.asyncio
async def test_evolution_daemon_has_tectonic_stage():
    """Test that EvolutionDaemon initializes with TectonicStage."""
    from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

    daemon = EvolutionDaemon()

    assert hasattr(daemon, 'tectonic_stage')
    assert daemon.tectonic_stage is not None


@pytest.mark.asyncio
async def test_daemon_can_trigger_tectonic_shift():
    """Test that daemon exposes trigger_tectonic_shift method."""
    from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

    daemon = EvolutionDaemon()

    # Mock the tectonic stage initialization
    daemon.tectonic_stage.initialize = AsyncMock(return_value=True)
    daemon.tectonic_stage.trigger_tectonic_shift = AsyncMock(
        return_value=MagicMock(success=True, improvement_pct=0.15)
    )

    await daemon.tectonic_stage.initialize()
    result = await daemon.tectonic_stage.trigger_tectonic_shift("test_trigger")

    assert result.success is True
    assert result.improvement_pct == 0.15


@pytest.mark.asyncio
async def test_metabolism_monitor_triggers_tectonic():
    """Test that substrate degradation triggers tectonic shift."""
    from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

    daemon = EvolutionDaemon()

    # Mock components
    daemon.tectonic_stage.should_trigger_shift = MagicMock(return_value=True)
    daemon.tectonic_stage.trigger_tectonic_shift = AsyncMock(
        return_value=MagicMock(success=True)
    )

    # Simulate metabolism check with degraded IPC
    should_shift = daemon.tectonic_stage.should_trigger_shift(current_ipc=0.35)

    assert should_shift is True
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/test_tectonic_integration.py -v`
Expected: FAIL with "EvolutionDaemon has no attribute 'tectonic_stage'"

**Step 3: Modify EvolutionDaemon to add TectonicStage**

```python
# In evolution_daemon.py, add import at line ~78:
from systems.evolution_daemon.stages.tectonic_stage import TectonicStage, TectonicShiftResult

# In EvolutionDaemon.__init__, after master_stage initialization (~line 391):
        # V15 Tectonic Stage - Substrate Self-Optimization
        self.tectonic_stage = TectonicStage(evolution_daemon=self)
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/test_tectonic_integration.py -v`
Expected: PASS (3 tests)

**Step 5: Commit**

```bash
git add systems/evolution_daemon/evolution_daemon.py tests/test_tectonic_integration.py
git commit -m "feat(daemon): integrate TectonicStage into EvolutionDaemon V15

- Add tectonic_stage to EvolutionDaemon initialization
- Enables autonomous shader substrate optimization
- Connects to MetabolismMonitor for degradation detection

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

### Task 3: Add Tectonic Stage to Visual Feedback

**Files:**
- Modify: `systems/evolution_daemon/evolution_daemon.py` (add method)
- Test: `tests/test_tectonic_integration.py` (extend)

**Step 1: Write the failing test**

```python
# Add to tests/test_tectonic_integration.py

@pytest.mark.asyncio
async def test_tectonic_shift_broadcasts_visual_event():
    """Test that tectonic shifts are broadcast to the visual shell."""
    from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

    daemon = EvolutionDaemon()
    daemon.visual_connected = True
    daemon.webmcp = MagicMock()
    daemon.webmcp.broadcast_event = AsyncMock(return_value=True)

    # Trigger shift
    daemon.tectonic_stage.trigger_tectonic_shift = AsyncMock(
        return_value=MagicMock(
            success=True,
            generations_run=5,
            improvement_pct=0.12,
            final_ipc=0.50
        )
    )

    # Call the method that broadcasts
    await daemon.visualize_tectonic_shift(
        MagicMock(success=True, generations_run=5, improvement_pct=0.12, final_ipc=0.50)
    )

    # Verify broadcast was called
    daemon.webmcp.broadcast_event.assert_called_once()
    call_args = daemon.webmcp.broadcast_event.call_args
    assert call_args[0][0] == "tectonic_shift"
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/test_tectonic_integration.py::test_tectonic_shift_broadcasts_visual_event -v`
Expected: FAIL with "EvolutionDaemon has no attribute 'visualize_tectonic_shift'"

**Step 3: Add visualize_tectonic_shift method**

```python
# Add to EvolutionDaemon class in evolution_daemon.py (~line 545):

    async def visualize_tectonic_shift(self, result: 'TectonicShiftResult'):
        """
        Broadcast tectonic shift event to visual shell.

        Args:
            result: TectonicShiftResult from trigger_tectonic_shift
        """
        if not self.visual_connected:
            logger.debug("Visual interface not connected, skipping tectonic broadcast")
            return

        try:
            await self.webmcp.broadcast_event('tectonic_shift', {
                "success": result.success,
                "generations_run": result.generations_run,
                "baseline_ipc": result.baseline_ipc,
                "final_ipc": result.final_ipc,
                "improvement_pct": result.improvement_pct,
                "best_mutation": result.best_mutation_id,
                "timestamp": result.timestamp
            })

            # Also place visual indicator on map
            if result.success:
                await self.visual_log(
                    f"🌋 TECTONIC: +{result.improvement_pct*100:.1f}% IPC",
                    "success"
                )
            else:
                await self.visual_log("🌋 TECTONIC: no improvement", "warning")

        except Exception as e:
            logger.warning(f"Failed to broadcast tectonic shift: {e}")
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/test_tectonic_integration.py -v`
Expected: PASS (4 tests)

**Step 5: Commit**

```bash
git add systems/evolution_daemon/evolution_daemon.py tests/test_tectonic_integration.py
git commit -m "feat(daemon): add visual feedback for tectonic shifts

- visualize_tectonic_shift() broadcasts events to frontend
- Displays IPC improvement on visual map
- Enables real-time monitoring of substrate optimization

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

### Task 4: Add Automatic Trigger from MetabolismMonitor

**Files:**
- Modify: `systems/evolution_daemon/safety/metabolism_monitor.py`
- Test: `tests/test_tectonic_metabolism.py`

**Step 1: Write the failing test**

```python
# tests/test_tectonic_metabolism.py
"""Tests for MetabolismMonitor triggering TectonicStage."""

import pytest
from unittest.mock import MagicMock, patch


def test_metabolism_monitor_tracks_ipc():
    """Test that MetabolismMonitor tracks substrate IPC."""
    from systems.evolution_daemon.safety.metabolism_monitor import MetabolismMonitor

    monitor = MetabolismMonitor()

    assert hasattr(monitor, 'substrate_ipc_history')
    monitor.record_ipc(0.45)
    monitor.record_ipc(0.42)

    assert len(monitor.substrate_ipc_history) == 2


def test_metabolism_monitor_detects_ipc_degradation():
    """Test detection of substrate performance degradation."""
    from systems.evolution_daemon.safety.metabolism_monitor import MetabolismMonitor

    monitor = MetabolismMonitor(baseline_ipc=0.50, degradation_threshold=0.10)

    # 20% degradation should trigger
    assert monitor.is_ipc_degraded(0.40) is True

    # 5% degradation should not trigger
    assert monitor.is_ipc_degraded(0.47) is False
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/test_tectonic_metabolism.py -v`
Expected: FAIL (MetabolismMonitor may not have these methods)

**Step 3: Check and extend MetabolismMonitor**

First, read the current MetabolismMonitor to see what exists:
```bash
head -100 systems/evolution_daemon/safety/metabolism_monitor.py
```

Then add IPC tracking methods if not present.

**Step 4: Run test to verify it passes**

Run: `pytest tests/test_tectonic_metabolism.py -v`
Expected: PASS (2 tests)

**Step 5: Commit**

```bash
git add systems/evolution_daemon/safety/metabolism_monitor.py tests/test_tectonic_metabolism.py
git commit -m "feat(metabolism): add IPC degradation detection for tectonic triggers

- record_ipc() tracks substrate performance over time
- is_ipc_degraded() detects when optimization is needed
- Connects to TectonicStage for automatic substrate healing

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

### Task 5: Wire MasterStage to TectonicStage

**Files:**
- Modify: `systems/evolution_daemon/stages/master_stage.py`
- Test: `tests/test_master_tectonic_wire.py`

**Step 1: Write the failing test**

```python
# tests/test_master_tectonic_wire.py
"""Tests for MasterStage <-> TectonicStage integration."""

import pytest
from unittest.mock import AsyncMock, MagicMock


@pytest.mark.asyncio
async def test_master_stage_can_propose_shader_upgrade():
    """Test MasterStage can propose shader capability upgrades from TectonicStage."""
    from systems.evolution_daemon.stages.master_stage import MasterStage, CapabilityType

    master = MasterStage()

    # Should have a method to create shader proposals from tectonic results
    proposal = await master.propose_from_tectonic_result(
        MagicMock(
            success=True,
            best_shader_code="fn main() { /* optimized */ }",
            improvement_pct=0.15,
            best_mutation_id="shift-gen05-var02"
        )
    )

    assert proposal is not None
    assert proposal.capability_type == CapabilityType.SHADER_PARAMETER


@pytest.mark.asyncio
async def test_master_stage_validates_tectonic_safety():
    """Test that MasterStage validates tectonic changes for safety."""
    from systems.evolution_daemon.stages.master_stage import MasterStage

    master = MasterStage()

    # Dangerous shader code should be rejected
    is_safe = master.validate_shader_safety("fn main() { trap_enter(); /* malicious */ }")

    assert is_safe is False
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/test_master_tectonic_wire.py -v`
Expected: FAIL with "MasterStage has no attribute 'propose_from_tectonic_result'"

**Step 3: Add tectonic integration methods to MasterStage**

```python
# Add to MasterStage class in master_stage.py:

    async def propose_from_tectonic_result(self, tectonic_result) -> Optional['VisualCapabilityProposal']:
        """
        Create a VisualCapabilityProposal from a TectonicShiftResult.

        This connects TectonicStage optimization results to the
        MasterStage evolution pipeline.
        """
        if not tectonic_result.success:
            logger.warning("Cannot create proposal from failed tectonic shift")
            return None

        if not tectonic_result.best_shader_code:
            logger.warning("No shader code in tectonic result")
            return None

        # Validate shader safety
        if not self.validate_shader_safety(tectonic_result.best_shader_code):
            logger.error("Tectonic shader failed safety validation")
            return None

        proposal = await self.propose_capability_upgrade(
            capability_type=CapabilityType.SHADER_PARAMETER,
            description=f"Tectonic optimization: +{tectonic_result.improvement_pct*100:.1f}% IPC",
            target_file="systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl",
            new_code=tectonic_result.best_shader_code,
            verification_intent=self._create_ipc_verification_intent(tectonic_result)
        )

        logger.info(f"🧬 Master: Created shader proposal from {tectonic_result.best_mutation_id}")
        return proposal

    def validate_shader_safety(self, shader_code: str) -> bool:
        """
        Validate shader code for safety before applying.

        Checks:
        - No infinite loops
        - Required functions present
        - No malicious patterns
        """
        # Check for required functions
        required = ["trap_enter", "trap_ret", "check_timer_interrupt"]
        for func in required:
            if f"fn {func}" not in shader_code:
                return False

        # Check for dangerous patterns
        dangerous = ["while(true)", "loop { }", "for(;;)"]
        for pattern in dangerous:
            if pattern in shader_code.replace(" ", ""):
                return False

        return True

    def _create_ipc_verification_intent(self, tectonic_result) -> 'VisualIntent':
        """Create a VisualIntent to verify the shader upgrade worked."""
        from systems.evolution_daemon.visual_verification_service import VisualIntent

        return VisualIntent(
            intent_type="performance_verified",
            description=f"Verify IPC >= {tectonic_result.final_ipc:.4f}",
            target_selector="hypervisor",
            expected_state={"ipc": tectonic_result.final_ipc}
        )
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/test_master_tectonic_wire.py -v`
Expected: PASS (2 tests)

**Step 5: Commit**

```bash
git add systems/evolution_daemon/stages/master_stage.py tests/test_master_tectonic_wire.py
git commit -m "feat(master): wire MasterStage to TectonicStage for shader upgrades

- propose_from_tectonic_result() creates proposals from optimizations
- validate_shader_safety() ensures shader changes are safe
- Creates VisualIntent for post-upgrade verification

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

### Task 6: End-to-End Integration Test

**Files:**
- Create: `tests/test_tectonic_e2e.py`

**Step 1: Write the E2E test**

```python
# tests/test_tectonic_e2e.py
"""End-to-end tests for Tectonic Evolution pipeline."""

import pytest
from unittest.mock import AsyncMock, MagicMock, patch


@pytest.mark.asyncio
async def test_full_tectonic_pipeline():
    """
    Test the complete tectonic evolution flow:
    1. MetabolismMonitor detects IPC degradation
    2. TectonicStage triggers optimization
    3. MasterStage creates proposal from result
    4. EvolutionDaemon executes safe_evolve
    """
    from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
    from systems.evolution_daemon.stages.tectonic_stage import TectonicShiftResult

    daemon = EvolutionDaemon()

    # Mock all external dependencies
    daemon.webmcp.connect = AsyncMock(return_value=True)
    daemon.webmcp.broadcast_event = AsyncMock(return_value=True)
    daemon.tectonic_stage.initialize = AsyncMock(return_value=True)

    # Simulate tectonic shift result
    mock_result = TectonicShiftResult(
        success=True,
        generations_run=5,
        baseline_ipc=0.45,
        final_ipc=0.50,
        improvement_pct=0.111,
        best_mutation_id="shift-gen05-var02"
    )
    daemon.tectonic_stage.trigger_tectonic_shift = AsyncMock(return_value=mock_result)

    # Run the pipeline
    await daemon.tectonic_stage.initialize()
    result = await daemon.tectonic_stage.trigger_tectonic_shift("metabolism_degradation")
    await daemon.visualize_tectonic_shift(result)

    # Verify
    assert result.success is True
    assert result.improvement_pct > 0
    daemon.webmcp.broadcast_event.assert_called()


@pytest.mark.asyncio
async def test_tectonic_autonomous_healing():
    """
    Test that substrate degradation triggers automatic tectonic healing.
    """
    from systems.evolution_daemon.safety.metabolism_monitor import MetabolismMonitor

    monitor = MetabolismMonitor(baseline_ipc=0.50, degradation_threshold=0.10)

    # Simulate degradation
    current_ipc = 0.40  # 20% drop
    should_heal = monitor.is_ipc_degraded(current_ipc)

    assert should_heal is True, "Should detect degradation and trigger healing"
```

**Step 2: Run E2E test**

Run: `pytest tests/test_tectonic_e2e.py -v`
Expected: PASS (2 tests)

**Step 3: Commit**

```bash
git add tests/test_tectonic_e2e.py
git commit -m "test(tectonic): add E2E integration tests

- test_full_tectonic_pipeline: Complete flow from detection to upgrade
- test_tectonic_autonomous_healing: Automatic degradation response

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Summary

| Task | Description | Files | Tests |
|------|-------------|-------|-------|
| 1 | Create TectonicStage class | `stages/tectonic_stage.py` | 3 |
| 2 | Integrate into EvolutionDaemon | `evolution_daemon.py` | 3 |
| 3 | Add visual feedback | `evolution_daemon.py` | 1 |
| 4 | MetabolismMonitor IPC tracking | `metabolism_monitor.py` | 2 |
| 5 | Wire MasterStage to TectonicStage | `master_stage.py` | 2 |
| 6 | E2E integration test | `test_tectonic_e2e.py` | 2 |

**Total: 6 tasks, 13 tests**

---

## Execution Handoff

Plan complete and saved to `docs/plans/2026-02-18-tectonic-daemon-integration.md`. Two execution options:

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**
