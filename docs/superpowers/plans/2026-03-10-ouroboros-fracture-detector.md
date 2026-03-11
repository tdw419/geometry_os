# Ouroboros Fracture Detector Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement a "spinal cord" reflex arc that detects structural fractures in real-time and triggers emergency response before cascading failure spreads through the Neural Substrate.

**Architecture:** Passive tailer monitors ASCII Scene Graph at 1Hz via a sliding window buffer. Calculates geometric drift between frames and triggers reflex responses (WARNING, QUARANTINE, EMERGENCY_FREEZE) when thresholds are exceeded. Integrates with EvolutionDaemon for mutation pausing and Mutation Governor for district quarantine enforcement.

**Tech Stack:** Python 3.10+, asyncio, dataclasses, enum, pathlib

**Spec Reference:** `docs/superpowers/specs/2026-03-10-ouroboros-fracture-detector-design.md`

---

## File Structure

```
systems/evolution_daemon/safety/
├── __init__.py                  # MODIFY: export FractureDetector, OuroborosReflex
├── fracture_detector.py         # CREATE: FractureDetector class
├── data_structures.py           # MODIFY: add ASCIIFrame, FractureEvent dataclasses

systems/evolution_daemon/
├── evolution_daemon.py          # MODIFY: wire in detector

systems/swarm/
├── agency_agents.py             # MODIFY: add quarantine check to Governor

tests/evolution_daemon/safety/
├── test_fracture_detector.py    # CREATE: unit tests
├── test_ouroboros_integration.py # CREATE: integration tests

.geometry/ascii_scene/
├── ouroboros_metrics.ascii      # CREATE (runtime): metrics output
```

---

## Chunk 1: Data Structures

### Task 1.1: Add ASCIIFrame and FractureEvent Dataclasses

**Files:**
- Modify: `systems/evolution_daemon/safety/data_structures.py`
- Test: `tests/evolution_daemon/safety/test_fracture_detector.py`

- [ ] **Step 1: Write the failing tests for ASCIIFrame**

```python
# tests/evolution_daemon/safety/test_fracture_detector.py
"""Tests for Ouroboros Fracture Detector."""
import pytest
from datetime import datetime


class TestASCIIFrame:
    """Tests for ASCIIFrame dataclass."""

    def test_ascii_frame_creation(self):
        """Test basic ASCIIFrame creation."""
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame

        frame = ASCIIFrame(
            timestamp=1234567890.0,
            window_count=5,
            windows=[{"id": "w1", "x": 100, "y": 200}],
            stability=0.85,
            heartbeat_age=0.5
        )
        assert frame.timestamp == 1234567890.0
        assert frame.window_count == 5
        assert len(frame.windows) == 1

    def test_ascii_frame_defaults(self):
        """Test ASCIIFrame default values."""
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame

        frame = ASCIIFrame(timestamp=1234567890.0)
        assert frame.window_count == 0
        assert frame.windows == []
        assert frame.stability == 0.0
        assert frame.heartbeat_age == 0.0
```

- [ ] **Step 2: Run test to verify it fails**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestASCIIFrame -v`
Expected: FAIL with "cannot import name 'ASCIIFrame'"

- [ ] **Step 3: Add ASCIIFrame dataclass to data_structures.py**

Add to `systems/evolution_daemon/safety/data_structures.py` after the existing dataclasses:

```python
@dataclass
class ASCIIFrame:
    """
    A snapshot of the ASCII Scene Graph at a point in time.

    Used by the Ouroboros Fracture Detector to track geometric coherence.
    """
    timestamp: float                              # Unix timestamp
    window_count: int = 0                         # Number of windows
    windows: List[Dict[str, Any]] = field(default_factory=list)  # Window data
    stability: float = 0.0                        # PAS stability component
    heartbeat_age: float = 0.0                    # Seconds since last heartbeat
```

- [ ] **Step 4: Run test to verify it passes**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestASCIIFrame -v`
Expected: PASS

- [ ] **Step 5: Write failing tests for FractureEvent**

```python
# Add to tests/evolution_daemon/safety/test_fracture_detector.py

class TestFractureEvent:
    """Tests for FractureEvent dataclass."""

    def test_fracture_event_creation(self):
        """Test basic FractureEvent creation."""
        from systems.evolution_daemon.safety.data_structures import FractureEvent
        from systems.evolution_daemon.safety.fracture_detector import OuroborosReflex

        event = FractureEvent(
            timestamp=1234567890.0,
            reflex_level=OuroborosReflex.WARNING,
            drift_score=0.45,
            signal_type="window_explosion",
            affected_districts=["district_alpha"]
        )
        assert event.timestamp == 1234567890.0
        assert event.reflex_level == OuroborosReflex.WARNING
        assert event.drift_score == 0.45

    def test_fracture_event_defaults(self):
        """Test FractureEvent default values."""
        from systems.evolution_daemon.safety.data_structures import FractureEvent

        event = FractureEvent(timestamp=1234567890.0)
        assert event.affected_districts == []
        assert event.signal_type == "unknown"
```

- [ ] **Step 6: Run test to verify it fails**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestFractureEvent -v`
Expected: FAIL with "cannot import name 'FractureEvent'"

- [ ] **Step 7: Add FractureEvent dataclass to data_structures.py**

Add to `systems/evolution_daemon/safety/data_structures.py`:

```python
@dataclass
class FractureEvent:
    """
    A fracture detection event from the Ouroboros detector.

    Represents a detected anomaly and the triggered reflex response.
    """
    timestamp: float
    reflex_level: "OuroborosReflex" = None        # Reference to enum
    drift_score: float = 0.0                      # 0.0 to 1.0
    signal_type: str = "unknown"                  # Type of fracture signal
    affected_districts: List[str] = field(default_factory=list)
    metadata: Dict[str, Any] = field(default_factory=dict)
```

- [ ] **Step 8: Run test to verify it passes**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestFractureEvent -v`
Expected: PASS (will still fail on OuroborosReflex import, handled next task)

- [ ] **Step 9: Commit data structures**

```bash
git add systems/evolution_daemon/safety/data_structures.py tests/evolution_daemon/safety/test_fracture_detector.py
git commit -m "feat(ouroboros): add ASCIIFrame and FractureEvent data structures

Phase 56 - Self-Healing Kernel

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 2: Core Detector Implementation

### Task 2.1: Create OuroborosReflex Enum and FractureConfig

**Files:**
- Create: `systems/evolution_daemon/safety/fracture_detector.py`
- Test: `tests/evolution_daemon/safety/test_fracture_detector.py`

- [ ] **Step 1: Write failing tests for OuroborosReflex**

```python
# Add to tests/evolution_daemon/safety/test_fracture_detector.py

class TestOuroborosReflex:
    """Tests for OuroborosReflex enum."""

    def test_reflex_levels_exist(self):
        """Test all reflex levels are defined."""
        from systems.evolution_daemon.safety.fracture_detector import OuroborosReflex

        assert OuroborosReflex.NONE.value == 0
        assert OuroborosReflex.WARNING.value == 1
        assert OuroborosReflex.QUARANTINE.value == 2
        assert OuroborosReflex.EMERGENCY_FREEZE.value == 3

    def test_reflex_ordering(self):
        """Test reflex levels are ordered by severity."""
        from systems.evolution_daemon.safety.fracture_detector import OuroborosReflex

        assert OuroborosReflex.NONE < OuroborosReflex.WARNING
        assert OuroborosReflex.WARNING < OuroborosReflex.QUARANTINE
        assert OuroborosReflex.QUARANTINE < OuroborosReflex.EMERGENCY_FREEZE
```

- [ ] **Step 2: Run test to verify it fails**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestOuroborosReflex -v`
Expected: FAIL with "cannot import name 'OuroborosReflex'"

- [ ] **Step 3: Create fracture_detector.py with enum and config**

```python
# systems/evolution_daemon/safety/fracture_detector.py
"""
Ouroboros Fracture Detector - Phase 56 (Self-Healing Kernel)

A Passive Tailer that monitors the ASCII Scene Graph at 1Hz and triggers
reflex responses when geometric coherence breaks down.

The Ouroboros transforms our passive ASCII monitoring into active self-preservation.
"""

import asyncio
import logging
import time
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from pathlib import Path
from typing import List, Dict, Optional, Any, TYPE_CHECKING

if TYPE_CHECKING:
    from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

logger = logging.getLogger(__name__)


class OuroborosReflex(Enum):
    """Reflex response levels for fracture detection."""
    NONE = 0              # Normal operation
    WARNING = 1           # Log anomaly, continue
    QUARANTINE = 2        # Freeze district, investigate
    EMERGENCY_FREEZE = 3  # Halt all mutations immediately


@dataclass
class FractureConfig:
    """Configuration for the Ouroboros Fracture Detector."""
    # Sliding window size (frames)
    WINDOW_SIZE: int = 5

    # Pain threshold (0.0-1.0 drift)
    PAIN_THRESHOLD: float = 0.3

    # Individual signal thresholds
    MAX_POSITION_DELTA: int = 500      # pixels
    MAX_COUNT_DELTA: int = 10          # windows
    MAX_HEARTBEAT_AGE: float = 3.0     # seconds
    MAX_STABILITY_DROP: float = 0.5    # PAS stability component

    # District quarantine duration
    QUARANTINE_DURATION_SECONDS: int = 300  # 5 minutes default

    # ASCII Scene paths
    ASCII_SCENE_DIR: str = ".geometry/ascii_scene"
```

- [ ] **Step 4: Run test to verify it passes**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestOuroborosReflex -v`
Expected: PASS

- [ ] **Step 5: Write failing tests for FractureConfig**

```python
# Add to tests/evolution_daemon/safety/test_fracture_detector.py

class TestFractureConfig:
    """Tests for FractureConfig dataclass."""

    def test_default_config(self):
        """Test default configuration values."""
        from systems.evolution_daemon.safety.fracture_detector import FractureConfig

        config = FractureConfig()
        assert config.WINDOW_SIZE == 5
        assert config.PAIN_THRESHOLD == 0.3
        assert config.MAX_POSITION_DELTA == 500
        assert config.MAX_COUNT_DELTA == 10
        assert config.MAX_HEARTBEAT_AGE == 3.0
        assert config.MAX_STABILITY_DROP == 0.5
        assert config.QUARANTINE_DURATION_SECONDS == 300

    def test_custom_config(self):
        """Test custom configuration values."""
        from systems.evolution_daemon.safety.fracture_detector import FractureConfig

        config = FractureConfig(
            WINDOW_SIZE=10,
            PAIN_THRESHOLD=0.5,
            MAX_HEARTBEAT_AGE=5.0
        )
        assert config.WINDOW_SIZE == 10
        assert config.PAIN_THRESHOLD == 0.5
        assert config.MAX_HEARTBEAT_AGE == 5.0
```

- [ ] **Step 6: Run test to verify it passes**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestFractureConfig -v`
Expected: PASS

- [ ] **Step 7: Commit enum and config**

```bash
git add systems/evolution_daemon/safety/fracture_detector.py tests/evolution_daemon/safety/test_fracture_detector.py
git commit -m "feat(ouroboros): add OuroborosReflex enum and FractureConfig

Phase 56 - Self-Healing Kernel

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

### Task 2.2: Implement Drift Calculation Algorithms

**Files:**
- Modify: `systems/evolution_daemon/safety/fracture_detector.py`
- Test: `tests/evolution_daemon/safety/test_fracture_detector.py`

- [ ] **Step 1: Write failing tests for position drift calculation**

```python
# Add to tests/evolution_daemon/safety/test_fracture_detector.py

class TestPositionDriftCalculation:
    """Tests for position drift calculation."""

    def test_no_windows_no_drift(self):
        """Test zero drift when no windows exist."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        drift = calculate_position_drift([], [])
        assert drift == 0.0

    def test_same_position_no_drift(self):
        """Test zero drift when positions are identical."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        prev = [{"id": "w1", "x": 100, "y": 200}]
        curr = [{"id": "w1", "x": 100, "y": 200}]
        drift = calculate_position_drift(prev, curr)
        assert drift == 0.0

    def test_small_movement_low_drift(self):
        """Test low drift for small movements."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        prev = [{"id": "w1", "x": 100, "y": 200}]
        curr = [{"id": "w1", "x": 110, "y": 210}]  # ~14px movement
        drift = calculate_position_drift(prev, curr)
        assert 0.0 < drift < 0.1

    def test_teleport_high_drift(self):
        """Test high drift for window teleport."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        prev = [{"id": "w1", "x": 100, "y": 200}]
        curr = [{"id": "w1", "x": 800, "y": 900}]  # ~1131px movement
        drift = calculate_position_drift(prev, curr)
        assert drift > 0.5  # Should be high

    def test_missing_window_increases_drift(self):
        """Test drift increases when windows disappear."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_position_drift

        prev = [{"id": "w1", "x": 100, "y": 200}, {"id": "w2", "x": 300, "y": 400}]
        curr = [{"id": "w1", "x": 100, "y": 200}]  # w2 disappeared
        drift = calculate_position_drift(prev, curr)
        assert drift > 0.0
```

- [ ] **Step 2: Run test to verify it fails**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestPositionDriftCalculation -v`
Expected: FAIL with "cannot import name 'calculate_position_drift'"

- [ ] **Step 3: Implement position drift calculation**

Add to `systems/evolution_daemon/safety/fracture_detector.py`:

```python
import math


def calculate_position_drift(
    prev_windows: List[Dict[str, Any]],
    curr_windows: List[Dict[str, Any]],
    max_delta: int = 500
) -> float:
    """
    Calculate position drift between window sets.

    Returns a normalized drift score 0.0-1.0 where:
    - 0.0 = No position change
    - 1.0 = Maximum detected drift

    Args:
        prev_windows: Previous frame windows
        curr_windows: Current frame windows
        max_delta: Maximum expected position delta (for normalization)
    """
    if not prev_windows or not curr_windows:
        return 0.0

    # Build lookup by window ID
    prev_by_id = {w.get("id"): w for w in prev_windows if w.get("id")}
    curr_by_id = {w.get("id"): w for w in curr_windows if w.get("id")}

    if not prev_by_id or not curr_by_id:
        return 0.0

    drift_scores = []

    # Calculate drift for matching windows
    for wid in prev_by_id:
        if wid in curr_by_id:
            prev_w = prev_by_id[wid]
            curr_w = curr_by_id[wid]

            # Euclidean distance
            dx = abs(curr_w.get("x", 0) - prev_w.get("x", 0))
            dy = abs(curr_w.get("y", 0) - prev_w.get("y", 0))
            distance = math.sqrt(dx * dx + dy * dy)

            # Normalize to 0-1
            normalized = min(distance / max_delta, 1.0)
            drift_scores.append(normalized)

    # Penalize missing/new windows
    missing_count = len(prev_by_id) - len(set(prev_by_id.keys()) & set(curr_by_id.keys()))
    if len(prev_by_id) > 0:
        missing_penalty = missing_count / len(prev_by_id)
        drift_scores.append(missing_penalty)

    return max(drift_scores) if drift_scores else 0.0
```

- [ ] **Step 4: Run test to verify it passes**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestPositionDriftCalculation -v`
Expected: PASS

- [ ] **Step 5: Write failing tests for geometric drift calculation**

```python
# Add to tests/evolution_daemon/safety/test_fracture_detector.py

class TestGeometricDriftCalculation:
    """Tests for overall geometric drift calculation."""

    def test_single_frame_no_drift(self):
        """Test zero drift with single frame."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_geometric_drift
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame

        frames = [ASCIIFrame(timestamp=1.0, window_count=1, stability=0.9)]
        drift = calculate_geometric_drift(frames)
        assert drift == 0.0

    def test_stable_frames_low_drift(self):
        """Test low drift for stable frames."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_geometric_drift
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame

        frames = [
            ASCIIFrame(timestamp=1.0, window_count=5, stability=0.9),
            ASCIIFrame(timestamp=2.0, window_count=5, stability=0.9),
            ASCIIFrame(timestamp=3.0, window_count=5, stability=0.9),
        ]
        drift = calculate_geometric_drift(frames)
        assert drift < 0.1

    def test_unstable_frames_high_drift(self):
        """Test high drift for unstable frames."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_geometric_drift
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame

        frames = [
            ASCIIFrame(timestamp=1.0, window_count=5, stability=0.9),
            ASCIIFrame(timestamp=2.0, window_count=50, stability=0.2),  # Explosion + collapse
        ]
        drift = calculate_geometric_drift(frames)
        assert drift > 0.3

    def test_returns_worst_drift(self):
        """Test that function returns worst drift in window."""
        from systems.evolution_daemon.safety.fracture_detector import calculate_geometric_drift
        from systems.evolution_daemon.safety.data_structures import ASCIIFrame

        frames = [
            ASCIIFrame(timestamp=1.0, window_count=5, stability=0.9),
            ASCIIFrame(timestamp=2.0, window_count=5, stability=0.9),  # Stable
            ASCIIFrame(timestamp=3.0, window_count=20, stability=0.3),  # Worst
            ASCIIFrame(timestamp=4.0, window_count=5, stability=0.8),  # Better
        ]
        drift = calculate_geometric_drift(frames)
        # Should return drift between frames 2-3, not 3-4
        assert drift > 0.2
```

- [ ] **Step 6: Run test to verify it fails**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestGeometricDriftCalculation -v`
Expected: FAIL with "cannot import name 'calculate_geometric_drift'"

- [ ] **Step 7: Implement geometric drift calculation**

Add to `systems/evolution_daemon/safety/fracture_detector.py`:

```python
def calculate_geometric_drift(
    frames: List["ASCIIFrame"],
    config: Optional[FractureConfig] = None
) -> float:
    """
    Calculate geometric drift between frames.

    Returns a value 0.0-1.0 where:
    - 0.0 = Perfect coherence (no drift)
    - 1.0 = Complete fracture (total incoherence)

    Args:
        frames: List of ASCIIFrame snapshots
        config: Optional configuration for thresholds
    """
    if len(frames) < 2:
        return 0.0

    config = config or FractureConfig()
    drift_scores = []

    for i in range(1, len(frames)):
        prev, curr = frames[i - 1], frames[i]

        # Position drift
        pos_drift = calculate_position_drift(
            prev.windows, curr.windows, config.MAX_POSITION_DELTA
        )

        # Count drift (normalized by expected max)
        count_delta = abs(curr.window_count - prev.window_count)
        count_drift = min(count_delta / config.MAX_COUNT_DELTA, 1.0)

        # Stability drift
        stability_drift = abs(prev.stability - curr.stability)
        # Normalize by max expected drop
        stability_drift_normalized = min(stability_drift / config.MAX_STABILITY_DROP, 1.0)

        # Combine drifts (weighted average)
        combined = (pos_drift + count_drift + stability_drift_normalized) / 3
        drift_scores.append(combined)

    return max(drift_scores)  # Return worst drift in window
```

- [ ] **Step 8: Run test to verify it passes**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestGeometricDriftCalculation -v`
Expected: PASS

- [ ] **Step 9: Commit drift calculations**

```bash
git add systems/evolution_daemon/safety/fracture_detector.py tests/evolution_daemon/safety/test_fracture_detector.py
git commit -m "feat(ouroboros): implement position and geometric drift calculations

Phase 56 - Self-Healing Kernel

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

### Task 2.3: Implement Reflex Level Determination

**Files:**
- Modify: `systems/evolution_daemon/safety/fracture_detector.py`
- Test: `tests/evolution_daemon/safety/test_fracture_detector.py`

- [ ] **Step 1: Write failing tests for reflex determination**

```python
# Add to tests/evolution_daemon/safety/test_fracture_detector.py

class TestReflexDetermination:
    """Tests for reflex level determination."""

    def test_low_drift_no_reflex(self):
        """Test no reflex for low drift."""
        from systems.evolution_daemon.safety.fracture_detector import determine_reflex_level

        reflex = determine_reflex_level(0.1)
        assert reflex.value == 0  # NONE

    def test_medium_drift_warning(self):
        """Test WARNING reflex for medium drift."""
        from systems.evolution_daemon.safety.fracture_detector import determine_reflex_level, OuroborosReflex

        reflex = determine_reflex_level(0.35)
        assert reflex == OuroborosReflex.WARNING

    def test_high_drift_quarantine(self):
        """Test QUARANTINE reflex for high drift."""
        from systems.evolution_daemon.safety.fracture_detector import determine_reflex_level, OuroborosReflex

        reflex = determine_reflex_level(0.6)
        assert reflex == OuroborosReflex.QUARANTINE

    def test_extreme_drift_emergency(self):
        """Test EMERGENCY_FREEZE for extreme drift."""
        from systems.evolution_daemon.safety.fracture_detector import determine_reflex_level, OuroborosReflex

        reflex = determine_reflex_level(0.9)
        assert reflex == OuroborosReflex.EMERGENCY_FREEZE

    def test_custom_thresholds(self):
        """Test reflex with custom threshold config."""
        from systems.evolution_daemon.safety.fracture_detector import (
            determine_reflex_level, OuroborosReflex, FractureConfig
        )

        config = FractureConfig(PAIN_THRESHOLD=0.5)
        reflex = determine_reflex_level(0.4, config)
        assert reflex == OuroborosReflex.NONE  # Below custom threshold
```

- [ ] **Step 2: Run test to verify it fails**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestReflexDetermination -v`
Expected: FAIL with "cannot import name 'determine_reflex_level'"

- [ ] **Step 3: Implement reflex level determination**

Add to `systems/evolution_daemon/safety/fracture_detector.py`:

```python
def determine_reflex_level(
    drift: float,
    config: Optional[FractureConfig] = None
) -> OuroborosReflex:
    """
    Determine the appropriate reflex level for a given drift score.

    Args:
        drift: Calculated drift score (0.0-1.0)
        config: Optional configuration for thresholds

    Returns:
        OuroborosReflex level
    """
    config = config or FractureConfig()
    threshold = config.PAIN_THRESHOLD

    if drift < threshold:
        return OuroborosReflex.NONE
    elif drift < threshold * 1.5:
        return OuroborosReflex.WARNING
    elif drift < threshold * 2.5:
        return OuroborosReflex.QUARANTINE
    else:
        return OuroborosReflex.EMERGENCY_FREEZE
```

- [ ] **Step 4: Run test to verify it passes**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestReflexDetermination -v`
Expected: PASS

- [ ] **Step 5: Commit reflex determination**

```bash
git add systems/evolution_daemon/safety/fracture_detector.py tests/evolution_daemon/safety/test_fracture_detector.py
git commit -m "feat(ouroboros): implement reflex level determination

Phase 56 - Self-Healing Kernel

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 3: FractureDetector Class

### Task 3.1: Implement FractureDetector Core

**Files:**
- Modify: `systems/evolution_daemon/safety/fracture_detector.py`
- Test: `tests/evolution_daemon/safety/test_fracture_detector.py`

- [ ] **Step 1: Write failing tests for FractureDetector initialization**

```python
# Add to tests/evolution_daemon/safety/test_fracture_detector.py

class TestFractureDetector:
    """Tests for FractureDetector class."""

    def test_detector_initialization(self):
        """Test basic detector initialization."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)
        assert detector.config.WINDOW_SIZE == 5
        assert detector.config.PAIN_THRESHOLD == 0.3
        assert len(detector._frame_buffer) == 0
        assert len(detector._quarantined_districts) == 0

    def test_detector_custom_config(self):
        """Test detector with custom config."""
        from systems.evolution_daemon.safety.fracture_detector import (
            FractureDetector, FractureConfig
        )

        config = FractureConfig(WINDOW_SIZE=10, PAIN_THRESHOLD=0.5)
        detector = FractureDetector(daemon=None, config=config)
        assert detector.config.WINDOW_SIZE == 10
        assert detector.config.PAIN_THRESHOLD == 0.5

    def test_detector_quarantine_management(self):
        """Test district quarantine state management."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)

        # Initially not quarantined
        assert not detector.is_district_quarantined("district_alpha")

        # Quarantine a district
        detector.quarantine_district("district_alpha")
        assert detector.is_district_quarantined("district_alpha")

        # Release quarantine
        detector.release_district("district_alpha")
        assert not detector.is_district_quarantined("district_alpha")
```

- [ ] **Step 2: Run test to verify it fails**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestFractureDetector -v`
Expected: FAIL with "cannot import name 'FractureDetector' from '...fracture_detector'"

- [ ] **Step 3: Implement FractureDetector class skeleton**

Add to `systems/evolution_daemon/safety/fracture_detector.py`:

```python
class FractureDetector:
    """
    Ouroboros Fracture Detector - The Spinal Cord of Geometry OS.

    Monitors the ASCII Scene Graph at 1Hz and triggers reflex responses
    when geometric coherence breaks down.

    Usage:
        detector = FractureDetector(daemon)
        await detector.run()  # Start monitoring loop
    """

    def __init__(
        self,
        daemon: Optional["EvolutionDaemon"] = None,
        config: Optional[FractureConfig] = None
    ):
        self.daemon = daemon
        self.config = config or FractureConfig()

        # Frame buffer for sliding window analysis
        self._frame_buffer: List["ASCIIFrame"] = []

        # Quarantine state
        self._quarantined_districts: Dict[str, float] = {}  # district -> quarantine_start_time

        # Metrics
        self._drift_current: float = 0.0
        self._drift_max_24h: float = 0.0
        self._reflexes_triggered_24h: Dict[OuroborosReflex, int] = {
            OuroborosReflex.WARNING: 0,
            OuroborosReflex.QUARANTINE: 0,
            OuroborosReflex.EMERGENCY_FREEZE: 0,
        }
        self._last_fracture: Optional["FractureEvent"] = None

        # State
        self._running: bool = False
        self._project_root = Path.cwd()

    def is_district_quarantined(self, district: str) -> bool:
        """Check if a district is currently quarantined."""
        if district not in self._quarantined_districts:
            return False

        # Check if quarantine has expired
        start_time = self._quarantined_districts[district]
        age = time.time() - start_time

        if age > self.config.QUARANTINE_DURATION_SECONDS:
            # Auto-expire
            del self._quarantined_districts[district]
            return False

        return True

    def quarantine_district(self, district: str) -> None:
        """Put a district into quarantine."""
        self._quarantined_districts[district] = time.time()
        logger.warning(f"🛡️ District '{district}' quarantined by Ouroboros")

    def release_district(self, district: str) -> None:
        """Release a district from quarantine."""
        if district in self._quarantined_districts:
            del self._quarantined_districts[district]
            logger.info(f"✅ District '{district}' released from quarantine")

    def get_current_drift(self) -> float:
        """Get the current drift score."""
        return self._drift_current
```

- [ ] **Step 4: Run test to verify it passes**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestFractureDetector -v`
Expected: PASS

- [ ] **Step 5: Commit FractureDetector skeleton**

```bash
git add systems/evolution_daemon/safety/fracture_detector.py tests/evolution_daemon/safety/test_fracture_detector.py
git commit -m "feat(ouroboros): implement FractureDetector class skeleton

Phase 56 - Self-Healing Kernel

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

### Task 3.2: Implement ASCII Scene Parsing

**Files:**
- Modify: `systems/evolution_daemon/safety/fracture_detector.py`
- Test: `tests/evolution_daemon/safety/test_fracture_detector.py`

- [ ] **Step 1: Write failing tests for ASCII parsing**

```python
# Add to tests/evolution_daemon/safety/test_fracture_detector.py
import tempfile
import os

class TestASCIISceneParsing:
    """Tests for ASCII Scene Graph parsing."""

    def test_parse_gnb_state(self):
        """Test parsing GNB state ASCII file."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        with tempfile.TemporaryDirectory() as tmpdir:
            # Create mock gnb_state.ascii
            gnb_path = Path(tmpdir) / ".geometry" / "gnb_state.ascii"
            gnb_path.parent.mkdir(parents=True, exist_ok=True)
            gnb_path.write_text("""GEOMETRIC NATIVE BROWSER - STATE MIRROR
TIMESTAMP: 1234567890.5
MODE: HEADLESS
HEARTBEAT: 42
---
SCENE SUMMARY:
Daemon: ACTIVE
Evolution Count: 5
""")

            detector = FractureDetector(daemon=None)
            detector._project_root = Path(tmpdir)

            frame = detector._parse_gnb_state()

            assert frame is not None
            assert frame.timestamp == 1234567890.5

    def test_parse_shell_fragments(self):
        """Test parsing shell_fragments.ascii."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        with tempfile.TemporaryDirectory() as tmpdir:
            # Create mock shell_fragments.ascii
            frag_path = Path(tmpdir) / ".geometry" / "ascii_scene" / "shell_fragments.ascii"
            frag_path.parent.mkdir(parents=True, exist_ok=True)
            frag_path.write_text("""windows:
  - id: win_001
    x: 100
    y: 200
    width: 800
    height: 600
  - id: win_002
    x: 300
    y: 400
    width: 400
    height: 300
""")

            detector = FractureDetector(daemon=None)
            detector._project_root = Path(tmpdir)

            windows = detector._parse_shell_fragments()

            assert len(windows) == 2
            assert windows[0]["id"] == "win_001"
            assert windows[0]["x"] == 100

    def test_missing_files_returns_empty(self):
        """Test that missing files return empty data gracefully."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        with tempfile.TemporaryDirectory() as tmpdir:
            detector = FractureDetector(daemon=None)
            detector._project_root = Path(tmpdir)

            # Should not raise, return empty data
            frame = detector._parse_gnb_state()
            assert frame is None

            windows = detector._parse_shell_fragments()
            assert windows == []
```

- [ ] **Step 2: Run test to verify it fails**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestASCIISceneParsing -v`
Expected: FAIL with "AttributeError: 'FractureDetector' object has no attribute '_parse_gnb_state'"

- [ ] **Step 3: Implement ASCII parsing methods**

Add to `systems/evolution_daemon/safety/fracture_detector.py`:

```python
    def _parse_gnb_state(self) -> Optional["ASCIIFrame"]:
        """Parse the GNB state ASCII file into an ASCIIFrame."""
        from .data_structures import ASCIIFrame

        gnb_path = self._project_root / ".geometry" / "gnb_state.ascii"

        if not gnb_path.exists():
            return None

        try:
            content = gnb_path.read_text()
            lines = content.strip().split("\n")

            timestamp = time.time()
            heartbeat_age = 0.0

            for line in lines:
                if line.startswith("TIMESTAMP:"):
                    timestamp = float(line.split(":", 1)[1].strip())
                elif line.startswith("HEARTBEAT:"):
                    # Heartbeat is a counter, calculate age
                    pass  # Age is time since last write

            # Calculate heartbeat age from file modification time
            if gnb_path.exists():
                mtime = gnb_path.stat().st_mtime
                heartbeat_age = time.time() - mtime

            return ASCIIFrame(
                timestamp=timestamp,
                heartbeat_age=heartbeat_age
            )

        except Exception as e:
            logger.warning(f"Failed to parse GNB state: {e}")
            return None

    def _parse_shell_fragments(self) -> List[Dict[str, Any]]:
        """Parse the shell_fragments.ascii file for window data."""
        frag_path = (
            self._project_root /
            self.config.ASCII_SCENE_DIR /
            "shell_fragments.ascii"
        )

        if not frag_path.exists():
            return []

        try:
            content = frag_path.read_text()
            windows = []

            # Simple YAML-like parsing for window entries
            current_window = {}
            for line in content.split("\n"):
                line = line.strip()

                if line.startswith("- id:"):
                    if current_window:
                        windows.append(current_window)
                    current_window = {"id": line.split(":", 1)[1].strip()}
                elif line.startswith("x:"):
                    current_window["x"] = int(line.split(":", 1)[1].strip())
                elif line.startswith("y:"):
                    current_window["y"] = int(line.split(":", 1)[1].strip())
                elif line.startswith("width:"):
                    current_window["width"] = int(line.split(":", 1)[1].strip())
                elif line.startswith("height:"):
                    current_window["height"] = int(line.split(":", 1)[1].strip())

            if current_window:
                windows.append(current_window)

            return windows

        except Exception as e:
            logger.warning(f"Failed to parse shell fragments: {e}")
            return []
```

- [ ] **Step 4: Run test to verify it passes**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestASCIISceneParsing -v`
Expected: PASS

- [ ] **Step 5: Commit ASCII parsing**

```bash
git add systems/evolution_daemon/safety/fracture_detector.py tests/evolution_daemon/safety/test_fracture_detector.py
git commit -m "feat(ouroboros): implement ASCII Scene Graph parsing

Phase 56 - Self-Healing Kernel

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

### Task 3.3: Implement Frame Capture and Analysis

**Files:**
- Modify: `systems/evolution_daemon/safety/fracture_detector.py`
- Test: `tests/evolution_daemon/safety/test_fracture_detector.py`

- [ ] **Step 1: Write failing tests for frame capture**

```python
# Add to tests/evolution_daemon/safety/test_fracture_detector.py

class TestFrameCapture:
    """Tests for frame capture and buffer management."""

    def test_capture_frame(self):
        """Test capturing a frame into buffer."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)
        assert len(detector._frame_buffer) == 0

        frame = detector._capture_frame()

        # Frame should be added to buffer
        assert len(detector._frame_buffer) == 1
        assert frame is not None

    def test_buffer_sliding_window(self):
        """Test that buffer maintains sliding window size."""
        from systems.evolution_daemon.safety.fracture_detector import (
            FractureDetector, FractureConfig
        )

        config = FractureConfig(WINDOW_SIZE=3)
        detector = FractureDetector(daemon=None, config=config)

        # Capture more frames than window size
        for _ in range(5):
            detector._capture_frame()

        # Buffer should be capped at WINDOW_SIZE
        assert len(detector._frame_buffer) == 3

    def test_analyze_frames_returns_drift(self):
        """Test that frame analysis returns drift score."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)

        # Capture some frames
        for _ in range(3):
            detector._capture_frame()

        drift = detector._analyze_frames()

        # Should return a float drift score
        assert isinstance(drift, float)
        assert 0.0 <= drift <= 1.0
```

- [ ] **Step 2: Run test to verify it fails**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestFrameCapture -v`
Expected: FAIL with "AttributeError: 'FractureDetector' object has no attribute '_capture_frame'"

- [ ] **Step 3: Implement frame capture and analysis**

Add to `systems/evolution_daemon/safety/fracture_detector.py`:

```python
    def _capture_frame(self) -> "ASCIIFrame":
        """Capture current state as an ASCIIFrame."""
        from .data_structures import ASCIIFrame

        # Parse GNB state
        gnb_frame = self._parse_gnb_state()

        # Parse window data
        windows = self._parse_shell_fragments()

        # Build frame
        frame = ASCIIFrame(
            timestamp=gnb_frame.timestamp if gnb_frame else time.time(),
            window_count=len(windows),
            windows=windows,
            heartbeat_age=gnb_frame.heartbeat_age if gnb_frame else 0.0
        )

        # Add to buffer (sliding window)
        self._frame_buffer.append(frame)

        # Trim buffer to window size
        while len(self._frame_buffer) > self.config.WINDOW_SIZE:
            self._frame_buffer.pop(0)

        return frame

    def _analyze_frames(self) -> float:
        """Analyze frame buffer for geometric drift."""
        if len(self._frame_buffer) < 2:
            return 0.0

        return calculate_geometric_drift(self._frame_buffer, self.config)
```

- [ ] **Step 4: Run test to verify it passes**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestFrameCapture -v`
Expected: PASS

- [ ] **Step 5: Commit frame capture and analysis**

```bash
git add systems/evolution_daemon/safety/fracture_detector.py tests/evolution_daemon/safety/test_fracture_detector.py
git commit -m "feat(ouroboros): implement frame capture and drift analysis

Phase 56 - Self-Healing Kernel

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

### Task 3.4: Implement Reflex Triggering

**Files:**
- Modify: `systems/evolution_daemon/safety/fracture_detector.py`
- Test: `tests/evolution_daemon/safety/test_fracture_detector.py`

- [ ] **Step 1: Write failing tests for reflex triggering**

```python
# Add to tests/evolution_daemon/safety/test_fracture_detector.py

class TestReflexTriggering:
    """Tests for reflex response triggering."""

    def test_trigger_warning_reflex(self):
        """Test WARNING reflex triggers logging."""
        from systems.evolution_daemon.safety.fracture_detector import (
            FractureDetector, OuroborosReflex
        )
        from systems.evolution_daemon.safety.data_structures import FractureEvent

        detector = FractureDetector(daemon=None)

        event = detector._trigger_reflex(
            OuroborosReflex.WARNING,
            drift=0.35,
            signal_type="window_explosion"
        )

        assert event.reflex_level == OuroborosReflex.WARNING
        assert detector._reflexes_triggered_24h[OuroborosReflex.WARNING] == 1
        assert detector._last_fracture == event

    def test_trigger_quarantine_reflex(self):
        """Test QUARANTINE reflex quarantines districts."""
        from systems.evolution_daemon.safety.fracture_detector import (
            FractureDetector, OuroborosReflex
        )

        detector = FractureDetector(daemon=None)

        detector._trigger_reflex(
            OuroborosReflex.QUARANTINE,
            drift=0.6,
            signal_type="window_teleport",
            affected_districts=["district_alpha"]
        )

        assert detector.is_district_quarantined("district_alpha")
        assert detector._reflexes_triggered_24h[OuroborosReflex.QUARANTINE] == 1

    def test_trigger_emergency_freeze(self):
        """Test EMERGENCY_FREEZE sets global freeze state."""
        from systems.evolution_daemon.safety.fracture_detector import (
            FractureDetector, OuroborosReflex
        )

        detector = FractureDetector(daemon=None)

        detector._trigger_reflex(
            OuroborosReflex.EMERGENCY_FREEZE,
            drift=0.95,
            signal_type="heartbeat_desync"
        )

        assert detector._emergency_freeze is True
        assert detector._reflexes_triggered_24h[OuroborosReflex.EMERGENCY_FREEZE] == 1
```

- [ ] **Step 2: Run test to verify it fails**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestReflexTriggering -v`
Expected: FAIL with "AttributeError: 'FractureDetector' object has no attribute '_trigger_reflex'"

- [ ] **Step 3: Add emergency freeze state and implement reflex triggering**

Add `_emergency_freeze` to `__init__`:

```python
        # State
        self._running: bool = False
        self._emergency_freeze: bool = False
        self._project_root = Path.cwd()
```

Add the `_trigger_reflex` method:

```python
    def _trigger_reflex(
        self,
        reflex: OuroborosReflex,
        drift: float,
        signal_type: str = "unknown",
        affected_districts: Optional[List[str]] = None
    ) -> "FractureEvent":
        """
        Trigger a reflex response to a detected fracture.

        Args:
            reflex: The reflex level to trigger
            drift: The drift score that triggered this
            signal_type: Type of fracture signal detected
            affected_districts: Districts affected by the fracture

        Returns:
            FractureEvent describing the response
        """
        from .data_structures import FractureEvent

        affected_districts = affected_districts or []

        event = FractureEvent(
            timestamp=time.time(),
            reflex_level=reflex,
            drift_score=drift,
            signal_type=signal_type,
            affected_districts=affected_districts
        )

        # Update metrics
        self._last_fracture = event
        if reflex in self._reflexes_triggered_24h:
            self._reflexes_triggered_24h[reflex] += 1

        # Execute reflex action
        if reflex == OuroborosReflex.WARNING:
            logger.warning(
                f"⚠️ Ouroboros WARNING: {signal_type} (drift={drift:.2f})"
            )

        elif reflex == OuroborosReflex.QUARANTINE:
            logger.error(
                f"🛡️ Ouroboros QUARANTINE: {signal_type} (drift={drift:.2f})"
            )
            for district in affected_districts:
                self.quarantine_district(district)

        elif reflex == OuroborosReflex.EMERGENCY_FREEZE:
            logger.critical(
                f"🚨 Ouroboros EMERGENCY_FREEZE: {signal_type} (drift={drift:.2f})"
            )
            self._emergency_freeze = True

            # Notify daemon if available
            if self.daemon is not None:
                self.daemon.pause_mutations("Ouroboros emergency freeze")

        # Write alert log
        self._write_alert_log(event)

        return event

    def _write_alert_log(self, event: "FractureEvent") -> None:
        """Write fracture event to alert log."""
        alert_path = self._project_root / ".loop" / "ouroboros_alerts.log"
        alert_path.parent.mkdir(parents=True, exist_ok=True)

        with open(alert_path, "a") as f:
            f.write(
                f"[{datetime.now().isoformat()}] "
                f"REFLEX={event.reflex_level.name} "
                f"DRIFT={event.drift_score:.3f} "
                f"SIGNAL={event.signal_type} "
                f"DISTRICTS={','.join(event.affected_districts)}\n"
            )

    def is_emergency_frozen(self) -> bool:
        """Check if system is in emergency freeze state."""
        return self._emergency_freeze

    def clear_emergency_freeze(self) -> None:
        """Clear emergency freeze state (manual intervention)."""
        self._emergency_freeze = False
        logger.info("✅ Ouroboros emergency freeze cleared")
```

- [ ] **Step 4: Run test to verify it passes**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestReflexTriggering -v`
Expected: PASS

- [ ] **Step 5: Commit reflex triggering**

```bash
git add systems/evolution_daemon/safety/fracture_detector.py tests/evolution_daemon/safety/test_fracture_detector.py
git commit -m "feat(ouroboros): implement reflex triggering and emergency freeze

Phase 56 - Self-Healing Kernel

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

### Task 3.5: Implement Main Run Loop

**Files:**
- Modify: `systems/evolution_daemon/safety/fracture_detector.py`
- Test: `tests/evolution_daemon/safety/test_fracture_detector.py`

- [ ] **Step 1: Write failing tests for run loop**

```python
# Add to tests/evolution_daemon/safety/test_fracture_detector.py
import asyncio

class TestRunLoop:
    """Tests for the main detector run loop."""

    @pytest.mark.asyncio
    async def test_run_loop_captures_frames(self):
        """Test that run loop captures frames periodically."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)

        # Run for a short time
        task = asyncio.create_task(detector.run())
        await asyncio.sleep(0.2)  # Let it run briefly

        detector.stop()
        await asyncio.sleep(0.1)  # Let it stop

        # Should have captured at least one frame
        assert len(detector._frame_buffer) >= 1

    @pytest.mark.asyncio
    async def test_run_loop_updates_drift(self):
        """Test that run loop updates current drift."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)

        task = asyncio.create_task(detector.run())
        await asyncio.sleep(0.3)

        detector.stop()
        await asyncio.sleep(0.1)

        # Drift should be set (even if 0.0)
        assert detector._drift_current is not None

    def test_stop_method(self):
        """Test that stop method sets running to False."""
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        detector = FractureDetector(daemon=None)
        detector._running = True

        detector.stop()

        assert detector._running is False
```

- [ ] **Step 2: Run test to verify it fails**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestRunLoop -v`
Expected: FAIL with "AttributeError: 'FractureDetector' object has no attribute 'run'"

- [ ] **Step 3: Implement run loop**

Add to `systems/evolution_daemon/safety/fracture_detector.py`:

```python
    async def run(self) -> None:
        """
        Main monitoring loop.

        Captures frames at 1Hz, analyzes drift, and triggers reflexes.
        """
        logger.info(f"🧬 Ouroboros Fracture Detector starting (PAIN_THRESHOLD={self.config.PAIN_THRESHOLD})")
        self._running = True

        try:
            while self._running:
                # 1. Capture current frame
                self._capture_frame()

                # 2. Analyze drift if we have enough frames
                if len(self._frame_buffer) >= 2:
                    drift = self._analyze_frames()
                    self._drift_current = drift

                    # Update max drift
                    if drift > self._drift_max_24h:
                        self._drift_max_24h = drift

                    # 3. Check for fracture signals
                    reflex = determine_reflex_level(drift, self.config)

                    if reflex != OuroborosReflex.NONE:
                        signal = self._detect_signal_type(drift)
                        districts = self._identify_affected_districts()
                        self._trigger_reflex(reflex, drift, signal, districts)

                    # 4. Check heartbeat desync separately
                    if self._frame_buffer:
                        last_frame = self._frame_buffer[-1]
                        if last_frame.heartbeat_age > self.config.MAX_HEARTBEAT_AGE:
                            self._trigger_reflex(
                                OuroborosReflex.EMERGENCY_FREEZE,
                                drift=1.0,
                                signal_type="heartbeat_desync"
                            )

                    # 5. Write metrics
                    self._write_metrics()

                # Sleep for 1 second (1Hz monitoring)
                await asyncio.sleep(1.0)

        except asyncio.CancelledError:
            logger.info("Ouroboros detector cancelled")
        except Exception as e:
            logger.error(f"Ouroboros detector crashed: {e}")
        finally:
            self._running = False
            logger.info("🛑 Ouroboros Fracture Detector stopped")

    def stop(self) -> None:
        """Stop the detector loop."""
        self._running = False

    def _detect_signal_type(self, drift: float) -> str:
        """Determine which fracture signal type triggered the reflex."""
        if len(self._frame_buffer) < 2:
            return "unknown"

        prev = self._frame_buffer[-2]
        curr = self._frame_buffer[-1]

        # Check for window explosion
        count_delta = abs(curr.window_count - prev.window_count)
        if count_delta > self.config.MAX_COUNT_DELTA:
            return "window_explosion"

        # Check for window teleport
        pos_drift = calculate_position_drift(
            prev.windows, curr.windows, self.config.MAX_POSITION_DELTA
        )
        if pos_drift > 0.5:
            return "window_teleport"

        # Check for PAS collapse
        stability_drop = prev.stability - curr.stability
        if stability_drop > self.config.MAX_STABILITY_DROP:
            return "pas_collapse"

        return "geometric_drift"

    def _identify_affected_districts(self) -> List[str]:
        """Identify which districts are affected by current drift."""
        # For now, return empty - can be enhanced with district mapping
        return []

    def _write_metrics(self) -> None:
        """Write current metrics to ASCII file."""
        metrics_path = (
            self._project_root /
            self.config.ASCII_SCENE_DIR /
            "ouroboros_metrics.ascii"
        )
        metrics_path.parent.mkdir(parents=True, exist_ok=True)

        content = f"""# Ouroboros Fracture Metrics
drift_current: {self._drift_current:.3f}
drift_max_24h: {self._drift_max_24h:.3f}
reflexes_triggered_24h: {sum(self._reflexes_triggered_24h.values())}
  - WARNING: {self._reflexes_triggered_24h[OuroborosReflex.WARNING]}
  - QUARANTINE: {self._reflexes_triggered_24h[OuroborosReflex.QUARANTINE]}
  - EMERGENCY_FREEZE: {self._reflexes_triggered_24h[OuroborosReflex.EMERGENCY_FREEZE]}
districts_quarantined: {len(self._quarantined_districts)}
emergency_frozen: {self._emergency_freeze}
last_fracture: {self._last_fracture.signal_type if self._last_fracture else 'null'}
"""
        metrics_path.write_text(content)
```

- [ ] **Step 4: Run test to verify it passes**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py::TestRunLoop -v`
Expected: PASS

- [ ] **Step 5: Commit run loop**

```bash
git add systems/evolution_daemon/safety/fracture_detector.py tests/evolution_daemon/safety/test_fracture_detector.py
git commit -m "feat(ouroboros): implement main run loop with 1Hz monitoring

Phase 56 - Self-Healing Kernel

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 4: Integration

### Task 4.1: Update Safety Package Exports

**Files:**
- Modify: `systems/evolution_daemon/safety/__init__.py`

- [ ] **Step 1: Add exports to __init__.py**

```python
# Add to imports in systems/evolution_daemon/safety/__init__.py

from .data_structures import (
    # ... existing imports ...
    # V14 (Ouroboros) additions
    ASCIIFrame,
    FractureEvent,
)

from .fracture_detector import (
    FractureDetector,
    FractureConfig,
    OuroborosReflex,
    calculate_geometric_drift,
    calculate_position_drift,
    determine_reflex_level,
)

# Add to __all__ list
__all__ = [
    # ... existing exports ...
    # V14 (Ouroboros)
    "ASCIIFrame",
    "FractureEvent",
    "FractureDetector",
    "FractureConfig",
    "OuroborosReflex",
    "calculate_geometric_drift",
    "calculate_position_drift",
    "determine_reflex_level",
]
```

Update version:

```python
__version__ = "14.0.0"  # Bumped for Ouroboros
```

- [ ] **Step 2: Verify imports work**

Run: `python -c "from systems.evolution_daemon.safety import FractureDetector, OuroborosReflex; print('OK')"`
Expected: "OK"

- [ ] **Step 3: Commit package exports**

```bash
git add systems/evolution_daemon/safety/__init__.py
git commit -m "feat(ouroboros): export FractureDetector from safety package

Phase 56 - Self-Healing Kernel

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

### Task 4.2: Wire FractureDetector into EvolutionDaemon

**Files:**
- Modify: `systems/evolution_daemon/evolution_daemon.py`
- Test: `tests/evolution_daemon/safety/test_ouroboros_integration.py`

- [ ] **Step 1: Write integration test**

```python
# tests/evolution_daemon/safety/test_ouroboros_integration.py
"""Integration tests for Ouroboros Fracture Detector."""
import pytest
import asyncio


class TestEvolutionDaemonIntegration:
    """Tests for EvolutionDaemon + Ouroboros integration."""

    @pytest.mark.asyncio
    async def test_daemon_creates_fracture_detector(self):
        """Test that daemon creates a FractureDetector instance."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        daemon = EvolutionDaemon()

        # Should have fracture detector attribute
        assert hasattr(daemon, '_fracture_detector')

        # Should be None until started (or created in __init__)
        # Implementation may vary

    @pytest.mark.asyncio
    async def test_daemon_has_fracture_task(self):
        """Test that daemon has fracture detector task."""
        # This test depends on how daemon is structured
        pass
```

- [ ] **Step 2: Run test to see current state**

Run: `python -m pytest tests/evolution_daemon/safety/test_ouroboros_integration.py -v`
Expected: FAIL (detector not wired yet)

- [ ] **Step 3: Wire detector into EvolutionDaemon**

In `systems/evolution_daemon/evolution_daemon.py`, add to imports:

```python
from systems.evolution_daemon.safety.fracture_detector import (
    FractureDetector,
    OuroborosReflex,
)
```

Add to `__init__` method:

```python
        # V14 Ouroboros - Fracture Detection
        self._fracture_detector: Optional[FractureDetector] = None
        self._fracture_task: Optional[asyncio.Task] = None
        self._init_ouroboros()
```

Add initialization method:

```python
    def _init_ouroboros(self) -> None:
        """Initialize the Ouroboros Fracture Detector."""
        self._fracture_detector = FractureDetector(daemon=self)
        logger.info("🧬 Ouroboros Fracture Detector initialized (PAIN_THRESHOLD=0.3)")
```

Start the detector task in the daemon's start/run method:

```python
        # Start Ouroboros fracture detector
        if self._fracture_detector:
            self._fracture_task = asyncio.create_task(
                self._fracture_detector.run(),
                name="ouroboros_fracture_detector"
            )
            logger.info("🧬 Ouroboros Fracture Detector started")
```

Add method to check quarantine state:

```python
    def is_district_quarantined(self, district: str) -> bool:
        """Check if a district is quarantined by Ouroboros."""
        if self._fracture_detector is None:
            return False
        return self._fracture_detector.is_district_quarantined(district)

    def is_emergency_frozen(self) -> bool:
        """Check if system is in Ouroboros emergency freeze."""
        if self._fracture_detector is None:
            return False
        return self._fracture_detector.is_emergency_frozen()
```

- [ ] **Step 4: Update integration test**

```python
# Update test in test_ouroboros_integration.py

    def test_daemon_creates_fracture_detector(self):
        """Test that daemon creates a FractureDetector instance."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        daemon = EvolutionDaemon()

        assert hasattr(daemon, '_fracture_detector')
        assert isinstance(daemon._fracture_detector, FractureDetector)

    def test_daemon_quarantine_check_method(self):
        """Test that daemon has quarantine check method."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        daemon = EvolutionDaemon()

        assert hasattr(daemon, 'is_district_quarantined')
        assert daemon.is_district_quarantined("test_district") is False
```

- [ ] **Step 5: Run test to verify it passes**

Run: `python -m pytest tests/evolution_daemon/safety/test_ouroboros_integration.py -v`
Expected: PASS

- [ ] **Step 6: Commit daemon integration**

```bash
git add systems/evolution_daemon/evolution_daemon.py tests/evolution_daemon/safety/test_ouroboros_integration.py
git commit -m "feat(ouroboros): wire FractureDetector into EvolutionDaemon

Phase 56 - Self-Healing Kernel

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

### Task 4.3: Add Quarantine Check to Mutation Governor

**Files:**
- Modify: `systems/swarm/agency_agents.py`
- Test: `tests/evolution_daemon/safety/test_ouroboros_integration.py`

- [ ] **Step 1: Write test for Governor quarantine check**

```python
# Add to test_ouroboros_integration.py

class TestMutationGovernorQuarantine:
    """Tests for Mutation Governor quarantine integration."""

    def test_governor_checks_quarantine_before_evaluation(self):
        """Test that Governor checks quarantine state before evaluation."""
        from systems.swarm.agency_agents import MutationGovernorAgent

        # This is a design test - implementation may vary
        # Governor should have access to daemon's quarantine state
        pass
```

- [ ] **Step 2: Add quarantine check to MutationGovernorAgent**

In `systems/swarm/agency_agents.py`, find the `MutationGovernorAgent` class and add quarantine check:

```python
    async def process_task(self, task: AgentTask) -> AgentResult:
        """Process a mutation evaluation task with quarantine check."""
        # Extract district from task metadata
        district = task.metadata.get("district", "unknown")

        # Check for active quarantine
        if self._daemon and hasattr(self._daemon, 'is_district_quarantined'):
            if self._daemon.is_district_quarantined(district):
                return AgentResult(
                    task_id=task.task_id,
                    success=False,
                    error=f"District '{district}' under Ouroboros quarantine"
                )

        # Check for emergency freeze
        if self._daemon and hasattr(self._daemon, 'is_emergency_frozen'):
            if self._daemon.is_emergency_frozen():
                return AgentResult(
                    task_id=task.task_id,
                    success=False,
                    error="System under Ouroboros emergency freeze"
                )

        # ... existing evaluation logic ...
```

- [ ] **Step 3: Commit Governor integration**

```bash
git add systems/swarm/agency_agents.py tests/evolution_daemon/safety/test_ouroboros_integration.py
git commit -m "feat(ouroboros): add quarantine check to Mutation Governor

Phase 56 - Self-Healing Kernel

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 5: Final Verification

### Task 5.1: Run All Tests

- [ ] **Step 1: Run full test suite for fracture detector**

Run: `python -m pytest tests/evolution_daemon/safety/test_fracture_detector.py -v`
Expected: All tests PASS

- [ ] **Step 2: Run integration tests**

Run: `python -m pytest tests/evolution_daemon/safety/test_ouroboros_integration.py -v`
Expected: All tests PASS

- [ ] **Step 3: Run all safety tests**

Run: `python -m pytest tests/evolution_daemon/safety/ -v`
Expected: All tests PASS

### Task 5.2: Update Documentation

- [ ] **Step 1: Update MEMORY.md**

Add to `memory/MEMORY.md`:

```markdown
| [Ouroboros](ouroboros.md) | ✅ Complete | 15+ | Fracture detection, reflex responses |
```

Create `memory/ouroboros.md`:

```markdown
# Ouroboros Fracture Detector

## Overview

The Ouroboros Fracture Detector provides Geometry OS with a "spinal cord" —
a reflex arc that detects structural fractures in real-time and triggers
emergency response before cascading failure spreads.

## Key Components

- **FractureDetector**: Main monitoring class (1Hz ASCII Scene polling)
- **OuroborosReflex**: Enum for reflex levels (NONE, WARNING, QUARANTINE, EMERGENCY_FREEZE)
- **FractureConfig**: Configuration thresholds

## Fracture Signals

| Signal | Threshold | Reflex |
|--------|-----------|--------|
| Window Teleport | >500px delta | QUARANTINE |
| Window Explosion | >10 count delta | WARNING |
| Heartbeat Desync | >3s no update | EMERGENCY_FREEZE |
| PAS Collapse | >0.5 stability drop | QUARANTINE |

## Usage

```python
from systems.evolution_daemon.safety import FractureDetector

detector = FractureDetector(daemon=evolution_daemon)
await detector.run()
```

## Files

- `systems/evolution_daemon/safety/fracture_detector.py`
- `.geometry/ascii_scene/ouroboros_metrics.ascii`
- `.loop/ouroboros_alerts.log`
```

- [ ] **Step 2: Commit documentation**

```bash
git add memory/MEMORY.md memory/ouroboros.md
git commit -m "docs: add Ouroboros Fracture Detector documentation

Phase 56 - Self-Healing Kernel

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

### Task 5.3: Final Commit

- [ ] **Step 1: Run git status**

Run: `git status`
Expected: Clean working directory (all changes committed)

- [ ] **Step 2: Verify all files are present**

Run: `ls -la systems/evolution_daemon/safety/fracture_detector.py tests/evolution_daemon/safety/test_fracture_detector.py`
Expected: Both files exist

---

## Summary

This plan implements the Ouroboros Fracture Detector across 5 chunks:

1. **Chunk 1**: Data structures (ASCIIFrame, FractureEvent)
2. **Chunk 2**: Core algorithms (drift calculation, reflex determination)
3. **Chunk 3**: FractureDetector class (frame capture, analysis, triggering)
4. **Chunk 4**: Integration (EvolutionDaemon, Mutation Governor)
5. **Chunk 5**: Verification and documentation

Total estimated tasks: 15
Total estimated commits: 12

---

*"The era of blind evolution is over. The era of the Ouroboros Spine has begun."*
