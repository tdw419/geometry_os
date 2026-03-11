# Journeyman Stage Design: Visual Self-Verification

> **Status**: Approved
> **Date**: 2026-02-17
> **Component**: Evolution Daemon - Journeyman Stage
> **Depends On**: Mirror Neuron (`render_visual_layout` tool)

## 1. Overview

The Journeyman Stage enables Geometry OS to **verify its own visual modifications** without human intervention. This transforms the system from a toolkit (Apprentice Stage) into a cognitive substrate capable of closed-loop visual self-improvement.

### Evolution Stages

| Stage | Status | Capability |
|-------|--------|------------|
| Apprentice | ✅ Complete | Human-driven visual loop |
| **Journeyman** | 🚀 This Design | AI verifies own visual modifications |
| Master | 🔮 Future | AI modifies visual capabilities |

### Key Capabilities

1. **Layout Verification**: Confirm position, size, and type of UI elements
2. **Text Verification**: Ensure text content and readability match intent
3. **Spatial Verification**: Assess relative positions and organization
4. **Adaptive Iteration**: Keep trying until success with learning
5. **Human Escalation**: Safe fallback when confidence drops

---

## 2. Architecture

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        Geometry OS - Journeyman Stage                    │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│   ┌─────────────────────┐         ┌─────────────────────────────────┐   │
│   │   Evolution Daemon  │         │    VisualVerificationService    │   │
│   ├─────────────────────┤         ├─────────────────────────────────┤   │
│   │                     │         │                                 │   │
│   │  1. Create Intent   │────────►│  verify(intent, actual_state)   │   │
│   │  2. Execute Action  │         │  ├── classify_criticality()     │   │
│   │  3. Get Visual State│         │  ├── verify_layout()            │   │
│   │                     │◄────────│  ├── verify_text()              │   │
│   │  4. Verify Result   │         │  ├── verify_spatial()           │   │
│   │  5. Iterate/Escalate│         │  └── calculate_confidence()     │   │
│   │                     │         │                                 │   │
│   └─────────────────────┘         └─────────────────────────────────┘   │
│              │                                   │                       │
│              │                                   │                       │
│              ▼                                   ▼                       │
│   ┌─────────────────────┐         ┌─────────────────────────────────┐   │
│   │    WebMCP Bridge    │         │       VerificationResult        │   │
│   │  render_visual_layout│         │  { success, failures[],         │   │
│   │  place_tile, etc.   │         │    confidence, should_retry }   │   │
│   └─────────────────────┘         └─────────────────────────────────┘   │
│                                                                          │
└─────────────────────────────────────────────────────────────────────────┘
```

**File Location**: `systems/evolution_daemon/visual_verification_service.py`

---

## 3. Core Components

### 3.1 CriticalityClassifier

Determines if an element requires exact or tolerance-based verification using a hybrid approach.

```python
class CriticalityClassifier:
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

### 3.2 LayoutVerifier

Verifies position, size, and type with tiered strictness.

```python
class LayoutVerifier:
    DEFAULT_TOLERANCE = {
        "position": 5,   # ±5 pixels
        "size": 5,       # ±5 pixels
    }

    def verify(
        self,
        intent: VisualIntent,
        actual: SceneNode,
        criticality: CriticalityLevel
    ) -> VerificationMatch:
        # Apply appropriate tolerance based on criticality
        ...
```

### 3.3 TextVerifier

Verifies text content and styling.

```python
class TextVerifier:
    def verify(
        self,
        intent: TextIntent,
        actual: TextNode,
        criticality: CriticalityLevel
    ) -> VerificationMatch:
        ...
```

### 3.4 SpatialVerifier

Verifies relative positions and relationships.

```python
class SpatialVerifier:
    def verify(
        self,
        intent: SpatialIntent,
        actual: SceneGraph
    ) -> VerificationMatch:
        ...
```

---

## 4. Data Structures

```python
from dataclasses import dataclass, field
from enum import Enum
from typing import Optional, List, Dict, Any


class CriticalityLevel(Enum):
    """Verification strictness levels"""
    EXACT = "exact"           # Pixel-perfect match required
    TOLERANT = "tolerant"     # Within ±N pixels
    RELAXED = "relaxed"       # Semantic/rough match


@dataclass
class VisualIntent:
    """What the AI intended to create/modify"""
    element_type: str                    # "button", "text", "window", etc.
    position: tuple[int, int]            # (x, y)
    size: tuple[int, int]                # (width, height)
    properties: Dict[str, Any] = field(default_factory=dict)
    critical: Optional[bool] = None      # Explicit criticality (None = use heuristic)
    spatial_relations: List['SpatialRelation'] = field(default_factory=list)


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

---

## 5. Verification Flow

### 5.1 Main Algorithm

```python
class VisualVerificationService:
    # Configuration
    MAX_RETRIES = 5
    CONFIDENCE_THRESHOLD = 0.6    # Below this, escalate to human
    MIN_CONFIDENCE_FOR_RETRY = 0.3  # Below this, don't even retry

    async def verify(
        self,
        intent: VisualIntent,
        actual_scene: Dict,
        attempt_number: int = 1
    ) -> VerificationResult:
        """
        Main entry point: Verify that actual scene matches intent.
        """
        matches = []

        # 1. Find the target element in the scene
        actual_element = self._find_element(intent, actual_scene)

        if actual_element is None:
            return self._create_not_found_result(intent, attempt_number)

        # 2. Classify criticality (hybrid: explicit + heuristic)
        criticality = self.classifier.classify(intent)

        # 3. Run verifiers based on intent type
        if self._needs_layout_verification(intent):
            match = self.layout_verifier.verify(intent, actual_element, criticality)
            matches.append(match)

        if self._needs_text_verification(intent):
            match = self.text_verifier.verify(intent, actual_element, criticality)
            matches.append(match)

        if self._needs_spatial_verification(intent):
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
```

### 5.2 Adaptive Iteration Logic

```python
def _should_retry(self, success: bool, confidence: float, attempt: int) -> bool:
    """Adaptive iteration logic"""
    if success:
        return False
    if attempt >= self.MAX_RETRIES:
        return False
    if confidence < self.MIN_CONFIDENCE_FOR_RETRY:
        return False  # Too broken to fix automatically
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
    matches: List[VerificationMatch],
    attempt: int
) -> float:
    """Calculate overall confidence score with attempt penalty"""
    if not matches:
        return 0.0

    # Base confidence from matches
    match_scores = [m.confidence for m in matches]
    base_confidence = sum(match_scores) / len(match_scores)

    # Penalty for multiple attempts (learning degradation)
    attempt_penalty = max(0, 0.1 * (attempt - 1))

    return max(0.0, base_confidence - attempt_penalty)
```

### 5.3 Retry Suggestions

```python
def _generate_suggestions(
    self,
    matches: List[VerificationMatch],
    intent: VisualIntent
) -> List[str]:
    """Generate actionable hints for the next retry attempt"""
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
```

---

## 6. Integration with Evolution Daemon

### 6.1 Initialization

```python
# systems/evolution_daemon/evolution_daemon.py

class EvolutionDaemon:
    def __init__(self, ...):
        # ... existing initialization ...

        # Journeyman Stage: Visual Verification Service
        self.visual_verifier = VisualVerificationService()
        self.verification_attempts: Dict[str, int] = {}
```

### 6.2 Modified safe_evolve

```python
async def safe_evolve(self, task: EvolutionTask) -> bool:
    """V11+ safe evolution with Journeyman visual verification."""

    # ... existing safety pipeline (sandbox, guardian, tier) ...

    # Execute the modification
    result = await self._execute_evolution_action(task)

    # === JOURNEYMAN STAGE: Visual Verification ===
    if task.has_visual_modification():
        verification_result = await self._verify_visual_modification(task)

        if not verification_result.success:
            if verification_result.should_escalate:
                return await self._escalate_to_human(task, verification_result)

            elif verification_result.should_retry:
                return await self._adaptive_retry(task, verification_result)

            else:
                task.status = "failed"
                task.result = f"Visual verification failed: {verification_result.summary}"
                return False

    # ... existing commit and monitoring logic ...
    return True
```

### 6.3 Adaptive Retry Handler

```python
async def _adaptive_retry(
    self,
    task: EvolutionTask,
    result: VerificationResult
) -> bool:
    """Attempt correction based on verification suggestions"""

    await self.visual_log(
        f"Verification failed, retrying... (suggestions: {len(result.retry_suggestions)})",
        level="warning"
    )

    # Feed suggestions back to the AI for correction
    correction_prompt = f"""
    The visual modification was not verified successfully.

    Original intent: {task.goal}
    Verification result: {result.summary}

    Suggestions for correction:
    {chr(10).join(f'- {s}' for s in result.retry_suggestions)}

    Please apply these corrections and provide the updated modification.
    """

    # Get correction from AI
    correction = await self.zai.chat("coder", correction_prompt)

    # Re-run safe_evolve (which will verify again)
    return await self.safe_evolve(task)
```

### 6.4 Human Escalation Handler

```python
async def _escalate_to_human(
    self,
    task: EvolutionTask,
    result: VerificationResult
) -> bool:
    """Pause and request human review"""

    task.status = "escalated"
    task.result = f"Human review required: {result.summary}"

    escalation_report = {
        "task_id": task.task_id,
        "goal": task.goal,
        "attempts": self.verification_attempts.get(task.task_id, 0),
        "confidence": result.overall_confidence,
        "failures": [m.failures for m in result.matches if not m.success],
        "suggestions": result.retry_suggestions
    }

    logger.warning(f"🚨 Human escalation triggered: {escalation_report}")

    await self.visual_log(
        f"ESCALATION: {task.goal[:30]} (confidence: {result.overall_confidence:.2f})",
        level="error"
    )

    return False
```

---

## 7. Testing Strategy

### 7.1 Test Categories

| Category | Count | Purpose |
|----------|-------|---------|
| `TestCriticalityClassifier` | 4 | Verify hybrid classification |
| `TestLayoutVerifier` | 4 | Verify tiered strictness |
| `TestAdaptiveIteration` | 6 | Verify retry/escalation logic |
| `TestRetrySuggestions` | 1 | Verify suggestion generation |
| `TestIntegration` | 2 | End-to-end flow verification |

**Total: 17 tests**

### 7.2 Key Test Cases

```python
# Test explicit criticality override
def test_explicit_critical_flag():
    intent = VisualIntent(
        element_type="decoration",  # Normally non-critical
        position=(0, 0),
        size=(100, 100),
        critical=True  # Override
    )
    classifier = CriticalityClassifier()
    assert classifier.classify(intent) == CriticalityLevel.EXACT

# Test tolerant verification
def test_tolerant_match_success():
    verifier = LayoutVerifier()
    intent = VisualIntent(element_type="button", position=(100, 200), size=(80, 40))
    actual = {"x": 103, "y": 198, "width": 80, "height": 40}  # Within ±5

    result = verifier.verify(intent, actual, CriticalityLevel.TOLERANT)
    assert result.success is True

# Test adaptive iteration boundaries
def test_should_not_retry_low_confidence():
    service = VisualVerificationService()
    assert service._should_retry(False, 0.2, 1) is False  # Below MIN_CONFIDENCE_FOR_RETRY

def test_should_escalate_low_confidence():
    service = VisualVerificationService()
    assert service._should_escalate(0.5, 2) is True  # Below CONFIDENCE_THRESHOLD
```

---

## 8. Configuration

| Parameter | Default | Description |
|-----------|---------|-------------|
| `MAX_RETRIES` | 5 | Maximum adaptive iteration attempts |
| `CONFIDENCE_THRESHOLD` | 0.6 | Below this, trigger human escalation |
| `MIN_CONFIDENCE_FOR_RETRY` | 0.3 | Below this, skip retry (too broken) |
| `DEFAULT_TOLERANCE.position` | 5 | Pixels of tolerance for TOLERANT level |
| `DEFAULT_TOLERANCE.size` | 5 | Pixels of tolerance for TOLERANT level |

---

## 9. Success Criteria

The Journeyman Stage is complete when:

1. ✅ `VisualVerificationService` class implemented with all components
2. ✅ `CriticalityClassifier` correctly handles explicit flags and heuristics
3. ✅ `LayoutVerifier`, `TextVerifier`, `SpatialVerifier` apply tiered verification
4. ✅ Adaptive iteration retries with learning (suggestions)
5. ✅ Human escalation triggers at correct thresholds
6. ✅ Integration with `EvolutionDaemon.safe_evolve()` works
7. ✅ All 17 tests pass

---

## 10. Future Enhancements (Master Stage)

- **Semantic Analysis**: AI infers criticality from natural language intent
- **Visual Learning**: Improve verification accuracy from human feedback
- **Multi-element Verification**: Verify complex layouts with dependencies
- **Performance Optimization**: Cache scene graphs, parallel verification

---

## Appendix: File Structure

```
systems/evolution_daemon/
├── visual_verification_service.py   # NEW: Main service
├── evolution_daemon.py              # MODIFIED: Integration
└── tests/
    └── test_visual_verification_service.py  # NEW: Tests
```
