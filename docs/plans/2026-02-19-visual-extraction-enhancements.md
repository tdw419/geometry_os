# Visual Extraction Pipeline Enhancements Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enhance the Visual Extraction Pipeline with semantic clustering, widget recognition, and bidirectional sync.

**Architecture:** Build on existing `gui_structure_analyzer.py` and `scene_graph.py`. Add new modules for semantic clustering (grouping OCR elements), widget detection (pattern matching), and sync service (WebSocket-based state synchronization).

**Tech Stack:** Python 3.12, Tesseract OCR, OpenCV (for image analysis), WebSockets, pytest

---

## Phase 1: Semantic Clustering

Group raw OCR elements into logical UI components (buttons, labels, panels).

### Task 1: Create Semantic Clustering Module

**Files:**
- Create: `conductor/tracks/shotcut-on-the-map/semantic_clusterer.py`
- Test: `conductor/tracks/shotcut-on-the-map/tests/test_semantic_clusterer.py`

**Step 1: Write the failing test**

```python
# tests/test_semantic_clusterer.py
import pytest
from semantic_clusterer import SemanticClusterer, OCRElement, UICluster

def test_cluster_adjacent_elements():
    """Adjacent text elements should be grouped into a cluster."""
    elements = [
        OCRElement(text="File", x=0, y=0, width=30, height=20),
        OCRElement(text="Edit", x=35, y=0, width=30, height=20),
        OCRElement(text="View", x=70, y=0, width=30, height=20),
    ]

    clusterer = SemanticClusterer()
    clusters = clusterer.cluster(elements)

    assert len(clusters) == 1
    assert clusters[0].label == "menu_bar"
    assert len(clusters[0].elements) == 3

def test_cluster_separate_regions():
    """Elements in different screen regions should form separate clusters."""
    elements = [
        OCRElement(text="File", x=0, y=0, width=30, height=20),
        OCRElement(text="OK", x=100, y=500, width=30, height=20),
    ]

    clusterer = SemanticClusterer()
    clusters = clusterer.cluster(elements)

    assert len(clusters) == 2
```

**Step 2: Run test to verify it fails**

Run: `pytest conductor/tracks/shotcut-on-the-map/tests/test_semantic_clusterer.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'semantic_clusterer'"

**Step 3: Write minimal implementation**

```python
# semantic_clusterer.py
from dataclasses import dataclass, field
from typing import List, Optional
import math

@dataclass
class OCRElement:
    text: str
    x: int
    y: int
    width: int
    height: int

    @property
    def center(self) -> tuple[int, int]:
        return (self.x + self.width // 2, self.y + self.height // 2)

    @property
    def right(self) -> int:
        return self.x + self.width

    @property
    def bottom(self) -> int:
        return self.y + self.height

@dataclass
class UICluster:
    label: str
    elements: List[OCRElement] = field(default_factory=list)

    @property
    def bounds(self) -> tuple[int, int, int, int]:
        if not self.elements:
            return (0, 0, 0, 0)
        x_min = min(e.x for e in self.elements)
        y_min = min(e.y for e in self.elements)
        x_max = max(e.right for e in self.elements)
        y_max = max(e.bottom for e in self.elements)
        return (x_min, y_min, x_max, y_max)

class SemanticClusterer:
    """Groups OCR elements into logical UI clusters."""

    def __init__(self, horizontal_threshold: int = 50, vertical_threshold: int = 30):
        self.horizontal_threshold = horizontal_threshold
        self.vertical_threshold = vertical_threshold

    def cluster(self, elements: List[OCRElement]) -> List[UICluster]:
        """Cluster elements based on spatial proximity."""
        if not elements:
            return []

        # Sort by y-coordinate (rows), then x (columns)
        sorted_elements = sorted(elements, key=lambda e: (e.y, e.x))

        clusters: List[UICluster] = []
        used = set()

        for i, elem in enumerate(sorted_elements):
            if i in used:
                continue

            # Start new cluster
            cluster = UICluster(label=self._infer_label(elem))
            cluster.elements.append(elem)
            used.add(i)

            # Find adjacent elements
            for j, other in enumerate(sorted_elements):
                if j in used:
                    continue
                if self._is_adjacent(cluster, other):
                    cluster.elements.append(other)
                    used.add(j)

            clusters.append(cluster)

        return clusters

    def _is_adjacent(self, cluster: UICluster, element: OCRElement) -> bool:
        """Check if element is adjacent to any element in cluster."""
        for elem in cluster.elements:
            # Horizontal adjacency (same row)
            if abs(elem.y - element.y) < self.vertical_threshold:
                if abs(elem.right - element.x) < self.horizontal_threshold:
                    return True
                if abs(element.right - elem.x) < self.horizontal_threshold:
                    return True
            # Vertical adjacency (same column)
            if abs(elem.x - element.x) < self.horizontal_threshold:
                if abs(elem.bottom - element.y) < self.vertical_threshold:
                    return True
        return False

    def _infer_label(self, element: OCRElement) -> str:
        """Infer cluster label from first element."""
        text = element.text.lower()
        if text in ['file', 'edit', 'view', 'help', 'tools']:
            return 'menu_bar'
        elif text in ['ok', 'cancel', 'apply', 'save', 'open']:
            return 'button'
        elif element.y < 50:
            return 'header'
        elif element.y > 500:
            return 'footer'
        return 'content'
```

**Step 4: Run test to verify it passes**

Run: `pytest conductor/tracks/shotcut-on-the-map/tests/test_semantic_clusterer.py -v`
Expected: PASS (2 tests)

**Step 5: Commit**

```bash
git add conductor/tracks/shotcut-on-the-map/semantic_clusterer.py
git add conductor/tracks/shotcut-on-the-map/tests/test_semantic_clusterer.py
git commit -m "feat(extraction): add semantic clustering for OCR elements"
```

---

### Task 2: Integrate Clustering with GUI Analyzer

**Files:**
- Modify: `conductor/tracks/shotcut-on-the-map/gui_structure_analyzer.py:50-80`
- Test: `conductor/tracks/shotcut-on-the-map/tests/test_gui_structure_analyzer.py`

**Step 1: Write the failing test**

```python
# tests/test_gui_structure_analyzer.py
import pytest
from gui_structure_analyzer import analyze_screenshot

def test_analyze_returns_clusters():
    """analyze_screenshot should return clustered UI components."""
    result = analyze_screenshot("conductor/tracks/shotcut-on-the-map/screenshots/final_proof.png")

    assert hasattr(result, 'clusters')
    assert len(result.clusters) > 0

def test_cluster_has_clickables():
    """Each cluster should have clickable metadata."""
    result = analyze_screenshot("conductor/tracks/shotcut-on-the-map/screenshots/final_proof.png")

    for cluster in result.clusters:
        assert cluster.label is not None
        assert cluster.bounds is not None
```

**Step 2: Run test to verify it fails**

Run: `pytest conductor/tracks/shotcut-on-the-map/tests/test_gui_structure_analyzer.py -v`
Expected: FAIL with "AttributeError: 'AnalysisResult' has no attribute 'clusters'"

**Step 3: Modify gui_structure_analyzer.py**

```python
# Add import at top
from semantic_clusterer import SemanticClusterer, OCRElement, UICluster

# Add to AnalysisResult dataclass
@dataclass
class AnalysisResult:
    ascii_view: str
    text_elements: List[Dict]
    clickables: Dict[str, tuple]
    clusters: List[UICluster] = field(default_factory=list)  # NEW

# Modify analyze_screenshot function
def analyze_screenshot(image_path: str) -> AnalysisResult:
    # ... existing OCR code ...

    # NEW: Cluster the elements
    clusterer = SemanticClusterer()
    ocr_elements = [
        OCRElement(
            text=e['text'],
            x=e['bbox'][0],
            y=e['bbox'][1],
            width=e['bbox'][2] - e['bbox'][0],
            height=e['bbox'][3] - e['bbox'][1]
        )
        for e in text_elements
    ]
    clusters = clusterer.cluster(ocr_elements)

    return AnalysisResult(
        ascii_view=ascii_view,
        text_elements=text_elements,
        clickables=clickables,
        clusters=clusters  # NEW
    )
```

**Step 4: Run test to verify it passes**

Run: `pytest conductor/tracks/shotcut-on-the-map/tests/test_gui_structure_analyzer.py -v`
Expected: PASS

**Step 5: Commit**

```bash
git add conductor/tracks/shotcut-on-the-map/gui_structure_analyzer.py
git add conductor/tracks/shotcut-on-the-map/tests/test_gui_structure_analyzer.py
git commit -m "feat(extraction): integrate semantic clustering into analyzer"
```

---

## Phase 2: Widget Recognition

Detect common UI widgets (buttons, inputs, menus) by visual patterns.

### Task 3: Widget Pattern Detector

**Files:**
- Create: `conductor/tracks/shotcut-on-the-map/widget_detector.py`
- Test: `conductor/tracks/shotcut-on-the-map/tests/test_widget_detector.py`

**Step 1: Write the failing test**

```python
# tests/test_widget_detector.py
import pytest
from widget_detector import WidgetDetector, Widget, WidgetType

def test_detect_button_from_border():
    """Detect button from rectangular border pattern."""
    # Mock OCR element that looks like a button
    elements = [
        {'text': 'OK', 'bbox': [100, 100, 150, 130], 'conf': 95}
    ]

    detector = WidgetDetector()
    widgets = detector.detect(elements)

    assert len(widgets) == 1
    assert widgets[0].type == WidgetType.BUTTON
    assert widgets[0].text == 'OK'

def test_detect_input_from_label():
    """Detect input field from adjacent label pattern."""
    elements = [
        {'text': 'Filename:', 'bbox': [50, 200, 120, 220], 'conf': 90},
        {'text': '', 'bbox': [125, 200, 300, 220], 'conf': 0}  # Empty input area
    ]

    detector = WidgetDetector()
    widgets = detector.detect(elements)

    assert any(w.type == WidgetType.INPUT for w in widgets)
```

**Step 2: Run test to verify it fails**

Run: `pytest conductor/tracks/shotcut-on-the-map/tests/test_widget_detector.py -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 3: Write minimal implementation**

```python
# widget_detector.py
from dataclasses import dataclass
from enum import Enum
from typing import List, Dict, Optional

class WidgetType(Enum):
    BUTTON = "button"
    INPUT = "input"
    MENU = "menu"
    LABEL = "label"
    CHECKBOX = "checkbox"
    UNKNOWN = "unknown"

@dataclass
class Widget:
    type: WidgetType
    text: str
    bbox: tuple[int, int, int, int]  # x1, y1, x2, y2
    confidence: float
    action: Optional[str] = None  # For clickables

class WidgetDetector:
    """Detects UI widgets from OCR elements."""

    # Keywords that indicate widget types
    BUTTON_KEYWORDS = ['ok', 'cancel', 'save', 'open', 'apply', 'yes', 'no',
                       'close', 'submit', 'clear', 'reset', 'delete', 'edit']
    MENU_KEYWORDS = ['file', 'edit', 'view', 'help', 'tools', 'window', 'settings']

    def detect(self, elements: List[Dict]) -> List[Widget]:
        """Detect widgets from OCR elements."""
        widgets = []

        for elem in elements:
            text = elem.get('text', '').lower().strip()
            bbox = elem.get('bbox', [0, 0, 0, 0])
            conf = elem.get('conf', 0)

            widget_type = self._classify(text, bbox, conf, elements)

            if widget_type != WidgetType.UNKNOWN:
                widgets.append(Widget(
                    type=widget_type,
                    text=elem.get('text', ''),
                    bbox=tuple(bbox),
                    confidence=conf / 100.0,
                    action=self._infer_action(widget_type, text)
                ))

        return widgets

    def _classify(self, text: str, bbox: tuple, conf: float,
                  all_elements: List[Dict]) -> WidgetType:
        """Classify element into widget type."""
        if not text:
            # Empty text area could be input
            return WidgetType.INPUT

        # Check for button keywords
        if any(kw in text for kw in self.BUTTON_KEYWORDS):
            return WidgetType.BUTTON

        # Check for menu keywords
        if any(kw == text for kw in self.MENU_KEYWORDS):
            return WidgetType.MENU

        # Check if followed by empty area (label + input pattern)
        if text.endswith(':') or text.endswith(':'):
            return WidgetType.LABEL

        return WidgetType.UNKNOWN

    def _infer_action(self, widget_type: WidgetType, text: str) -> Optional[str]:
        """Infer action from widget type and text."""
        if widget_type == WidgetType.BUTTON:
            return f"click:{text.lower()}"
        elif widget_type == WidgetType.MENU:
            return f"menu:{text.lower()}"
        return None
```

**Step 4: Run test to verify it passes**

Run: `pytest conductor/tracks/shotcut-on-the-map/tests/test_widget_detector.py -v`
Expected: PASS

**Step 5: Commit**

```bash
git add conductor/tracks/shotcut-on-the-map/widget_detector.py
git add conductor/tracks/shotcut-on-the-map/tests/test_widget_detector.py
git commit -m "feat(extraction): add widget pattern detector"
```

---

## Phase 3: Bidirectional Sync

Keep ASCII scene graph synchronized with VM state via WebSocket.

### Task 4: Scene Sync Service

**Files:**
- Create: `conductor/tracks/shotcut-on-the-map/scene_sync.py`
- Test: `conductor/tracks/shotcut-on-the-map/tests/test_scene_sync.py`

**Step 1: Write the failing test**

```python
# tests/test_scene_sync.py
import pytest
import asyncio
from scene_sync import SceneSyncService, SyncState

@pytest.mark.asyncio
async def test_sync_detects_view_change():
    """Sync service should detect when VM view changes."""
    sync = SceneSyncService(poll_interval=0.1)

    # Initial state
    state = await sync.get_current_state()
    initial_view = state.current_view

    # Simulate VM change (mock)
    sync._mock_screenshot_change()

    # After poll
    await asyncio.sleep(0.2)
    new_state = await sync.get_current_state()

    assert new_state.current_view != initial_view

@pytest.mark.asyncio
async def test_sync_updates_scene_graph():
    """Sync service should update scene graph on change."""
    sync = SceneSyncService(poll_interval=0.1)

    # Simulate change
    await sync.force_sync()

    # Check scene graph was updated
    graph = sync.get_scene_graph()
    assert graph is not None
    assert len(graph.views) > 0
```

**Step 2: Run test to verify it fails**

Run: `pytest conductor/tracks/shotcut-on-the-map/tests/test_scene_sync.py -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 3: Write minimal implementation**

```python
# scene_sync.py
import asyncio
from dataclasses import dataclass
from typing import Optional, Callable
from pathlib import Path
import json

from gui_structure_analyzer import analyze_screenshot
from systems.visual_shell.ascii_scene.scene_graph import AsciiSceneGraph

@dataclass
class SyncState:
    current_view: str
    last_screenshot_hash: str
    changes_detected: int

class SceneSyncService:
    """Keeps ASCII scene graph synchronized with VM state."""

    def __init__(self, poll_interval: float = 1.0, scene_dir: str = ".geometry/shotcut_scene"):
        self.poll_interval = poll_interval
        self.scene_dir = Path(scene_dir)
        self._scene_graph: Optional[AsciiSceneGraph] = None
        self._state = SyncState(
            current_view="unknown",
            last_screenshot_hash="",
            changes_detected=0
        )
        self._running = False
        self._on_change_callbacks: list[Callable] = []

    async def start(self):
        """Start synchronization loop."""
        self._running = True
        self._scene_graph = AsciiSceneGraph.load(str(self.scene_dir))

        while self._running:
            await self._poll_and_sync()
            await asyncio.sleep(self.poll_interval)

    async def stop(self):
        """Stop synchronization."""
        self._running = False

    async def _poll_and_sync(self):
        """Poll VM and sync if changed."""
        # This would connect to shotcut_vm_bridge in production
        # For now, use mock
        pass

    async def force_sync(self, screenshot_path: str = None) -> bool:
        """Force immediate synchronization."""
        if screenshot_path is None:
            return False

        # Analyze screenshot
        result = analyze_screenshot(screenshot_path)

        # Update scene graph
        if self._scene_graph is None:
            self._scene_graph = AsciiSceneGraph.load(str(self.scene_dir))

        # Create/update view from analysis
        view_id = self._infer_view_id(result)
        self._update_view(view_id, result)

        self._state.changes_detected += 1
        return True

    def _infer_view_id(self, analysis) -> str:
        """Infer view ID from analysis."""
        # Use clusters to determine view type
        for cluster in analysis.clusters:
            if cluster.label == 'menu_bar':
                return 'main'
        return 'unknown'

    def _update_view(self, view_id: str, analysis):
        """Update or create view in scene graph."""
        from systems.visual_shell.ascii_scene.scene_graph import AsciiView

        view = AsciiView(
            id=view_id,
            content=analysis.ascii_view,
            clickables={
                f"{k}": v for k, v in analysis.clickables.items()
            }
        )
        self._scene_graph.views[view_id] = view
        self._scene_graph.save_state()

    async def get_current_state(self) -> SyncState:
        """Get current sync state."""
        return self._state

    def get_scene_graph(self) -> Optional[AsciiSceneGraph]:
        """Get the synchronized scene graph."""
        return self._scene_graph

    def on_change(self, callback: Callable):
        """Register callback for view changes."""
        self._on_change_callbacks.append(callback)

    def _mock_screenshot_change(self):
        """Mock method for testing."""
        self._state.current_view = "changed_view"
```

**Step 4: Run test to verify it passes**

Run: `pytest conductor/tracks/shotcut-on-the-map/tests/test_scene_sync.py -v`
Expected: PASS

**Step 5: Commit**

```bash
git add conductor/tracks/shotcut-on-the-map/scene_sync.py
git add conductor/tracks/shotcut-on-the-map/tests/test_scene_sync.py
git commit -m "feat(extraction): add bidirectional scene sync service"
```

---

## Phase 4: Integration

Integrate all components into a unified extraction pipeline.

### Task 5: Unified Extraction Pipeline

**Files:**
- Create: `conductor/tracks/shotcut-on-the-map/extraction_pipeline.py`
- Test: `conductor/tracks/shotcut-on-the-map/tests/test_extraction_pipeline.py`

**Step 1: Write the failing test**

```python
# tests/test_extraction_pipeline.py
import pytest
from extraction_pipeline import ExtractionPipeline, ExtractionResult

def test_full_extraction_pipeline():
    """Full pipeline should produce complete scene graph."""
    pipeline = ExtractionPipeline()

    result = pipeline.extract("conductor/tracks/shotcut-on-the-map/screenshots/final_proof.png")

    assert result.success
    assert result.scene_graph is not None
    assert len(result.widgets) > 0
    assert len(result.clusters) > 0

def test_pipeline_produces_ascii_view():
    """Pipeline should produce ASCII view with clickables."""
    pipeline = ExtractionPipeline()

    result = pipeline.extract("conductor/tracks/shotcut-on-the-map/screenshots/final_proof.png")

    assert "# [CLICKABLE:" in result.ascii_view
```

**Step 2: Run test to verify it fails**

Run: `pytest conductor/tracks/shotcut-on-the-map/tests/test_extraction_pipeline.py -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 3: Write minimal implementation**

```python
# extraction_pipeline.py
from dataclasses import dataclass
from typing import List, Optional
from pathlib import Path

from gui_structure_analyzer import analyze_screenshot, AnalysisResult
from semantic_clusterer import UICluster
from widget_detector import Widget, WidgetDetector
from systems.visual_shell.ascii_scene.scene_graph import AsciiSceneGraph

@dataclass
class ExtractionResult:
    success: bool
    ascii_view: str
    widgets: List[Widget]
    clusters: List[UICluster]
    scene_graph: Optional[AsciiSceneGraph]
    error: Optional[str] = None

class ExtractionPipeline:
    """Unified extraction pipeline combining all components."""

    def __init__(self, scene_dir: str = ".geometry/shotcut_scene"):
        self.scene_dir = Path(scene_dir)
        self.widget_detector = WidgetDetector()

    def extract(self, screenshot_path: str) -> ExtractionResult:
        """
        Run full extraction pipeline on screenshot.

        1. OCR + structure analysis
        2. Semantic clustering
        3. Widget detection
        4. Scene graph generation
        """
        try:
            # Phase 1: OCR + structure
            analysis = analyze_screenshot(screenshot_path)

            # Phase 2: Widget detection
            widgets = self.widget_detector.detect(analysis.text_elements)

            # Phase 3: Scene graph
            scene_graph = self._build_scene_graph(analysis, widgets)

            return ExtractionResult(
                success=True,
                ascii_view=analysis.ascii_view,
                widgets=widgets,
                clusters=analysis.clusters,
                scene_graph=scene_graph
            )

        except Exception as e:
            return ExtractionResult(
                success=False,
                ascii_view="",
                widgets=[],
                clusters=[],
                scene_graph=None,
                error=str(e)
            )

    def _build_scene_graph(self, analysis: AnalysisResult,
                           widgets: List[Widget]) -> AsciiSceneGraph:
        """Build scene graph from analysis and widgets."""
        self.scene_dir.mkdir(parents=True, exist_ok=True)
        views_dir = self.scene_dir / "views"
        views_dir.mkdir(exist_ok=True)

        graph = AsciiSceneGraph(str(self.scene_dir))

        # Create main view
        from systems.visual_shell.ascii_scene.scene_graph import AsciiView
        main_view = AsciiView(
            id="main",
            content=analysis.ascii_view,
            clickables={
                f"{w.text}": w.action
                for w in widgets
                if w.action
            }
        )
        graph.views["main"] = main_view

        # Save
        graph.save_state()

        return graph
```

**Step 4: Run test to verify it passes**

Run: `pytest conductor/tracks/shotcut-on-the-map/tests/test_extraction_pipeline.py -v`
Expected: PASS

**Step 5: Commit**

```bash
git add conductor/tracks/shotcut-on-the-map/extraction_pipeline.py
git add conductor/tracks/shotcut-on-the-map/tests/test_extraction_pipeline.py
git commit -m "feat(extraction): add unified extraction pipeline"
```

---

## Summary

| Phase | Tasks | Files Created |
|-------|-------|---------------|
| 1. Semantic Clustering | 2 | `semantic_clusterer.py` |
| 2. Widget Recognition | 1 | `widget_detector.py` |
| 3. Bidirectional Sync | 1 | `scene_sync.py` |
| 4. Integration | 1 | `extraction_pipeline.py` |

**Total**: 5 tasks, 4 new modules, ~400 lines of code

---

## Verification Checklist

After completing all tasks, verify:

- [ ] `pytest conductor/tracks/shotcut-on-the-map/tests/ -v` passes
- [ ] `python -m extraction_pipeline screenshots/final_proof.png` produces scene graph
- [ ] Scene graph loads in `AsciiSceneGraph.load()`
- [ ] AI context generation works: `graph.get_ai_context()`
