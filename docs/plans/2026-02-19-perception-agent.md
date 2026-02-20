# PerceptionAgent Implementation Plan (Frontier G: Visual Ingestion)

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a PerceptionAgent that wraps the Visual Extraction Pipeline as a swarm-capable agent, enabling any agent in the collective to "see" and analyze pixel-based interfaces.

**Architecture:** PerceptionAgent subclasses WorkerAgent and exposes `extract_visuals` capability. It imports the extraction_pipeline from the shotcut-on-the-map track and returns widgets + ASCII scene graphs to requesting agents.

**Tech Stack:** Python, asyncio, websockets, dataclasses, Tesseract OCR (via extraction_pipeline)

---

## Prerequisites

- Visual Extraction Pipeline exists at `conductor/tracks/shotcut-on-the-map/extraction_pipeline.py`
- WorkerAgent base class at `systems/visual_shell/swarm/worker_agent.py`
- Team configuration at `ai_project_management/teams/cognitive-ide-team.yaml`

---

### Task 1: Create PerceptionAgent Test File

**Files:**
- Create: `tests/system/test_perception_agent.py`

**Step 1: Write the failing test for PerceptionAgent initialization**

```python
"""
Tests for PerceptionAgent - The 'Retina' of the Swarm.
"""

import pytest
import asyncio
from unittest.mock import Mock, patch, AsyncMock
import sys
import os

# Add project paths
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../..'))
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../../conductor/tracks/shotcut-on-the-map'))


class TestPerceptionAgentInit:
    """Test PerceptionAgent initialization."""

    def test_perception_agent_imports(self):
        """Test that PerceptionAgent can be imported."""
        from systems.visual_shell.swarm.perception_agent import PerceptionAgent
        assert PerceptionAgent is not None

    def test_perception_agent_initialization(self):
        """Test PerceptionAgent initializes with correct capabilities."""
        from systems.visual_shell.swarm.perception_agent import PerceptionAgent

        agent = PerceptionAgent(agent_id="perception-test-1")
        assert agent.agent_id == "perception-test-1"
        assert "perception" in agent.capabilities
        assert "visual_extraction" in agent.capabilities
        assert "ocr" in agent.capabilities

    def test_perception_agent_metadata(self):
        """Test PerceptionAgent has correct metadata for registration."""
        from systems.visual_shell.swarm.perception_agent import PerceptionAgent

        agent = PerceptionAgent(agent_id="perception-test-2")
        metadata = agent.get_registration_metadata()

        assert metadata["agent_type"] == "specialist"
        assert "visual_extraction" in metadata["capabilities"]
        assert "ocr" in metadata["capabilities"]
        assert "semantic_clustering" in metadata["capabilities"]
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/system/test_perception_agent.py -v`
Expected: FAIL with "No module named 'systems.visual_shell.swarm.perception_agent'"

**Step 3: Commit the test file**

```bash
git add tests/system/test_perception_agent.py
git commit -m "test(perception): add failing tests for PerceptionAgent initialization"
```

---

### Task 2: Implement PerceptionAgent Core

**Files:**
- Create: `systems/visual_shell/swarm/perception_agent.py`

**Step 1: Write the failing test for extract_visuals message handling**

Add to `tests/system/test_perception_agent.py`:

```python


class TestPerceptionAgentExtraction:
    """Test PerceptionAgent visual extraction capability."""

    @pytest.fixture
    def mock_extraction_result(self):
        """Create a mock extraction result."""
        from dataclasses import dataclass
        from typing import List, Dict, Any

        @dataclass
        class MockWidget:
            type: type('MockWidgetType')(value='button')
            text: str = "Open File"
            bbox: tuple = (10, 20, 100, 40)
            action: str = "action:click_open_file"

        @dataclass
        class MockResult:
            ascii_view: str = "┌─────────┐\n│ File    │\n└─────────┘"
            widgets: list = None

            def __post_init__(self):
                if self.widgets is None:
                    self.widgets = [MockWidget()]

            def to_dict(self):
                return {
                    "widgets": [{"type": "button", "text": "Open File", "bbox": [10, 20, 100, 40]}],
                    "ascii_view": self.ascii_view
                }

        return MockResult()

    @pytest.mark.asyncio
    async def test_handle_extract_visuals_message(self, mock_extraction_result):
        """Test handling of extract_visuals message type."""
        from systems.visual_shell.swarm.perception_agent import PerceptionAgent

        agent = PerceptionAgent(agent_id="perception-test-3")

        with patch.object(agent, '_run_extraction', new_callable=AsyncMock) as mock_extract:
            mock_extract.return_value = mock_extraction_result

            result = await agent.handle_message({
                "type": "extract_visuals",
                "source": "test_screenshot.png"
            })

        assert result["status"] == "success"
        assert "widgets" in result
        assert "ascii_graph" in result
        assert result["ascii_graph"] == mock_extraction_result.ascii_view

    @pytest.mark.asyncio
    async def test_handle_unknown_message_returns_none(self):
        """Test that unknown message types return None (pass to parent)."""
        from systems.visual_shell.swarm.perception_agent import PerceptionAgent

        agent = PerceptionAgent(agent_id="perception-test-4")
        result = await agent.handle_message({"type": "unknown_type"})

        # Should return None to let parent handle it
        assert result is None
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/system/test_perception_agent.py::TestPerceptionAgentExtraction -v`
Expected: FAIL with "AttributeError: 'PerceptionAgent' object has no attribute 'handle_message'"

**Step 3: Implement PerceptionAgent with extraction logic**

Create `systems/visual_shell/swarm/perception_agent.py`:

```python
"""
PerceptionAgent - The 'Retina' of the Swarm.

Wraps the Visual Extraction Pipeline as a distributed service, enabling
any agent in the collective to "see" and analyze pixel-based interfaces.

Usage:
    agent = PerceptionAgent(agent_id="perception-1")
    result = await agent.handle_message({
        "type": "extract_visuals",
        "source": "path/to/screenshot.png"
    })
    # result = {"status": "success", "widgets": [...], "ascii_graph": "..."}
"""

import asyncio
import json
import logging
import os
import sys
from typing import Dict, Any, Optional

# Add extraction pipeline to path
EXTRACTION_PIPELINE_PATH = os.path.join(
    os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(__file__)))),
    "conductor", "tracks", "shotcut-on-the-map"
)
if EXTRACTION_PIPELINE_PATH not in sys.path:
    sys.path.insert(0, EXTRACTION_PIPELINE_PATH)

from systems.visual_shell.swarm.worker_agent import WorkerAgent

logger = logging.getLogger(__name__)


class PerceptionAgent(WorkerAgent):
    """
    The Retina of the Swarm.

    Provides visual extraction capabilities to the collective consciousness.
    Can analyze any pixel-based interface and return structured semantic data.

    Capabilities:
        - visual_extraction: Extract widgets and structure from screenshots
        - ocr: Optical character recognition via Tesseract
        - semantic_clustering: Group related UI elements
        - reverse_ui_engineering: Clone legacy interfaces

    Message Protocol:
        Request:  {"type": "extract_visuals", "source": "path/to/image.png"}
        Response: {"status": "success", "widgets": [...], "ascii_graph": "..."}
    """

    # Capabilities this agent provides
    AGENT_CAPABILITIES = [
        "perception",
        "visual_extraction",
        "ocr",
        "semantic_clustering",
        "reverse_ui_engineering"
    ]

    def __init__(
        self,
        agent_id: str,
        a2a_url: str = "ws://localhost:8766",
        ascii_width: int = 80,
        ascii_height: int = 24
    ):
        """
        Initialize PerceptionAgent.

        Args:
            agent_id: Unique identifier for this agent
            a2a_url: WebSocket URL for agent-to-agent communication
            ascii_width: Width of ASCII scene graph (default: 80)
            ascii_height: Height of ASCII scene graph (default: 24)
        """
        super().__init__(agent_id=agent_id, a2a_url=a2a_url)

        # Add perception capabilities
        self.capabilities = list(self.AGENT_CAPABILITIES)

        # ASCII scene graph dimensions
        self.ascii_width = ascii_width
        self.ascii_height = ascii_height

        # Lazy-load extraction pipeline
        self._pipeline = None

        self.logger.info(f"PerceptionAgent {self.agent_id} online with capabilities: {self.capabilities}")

    @property
    def pipeline(self):
        """Lazy-load the extraction pipeline on first use."""
        if self._pipeline is None:
            try:
                from extraction_pipeline import ExtractionPipeline
                self._pipeline = ExtractionPipeline(
                    ascii_width=self.ascii_width,
                    ascii_height=self.ascii_height
                )
                self.logger.info("Visual Extraction Pipeline loaded successfully")
            except ImportError as e:
                self.logger.error(f"Failed to load extraction pipeline: {e}")
                raise
        return self._pipeline

    def get_registration_metadata(self) -> Dict[str, Any]:
        """
        Get metadata for agent registration with CoordinatorAgent.

        Returns:
            Registration message payload
        """
        return {
            "agent_id": self.agent_id,
            "agent_type": "specialist",
            "capabilities": [
                "visual_extraction",
                "ocr",
                "semantic_clustering",
                "reverse_ui_engineering"
            ],
            "district": "COGNITIVE"
        }

    async def _run_extraction(self, image_path: str):
        """
        Run the extraction pipeline on an image.

        Args:
            image_path: Path to screenshot image

        Returns:
            ExtractionResult from the pipeline
        """
        # Run in executor to avoid blocking
        loop = asyncio.get_event_loop()
        return await loop.run_in_executor(
            None,
            self.pipeline.extract,
            image_path
        )

    async def handle_message(self, msg: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """
        Handle incoming messages.

        Supported message types:
            - extract_visuals: Extract structure from a screenshot

        Args:
            msg: Message dictionary with 'type' and type-specific fields

        Returns:
            Response dictionary or None to pass to parent handler
        """
        msg_type = msg.get("type")

        if msg_type == "extract_visuals":
            return await self._handle_extract_visuals(msg)

        # Pass unknown messages to parent
        return await super().handle_message(msg) if hasattr(super(), 'handle_message') else None

    async def _handle_extract_visuals(self, msg: Dict[str, Any]) -> Dict[str, Any]:
        """
        Handle extract_visuals request.

        Args:
            msg: Message with 'source' field containing image path

        Returns:
            Response with widgets and ASCII scene graph
        """
        image_path = msg.get("source")

        if not image_path:
            return {
                "status": "error",
                "error": "Missing 'source' field in extract_visuals request"
            }

        if not os.path.exists(image_path):
            return {
                "status": "error",
                "error": f"Image file not found: {image_path}"
            }

        try:
            self.logger.info(f"PerceptionAgent {self.agent_id} extracting from {image_path}")

            # Run extraction
            result = await self._run_extraction(image_path)

            # Format response
            response = {
                "status": "success",
                "widgets": [
                    {
                        "type": w.get("type", "unknown"),
                        "text": w.get("text", ""),
                        "bbox": w.get("bbox", []),
                        "action": w.get("action")
                    }
                    for w in result.to_dict().get("widgets", [])
                ],
                "ascii_graph": result.ascii_view,
                "metadata": {
                    "source": image_path,
                    "widget_count": len(result.widgets),
                    "extraction_time": result.metadata.get("extraction_time_seconds", 0)
                }
            }

            self.logger.info(f"Extraction complete: {len(response['widgets'])} widgets found")
            return response

        except Exception as e:
            self.logger.error(f"Extraction failed: {e}")
            return {
                "status": "error",
                "error": str(e)
            }


# CLI entry point for testing
if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="PerceptionAgent - Visual Extraction Service")
    parser.add_argument("--id", required=True, help="Agent ID")
    parser.add_argument("--test-image", help="Test extraction on an image and exit")
    args = parser.parse_args()

    agent = PerceptionAgent(agent_id=args.id)

    if args.test_image:
        # Test mode: extract from image and print result
        async def test_extract():
            result = await agent.handle_message({
                "type": "extract_visuals",
                "source": args.test_image
            })
            print(json.dumps(result, indent=2))

        asyncio.run(test_extract())
    else:
        # Normal mode: connect to coordinator
        asyncio.run(agent.connect())
```

**Step 4: Run tests to verify they pass**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/system/test_perception_agent.py -v`
Expected: All tests PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/swarm/perception_agent.py tests/system/test_perception_agent.py
git commit -m "feat(perception): implement PerceptionAgent with visual extraction capability"
```

---

### Task 3: Update Team Configuration

**Files:**
- Modify: `ai_project_management/teams/cognitive-ide-team.yaml`

**Step 1: Write the failing test for team config**

Add to `tests/system/test_perception_agent.py`:

```python


class TestPerceptionAgentTeamConfig:
    """Test PerceptionAgent is properly configured in team YAML."""

    def test_perception_agent_in_team_config(self):
        """Test that perception-specialist exists in cognitive-ide-team.yaml."""
        import yaml

        config_path = os.path.join(
            os.path.dirname(__file__),
            '../../..',
            'ai_project_management/teams/cognitive-ide-team.yaml'
        )

        with open(config_path, 'r') as f:
            config = yaml.safe_load(f)

        agent_ids = [a['agent_id'] for a in config.get('agents', [])]
        assert 'perception-specialist' in agent_ids, \
            f"perception-specialist not found in team config. Found: {agent_ids}"

    def test_perception_agent_has_correct_capabilities(self):
        """Test perception-specialist has required capabilities."""
        import yaml

        config_path = os.path.join(
            os.path.dirname(__file__),
            '../../..',
            'ai_project_management/teams/cognitive-ide-team.yaml'
        )

        with open(config_path, 'r') as f:
            config = yaml.safe_load(f)

        perception_agent = next(
            (a for a in config.get('agents', []) if a['agent_id'] == 'perception-specialist'),
            None
        )

        assert perception_agent is not None, "perception-specialist not found"
        caps = perception_agent.get('capabilities', [])

        required = ['visual_extraction', 'ocr', 'semantic_clustering']
        for cap in required:
            assert cap in caps, f"Missing capability: {cap}"

    def test_perception_agent_task_routing(self):
        """Test extract_visuals tasks route to perception-specialist."""
        import yaml

        config_path = os.path.join(
            os.path.dirname(__file__),
            '../../..',
            'ai_project_management/teams/cognitive-ide-team.yaml'
        )

        with open(config_path, 'r') as f:
            config = yaml.safe_load(f)

        routing = config.get('task_routing', [])
        perception_routing = next(
            (r for r in routing if r.get('assign_to') == 'perception-specialist'),
            None
        )

        assert perception_routing is not None, \
            "No task routing found for perception-specialist"
        assert 'extract.*visual' in perception_routing.get('pattern', '').lower() or \
               'visual.*extract' in perception_routing.get('pattern', '').lower(), \
               "Task routing pattern should match extract_visuals"
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/system/test_perception_agent.py::TestPerceptionAgentTeamConfig -v`
Expected: FAIL with "AssertionError: perception-specialist not found"

**Step 3: Update team configuration**

Add to `ai_project_management/teams/cognitive-ide-team.yaml` after the test-engineer section (around line 278):

```yaml
  # ============================================
  # PERCEPTION SPECIALIST - Visual Ingestion
  # ============================================
  - agent_id: perception-specialist
    name: Perception Agent Specialist
    agent_type: specialist
    capabilities:
      - visual_extraction
      - ocr
      - semantic_clustering
      - reverse_ui_engineering
      - perception
    enabled: true
    max_concurrent_tasks: 2
    priority: 85
    metadata:
      role: Visual Ingestion for Swarm
      focuses:
        - Screenshot analysis
        - Widget detection
        - Semantic grounding
        - ASCII scene graph generation
      key_files:
        - systems/visual_shell/swarm/perception_agent.py
        - conductor/tracks/shotcut-on-the-map/extraction_pipeline.py
        - tests/system/test_perception_agent.py
```

And add task routing at the end of `task_routing` section (around line 295):

```yaml
  - pattern: "extract.*visual|visual.*extract|ocr|widget.*detect|perception|scene.*graph"
    assign_to: perception-specialist
```

**Step 4: Run tests to verify they pass**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/system/test_perception_agent.py::TestPerceptionAgentTeamConfig -v`
Expected: All tests PASS

**Step 5: Commit**

```bash
git add ai_project_management/teams/cognitive-ide-team.yaml tests/system/test_perception_agent.py
git commit -m "feat(team): add perception-specialist to cognitive-ide-team with task routing"
```

---

### Task 4: Integration Test with Real Screenshot

**Files:**
- Create: `tests/system/test_perception_agent_integration.py`

**Step 1: Write integration test**

```python
"""
Integration tests for PerceptionAgent with real screenshots.
"""

import pytest
import asyncio
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../..'))


class TestPerceptionAgentIntegration:
    """Integration tests with real Visual Extraction Pipeline."""

    @pytest.fixture
    def sample_screenshot(self):
        """Get path to a test screenshot."""
        # Use an existing test image
        test_images = [
            "conductor/tracks/shotcut-on-the-map/shotcut_gui_test.png",
            "conductor/tracks/shotcut-on-the-map/linux_boot_console.png",
        ]
        for path in test_images:
            full_path = os.path.join(os.path.dirname(__file__), '../../..', path)
            if os.path.exists(full_path):
                return full_path
        return None

    @pytest.mark.asyncio
    @pytest.mark.skipif(
        not os.path.exists("conductor/tracks/shotcut-on-the-map/shotcut_gui_test.png"),
        reason="No test screenshot available"
    )
    async def test_real_extraction_from_screenshot(self, sample_screenshot):
        """Test extraction from a real screenshot."""
        from systems.visual_shell.swarm.perception_agent import PerceptionAgent

        if sample_screenshot is None:
            pytest.skip("No sample screenshot found")

        agent = PerceptionAgent(agent_id="perception-integration-test")

        result = await agent.handle_message({
            "type": "extract_visuals",
            "source": sample_screenshot
        })

        # Verify response structure
        assert result["status"] == "success", f"Extraction failed: {result.get('error')}"
        assert "widgets" in result
        assert "ascii_graph" in result
        assert "metadata" in result

        # Verify we extracted something
        assert len(result["widgets"]) > 0, "No widgets extracted"
        assert len(result["ascii_graph"]) > 0, "No ASCII graph generated"

        print(f"\nExtracted {len(result['widgets'])} widgets:")
        for w in result["widgets"][:5]:  # Show first 5
            print(f"  - {w['type']}: '{w['text']}'")

    @pytest.mark.asyncio
    async def test_handles_missing_file_gracefully(self):
        """Test that missing files return error, not exception."""
        from systems.visual_shell.swarm.perception_agent import PerceptionAgent

        agent = PerceptionAgent(agent_id="perception-test-missing")

        result = await agent.handle_message({
            "type": "extract_visuals",
            "source": "/nonexistent/path/to/image.png"
        })

        assert result["status"] == "error"
        assert "not found" in result["error"].lower()

    @pytest.mark.asyncio
    async def test_handles_missing_source_field(self):
        """Test that missing source field returns error."""
        from systems.visual_shell.swarm.perception_agent import PerceptionAgent

        agent = PerceptionAgent(agent_id="perception-test-no-source")

        result = await agent.handle_message({
            "type": "extract_visuals"
        })

        assert result["status"] == "error"
        assert "missing" in result["error"].lower()
```

**Step 2: Run integration tests**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/system/test_perception_agent_integration.py -v`
Expected: All tests PASS (or skip if no screenshot)

**Step 3: Commit**

```bash
git add tests/system/test_perception_agent_integration.py
git commit -m "test(perception): add integration tests with real screenshots"
```

---

### Task 5: Add Documentation

**Files:**
- Create: `docs/perception_agent.md`

**Step 1: Write documentation**

```markdown
# PerceptionAgent - Visual Ingestion for Geometry OS

The PerceptionAgent is the "Retina" of the Swarm, wrapping the Visual Extraction Pipeline as a distributed service.

## Overview

Enables any agent in the collective consciousness to "see" and analyze pixel-based interfaces.

## Capabilities

| Capability | Description |
|------------|-------------|
| `visual_extraction` | Extract widgets and structure from screenshots |
| `ocr` | Optical character recognition via Tesseract |
| `semantic_clustering` | Group related UI elements |
| `reverse_ui_engineering` | Clone legacy interfaces |

## Message Protocol

### Request

```json
{
  "type": "extract_visuals",
  "source": "path/to/screenshot.png"
}
```

### Response

```json
{
  "status": "success",
  "widgets": [
    {"type": "button", "text": "Open File", "bbox": [10, 20, 100, 40], "action": "action:click_open_file"}
  ],
  "ascii_graph": "┌─────────┐\n│ File    │\n└─────────┘",
  "metadata": {
    "source": "path/to/screenshot.png",
    "widget_count": 15,
    "extraction_time": 0.45
  }
}
```

## Usage

### Python API

```python
from systems.visual_shell.swarm.perception_agent import PerceptionAgent

agent = PerceptionAgent(agent_id="perception-1")
result = await agent.handle_message({
    "type": "extract_visuals",
    "source": "screenshot.png"
})
print(result["ascii_graph"])
```

### CLI

```bash
python systems/visual_shell/swarm/perception_agent.py \
  --id perception-1 \
  --test-image screenshot.png
```

## Integration with Cognitive IDE

The PerceptionAgent integrates with the Cognitive IDE Team via `ai_project_management/teams/cognitive-ide-team.yaml`:

- Agent ID: `perception-specialist`
- Priority: 85
- Task Routing: `extract.*visual`, `ocr`, `widget.*detect`

## Architecture

```
CoordinatorAgent
       │
       │ extract_visuals task
       ▼
PerceptionAgent (perception-specialist)
       │
       │ _run_extraction()
       ▼
Visual Extraction Pipeline
       │
       │ OCR → Cluster → Widget Detect
       ▼
ExtractionResult
       │
       ▼
{widgets: [...], ascii_graph: "..."}
```
```

**Step 2: Commit**

```bash
git add docs/perception_agent.md
git commit -m "docs(perception): add PerceptionAgent documentation"
```

---

## Verification

After all tasks complete, verify:

```bash
# Run all perception agent tests
cd /home/jericho/zion/projects/geometry_os/geometry_os
python -m pytest tests/system/test_perception_agent*.py -v

# Test CLI
python systems/visual_shell/swarm/perception_agent.py --id test-cli --test-image conductor/tracks/shotcut-on-the-map/shotcut_gui_test.png

# Verify team config
grep -A 20 "perception-specialist" ai_project_management/teams/cognitive-ide-team.yaml
```

---

## Summary

| Task | Files | Commits |
|------|-------|---------|
| 1. Test file setup | `tests/system/test_perception_agent.py` | 1 |
| 2. Core implementation | `systems/visual_shell/swarm/perception_agent.py` | 1 |
| 3. Team config | `ai_project_management/teams/cognitive-ide-team.yaml` | 1 |
| 4. Integration tests | `tests/system/test_perception_agent_integration.py` | 1 |
| 5. Documentation | `docs/perception_agent.md` | 1 |

**Total: 5 tasks, 5 commits, 4 files created, 1 file modified**
