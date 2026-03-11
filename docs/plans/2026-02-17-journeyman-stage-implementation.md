# Journeyman Stage Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Implement the VisualVerificationService to enable AI self-verification of visual modifications.

**Architecture:** A dedicated service with CriticalityClassifier, LayoutVerifier, TextVerifier, SpatialVerifier components that integrate with the existing EvolutionDaemon via the safe_evolve() pipeline.

**Tech Stack:** Python 3.12, pytest, dataclasses, asyncio (matching existing Evolution Daemon)

---

## Task 1: Data Structures - Enums and Base Classes

**Files:**
- Create: `systems/evolution_daemon/visual_verification_service.py`
- Test: `systems/evolution_daemon/tests/test_visual_verification_service.py`

**Step 1: Write the failing test for CriticalityLevel enum**

```python
# systems/evolution_daemon/tests/test_visual_verification_service.py
"""
Journeyman Stage - Visual Verification Service Tests

Tests for AI self-verification of visual modifications.
"""
import pytest


class TestCriticalityLevel:
    """Tests for CriticalityLevel enum"""

    def test_criticality_level_has_exact(self):
        from systems.evolution_daemon.visual_verification_service import CriticalityLevel
        assert CriticalityLevel.EXACT.value == "exact"

    def test_criticality_level_has_tolerant(self):
        from systems.evolution_daemon.visual_verification_service import CriticalityLevel
        assert CriticalityLevel.TOLERANT.value == "tolerant"

    def test_criticality_level_has_relaxed(self):
        from systems.evolution_daemon.visual_verification_service import CriticalityLevel
        assert CriticalityLevel.RELAXED.value == "relaxed"
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestCriticalityLevel -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 3: Write minimal implementation**

```python
# systems/evolution_daemon/visual_verification_service.py
"""
Visual Verification Service - Journeyman Stage

Enables AI self-verification of visual modifications through tiered
verification (exact, tolerant, relaxed) with adaptive iteration and
human escalation.
"""
from enum import Enum


class CriticalityLevel(Enum):
    """Verification strictness levels"""
    EXACT = "exact"           # Pixel-perfect match required
    TOLERANT = "tolerant"     # Within ±N pixels
    RELAXED = "relaxed"       # Semantic/rough match
```

**Step 4: Run test to verify it passes**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestCriticalityLevel -v`
Expected: 3 PASSED

**Step 5: Commit**

```bash
git add systems/evolution_daemon/visual_verification_service.py systems/evolution_daemon/tests/test_visual_verification_service.py
git commit -m "feat(journeyman): add CriticalityLevel enum for tiered verification"
```

---

## Task 2: Data Structures - VisualIntent

**Files:**
- Modify: `systems/evolution_daemon/visual_verification_service.py`
- Modify: `systems/evolution_daemon/tests/test_visual_verification_service.py`

**Step 1: Write the failing test for VisualIntent dataclass**

```python
# Add to test_visual_verification_service.py

class TestVisualIntent:
    """Tests for VisualIntent dataclass"""

    def test_visual_intent_has_required_fields(self):
        from systems.evolution_daemon.visual_verification_service import VisualIntent
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )
        assert intent.element_type == "button"
        assert intent.position == (100, 200)
        assert intent.size == (80, 40)

    def test_visual_intent_has_optional_critical_flag(self):
        from systems.evolution_daemon.visual_verification_service import VisualIntent
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40),
            critical=True
        )
        assert intent.critical is True

    def test_visual_intent_critical_defaults_to_none(self):
        from systems.evolution_daemon.visual_verification_service import VisualIntent
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )
        assert intent.critical is None

    def test_visual_intent_has_properties_dict(self):
        from systems.evolution_daemon.visual_verification_service import VisualIntent
        intent = VisualIntent(
            element_type="text",
            position=(50, 50),
            size=(100, 20),
            properties={"text": "Save", "font_size": 14}
        )
        assert intent.properties["text"] == "Save"
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestVisualIntent -v`
Expected: FAIL

**Step 3: Write minimal implementation**

```python
# Add to visual_verification_service.py (after CriticalityLevel)

from dataclasses import dataclass, field
from typing import Optional, List, Dict, Any


@dataclass
class VisualIntent:
    """What the AI intended to create/modify"""
    element_type: str                    # "button", "text", "window", etc.
    position: tuple[int, int]            # (x, y)
    size: tuple[int, int]                # (width, height)
    properties: Dict[str, Any] = field(default_factory=dict)
    critical: Optional[bool] = None      # Explicit criticality (None = use heuristic)
    spatial_relations: List['SpatialRelation'] = field(default_factory=list)
```

**Step 4: Run test to verify it passes**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestVisualIntent -v`
Expected: 4 PASSED

**Step 5: Commit**

```bash
git add systems/evolution_daemon/visual_verification_service.py systems/evolution_daemon/tests/test_visual_verification_service.py
git commit -m "feat(journeyman): add VisualIntent dataclass for intent capture"
```

---

## Task 3: Data Structures - SpatialRelation, VerificationMatch, VerificationResult

**Files:**
- Modify: `systems/evolution_daemon/visual_verification_service.py`
- Modify: `systems/evolution_daemon/tests/test_visual_verification_service.py`

**Step 1: Write the failing tests**

```python
# Add to test_visual_verification_service.py

class TestSpatialRelation:
    """Tests for SpatialRelation dataclass"""

    def test_spatial_relation_has_required_fields(self):
        from systems.evolution_daemon.visual_verification_service import SpatialRelation
        relation = SpatialRelation(
            relation_type="above",
            target_element="submit_button"
        )
        assert relation.relation_type == "above"
        assert relation.target_element == "submit_button"

    def test_spatial_relation_has_default_tolerance(self):
        from systems.evolution_daemon.visual_verification_service import SpatialRelation
        relation = SpatialRelation(
            relation_type="left_of",
            target_element="input_field"
        )
        assert relation.tolerance == 10


class TestVerificationMatch:
    """Tests for VerificationMatch dataclass"""

    def test_verification_match_has_required_fields(self):
        from systems.evolution_daemon.visual_verification_service import (
            VerificationMatch, CriticalityLevel
        )
        match = VerificationMatch(
            success=True,
            criticality=CriticalityLevel.TOLERANT,
            actual_position=(100, 200),
            expected_position=(100, 200),
            position_delta=(0, 0)
        )
        assert match.success is True
        assert match.position_delta == (0, 0)

    def test_verification_match_has_default_confidence(self):
        from systems.evolution_daemon.visual_verification_service import (
            VerificationMatch, CriticalityLevel
        )
        match = VerificationMatch(
            success=True,
            criticality=CriticalityLevel.EXACT,
            actual_position=(50, 50),
            expected_position=(50, 50),
            position_delta=(0, 0)
        )
        assert match.confidence == 1.0


class TestVerificationResult:
    """Tests for VerificationResult dataclass"""

    def test_verification_result_has_required_fields(self):
        from systems.evolution_daemon.visual_verification_service import VerificationResult
        result = VerificationResult(
            success=True,
            matches=[],
            overall_confidence=1.0,
            should_retry=False,
            should_escalate=False,
            retry_suggestions=[],
            summary="All verifications passed"
        )
        assert result.success is True
        assert result.should_retry is False

    def test_verification_result_retry_suggestions_default_empty(self):
        from systems.evolution_daemon.visual_verification_service import VerificationResult
        result = VerificationResult(
            success=False,
            matches=[],
            overall_confidence=0.5,
            should_retry=True,
            should_escalate=False,
            summary="Partial match"
        )
        assert result.retry_suggestions == []
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestSpatialRelation -v`
Expected: FAIL

**Step 3: Write minimal implementation**

```python
# Add to visual_verification_service.py (after VisualIntent)

@dataclass
class SpatialRelation:
    """Expected spatial relationship between elements"""
    relation_type: str       # "above", "below", "left_of", "right_of", "inside", "overlaps"
    target_element: str      # Element ID or description
    tolerance: int = 10      # Pixels of tolerance


@dataclass
class VerificationMatch:
    """Result of verifying a single element"""
    success: bool
    criticality: CriticalityLevel
    actual_position: tuple[int, int]
    expected_position: tuple[int, int]
    position_delta: tuple[int, int]      # How far off (for iteration learning)
    failures: List[str] = field(default_factory=list)
    confidence: float = 1.0              # 0.0 to 1.0


@dataclass
class VerificationResult:
    """Complete verification result for an intent"""
    success: bool
    matches: List[VerificationMatch]
    overall_confidence: float
    should_retry: bool                    # True if adaptive iteration should continue
    should_escalate: bool                 # True if human review needed
    retry_suggestions: List[str]          # Actionable hints for next attempt
    summary: str                          # Human-readable result
```

**Step 4: Run test to verify it passes**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestSpatialRelation -v`
Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestVerificationMatch -v`
Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestVerificationResult -v`
Expected: All PASSED

**Step 5: Commit**

```bash
git add systems/evolution_daemon/visual_verification_service.py systems/evolution_daemon/tests/test_visual_verification_service.py
git commit -m "feat(journeyman): add SpatialRelation, VerificationMatch, VerificationResult dataclasses"
```

---

## Task 4: CriticalityClassifier

**Files:**
- Modify: `systems/evolution_daemon/visual_verification_service.py`
- Modify: `systems/evolution_daemon/tests/test_visual_verification_service.py`

**Step 1: Write the failing tests**

```python
# Add to test_visual_verification_service.py

class TestCriticalityClassifier:
    """Tests for hybrid criticality classification"""

    def test_explicit_critical_flag_returns_exact(self):
        """Explicit critical=True should override heuristics"""
        from systems.evolution_daemon.visual_verification_service import (
            CriticalityClassifier, VisualIntent, CriticalityLevel
        )
        intent = VisualIntent(
            element_type="decoration",  # Normally non-critical
            position=(0, 0),
            size=(100, 100),
            critical=True
        )
        classifier = CriticalityClassifier()
        assert classifier.classify(intent) == CriticalityLevel.EXACT

    def test_explicit_non_critical_flag_returns_relaxed(self):
        """Explicit critical=False should override heuristics"""
        from systems.evolution_daemon.visual_verification_service import (
            CriticalityClassifier, VisualIntent, CriticalityLevel
        )
        intent = VisualIntent(
            element_type="button",  # Normally critical
            position=(0, 0),
            size=(100, 100),
            critical=False
        )
        classifier = CriticalityClassifier()
        assert classifier.classify(intent) == CriticalityLevel.RELAXED

    def test_heuristic_critical_type_returns_tolerant(self):
        """Heuristic: button should be TOLERANT"""
        from systems.evolution_daemon.visual_verification_service import (
            CriticalityClassifier, VisualIntent, CriticalityLevel
        )
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40),
            critical=None  # Use heuristic
        )
        classifier = CriticalityClassifier()
        assert classifier.classify(intent) == CriticalityLevel.TOLERANT

    def test_heuristic_non_critical_type_returns_relaxed(self):
        """Heuristic: decoration should be RELAXED"""
        from systems.evolution_daemon.visual_verification_service import (
            CriticalityClassifier, VisualIntent, CriticalityLevel
        )
        intent = VisualIntent(
            element_type="decoration",
            position=(0, 0),
            size=(50, 50),
            critical=None
        )
        classifier = CriticalityClassifier()
        assert classifier.classify(intent) == CriticalityLevel.RELAXED
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestCriticalityClassifier -v`
Expected: FAIL

**Step 3: Write minimal implementation**

```python
# Add to visual_verification_service.py (after VerificationResult)

class CriticalityClassifier:
    """
    Determines if an element requires exact or tolerance-based verification.
    Uses hybrid approach: explicit marking + heuristic fallback.
    """

    # Heuristic defaults: element types that are inherently critical
    CRITICAL_TYPES = {
        "button", "input", "link", "checkbox", "dropdown",
        "window_title", "navigation", "form_field"
    }

    NON_CRITICAL_TYPES = {
        "decoration", "background", "icon", "divider", "spacer"
    }

    def classify(self, element: VisualIntent) -> CriticalityLevel:
        """Returns: EXACT, TOLERANT, or RELAXED"""
        # 1. Check explicit critical flag
        if element.critical is True:
            return CriticalityLevel.EXACT
        if element.critical is False:
            return CriticalityLevel.RELAXED

        # 2. Fall back to heuristic classification
        if element.element_type in self.CRITICAL_TYPES:
            return CriticalityLevel.TOLERANT
        if element.element_type in self.NON_CRITICAL_TYPES:
            return CriticalityLevel.RELAXED

        # 3. Default to tolerant
        return CriticalityLevel.TOLERANT
```

**Step 4: Run test to verify it passes**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestCriticalityClassifier -v`
Expected: 4 PASSED

**Step 5: Commit**

```bash
git add systems/evolution_daemon/visual_verification_service.py systems/evolution_daemon/tests/test_visual_verification_service.py
git commit -m "feat(journeyman): add CriticalityClassifier with hybrid classification"
```

---

## Task 5: LayoutVerifier

**Files:**
- Modify: `systems/evolution_daemon/visual_verification_service.py`
- Modify: `systems/evolution_daemon/tests/test_visual_verification_service.py`

**Step 1: Write the failing tests**

```python
# Add to test_visual_verification_service.py

class TestLayoutVerifier:
    """Tests for layout verification with tiered strictness"""

    def test_exact_match_position_success(self):
        """Exact position match should succeed"""
        from systems.evolution_daemon.visual_verification_service import (
            LayoutVerifier, VisualIntent, CriticalityLevel
        )
        verifier = LayoutVerifier()
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )
        actual = {"x": 100, "y": 200, "width": 80, "height": 40}

        result = verifier.verify(intent, actual, CriticalityLevel.EXACT)
        assert result.success is True
        assert result.position_delta == (0, 0)

    def test_exact_match_position_failure_one_pixel(self):
        """Even 1 pixel off should fail for EXACT"""
        from systems.evolution_daemon.visual_verification_service import (
            LayoutVerifier, VisualIntent, CriticalityLevel
        )
        verifier = LayoutVerifier()
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )
        actual = {"x": 101, "y": 200, "width": 80, "height": 40}

        result = verifier.verify(intent, actual, CriticalityLevel.EXACT)
        assert result.success is False
        assert result.position_delta == (1, 0)

    def test_tolerant_match_success_within_tolerance(self):
        """Within tolerance (±5) should succeed for TOLERANT"""
        from systems.evolution_daemon.visual_verification_service import (
            LayoutVerifier, VisualIntent, CriticalityLevel
        )
        verifier = LayoutVerifier()
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )
        actual = {"x": 103, "y": 198, "width": 80, "height": 40}

        result = verifier.verify(intent, actual, CriticalityLevel.TOLERANT)
        assert result.success is True

    def test_tolerant_match_failure_beyond_tolerance(self):
        """Beyond tolerance should fail for TOLERANT"""
        from systems.evolution_daemon.visual_verification_service import (
            LayoutVerifier, VisualIntent, CriticalityLevel
        )
        verifier = LayoutVerifier()
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )
        actual = {"x": 110, "y": 200, "width": 80, "height": 40}

        result = verifier.verify(intent, actual, CriticalityLevel.TOLERANT)
        assert result.success is False
        assert result.position_delta == (10, 0)
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestLayoutVerifier -v`
Expected: FAIL

**Step 3: Write minimal implementation**

```python
# Add to visual_verification_service.py (after CriticalityClassifier)

class LayoutVerifier:
    """
    Verifies position, size, and type of UI elements.
    Applies tiered verification based on criticality.
    """

    DEFAULT_TOLERANCE = {
        "position": 5,   # ±5 pixels
        "size": 5,       # ±5 pixels
    }

    def verify(
        self,
        intent: VisualIntent,
        actual: dict,
        criticality: CriticalityLevel
    ) -> VerificationMatch:
        """Verify layout matches intent based on criticality level."""
        expected_x, expected_y = intent.position
        expected_w, expected_h = intent.size

        actual_x = actual.get("x", 0)
        actual_y = actual.get("y", 0)
        actual_w = actual.get("width", 0)
        actual_h = actual.get("height", 0)

        # Calculate deltas
        dx = actual_x - expected_x
        dy = actual_y - expected_y
        dw = actual_w - expected_w
        dh = actual_h - expected_h

        failures = []
        tolerance = self._get_tolerance(criticality)

        # Check position
        if criticality == CriticalityLevel.EXACT:
            if abs(dx) > 0 or abs(dy) > 0:
                failures.append(f"Position mismatch: expected ({expected_x}, {expected_y}), got ({actual_x}, {actual_y})")
        else:
            if abs(dx) > tolerance or abs(dy) > tolerance:
                failures.append(f"Position out of tolerance: delta=({dx}, {dy}), max={tolerance}")

        # Check size
        if criticality == CriticalityLevel.EXACT:
            if abs(dw) > 0 or abs(dh) > 0:
                failures.append(f"Size mismatch: expected ({expected_w}, {expected_h}), got ({actual_w}, {actual_h})")
        else:
            if abs(dw) > tolerance or abs(dh) > tolerance:
                failures.append(f"Size out of tolerance: delta=({dw}, {dh}), max={tolerance}")

        success = len(failures) == 0
        confidence = 1.0 if success else max(0.0, 1.0 - (len(failures) * 0.2))

        return VerificationMatch(
            success=success,
            criticality=criticality,
            actual_position=(actual_x, actual_y),
            expected_position=(expected_x, expected_y),
            position_delta=(dx, dy),
            failures=failures,
            confidence=confidence
        )

    def _get_tolerance(self, criticality: CriticalityLevel) -> int:
        """Get tolerance based on criticality level."""
        if criticality == CriticalityLevel.EXACT:
            return 0
        elif criticality == CriticalityLevel.RELAXED:
            return self.DEFAULT_TOLERANCE["position"] * 2  # Double tolerance for relaxed
        return self.DEFAULT_TOLERANCE["position"]
```

**Step 4: Run test to verify it passes**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestLayoutVerifier -v`
Expected: 4 PASSED

**Step 5: Commit**

```bash
git add systems/evolution_daemon/visual_verification_service.py systems/evolution_daemon/tests/test_visual_verification_service.py
git commit -m "feat(journeyman): add LayoutVerifier with tiered strictness"
```

---

## Task 6: TextVerifier

**Files:**
- Modify: `systems/evolution_daemon/visual_verification_service.py`
- Modify: `systems/evolution_daemon/tests/test_visual_verification_service.py`

**Step 1: Write the failing tests**

```python
# Add to test_visual_verification_service.py

class TestTextVerifier:
    """Tests for text content verification"""

    def test_text_exact_match_success(self):
        """Exact text match should succeed"""
        from systems.evolution_daemon.visual_verification_service import (
            TextVerifier, VisualIntent, CriticalityLevel
        )
        verifier = TextVerifier()
        intent = VisualIntent(
            element_type="text",
            position=(50, 50),
            size=(100, 20),
            properties={"text": "Save"}
        )
        actual = {"x": 50, "y": 50, "text": "Save"}

        result = verifier.verify(intent, actual, CriticalityLevel.EXACT)
        assert result.success is True

    def test_text_exact_match_failure(self):
        """Text mismatch should fail for EXACT"""
        from systems.evolution_daemon.visual_verification_service import (
            TextVerifier, VisualIntent, CriticalityLevel
        )
        verifier = TextVerifier()
        intent = VisualIntent(
            element_type="text",
            position=(50, 50),
            size=(100, 20),
            properties={"text": "Save"}
        )
        actual = {"x": 50, "y": 50, "text": "Save "}

        result = verifier.verify(intent, actual, CriticalityLevel.EXACT)
        assert result.success is False

    def test_text_tolerant_similar_match(self):
        """Similar text should succeed for TOLERANT"""
        from systems.evolution_daemon.visual_verification_service import (
            TextVerifier, VisualIntent, CriticalityLevel
        )
        verifier = TextVerifier()
        intent = VisualIntent(
            element_type="text",
            position=(50, 50),
            size=(100, 20),
            properties={"text": "Save"}
        )
        actual = {"x": 50, "y": 50, "text": "save"}  # Case difference

        result = verifier.verify(intent, actual, CriticalityLevel.TOLERANT)
        assert result.success is True  # Similar enough

    def test_text_missing_in_actual(self):
        """Missing text should fail"""
        from systems.evolution_daemon.visual_verification_service import (
            TextVerifier, VisualIntent, CriticalityLevel
        )
        verifier = TextVerifier()
        intent = VisualIntent(
            element_type="text",
            position=(50, 50),
            size=(100, 20),
            properties={"text": "Save"}
        )
        actual = {"x": 50, "y": 50}  # No text field

        result = verifier.verify(intent, actual, CriticalityLevel.EXACT)
        assert result.success is False
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestTextVerifier -v`
Expected: FAIL

**Step 3: Write minimal implementation**

```python
# Add to visual_verification_service.py (after LayoutVerifier)

class TextVerifier:
    """
    Verifies text content and styling.
    Supports exact match and similarity-based verification.
    """

    def verify(
        self,
        intent: VisualIntent,
        actual: dict,
        criticality: CriticalityLevel
    ) -> VerificationMatch:
        """Verify text content matches intent."""
        expected_text = intent.properties.get("text", "")
        actual_text = actual.get("text", "")

        expected_pos = intent.position
        actual_pos = (actual.get("x", 0), actual.get("y", 0))

        dx = actual_pos[0] - expected_pos[0]
        dy = actual_pos[1] - expected_pos[1]

        failures = []

        if criticality == CriticalityLevel.EXACT:
            if actual_text != expected_text:
                failures.append(f"Text mismatch: expected '{expected_text}', got '{actual_text}'")
        elif criticality == CriticalityLevel.TOLERANT:
            # Case-insensitive comparison for tolerant
            if actual_text.lower() != expected_text.lower():
                # Check similarity (at least 80% match)
                similarity = self._calculate_similarity(expected_text, actual_text)
                if similarity < 0.8:
                    failures.append(f"Text too different: {similarity:.0%} similar")
        # RELAXED: Just check if there's some text
        elif not actual_text:
            failures.append("No text found")

        success = len(failures) == 0
        confidence = 1.0 if success else 0.5

        return VerificationMatch(
            success=success,
            criticality=criticality,
            actual_position=actual_pos,
            expected_position=expected_pos,
            position_delta=(dx, dy),
            failures=failures,
            confidence=confidence
        )

    def _calculate_similarity(self, text1: str, text2: str) -> float:
        """Calculate simple text similarity (Jaccard on words)."""
        if not text1 and not text2:
            return 1.0
        if not text1 or not text2:
            return 0.0

        words1 = set(text1.lower().split())
        words2 = set(text2.lower().split())

        if not words1 and not words2:
            return 1.0

        intersection = words1 & words2
        union = words1 | words2

        return len(intersection) / len(union) if union else 0.0
```

**Step 4: Run test to verify it passes**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestTextVerifier -v`
Expected: 4 PASSED

**Step 5: Commit**

```bash
git add systems/evolution_daemon/visual_verification_service.py systems/evolution_daemon/tests/test_visual_verification_service.py
git commit -m "feat(journeyman): add TextVerifier with similarity matching"
```

---

## Task 7: SpatialVerifier

**Files:**
- Modify: `systems/evolution_daemon/visual_verification_service.py`
- Modify: `systems/evolution_daemon/tests/test_visual_verification_service.py`

**Step 1: Write the failing tests**

```python
# Add to test_visual_verification_service.py

class TestSpatialVerifier:
    """Tests for spatial relationship verification"""

    def test_spatial_above_success(self):
        """Element above target should pass"""
        from systems.evolution_daemon.visual_verification_service import (
            SpatialVerifier, VisualIntent, SpatialRelation
        )
        verifier = SpatialVerifier()
        intent = VisualIntent(
            element_type="label",
            position=(100, 100),
            size=(80, 20),
            spatial_relations=[
                SpatialRelation(relation_type="above", target_element="button")
            ]
        )
        scene = {
            "children": [
                {"type": "label", "x": 100, "y": 100, "width": 80, "height": 20},
                {"type": "button", "x": 100, "y": 150, "width": 80, "height": 40}
            ]
        }

        result = verifier.verify(intent, scene)
        assert result.success is True

    def test_spatial_left_of_success(self):
        """Element left of target should pass"""
        from systems.evolution_daemon.visual_verification_service import (
            SpatialVerifier, VisualIntent, SpatialRelation
        )
        verifier = SpatialVerifier()
        intent = VisualIntent(
            element_type="label",
            position=(50, 100),
            size=(40, 20),
            spatial_relations=[
                SpatialRelation(relation_type="left_of", target_element="input")
            ]
        )
        scene = {
            "children": [
                {"type": "label", "x": 50, "y": 100, "width": 40, "height": 20},
                {"type": "input", "x": 100, "y": 100, "width": 200, "height": 30}
            ]
        }

        result = verifier.verify(intent, scene)
        assert result.success is True

    def test_spatial_inside_success(self):
        """Element inside target should pass"""
        from systems.evolution_daemon.visual_verification_service import (
            SpatialVerifier, VisualIntent, SpatialRelation
        )
        verifier = SpatialVerifier()
        intent = VisualIntent(
            element_type="button",
            position=(110, 60),
            size=(80, 30),
            spatial_relations=[
                SpatialRelation(relation_type="inside", target_element="window")
            ]
        )
        scene = {
            "children": [
                {"type": "Window", "x": 100, "y": 50, "width": 200, "height": 150},
                {"type": "button", "x": 110, "y": 60, "width": 80, "height": 30}
            ]
        }

        result = verifier.verify(intent, scene)
        assert result.success is True

    def test_spatial_relation_not_found_target(self):
        """Missing target element should fail"""
        from systems.evolution_daemon.visual_verification_service import (
            SpatialVerifier, VisualIntent, SpatialRelation
        )
        verifier = SpatialVerifier()
        intent = VisualIntent(
            element_type="label",
            position=(50, 100),
            size=(40, 20),
            spatial_relations=[
                SpatialRelation(relation_type="above", target_element="nonexistent")
            ]
        )
        scene = {
            "children": [
                {"type": "label", "x": 50, "y": 100, "width": 40, "height": 20}
            ]
        }

        result = verifier.verify(intent, scene)
        assert result.success is False
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestSpatialVerifier -v`
Expected: FAIL

**Step 3: Write minimal implementation**

```python
# Add to visual_verification_service.py (after TextVerifier)

class SpatialVerifier:
    """
    Verifies relative positions and spatial relationships.
    Checks: above/below, left/right, overlaps, contains, etc.
    """

    def verify(
        self,
        intent: VisualIntent,
        scene: dict
    ) -> VerificationMatch:
        """Verify spatial relationships in the scene."""
        failures = []

        # Find the subject element in the scene
        subject = self._find_element_by_position(scene, intent.position)
        if not subject:
            return VerificationMatch(
                success=False,
                criticality=CriticalityLevel.TOLERANT,
                actual_position=(0, 0),
                expected_position=intent.position,
                position_delta=(0, 0),
                failures=["Subject element not found in scene"],
                confidence=0.0
            )

        subject_bounds = self._get_bounds(subject)

        # Check each spatial relation
        for relation in intent.spatial_relations:
            target = self._find_element_by_type(scene, relation.target_element)
            if not target:
                failures.append(f"Target element '{relation.target_element}' not found")
                continue

            target_bounds = self._get_bounds(target)

            if not self._check_relation(
                subject_bounds, target_bounds,
                relation.relation_type, relation.tolerance
            ):
                failures.append(
                    f"Spatial relation '{relation.relation_type}' to '{relation.target_element}' not satisfied"
                )

        success = len(failures) == 0
        confidence = 1.0 if success else max(0.0, 1.0 - len(failures) * 0.25)

        return VerificationMatch(
            success=success,
            criticality=CriticalityLevel.TOLERANT,
            actual_position=(subject_bounds["x"], subject_bounds["y"]),
            expected_position=intent.position,
            position_delta=(
                subject_bounds["x"] - intent.position[0],
                subject_bounds["y"] - intent.position[1]
            ),
            failures=failures,
            confidence=confidence
        )

    def _find_element_by_position(self, scene: dict, position: tuple) -> dict | None:
        """Find element at or near the given position."""
        for child in scene.get("children", []):
            x, y = child.get("x", 0), child.get("y", 0)
            if abs(x - position[0]) < 10 and abs(y - position[1]) < 10:
                return child
        return None

    def _find_element_by_type(self, scene: dict, target_type: str) -> dict | None:
        """Find element by type or description."""
        target_lower = target_type.lower()
        for child in scene.get("children", []):
            child_type = child.get("type", "").lower()
            if target_lower in child_type or child_type in target_lower:
                return child
        return None

    def _get_bounds(self, element: dict) -> dict:
        """Get bounding box of element."""
        return {
            "x": element.get("x", 0),
            "y": element.get("y", 0),
            "width": element.get("width", 0),
            "height": element.get("height", 0)
        }

    def _check_relation(
        self,
        subject: dict,
        target: dict,
        relation_type: str,
        tolerance: int
    ) -> bool:
        """Check if spatial relation is satisfied."""
        if relation_type == "above":
            return subject["y"] + subject["height"] <= target["y"] + tolerance
        elif relation_type == "below":
            return subject["y"] >= target["y"] + target["height"] - tolerance
        elif relation_type == "left_of":
            return subject["x"] + subject["width"] <= target["x"] + tolerance
        elif relation_type == "right_of":
            return subject["x"] >= target["x"] + target["width"] - tolerance
        elif relation_type == "inside":
            return (
                subject["x"] >= target["x"] - tolerance and
                subject["y"] >= target["y"] - tolerance and
                subject["x"] + subject["width"] <= target["x"] + target["width"] + tolerance and
                subject["y"] + subject["height"] <= target["y"] + target["height"] + tolerance
            )
        elif relation_type == "overlaps":
            return (
                subject["x"] < target["x"] + target["width"] and
                subject["x"] + subject["width"] > target["x"] and
                subject["y"] < target["y"] + target["height"] and
                subject["y"] + subject["height"] > target["y"]
            )
        return True  # Unknown relation, pass by default
```

**Step 4: Run test to verify it passes**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestSpatialVerifier -v`
Expected: 4 PASSED

**Step 5: Commit**

```bash
git add systems/evolution_daemon/visual_verification_service.py systems/evolution_daemon/tests/test_visual_verification_service.py
git commit -m "feat(journeyman): add SpatialVerifier for relationship verification"
```

---

## Task 8: VisualVerificationService Main Class

**Files:**
- Modify: `systems/evolution_daemon/visual_verification_service.py`
- Modify: `systems/evolution_daemon/tests/test_visual_verification_service.py`

**Step 1: Write the failing tests for main service**

```python
# Add to test_visual_verification_service.py

class TestVisualVerificationService:
    """Tests for main verification service"""

    @pytest.mark.asyncio
    async def test_verify_success(self):
        """Complete verification flow with success"""
        from systems.evolution_daemon.visual_verification_service import (
            VisualVerificationService, VisualIntent
        )
        service = VisualVerificationService()
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40),
            critical=True
        )
        scene = {
            "children": [
                {"type": "Button", "x": 100, "y": 200, "width": 80, "height": 40}
            ]
        }

        result = await service.verify(intent, scene, attempt_number=1)

        assert result.success is True
        assert result.should_retry is False
        assert result.should_escalate is False

    @pytest.mark.asyncio
    async def test_verify_element_not_found(self):
        """Element not found should return failure"""
        from systems.evolution_daemon.visual_verification_service import (
            VisualVerificationService, VisualIntent
        )
        service = VisualVerificationService()
        intent = VisualIntent(
            element_type="button",
            position=(500, 500),
            size=(80, 40)
        )
        scene = {
            "children": [
                {"type": "Button", "x": 100, "y": 200, "width": 80, "height": 40}
            ]
        }

        result = await service.verify(intent, scene, attempt_number=1)

        assert result.success is False
        assert "not found" in result.summary.lower()

    @pytest.mark.asyncio
    async def test_verify_with_retry_suggestions(self):
        """Failed verification should provide suggestions"""
        from systems.evolution_daemon.visual_verification_service import (
            VisualVerificationService, VisualIntent
        )
        service = VisualVerificationService()
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )
        scene = {
            "children": [
                {"type": "Button", "x": 115, "y": 200, "width": 80, "height": 40}  # 15px off
            ]
        }

        result = await service.verify(intent, scene, attempt_number=1)

        assert result.success is False
        assert result.should_retry is True
        assert len(result.retry_suggestions) >= 1
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestVisualVerificationService -v`
Expected: FAIL

**Step 3: Write minimal implementation**

```python
# Add to visual_verification_service.py (after SpatialVerifier)

class VisualVerificationService:
    """
    Main service for visual self-verification.
    Implements the Journeyman Stage closed-loop verification.
    """

    # Configuration
    MAX_RETRIES = 5
    CONFIDENCE_THRESHOLD = 0.6    # Below this, escalate to human
    MIN_CONFIDENCE_FOR_RETRY = 0.3  # Below this, don't even retry

    def __init__(self):
        self.classifier = CriticalityClassifier()
        self.layout_verifier = LayoutVerifier()
        self.text_verifier = TextVerifier()
        self.spatial_verifier = SpatialVerifier()

    async def verify(
        self,
        intent: VisualIntent,
        actual_scene: dict,
        attempt_number: int = 1
    ) -> VerificationResult:
        """
        Main entry point: Verify that actual scene matches intent.

        Args:
            intent: What the AI intended to create
            actual_scene: Current visual state from mirror neuron
            attempt_number: Current retry attempt (for adaptive learning)

        Returns:
            VerificationResult with success, confidence, and next action
        """
        matches = []

        # 1. Find the target element in the scene
        actual_element = self._find_element(intent, actual_scene)

        if actual_element is None:
            return self._create_not_found_result(intent, attempt_number)

        # 2. Classify criticality (hybrid: explicit + heuristic)
        criticality = self.classifier.classify(intent)

        # 3. Run verifiers based on intent type
        match = self.layout_verifier.verify(intent, actual_element, criticality)
        matches.append(match)

        if intent.properties.get("text"):
            match = self.text_verifier.verify(intent, actual_element, criticality)
            matches.append(match)

        if intent.spatial_relations:
            match = self.spatial_verifier.verify(intent, actual_scene)
            matches.append(match)

        # 4. Calculate overall confidence
        total_confidence = self._calculate_confidence(matches, attempt_number)

        # 5. Determine next action
        all_success = all(m.success for m in matches)
        should_retry = self._should_retry(all_success, total_confidence, attempt_number)
        should_escalate = self._should_escalate(total_confidence, attempt_number)

        # 6. Generate retry suggestions if needed
        retry_suggestions = []
        if not all_success and should_retry:
            retry_suggestions = self._generate_suggestions(matches, intent)

        return VerificationResult(
            success=all_success,
            matches=matches,
            overall_confidence=total_confidence,
            should_retry=should_retry,
            should_escalate=should_escalate,
            retry_suggestions=retry_suggestions,
            summary=self._generate_summary(matches, all_success)
        )

    def _find_element(self, intent: VisualIntent, scene: dict) -> dict | None:
        """Find the element matching the intent in the scene."""
        target_x, target_y = intent.position

        for child in scene.get("children", []):
            x, y = child.get("x", 0), child.get("y", 0)
            # Allow some tolerance in finding
            if abs(x - target_x) < 50 and abs(y - target_y) < 50:
                return child
        return None

    def _create_not_found_result(
        self,
        intent: VisualIntent,
        attempt_number: int
    ) -> VerificationResult:
        """Create a result for when the element is not found."""
        confidence = max(0.0, 0.2 - (attempt_number - 1) * 0.05)
        return VerificationResult(
            success=False,
            matches=[],
            overall_confidence=confidence,
            should_retry=attempt_number < self.MAX_RETRIES,
            should_escalate=attempt_number >= 2,
            retry_suggestions=[f"Element not found at {intent.position}. Try placing it first."],
            summary=f"Element '{intent.element_type}' not found at position {intent.position}"
        )

    def _should_retry(self, success: bool, confidence: float, attempt: int) -> bool:
        """Adaptive iteration logic"""
        if success:
            return False
        if attempt >= self.MAX_RETRIES:
            return False
        if confidence < self.MIN_CONFIDENCE_FOR_RETRY:
            return False
        return True

    def _should_escalate(self, confidence: float, attempt: int) -> bool:
        """Human escalation logic"""
        if confidence < self.CONFIDENCE_THRESHOLD and attempt >= 2:
            return True
        if attempt >= self.MAX_RETRIES:
            return True
        return False

    def _calculate_confidence(
        self,
        matches: list[VerificationMatch],
        attempt: int
    ) -> float:
        """Calculate overall confidence score with attempt penalty."""
        if not matches:
            return 0.0

        match_scores = [m.confidence for m in matches]
        base_confidence = sum(match_scores) / len(match_scores)

        # Penalty for multiple attempts
        attempt_penalty = max(0, 0.1 * (attempt - 1))

        return max(0.0, base_confidence - attempt_penalty)

    def _generate_suggestions(
        self,
        matches: list[VerificationMatch],
        intent: VisualIntent
    ) -> list[str]:
        """Generate actionable hints for the next retry attempt."""
        suggestions = []

        for match in matches:
            if not match.success:
                dx, dy = match.position_delta

                if abs(dx) > 0 or abs(dy) > 0:
                    suggestions.append(
                        f"Adjust position by ({-dx}, {-dy}) to correct placement"
                    )

                for failure in match.failures:
                    suggestions.append(f"Fix: {failure}")

        return suggestions

    def _generate_summary(
        self,
        matches: list[VerificationMatch],
        success: bool
    ) -> str:
        """Generate human-readable summary."""
        if success:
            return "All verifications passed"

        failures = []
        for match in matches:
            failures.extend(match.failures)

        if len(failures) == 1:
            return f"Verification failed: {failures[0]}"

        return f"Verification failed with {len(failures)} issues"
```

**Step 4: Run test to verify it passes**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestVisualVerificationService -v`
Expected: 3 PASSED

**Step 5: Commit**

```bash
git add systems/evolution_daemon/visual_verification_service.py systems/evolution_daemon/tests/test_visual_verification_service.py
git commit -m "feat(journeyman): add VisualVerificationService main class"
```

---

## Task 9: Adaptive Iteration Tests

**Files:**
- Modify: `systems/evolution_daemon/tests/test_visual_verification_service.py`

**Step 1: Write the tests for adaptive iteration logic**

```python
# Add to test_visual_verification_service.py

class TestAdaptiveIteration:
    """Tests for adaptive iteration and human escalation"""

    def test_should_retry_on_failure(self):
        """Should retry when confidence is reasonable"""
        from systems.evolution_daemon.visual_verification_service import VisualVerificationService
        service = VisualVerificationService()
        assert service._should_retry(False, 0.8, 1) is True
        assert service._should_retry(False, 0.7, 2) is True

    def test_should_not_retry_on_success(self):
        """Should not retry on success"""
        from systems.evolution_daemon.visual_verification_service import VisualVerificationService
        service = VisualVerificationService()
        assert service._should_retry(True, 1.0, 1) is False

    def test_should_not_retry_max_attempts(self):
        """Should not retry after max attempts"""
        from systems.evolution_daemon.visual_verification_service import VisualVerificationService
        service = VisualVerificationService()
        assert service._should_retry(False, 0.8, 5) is False
        assert service._should_retry(False, 0.8, 6) is False

    def test_should_not_retry_low_confidence(self):
        """Should not retry when confidence too low"""
        from systems.evolution_daemon.visual_verification_service import VisualVerificationService
        service = VisualVerificationService()
        assert service._should_retry(False, 0.2, 1) is False

    def test_should_escalate_low_confidence(self):
        """Should escalate when confidence drops below threshold"""
        from systems.evolution_daemon.visual_verification_service import VisualVerificationService
        service = VisualVerificationService()
        assert service._should_escalate(0.5, 2) is True
        assert service._should_escalate(0.4, 3) is True

    def test_should_escalate_max_attempts(self):
        """Should escalate after max attempts regardless of confidence"""
        from systems.evolution_daemon.visual_verification_service import VisualVerificationService
        service = VisualVerificationService()
        assert service._should_escalate(0.9, 5) is True

    def test_should_not_escalate_early_high_confidence(self):
        """Should not escalate early with high confidence"""
        from systems.evolution_daemon.visual_verification_service import VisualVerificationService
        service = VisualVerificationService()
        assert service._should_escalate(0.9, 1) is False
        assert service._should_escalate(0.8, 1) is False
```

**Step 2: Run test to verify it passes**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py::TestAdaptiveIteration -v`
Expected: 7 PASSED

**Step 3: Commit**

```bash
git add systems/evolution_daemon/tests/test_visual_verification_service.py
git commit -m "test(journeyman): add adaptive iteration and escalation tests"
```

---

## Task 10: Run All Tests and Final Commit

**Step 1: Run complete test suite**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py -v`
Expected: All 30+ tests PASSED

**Step 2: Run with coverage (optional)**

Run: `python -m pytest systems/evolution_daemon/tests/test_visual_verification_service.py -v --cov=systems/evolution_daemon/visual_verification_service --cov-report=term-missing`

**Step 3: Final commit for Journeyman Stage**

```bash
git add systems/evolution_daemon/visual_verification_service.py systems/evolution_daemon/tests/test_visual_verification_service.py
git commit -m "feat(journeyman): complete VisualVerificationService implementation

Implements Journeyman Stage for AI visual self-verification:

- CriticalityClassifier: Hybrid explicit + heuristic classification
- LayoutVerifier: Tiered strictness (exact/tolerant/relaxed)
- TextVerifier: Content verification with similarity matching
- SpatialVerifier: Relationship verification (above/below/left/right/inside)
- VisualVerificationService: Main orchestrator with adaptive iteration

Features:
- Adaptive iteration with learning-based retry suggestions
- Human escalation when confidence drops below threshold
- Integration-ready for EvolutionDaemon.safe_evolve()

Closes: Journeyman Stage design implementation"
```

---

## Summary

| Task | Tests | Purpose |
|------|-------|---------|
| 1 | 3 | CriticalityLevel enum |
| 2 | 4 | VisualIntent dataclass |
| 3 | 5 | SpatialRelation, VerificationMatch, VerificationResult |
| 4 | 4 | CriticalityClassifier |
| 5 | 4 | LayoutVerifier |
| 6 | 4 | TextVerifier |
| 7 | 4 | SpatialVerifier |
| 8 | 3 | VisualVerificationService main |
| 9 | 7 | Adaptive iteration tests |
| **Total** | **~38** | |

**Files Created:**
- `systems/evolution_daemon/visual_verification_service.py`
- `systems/evolution_daemon/tests/test_visual_verification_service.py`

**Next Steps (separate tasks):**
- Integration with `EvolutionDaemon.safe_evolve()`
- EvolutionTask extensions for visual properties
- End-to-end integration tests
