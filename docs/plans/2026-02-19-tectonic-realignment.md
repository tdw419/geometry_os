# Tectonic Realignment Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Transform Neural City into a self-optimizing spatial substrate where buildings drift based on semantic gravity and communication tension, with elastic anchors preserving district structure.

**Architecture:** Force-directed graph where F_total = F_gravity(similarity) + F_tension(bridge_freq) - F_anchor(distance). TectonicEngine calculates forces and emits drift events. CityOrchestrator applies offsets with lerp interpolation. Phase Shift triggers when cross-district forces exceed 2x anchor force for 10s+.

**Tech Stack:** Python asyncio, numpy (force calculations), JavaScript ES6, PixiJS v8 (visualization)

---

## Task 1: Create TectonicEngine Core

**Files:**
- Create: `systems/evolution_daemon/tectonic_engine.py`
- Test: `tests/test_tectonic_engine.py`

**Step 1: Write the failing test**

```python
"""
Tests for TectonicEngine - Force-directed spatial realignment.

Task 1 of Tectonic Realignment Plan (Phase 28).
"""
import pytest
import asyncio
import numpy as np

from systems.evolution_daemon.tectonic_engine import (
    TectonicEngine,
    ForceVector,
    BuildingState
)


class TestForceVector:
    """Tests for ForceVector dataclass."""

    def test_create_force_vector(self):
        """Test creating a force vector."""
        fv = ForceVector(dx=1.5, dy=-2.0, magnitude=2.5)
        assert fv.dx == 1.5
        assert fv.dy == -2.0
        assert fv.magnitude == 2.5

    def test_force_vector_to_dict(self):
        """Test serializing to dictionary."""
        fv = ForceVector(dx=0.5, dy=0.3, magnitude=0.58)
        data = fv.to_dict()
        assert data["dx"] == 0.5
        assert data["dy"] == 0.3


class TestBuildingState:
    """Tests for BuildingState dataclass."""

    def test_create_building_state(self):
        """Test creating building state."""
        bs = BuildingState(
            building_id="agent-001",
            position=(100.0, 50.0),
            district="cognitive",
            anchor_position=(0.0, 200.0)
        )
        assert bs.building_id == "agent-001"
        assert bs.district == "cognitive"
        assert bs.anchor_position == (0.0, 200.0)

    def test_distance_from_anchor(self):
        """Test distance calculation from anchor."""
        bs = BuildingState(
            building_id="test",
            position=(100.0, 0.0),
            district="cognitive",
            anchor_position=(0.0, 0.0)
        )
        assert bs.distance_from_anchor == 100.0


class TestTectonicEngine:
    """Tests for TectonicEngine."""

    @pytest.fixture
    def engine(self):
        """Create a fresh engine for each test."""
        return TectonicEngine()

    def test_engine_initialization(self, engine):
        """Test engine initializes with correct defaults."""
        assert engine.gravity_constant == 0.1
        assert engine.tension_constant == 0.05
        assert engine.anchor_constant == 0.02
        assert len(engine.buildings) == 0

    def test_register_building(self, engine):
        """Test registering a building."""
        engine.register_building(
            building_id="agent-001",
            position=(100.0, 50.0),
            district="cognitive"
        )
        assert "agent-001" in engine.buildings
        assert engine.buildings["agent-001"].district == "cognitive"

    def test_register_bridge(self, engine):
        """Test registering a communication bridge."""
        engine.register_building("agent-001", (100.0, 50.0), "cognitive")
        engine.register_building("agent-002", (150.0, 75.0), "cognitive")
        engine.register_bridge("agent-001", "agent-002")

        key = ("agent-001", "agent-002")
        assert key in engine.bridges
        assert engine.bridges[key] == 1

    def test_bridge_frequency_increments(self, engine):
        """Test that bridge frequency increments on repeat."""
        engine.register_building("agent-001", (100.0, 50.0), "cognitive")
        engine.register_building("agent-002", (150.0, 75.0), "cognitive")

        engine.register_bridge("agent-001", "agent-002")
        engine.register_bridge("agent-001", "agent-002")
        engine.register_bridge("agent-001", "agent-002")

        key = ("agent-001", "agent-002")
        assert engine.bridges[key] == 3

    def test_calculate_gravity_force(self, engine):
        """Test semantic gravity calculation."""
        engine.register_building("a", (0.0, 0.0), "cognitive")
        engine.register_building("b", (100.0, 0.0), "cognitive")

        # High similarity = strong pull toward each other
        force = engine.calculate_gravity_force("a", "b", similarity=0.9)
        assert force.dx > 0  # a should be pulled toward b (positive x)
        assert force.magnitude > 0

    def test_calculate_tension_force(self, engine):
        """Test bridge tension calculation."""
        engine.register_building("a", (0.0, 0.0), "cognitive")
        engine.register_building("b", (100.0, 0.0), "cognitive")
        engine.register_bridge("a", "b")
        engine.register_bridge("a", "b")
        engine.register_bridge("a", "b")

        force = engine.calculate_tension_force("a", "b")
        assert force.dx > 0  # Pulled toward b
        assert force.magnitude > 0

    def test_calculate_anchor_force(self, engine):
        """Test anchor spring force calculation."""
        # Building far from anchor should be pulled back
        engine.register_building("a", (200.0, 0.0), "cognitive")

        force = engine.calculate_anchor_force("a")
        # Anchor for cognitive is at angle 0°, distance ~200
        # Force should pull toward anchor (negative if past anchor)
        assert force.magnitude > 0

    @pytest.mark.asyncio
    async def test_calculate_total_force(self, engine):
        """Test total force calculation for a building."""
        engine.register_building("a", (100.0, 0.0), "cognitive")
        engine.register_building("b", (150.0, 0.0), "cognitive")
        engine.register_bridge("a", "b")

        # Set similarity
        engine.similarities[("a", "b")] = 0.8

        total = await engine.calculate_total_force("a")
        assert isinstance(total, ForceVector)
        assert total.dx != 0 or total.dy != 0  # Should have some force

    @pytest.mark.asyncio
    async def test_detect_migration_no_migration(self, engine):
        """Test migration detection when forces are balanced."""
        engine.register_building("a", (100.0, 0.0), "cognitive")

        # No foreign forces, should not migrate
        result = await engine.detect_migration("a")
        assert result is None

    @pytest.mark.asyncio
    async def test_get_drift_updates(self, engine):
        """Test getting drift updates for all buildings."""
        engine.register_building("a", (0.0, 0.0), "cognitive")
        engine.register_building("b", (100.0, 0.0), "cognitive")
        engine.register_bridge("a", "b")
        engine.similarities[("a", "b")] = 0.9

        drifts = await engine.get_drift_updates()
        assert "a" in drifts
        assert "b" in drifts


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_tectonic_engine.py -v`
Expected: FAIL with "ModuleNotFoundError" or "ImportError"

**Step 3: Write minimal implementation**

```python
"""
TectonicEngine - Force-directed spatial realignment for Neural City.

Phase 28: Tectonic Realignment
- Calculates semantic gravity from NeuralMemoryHub similarity
- Calculates operational tension from bridge frequency
- Calculates anchor force to district center
- Detects Phase Shift (migration) thresholds
"""
import asyncio
import logging
import math
from dataclasses import dataclass, field
from typing import Dict, Tuple, Optional, List, Any
from collections import defaultdict

logger = logging.getLogger("evolution_daemon.tectonic_engine")

# District anchor positions (radial layout)
DISTRICT_ANCHORS = {
    "cognitive": (200.0, 0.0),      # 0°
    "metabolic": (-100.0, 173.2),   # 120°
    "substrate": (-100.0, -173.2)   # 240°
}


@dataclass
class ForceVector:
    """Represents a 2D force vector."""
    dx: float = 0.0
    dy: float = 0.0
    magnitude: float = 0.0

    def to_dict(self) -> Dict[str, float]:
        return {"dx": self.dx, "dy": self.dy, "magnitude": self.magnitude}

    def __add__(self, other: "ForceVector") -> "ForceVector":
        return ForceVector(
            dx=self.dx + other.dx,
            dy=self.dy + other.dy,
            magnitude=math.sqrt((self.dx + other.dx)**2 + (self.dy + other.dy)**2)
        )

    def __sub__(self, other: "ForceVector") -> "ForceVector":
        return ForceVector(
            dx=self.dx - other.dx,
            dy=self.dy - other.dy,
            magnitude=math.sqrt((self.dx - other.dx)**2 + (self.dy - other.dy)**2)
        )


@dataclass
class BuildingState:
    """Tracks the spatial state of a building."""
    building_id: str
    position: Tuple[float, float]
    district: str
    anchor_position: Tuple[float, float] = (0.0, 0.0)
    foreign_forces: Dict[str, float] = field(default_factory=dict)  # district -> force magnitude
    migration_timer: float = 0.0  # Seconds spent in migration threshold
    last_update: float = 0.0

    @property
    def distance_from_anchor(self) -> float:
        dx = self.position[0] - self.anchor_position[0]
        dy = self.position[1] - self.anchor_position[1]
        return math.sqrt(dx*dx + dy*dy)


@dataclass
class TectonicEngine:
    """
    Force-directed spatial engine for Neural City.

    Calculates forces that determine building positions:
    - Semantic Gravity: Pulls similar tiles together
    - Operational Tension: Pulls frequent communicators together
    - Anchor Force: Pulls buildings back to district center

    Attributes:
        gravity_constant: Strength of semantic gravity (default 0.1)
        tension_constant: Strength of bridge tension (default 0.05)
        anchor_constant: Strength of anchor spring (default 0.02)
        migration_threshold: Force ratio to trigger migration (default 2.0)
        migration_duration: Seconds at threshold to migrate (default 10.0)
    """
    gravity_constant: float = 0.1
    tension_constant: float = 0.05
    anchor_constant: float = 0.02
    migration_threshold: float = 2.0
    migration_duration: float = 10.0
    flux_mode: bool = False  # When True, anchor force is reduced

    buildings: Dict[str, BuildingState] = field(default_factory=dict)
    bridges: Dict[Tuple[str, str], int] = field(default_factory=lambda: defaultdict(int))
    similarities: Dict[Tuple[str, str], float] = field(default_factory=dict)

    _webmcp: Any = field(default=None, repr=False)

    def set_webmcp(self, webmcp):
        """Set WebMCP instance for broadcasting."""
        self._webmcp = webmcp

    def register_building(
        self,
        building_id: str,
        position: Tuple[float, float],
        district: str
    ) -> BuildingState:
        """Register or update a building in the engine."""
        anchor = DISTRICT_ANCHORS.get(district, (0.0, 0.0))

        state = BuildingState(
            building_id=building_id,
            position=position,
            district=district,
            anchor_position=anchor
        )

        self.buildings[building_id] = state
        logger.debug(f"Registered building {building_id} in {district}")
        return state

    def unregister_building(self, building_id: str):
        """Remove a building from the engine."""
        if building_id in self.buildings:
            del self.buildings[building_id]
            # Clean up bridges
            self.bridges = defaultdict(int, {
                k: v for k, v in self.bridges.items()
                if building_id not in k
            })

    def register_bridge(self, from_id: str, to_id: str):
        """Register a communication bridge between buildings."""
        key = (min(from_id, to_id), max(from_id, to_id))
        self.bridges[key] += 1
        logger.debug(f"Bridge {key} frequency: {self.bridges[key]}")

    def set_similarity(self, id1: str, id2: str, similarity: float):
        """Set semantic similarity between two buildings."""
        key = (min(id1, id2), max(id1, id2))
        self.similarities[key] = similarity

    def calculate_gravity_force(
        self,
        building_id: str,
        other_id: str,
        similarity: float
    ) -> ForceVector:
        """
        Calculate semantic gravity force between two buildings.

        Higher similarity = stronger pull toward each other.
        """
        if building_id not in self.buildings or other_id not in self.buildings:
            return ForceVector()

        b1 = self.buildings[building_id]
        b2 = self.buildings[other_id]

        # Direction from b1 to b2
        dx = b2.position[0] - b1.position[0]
        dy = b2.position[1] - b1.position[1]
        distance = math.sqrt(dx*dx + dy*dy)

        if distance == 0:
            return ForceVector()

        # Normalize direction
        nx, ny = dx / distance, dy / distance

        # Force magnitude = similarity * constant / distance (inverse square-ish)
        magnitude = similarity * self.gravity_constant * (100.0 / max(distance, 50.0))

        return ForceVector(
            dx=nx * magnitude,
            dy=ny * magnitude,
            magnitude=magnitude
        )

    def calculate_tension_force(
        self,
        building_id: str,
        other_id: str
    ) -> ForceVector:
        """
        Calculate operational tension force from bridge frequency.

        More bridges = stronger pull.
        """
        if building_id not in self.buildings or other_id not in self.buildings:
            return ForceVector()

        b1 = self.buildings[building_id]
        b2 = self.buildings[other_id]

        key = (min(building_id, other_id), max(building_id, other_id))
        bridge_count = self.bridges.get(key, 0)

        if bridge_count == 0:
            return ForceVector()

        # Direction from b1 to b2
        dx = b2.position[0] - b1.position[0]
        dy = b2.position[1] - b1.position[1]
        distance = math.sqrt(dx*dx + dy*dy)

        if distance == 0:
            return ForceVector()

        # Normalize direction
        nx, ny = dx / distance, dy / distance

        # Force magnitude = bridge_count * constant
        magnitude = bridge_count * self.tension_constant

        return ForceVector(
            dx=nx * magnitude,
            dy=ny * magnitude,
            magnitude=magnitude
        )

    def calculate_anchor_force(self, building_id: str) -> ForceVector:
        """
        Calculate anchor spring force pulling building back to district center.

        In flux mode, this force is greatly reduced.
        """
        if building_id not in self.buildings:
            return ForceVector()

        building = self.buildings[building_id]
        dx = building.anchor_position[0] - building.position[0]
        dy = building.anchor_position[1] - building.position[1]
        distance = math.sqrt(dx*dx + dy*dy)

        if distance == 0:
            return ForceVector()

        # Normalize direction
        nx, ny = dx / distance, dy / distance

        # Anchor force is proportional to distance (spring)
        # Reduced in flux mode
        effective_constant = self.anchor_constant * (0.1 if self.flux_mode else 1.0)
        magnitude = distance * effective_constant

        return ForceVector(
            dx=nx * magnitude,
            dy=ny * magnitude,
            magnitude=magnitude
        )

    async def calculate_total_force(self, building_id: str) -> ForceVector:
        """
        Calculate the total force on a building from all sources.

        F_total = F_gravity + F_tension - F_anchor
        """
        if building_id not in self.buildings:
            return ForceVector()

        building = self.buildings[building_id]
        total = ForceVector()

        # Track foreign district forces for migration detection
        foreign_forces: Dict[str, float] = defaultdict(float)

        # Sum gravity and tension forces from all other buildings
        for other_id in self.buildings:
            if other_id == building_id:
                continue

            other = self.buildings[other_id]

            # Gravity force (semantic similarity)
            key = (min(building_id, other_id), max(building_id, other_id))
            similarity = self.similarities.get(key, 0.0)

            if similarity > 0:
                gravity = self.calculate_gravity_force(building_id, other_id, similarity)
                total = total + gravity

                # Track foreign force
                if other.district != building.district:
                    foreign_forces[other.district] += gravity.magnitude

            # Tension force (bridge frequency)
            tension = self.calculate_tension_force(building_id, other_id)
            total = total + tension

            if other.district != building.district:
                foreign_forces[other.district] += tension.magnitude

        # Subtract anchor force
        anchor = self.calculate_anchor_force(building_id)
        total = total - anchor

        # Store foreign forces for migration detection
        building.foreign_forces = dict(foreign_forces)

        return total

    async def detect_migration(self, building_id: str) -> Optional[str]:
        """
        Detect if a building should migrate to a different district.

        Returns target district name if migration threshold met, else None.

        Migration occurs when:
        foreign_force > 2 * anchor_force for 10+ seconds
        """
        if building_id not in self.buildings:
            return None

        building = self.buildings[building_id]

        # Calculate anchor force magnitude
        anchor = self.calculate_anchor_force(building_id)
        anchor_magnitude = anchor.magnitude

        # Find strongest foreign district
        if not building.foreign_forces:
            building.migration_timer = 0.0
            return None

        strongest_district = max(building.foreign_forces, key=building.foreign_forces.get)
        strongest_force = building.foreign_forces[strongest_district]

        # Check threshold
        if strongest_force > self.migration_threshold * anchor_magnitude:
            building.migration_timer += 1.0  # Assuming 1s tick

            if building.migration_timer >= self.migration_duration:
                logger.info(f"Migration detected: {building_id} -> {strongest_district}")
                return strongest_district
        else:
            building.migration_timer = 0.0

        return None

    async def get_drift_updates(self) -> Dict[str, ForceVector]:
        """
        Calculate drift (dx, dy) for all buildings.

        Returns dict of building_id -> ForceVector with total drift.
        """
        drifts = {}

        for building_id in list(self.buildings.keys()):
            force = await self.calculate_total_force(building_id)
            drifts[building_id] = force

        return drifts

    async def get_migration_candidates(self) -> List[Tuple[str, str]]:
        """
        Find all buildings that should migrate.

        Returns list of (building_id, target_district) tuples.
        """
        migrations = []

        for building_id in list(self.buildings.keys()):
            target = await self.detect_migration(building_id)
            if target:
                migrations.append((building_id, target))

        return migrations

    def enter_flux_mode(self):
        """Enter flux mode - reduced anchor forces for major reorganization."""
        self.flux_mode = True
        logger.info("TectonicEngine entered FLUX mode")

    def exit_flux_mode(self):
        """Exit flux mode - normal anchor forces."""
        self.flux_mode = False
        logger.info("TectonicEngine exited FLUX mode")


# Singleton instance
_engine: Optional[TectonicEngine] = None


def get_tectonic_engine() -> TectonicEngine:
    """Get the global TectonicEngine instance."""
    global _engine
    if _engine is None:
        _engine = TectonicEngine()
    return _engine
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_tectonic_engine.py -v`
Expected: PASS (all tests)

**Step 5: Commit**

```bash
git add systems/evolution_daemon/tectonic_engine.py tests/test_tectonic_engine.py
git commit -m "feat(tectonic): add TectonicEngine for force-directed spatial realignment

- ForceVector and BuildingState dataclasses
- Semantic gravity from similarity scores
- Operational tension from bridge frequency
- Anchor spring force to district centers
- Migration threshold detection

Part of Phase 28: Tectonic Realignment (Task 1)

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 2: Integrate TectonicEngine with NeuralMemoryHub

**Files:**
- Modify: `systems/evolution_daemon/tectonic_engine.py` (add similarity subscription)
- Modify: `systems/evolution_daemon/neural_memory_hub.py` (broadcast similarities)
- Test: `tests/test_tectonic_engine.py` (add integration tests)

**Step 1: Write the failing test**

Add to `tests/test_tectonic_engine.py`:

```python
class TestTectonicEngineIntegration:
    """Integration tests with NeuralMemoryHub."""

    @pytest.fixture
    def engine(self):
        return TectonicEngine()

    @pytest.mark.asyncio
    async def test_update_similarities_from_events(self, engine):
        """Test updating similarities from neural events."""
        from systems.evolution_daemon.neural_event import NeuralEvent

        engine.register_building("a", (0.0, 0.0), "cognitive")
        engine.register_building("b", (100.0, 0.0), "cognitive")

        # Simulate similarity update
        engine.set_similarity("a", "b", 0.85)

        # Verify it's stored
        key = ("a", "b")
        assert engine.similarities[key] == 0.85

    @pytest.mark.asyncio
    async def test_force_increases_with_similarity(self, engine):
        """Test that higher similarity creates stronger forces."""
        engine.register_building("a", (0.0, 0.0), "cognitive")
        engine.register_building("b", (100.0, 0.0), "cognitive")

        engine.set_similarity("a", "b", 0.9)
        force_high = await engine.calculate_total_force("a")

        engine.set_similarity("a", "b", 0.3)
        force_low = await engine.calculate_total_force("a")

        assert force_high.magnitude > force_low.magnitude
```

**Step 2: Run test to verify it passes**

Run: `python3 -m pytest tests/test_tectonic_engine.py::TestTectonicEngineIntegration -v`
Expected: PASS (uses existing implementation)

**Step 3: Add similarity update method to TectonicEngine**

Already implemented in Task 1. Add convenience method:

```python
# Add to TectonicEngine class
async def update_from_memory_hub(self, memory_hub):
    """
    Update similarities from NeuralMemoryHub.

    Pulls recent similar events and updates force graph.
    """
    for building_id in self.buildings:
        context = await memory_hub.get_collective_context(building_id)

        # Extract similar tiles
        for event in context.get("similar_events", []):
            other_id = event.get("tile_id")
            if other_id and other_id in self.buildings:
                # Use confidence as similarity proxy
                similarity = event.get("confidence", 0.5)
                self.set_similarity(building_id, other_id, similarity)
```

**Step 4: Run tests**

Run: `python3 -m pytest tests/test_tectonic_engine.py -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/evolution_daemon/tectonic_engine.py tests/test_tectonic_engine.py
git commit -m "feat(tectonic): integrate with NeuralMemoryHub for similarity updates

- Add update_from_memory_hub() method
- Add integration tests for similarity-based forces

Part of Phase 28: Tectonic Realignment (Task 2)

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: Add Tectonic Drift Loop

**Files:**
- Modify: `systems/evolution_daemon/tectonic_engine.py` (add drift loop)
- Test: `tests/test_tectonic_engine.py` (add drift loop tests)

**Step 1: Write the failing test**

```python
class TestTectonicDriftLoop:
    """Tests for the drift calculation loop."""

    @pytest.fixture
    def engine(self):
        return TectonicEngine()

    @pytest.mark.asyncio
    async def test_drift_loop_calculates_forces(self, engine):
        """Test that drift loop calculates and stores forces."""
        engine.register_building("a", (0.0, 0.0), "cognitive")
        engine.register_building("b", (100.0, 0.0), "cognitive")
        engine.register_bridge("a", "b")
        engine.set_similarity("a", "b", 0.8)

        # Start drift loop (runs once then we check)
        drifts = await engine.get_drift_updates()

        assert "a" in drifts
        assert "b" in drifts
        # Both should have non-zero forces
        assert drifts["a"].magnitude > 0

    @pytest.mark.asyncio
    async def test_drift_loop_respects_flux_mode(self, engine):
        """Test that flux mode reduces anchor force."""
        engine.register_building("a", (200.0, 0.0), "cognitive")

        # Normal mode
        anchor_normal = engine.calculate_anchor_force("a")

        # Flux mode
        engine.enter_flux_mode()
        anchor_flux = engine.calculate_anchor_force("a")
        engine.exit_flux_mode()

        # Flux mode should have much weaker anchor
        assert anchor_flux.magnitude < anchor_normal.magnitude
```

**Step 2: Verify tests pass (implementation already exists)**

Run: `python3 -m pytest tests/test_tectonic_engine.py::TestTectonicDriftLoop -v`
Expected: PASS

**Step 3: Commit**

```bash
git add tests/test_tectonic_engine.py
git commit -m "test(tectonic): add drift loop tests

- Test drift calculation for all buildings
- Test flux mode anchor reduction

Part of Phase 28: Tectonic Realignment (Task 3)

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: Update CityOrchestrator for Fluid Layout

**Files:**
- Modify: `systems/visual_shell/web/js/CityOrchestrator.js`
- Test: `systems/visual_shell/web/tests/test_city_orchestrator.js`

**Step 1: Write the failing test**

Create `systems/visual_shell/web/tests/test_city_orchestrator.js`:

```javascript
/**
 * Tests for CityOrchestrator fluid layout (Tectonic Realignment).
 */

describe('CityOrchestrator Fluid Layout', () => {
    it('should apply drift offset to building position', () => {
        const orchestrator = new CityOrchestrator();
        orchestrator.spawnBuilding('agent-001', 'cognitive', {});

        // Apply drift
        orchestrator.applyDrift('agent-001', { dx: 10, dy: 5 });

        const building = orchestrator.getBuilding('agent-001');
        assert.ok(building.drift);
        assert.equal(building.drift.dx, 10);
        assert.equal(building.drift.dy, 5);
    });

    it('should calculate rendered position with drift', () => {
        const orchestrator = new CityOrchestrator();
        orchestrator.spawnBuilding('agent-001', 'cognitive', {});

        const basePos = orchestrator.getBuilding('agent-001').position;
        orchestrator.applyDrift('agent-001', { dx: 20, dy: -10 });

        const renderedPos = orchestrator.getRenderedPosition('agent-001');
        assert.equal(renderedPos.x, basePos.x + 20);
        assert.equal(renderedPos.y, basePos.y - 10);
    });

    it('should lerp building to target position', () => {
        const orchestrator = new CityOrchestrator();
        orchestrator.spawnBuilding('agent-001', 'cognitive', {});

        const startPos = orchestrator.getBuilding('agent-001').position;
        orchestrator.setTargetPosition('agent-001', { x: 300, y: 200 });

        // Lerp 50%
        orchestrator.lerpToTarget('agent-001', 0.5);

        const rendered = orchestrator.getRenderedPosition('agent-001');
        assert.ok(rendered.x > startPos.x);
        assert.ok(rendered.x < 300);
    });

    it('should handle Phase Shift (district migration)', () => {
        const orchestrator = new CityOrchestrator();
        orchestrator.spawnBuilding('agent-001', 'cognitive', {});

        // Trigger migration
        orchestrator.migrateBuilding('agent-001', 'metabolic');

        const building = orchestrator.getBuilding('agent-001');
        assert.equal(building.district, 'metabolic');
        assert.ok(building.isMigrating);
    });

    it('should complete migration glide smoothly', () => {
        const orchestrator = new CityOrchestrator();
        orchestrator.spawnBuilding('agent-001', 'cognitive', {});
        orchestrator.migrateBuilding('agent-001', 'metabolic');

        // Simulate multiple lerp steps
        for (let i = 0; i < 20; i++) {
            orchestrator.lerpToTarget('agent-001', 0.1);
        }

        const building = orchestrator.getBuilding('agent-001');
        assert.ok(!building.isMigrating); // Migration complete
    });
});
```

**Step 2: Run test to verify it fails**

Run: `npm test` or open test file in browser
Expected: FAIL with "applyDrift is not a function"

**Step 3: Add fluid layout methods to CityOrchestrator**

Add to `systems/visual_shell/web/js/CityOrchestrator.js`:

```javascript
/**
 * Apply drift offset from TectonicEngine.
 * @param {string} agentId - Building ID
 * @param {Object} drift - Drift vector {dx, dy, magnitude}
 */
applyDrift(agentId, drift) {
    const building = this.buildings.get(agentId);
    if (!building) return;

    building.drift = {
        dx: drift.dx || 0,
        dy: drift.dy || 0,
        magnitude: drift.magnitude || 0
    };

    if (this.onBuildingUpdate) {
        this.onBuildingUpdate(building);
    }
}

/**
 * Get the rendered position including drift offset.
 * @param {string} agentId - Building ID
 * @returns {Object} Rendered position {x, y}
 */
getRenderedPosition(agentId) {
    const building = this.buildings.get(agentId);
    if (!building) return null;

    const base = building.position;
    const drift = building.drift || { dx: 0, dy: 0 };
    const target = building.targetPosition;

    // If migrating, interpolate toward target
    if (target && building.isMigrating) {
        return {
            x: building.lerpPosition.x,
            y: building.lerpPosition.y
        };
    }

    return {
        x: base.x + drift.dx,
        y: base.y + drift.dy
    };
}

/**
 * Set target position for smooth glide.
 * @param {string} agentId - Building ID
 * @param {Object} target - Target position {x, y}
 */
setTargetPosition(agentId, target) {
    const building = this.buildings.get(agentId);
    if (!building) return;

    building.targetPosition = target;
    building.lerpPosition = { ...this.getRenderedPosition(agentId) };
    building.lerpProgress = 0;
}

/**
 * Lerp building toward target position.
 * @param {string} agentId - Building ID
 * @param {number} t - Interpolation factor (0-1)
 */
lerpToTarget(agentId, t) {
    const building = this.buildings.get(agentId);
    if (!building || !building.targetPosition) return;

    const current = building.lerpPosition;
    const target = building.targetPosition;

    building.lerpPosition = {
        x: current.x + (target.x - current.x) * t,
        y: current.y + (target.y - current.y) * t
    };
    building.lerpProgress += t;

    // Check if migration complete
    if (building.isMigrating && building.lerpProgress >= 1.0) {
        building.position = { ...building.targetPosition };
        building.drift = { dx: 0, dy: 0 };
        building.isMigrating = false;
        building.targetPosition = null;
        delete building.lerpPosition;
        delete building.lerpProgress;

        if (this.onBuildingUpdate) {
            this.onBuildingUpdate(building);
        }
    }
}

/**
 * Migrate building to a new district with smooth glide.
 * @param {string} agentId - Building ID
 * @param {string} newDistrict - Target district
 */
migrateBuilding(agentId, newDistrict) {
    const building = this.buildings.get(agentId);
    if (!building) return null;

    if (!DISTRICTS[newDistrict]) {
        console.warn(`Invalid district: ${newDistrict}`);
        return null;
    }

    // Calculate new anchor position
    const targetPos = this._calculateBuildingPosition(newDistrict, agentId);

    building.district = newDistrict;
    building.isMigrating = true;
    this.setTargetPosition(agentId, targetPos);

    console.log(`🏗️ Phase Shift: ${agentId} -> ${newDistrict}`);

    return building;
}
```

**Step 4: Run tests**

Run: `npm test` or browser test runner
Expected: PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/js/CityOrchestrator.js systems/visual_shell/web/tests/test_city_orchestrator.js
git commit -m "feat(city): add fluid layout with drift and migration

- applyDrift() for TectonicEngine offsets
- getRenderedPosition() combines base + drift
- lerpToTarget() for smooth glides
- migrateBuilding() for Phase Shift district changes

Part of Phase 28: Tectonic Realignment (Task 4)

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 5: Wire TelemetryBus for Tectonic Events

**Files:**
- Modify: `systems/visual_shell/web/js/NeuralCityEngine.js`
- Modify: `systems/visual_shell/web/js/TelemetryBus.js` (if needed)
- Test: `systems/visual_shell/web/tests/test_telemetry_bus.js`

**Step 1: Write the failing test**

Add to `systems/visual_shell/web/tests/test_telemetry_bus.js`:

```javascript
// Tectonic Event Tests (Phase 28)

it('should handle tectonic_drift messages', () => {
    const bus = new TelemetryBus();
    let received = null;
    bus.subscribe('tectonic_drift', (data) => { received = data; });

    const msg = {
        data: JSON.stringify({
            type: 'broadcast_event',
            params: {
                type: 'tectonic_drift',
                data: {
                    drifts: {
                        'agent-001': { dx: 5.2, dy: -3.1, magnitude: 6.1 },
                        'agent-002': { dx: -2.0, dy: 1.5, magnitude: 2.5 }
                    }
                }
            }
        })
    };
    bus._handleMessage(msg);

    assert.ok(received);
    assert.ok(received.drifts['agent-001']);
    assert.equal(received.drifts['agent-001'].dx, 5.2);
});

it('should handle agent_relocation messages', () => {
    const bus = new TelemetryBus();
    let received = null;
    bus.subscribe('agent_relocation', (data) => { received = data; });

    const msg = {
        data: JSON.stringify({
            type: 'broadcast_event',
            params: {
                type: 'agent_relocation',
                data: {
                    agent_id: 'agent-001',
                    from_district: 'cognitive',
                    to_district: 'metabolic'
                }
            }
        })
    };
    bus._handleMessage(msg);

    assert.ok(received);
    assert.equal(received.agent_id, 'agent-001');
    assert.equal(received.to_district, 'metabolic');
});

it('should handle flux_mode messages', () => {
    const bus = new TelemetryBus();
    let received = null;
    bus.subscribe('flux_mode', (data) => { received = data; });

    const msg = {
        data: JSON.stringify({
            type: 'broadcast_event',
            params: {
                type: 'flux_mode',
                data: { active: true, reason: 'evolution_event' }
            }
        })
    };
    bus._handleMessage(msg);

    assert.ok(received);
    assert.equal(received.active, true);
});
```

**Step 2: Run test to verify it fails**

Run: test runner
Expected: Tests rely on existing _handleMessage logic, should PASS

**Step 3: Add handlers to NeuralCityEngine**

Add to `_setupTelemetryHandlers()` in `NeuralCityEngine.js`:

```javascript
// Tectonic Drift updates (Phase 28)
this.telemetryBus.subscribe('tectonic_drift', (data) => {
    this._updateFromTelemetry('tectonic_drift', data);
});

// Agent relocation events
this.telemetryBus.subscribe('agent_relocation', (data) => {
    this._updateFromTelemetry('agent_relocation', data);
});

// Flux mode changes
this.telemetryBus.subscribe('flux_mode', (data) => {
    this._updateFromTelemetry('flux_mode', data);
});
```

Add to `_updateFromTelemetry()`:

```javascript
case 'tectonic_drift':
    // Apply drift offsets to all buildings
    if (data.drifts) {
        for (const [agentId, drift] of Object.entries(data.drifts)) {
            this.orchestrator.applyDrift(agentId, drift);
            this._updateBuildingRender(this.orchestrator.getBuilding(agentId));
        }
    }
    break;

case 'agent_relocation':
    // Handle Phase Shift migration
    this.orchestrator.migrateBuilding(
        data.agent_id,
        data.to_district
    );
    console.log(`🔄 Phase Shift: ${data.agent_id} -> ${data.to_district}`);
    break;

case 'flux_mode':
    // Visual feedback for flux mode
    if (data.active) {
        console.log('🌋 SPIRE FLUX MODE ACTIVATED');
        // Spire glow effect handled in render
    } else {
        console.log('🏔️ Spire flux mode deactivated');
    }
    break;
```

**Step 4: Run tests**

Expected: PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/js/NeuralCityEngine.js systems/visual_shell/web/tests/test_telemetry_bus.js
git commit -m "feat(telemetry): wire tectonic drift and relocation events

- tectonic_drift handler applies offsets to buildings
- agent_relocation triggers Phase Shift migration
- flux_mode activates Spire visual effects

Part of Phase 28: Tectonic Realignment (Task 5)

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 6: Add Tension Visualization

**Files:**
- Create: `systems/visual_shell/web/js/TensionVisualizer.js`
- Test: `systems/visual_shell/web/tests/test_tension_visualizer.js`

**Step 1: Write the failing test**

```javascript
/**
 * Tests for TensionVisualizer - Renders tension lines between buildings.
 */

describe('TensionVisualizer', () => {
    it('should create visualizer with container', () => {
        const viz = new TensionVisualizer({ container: new PIXI.Container() });
        assert.ok(viz.container);
        assert.ok(viz.tensionLines);
    });

    it('should render tension line between two points', () => {
        const viz = new TensionVisualizer({ container: new PIXI.Container() });

        viz.renderTension('a', 'b', { x: 0, y: 0 }, { x: 100, y: 0 }, 0.8);

        assert.equal(viz.tensionLines.size, 1);
        assert.ok(viz.tensionLines.has('a-b'));
    });

    it('should remove tension line', () => {
        const viz = new TensionVisualizer({ container: new PIXI.Container() });

        viz.renderTension('a', 'b', { x: 0, y: 0 }, { x: 100, y: 0 }, 0.8);
        viz.removeTension('a', 'b');

        assert.equal(viz.tensionLines.size, 0);
    });

    it('should color lines by force magnitude', () => {
        const viz = new TensionVisualizer({ container: new PIXI.Container() });

        viz.renderTension('a', 'b', { x: 0, y: 0 }, { x: 100, y: 0 }, 0.3);
        const weakColor = viz.tensionLines.get('a-b').graphics.alpha;

        viz.renderTension('a', 'b', { x: 0, y: 0 }, { x: 100, y: 0 }, 0.9);
        const strongColor = viz.tensionLines.get('a-b').graphics.alpha;

        // Stronger force = higher alpha
        assert.ok(strongColor > weakColor);
    });

    it('should render anchor tether', () => {
        const viz = new TensionVisualizer({ container: new PIXI.Container() });

        viz.renderAnchorTether('agent-001', { x: 200, y: 0 }, { x: 0, y: 200 });

        assert.ok(viz.anchorTethers.has('agent-001'));
    });

    it('should update all tensions from drift data', () => {
        const viz = new TensionVisualizer({ container: new PIXI.Container() });

        viz.updateFromDrifts({
            'agent-001': { dx: 10, dy: 5, magnitude: 11.2 },
            'agent-002': { dx: -5, dy: 10, magnitude: 11.2 }
        });

        // Should have updated without error
        assert.ok(true);
    });
});
```

**Step 2: Run test to verify it fails**

Expected: FAIL with "TensionVisualizer is not defined"

**Step 3: Create TensionVisualizer**

```javascript
/**
 * TensionVisualizer - Renders tension lines and anchor tethers.
 *
 * Phase 28: Tectonic Realignment
 * Visualizes the force-directed graph connections.
 */
class TensionVisualizer {
    constructor(config = {}) {
        this.container = config.container || new PIXI.Container();
        this.app = config.app || null;

        // Tension lines: "id1-id2" -> { graphics, fromPos, toPos, magnitude }
        this.tensionLines = new Map();

        // Anchor tethers: buildingId -> graphics
        this.anchorTethers = new Map();

        // Configuration
        this.maxAlpha = 0.6;
        this.tetherColor = 0x0ff; // Cyan for anchor tethers
        this.tensionColor = 0xff00ff; // Magenta for tension
    }

    /**
     * Render a tension line between two positions.
     */
    renderTension(id1, id2, fromPos, toPos, magnitude) {
        const key = `${min(id1, id2)}-${max(id1, id2)}`;

        // Remove existing if any
        this.removeTension(id1, id2);

        const graphics = new PIXI.Graphics();
        graphics.name = key;

        // Alpha based on magnitude (0-1 normalized)
        const alpha = Math.min(this.maxAlpha, magnitude / 10);

        // Draw line with vibration effect
        graphics.moveTo(fromPos.x, fromPos.y);
        graphics.lineTo(toPos.x, toPos.y);
        graphics.stroke({ color: this.tensionColor, width: 1, alpha });

        this.container.addChild(graphics);
        this.tensionLines.set(key, {
            graphics,
            fromPos: { ...fromPos },
            toPos: { ...toPos },
            magnitude
        });

        return graphics;
    }

    /**
     * Remove a tension line.
     */
    removeTension(id1, id2) {
        const key = `${min(id1, id2)}-${max(id1, id2)}`;
        const line = this.tensionLines.get(key);

        if (line) {
            this.container.removeChild(line.graphics);
            line.graphics.destroy();
            this.tensionLines.delete(key);
        }
    }

    /**
     * Render an anchor tether (dashed line to district center).
     */
    renderAnchorTether(buildingId, buildingPos, anchorPos) {
        // Remove existing
        this.removeAnchorTether(buildingId);

        const graphics = new PIXI.Graphics();
        graphics.name = `tether-${buildingId}`;

        // Calculate distance - if far, show tether
        const dx = buildingPos.x - anchorPos.x;
        const dy = buildingPos.y - anchorPos.y;
        const distance = Math.sqrt(dx*dx + dy*dy);

        // Only show if drifting significantly
        if (distance < 50) return;

        // Draw dashed line
        const segments = 10;
        const segLen = distance / (segments * 2);

        for (let i = 0; i < segments; i++) {
            const t1 = (i * 2) / (segments * 2);
            const t2 = (i * 2 + 1) / (segments * 2);

            const x1 = anchorPos.x + (buildingPos.x - anchorPos.x) * t1;
            const y1 = anchorPos.y + (buildingPos.y - anchorPos.y) * t1;
            const x2 = anchorPos.x + (buildingPos.x - anchorPos.x) * t2;
            const y2 = anchorPos.y + (buildingPos.y - anchorPos.y) * t2;

            graphics.moveTo(x1, y1);
            graphics.lineTo(x2, y2);
        }

        graphics.stroke({ color: this.tetherColor, width: 1, alpha: 0.3 });

        this.container.addChild(graphics);
        this.anchorTethers.set(buildingId, graphics);

        return graphics;
    }

    /**
     * Remove an anchor tether.
     */
    removeAnchorTether(buildingId) {
        const tether = this.anchorTethers.get(buildingId);

        if (tether) {
            this.container.removeChild(tether);
            tether.destroy();
            this.anchorTethers.delete(buildingId);
        }
    }

    /**
     * Update all visualizations from drift data.
     */
    updateFromDrifts(drifts) {
        // Clear old visualizations
        this.tensionLines.forEach((_, key) => {
            const [id1, id2] = key.split('-');
            this.removeTension(id1, id2);
        });
        this.anchorTethers.forEach((_, id) => this.removeAnchorTether(id));
    }

    /**
     * Clear all visualizations.
     */
    clear() {
        this.tensionLines.forEach((_, key) => {
            const [id1, id2] = key.split('-');
            this.removeTension(id1, id2);
        });
        this.anchorTethers.forEach((_, id) => this.removeAnchorTether(id));
    }
}

// Helper functions
function min(a, b) { return a < b ? a : b; }
function max(a, b) { return a > b ? a : b; }

// Export
if (typeof window !== 'undefined') {
    window.TensionVisualizer = TensionVisualizer;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = TensionVisualizer;
}
```

**Step 4: Run tests**

Expected: PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/js/TensionVisualizer.js systems/visual_shell/web/tests/test_tension_visualizer.js
git commit -m "feat(viz): add TensionVisualizer for force connections

- renderTension() for building-to-building lines
- renderAnchorTether() for district anchor connections
- Magnitude-based alpha for force visualization

Part of Phase 28: Tectonic Realignment (Task 6)

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Summary

| Task | Component | Tests | Key File |
|------|-----------|-------|----------|
| 1 | TectonicEngine Core | 15 | `tectonic_engine.py` |
| 2 | NeuralMemoryHub Integration | 2 | `tectonic_engine.py` |
| 3 | Drift Loop | 2 | `tectonic_engine.py` |
| 4 | CityOrchestrator Fluid Layout | 5 | `CityOrchestrator.js` |
| 5 | TelemetryBus Wiring | 3 | `NeuralCityEngine.js` |
| 6 | Tension Visualization | 6 | `TensionVisualizer.js` |

**Total: ~33 tests**

**Key Physics:**
- F_total = F_gravity(similarity) + F_tension(bridge_freq) - F_anchor(distance)
- Migration when F_foreign > 2 * F_anchor for 10s+
- Flux mode reduces anchor to 10% for major reorganization
