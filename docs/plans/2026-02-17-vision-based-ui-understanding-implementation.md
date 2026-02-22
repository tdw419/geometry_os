# Implementation Plan: Vision-Based UI Understanding System

**Design Document**: [2026-02-17-vision-based-ui-understanding-design.md](./2026-02-17-vision-based-ui-understanding-design.md)
**Created**: 2026-02-17
**Status**: Ready for Execution

---

## Overview

This plan implements the Vision-Based UI Understanding System — a shared GPU inference daemon that provides visual UI understanding as a system-level primitive for Geometry OS agents.

**Goal**: Replace hardcoded coordinate guessing with semantic UI perception using Florence-2.

**Scope**: 8 MVP operations + pipeline executor + VisionDaemon + ShotcutAgent integration.

---

## Phase 1: Foundation & Model Setup

**Goal**: Establish the project structure and verify Florence-2 model access.

### 1.1 Create Project Structure

Create the `systems/vision/` directory with all required files.

```bash
systems/vision/
├── __init__.py
├── vision_daemon.py          # Main daemon entry point (stub)
├── pipeline_executor.py      # Pipeline orchestration (stub)
├── florence_model.py         # Model wrapper
└── operations/
    └── __init__.py
```

**Verification**: Directory structure exists and imports work.

```bash
python -c "from systems.vision import VisionDaemon; print('OK')"
```

### 1.2 Implement Florence-2 Model Wrapper

Create `florence_model.py` with a clean wrapper around Florence-2 that provides:
- Model loading (lazy, on first use)
- Inference for: OCR, Object Detection, Phrase Grounding
- Bounding box normalization

**Key Interface**:
```python
class FlorenceModel:
    def load(self) -> None: ...
    def ocr(self, image: PIL.Image) -> List[TextResult]: ...
    def detect(self, image: PIL.Image, classes: List[str]) -> List[DetectionResult]: ...
    def ground(self, image: PIL.Image, text: str) -> List[GroundingResult]: ...
```

**Verification**: Unit test with sample image.

```bash
pytest systems/vision/tests/test_florence_model.py -v
```

### 1.3 Create Test Fixtures

Collect 5-10 sample screenshots from Shotcut UI for testing:
- Main window with timeline
- Export dialog
- Settings panel
- File open dialog
- Error message box

**Verification**: Test images exist in `tests/fixtures/sample_screenshots/`.

---

## Phase 2: Core Operations

**Goal**: Implement the 3 core detection operations.

### 2.1 Base Operation Class

Create `operations/base.py` with the abstract base class:

```python
class BaseOperation(ABC):
    @property
    @abstractmethod
    def name(self) -> str: ...

    @abstractmethod
    def execute(self, context: OperationContext, params: dict) -> Any: ...

    def validate_params(self, params: dict) -> List[str]: ...
```

**Verification**: Unit test for base class.

### 2.2 Implement `detect` Operation

File: `operations/detect.py`

- Accept `classes` parameter (list of UI element types)
- Use Florence-2 object detection
- Return list of `{bbox, class, confidence}`

**Verification**:
```bash
pytest systems/vision/tests/test_operations.py::test_detect -v
```

### 2.3 Implement `ocr` Operation

File: `operations/ocr.py`

- Accept optional `region` parameter (bbox to constrain)
- Use Florence-2 OCR task
- Return list of `{bbox, text, confidence}`

**Verification**:
```bash
pytest systems/vision/tests/test_operations.py::test_ocr -v
```

### 2.4 Implement `ground` Operation

File: `operations/ground.py`

- Accept `text` parameter (string to find)
- Use Florence-2 phrase grounding
- Return `{bbox, text, confidence}` or list of matches

**Verification**:
```bash
pytest systems/vision/tests/test_operations.py::test_ground -v
```

---

## Phase 3: Spatial Operations

**Goal**: Implement spatial reasoning operations.

### 3.1 Implement `relative` Operation

File: `operations/relative.py`

- Accept `anchor` (variable ref), `direction` (above/below/left/right), `max_distance`
- Filter source elements by spatial relationship to anchor
- Handle edge cases (no elements found, overlapping regions)

**Verification**:
```bash
pytest systems/vision/tests/test_operations.py::test_relative -v
```

### 3.2 Implement `contains` Operation

File: `operations/contains.py`

- Accept `source`, `text`, `match` (exact/fuzzy/regex)
- Filter elements by text content
- Support fuzzy matching for OCR variations

**Verification**:
```bash
pytest systems/vision/tests/test_operations.py::test_contains -v
```

### 3.3 Implement `largest` / `smallest` Operations

File: `operations/size.py`

- Accept `source`, `count` (optional limit)
- Sort by area and return top N
- Handle ties consistently

**Verification**:
```bash
pytest systems/vision/tests/test_operations.py::test_size_operations -v
```

---

## Phase 4: Utility Operations

**Goal**: Implement utility and debugging operations.

### 4.1 Implement `click_point` Operation

File: `operations/click_point.py`

- Accept `source` (variable ref to element)
- Return center point `{x, y}` of bbox
- Handle single element or list (return first)

**Verification**:
```bash
pytest systems/vision/tests/test_operations.py::test_click_point -v
```

### 4.2 Implement `render_text_layout` Operation

File: `operations/render_text_layout.py`

- Accept `sources` (list of variable refs)
- Create ASCII representation with bounding boxes
- Use Unicode box-drawing characters for clarity

**Output Format**:
```
┌────────────────────┐
│ [Export]  [Cancel] │
│                    │
│ Speed:   [100]     │
└────────────────────┘
```

**Verification**:
```bash
pytest systems/vision/tests/test_operations.py::test_render_text_layout -v
```

---

## Phase 5: Pipeline Executor

**Goal**: Implement the step-by-step pipeline execution engine.

### 5.1 Implement Pipeline Executor

File: `pipeline_executor.py`

- Parse pipeline JSON with `steps` array
- Execute steps sequentially, maintaining variable context
- Handle variable references (`$varname`, `$varname.bbox`)
- Return combined results with latency measurement

**Key Interface**:
```python
class PipelineExecutor:
    def __init__(self, model: FlorenceModel): ...

    async def execute(self, image: PIL.Image, steps: List[dict]) -> PipelineResult:
        context = {}
        for step in steps:
            op = self._get_operation(step["op"])
            result = await op.execute(context, step)
            if "assign_to" in step:
                context[step["assign_to"]] = result
        return PipelineResult(success=True, results=context, latency_ms=...)
```

**Verification**:
```bash
pytest systems/vision/tests/test_pipeline.py -v
```

### 5.2 Variable Reference Resolution

Implement helper for resolving `$varname` and `$varname.property` references:

```python
def resolve_reference(ref: str, context: dict) -> Any:
    if not ref.startswith("$"):
        return ref
    parts = ref[1:].split(".")
    value = context[parts[0]]
    for part in parts[1:]:
        value = getattr(value, part) if hasattr(value, part) else value[part]
    return value
```

**Verification**: Unit tests for edge cases (missing vars, nested access).

---

## Phase 6: VisionDaemon Service

**Goal**: Create the GPU inference daemon with Unix socket interface.

### 6.1 Implement VisionDaemon

File: `vision_daemon.py`

- Load Florence-2 model on startup (lazy or eager, configurable)
- Listen on Unix socket (default: `/tmp/vision_daemon.sock`)
- Accept JSON requests, return JSON responses
- Graceful shutdown handling

**Key Interface**:
```python
class VisionDaemon:
    def __init__(self, socket_path: str = "/tmp/vision_daemon.sock"): ...

    async def start(self) -> None: ...
    async def stop(self) -> None: ...

    async def handle_request(self, request: dict) -> dict: ...
```

**Verification**:
```bash
pytest systems/vision/tests/test_daemon.py -v
```

### 6.2 Request/Response Protocol

Define the wire protocol:

**Request**:
```json
{
  "image": "<base64>",
  "steps": [...]
}
```

**Response**:
```json
{
  "success": true,
  "results": {...},
  "latency_ms": 45,
  "error": null
}
```

**Error Response**:
```json
{
  "success": false,
  "results": {},
  "latency_ms": 0,
  "error": "Step 2 failed: unknown operation 'xyz'"
}
```

**Verification**: Integration test with socket communication.

---

## Phase 7: ShotcutAgent Integration

**Goal**: Update ShotcutAgent to use VisionDaemon.

### 7.1 Create VisionClient

File: `conductor/tracks/shotcut-on-the-map/vision_client.py`

Lightweight client for communicating with VisionDaemon:

```python
class VisionClient:
    def __init__(self, socket_path: str = "/tmp/vision_daemon.sock"): ...

    async def query(self, request: dict) -> dict: ...
    async def health_check(self) -> bool: ...
```

**Verification**:
```bash
pytest conductor/tracks/shotcut-on-the-map/tests/test_vision_client.py -v
```

### 7.2 Update ShotcutAgent

File: `conductor/tracks/shotcut-on-the-map/shotcut_agent.py`

Replace `find_element()` with vision-based implementation:

**Before**:
```python
async def find_element(self, element_type: str) -> Tuple[int, int]:
    return self._hardcoded_positions.get(element_type)
```

**After**:
```python
async def find_element(self, description: str) -> Tuple[int, int]:
    result = await self.vision.query({
        "image": self._last_screenshot,
        "steps": [
            { "op": "ground", "text": description, "assign_to": "target" },
            { "op": "click_point", "source": "$target", "assign_to": "click" }
        ]
    })
    return (result["results"]["click"]["x"], result["results"]["click"]["y"])
```

**Verification**: End-to-end test with Shotcut running.

```bash
pytest conductor/tracks/shotcut-on-the-map/tests/test_shotcut_agent_vision.py -v
```

### 7.3 Integration Tests

Create integration tests that:
1. Start VisionDaemon
2. Take real screenshot of Shotcut
3. Query for specific elements
4. Verify click coordinates are reasonable

**Verification**:
```bash
pytest conductor/tracks/shotcut-on-the-map/tests/test_vision_integration.py -v
```

---

## Phase 8: Testing & Benchmarking

**Goal**: Ensure quality and measure performance.

### 8.1 Unit Test Suite

Ensure all operations have comprehensive tests:
- Happy path tests
- Edge case tests (empty results, malformed input)
- Error handling tests

**Coverage Target**: >80%

**Verification**:
```bash
pytest systems/vision/tests/ -v --cov=systems/vision --cov-report=term-missing
```

### 8.2 Performance Benchmarks

Measure latency for:
- Single operation (detect, ocr, ground)
- 3-step pipeline
- 5-step pipeline

**Targets**:
| Query Type | Target P95 |
|------------|------------|
| Single op | <50ms |
| 3-step | <100ms |
| 5-step | <150ms |

**Verification**:
```bash
python systems/vision/benchmarks/latency_benchmark.py
```

### 8.3 Accuracy Benchmarks

Test against Shotcut screenshots with known element positions:
- Calculate detection accuracy (IoU > 0.5)
- Calculate text matching accuracy

**Target**: >90% accuracy

**Verification**:
```bash
python systems/vision/benchmarks/accuracy_benchmark.py
```

---

## Execution Checklist

### Before Starting
- [ ] Review design document
- [ ] Verify CUDA/torch GPU access
- [ ] Verify Florence-2 model can be downloaded (~0.5GB)

### Phase 1
- [ ] 1.1 Create project structure
- [ ] 1.2 Implement FlorenceModel wrapper
- [ ] 1.3 Create test fixtures

### Phase 2
- [ ] 2.1 Base operation class
- [ ] 2.2 `detect` operation
- [ ] 2.3 `ocr` operation
- [ ] 2.4 `ground` operation

### Phase 3
- [ ] 3.1 `relative` operation
- [ ] 3.2 `contains` operation
- [ ] 3.3 `largest`/`smallest` operations

### Phase 4
- [ ] 4.1 `click_point` operation
- [ ] 4.2 `render_text_layout` operation

### Phase 5
- [ ] 5.1 Pipeline executor
- [ ] 5.2 Variable reference resolution

### Phase 6
- [ ] 6.1 VisionDaemon service
- [ ] 6.2 Request/response protocol

### Phase 7
- [ ] 7.1 VisionClient
- [ ] 7.2 Update ShotcutAgent
- [ ] 7.3 Integration tests

### Phase 8
- [ ] 8.1 Unit test suite (80%+ coverage)
- [ ] 8.2 Performance benchmarks (<100ms P95)
- [ ] 8.3 Accuracy benchmarks (>90%)

---

## Rollback Plan

If issues arise:
1. **Phase 1-4**: Operations are isolated, can disable individually
2. **Phase 5**: Pipeline executor is stateless, easy to revert
3. **Phase 6**: Daemon can be stopped, agents fall back to hardcoded
4. **Phase 7**: ShotcutAgent has `use_vision` flag for A/B testing

---

## Notes

- Florence-2 model is downloaded on first use (~0.5GB)
- GPU memory is held by daemon for low latency
- Unix socket provides <1ms IPC overhead
- Operations are stateless and can be tested independently
