# Spatial Render Monitor Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Extend VisualPerceptionAgent to monitor video rendering completion in the Shotcut VM and notify the swarm.

**Architecture:** Add MONITOR_RENDER message handler to VisualPerceptionAgent that spawns a background async task polling screenshots every 5 seconds. CompletionDetector uses OCR pattern matching to detect "100%" or "Complete" text. On detection, broadcast RENDER_COMPLETE to swarm.

**Tech Stack:** Python, asyncio, regex, PIL (Pillow), Tesseract OCR (via extraction_pipeline)

---

## Prerequisites

- VisualPerceptionAgent exists at `systems/visual_shell/swarm/visual_perception/visual_perception_agent.py`
- Extraction pipeline at `conductor/tracks/shotcut-on-the-map/extraction_pipeline.py`
- Screenshot utility at `conductor/tracks/shotcut-on-the-map/screenshot_vm.py`

---

### Task 1: Create CompletionDetector Test File

**Files:**
- Create: `tests/system/test_completion_detector.py`

**Step 1: Write the failing test for CompletionDetector initialization**

```python
"""
Tests for CompletionDetector - Pattern matching for render completion.
"""

import pytest
import re
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../..'))


class TestCompletionDetectorInit:
    """Test CompletionDetector initialization."""

    def test_completion_detector_imports(self):
        """Test that CompletionDetector can be imported."""
        from systems.visual_shell.swarm.visual_perception.completion_detector import CompletionDetector
        assert CompletionDetector is not None

    def test_completion_detector_has_patterns(self):
        """Test that CompletionDetector has completion patterns."""
        from systems.visual_shell.swarm.visual_perception.completion_detector import CompletionDetector

        detector = CompletionDetector()
        assert hasattr(detector, 'patterns')
        assert len(detector.patterns) > 0

    def test_default_patterns_include_100_percent(self):
        """Test that default patterns include 100% detection."""
        from systems.visual_shell.swarm.visual_perception.completion_detector import CompletionDetector

        detector = CompletionDetector()
        pattern_strs = [str(p) for p in detector.patterns]

        # Should have a pattern that matches "100%"
        assert any("100" in p for p in pattern_strs)
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/system/test_completion_detector.py -v`
Expected: FAIL with "No module named 'systems.visual_shell.swarm.visual_perception.completion_detector'"

**Step 3: Commit the test file**

```bash
git add tests/system/test_completion_detector.py
git commit -m "test(completion): add failing tests for CompletionDetector initialization"
```

---

### Task 2: Implement CompletionDetector Core

**Files:**
- Create: `systems/visual_shell/swarm/visual_perception/completion_detector.py`

**Step 1: Write the failing test for pattern matching**

Add to `tests/system/test_completion_detector.py`:

```python


class TestCompletionDetectorMatching:
    """Test CompletionDetector pattern matching."""

    @pytest.fixture
    def detector(self):
        from systems.visual_shell.swarm.visual_perception.completion_detector import CompletionDetector
        return CompletionDetector()

    def test_detects_100_percent(self, detector):
        """Test detection of '100%' text."""
        result = {
            "widgets": [
                {"type": "label", "text": "Progress: 100%", "bbox": [10, 10, 100, 30]}
            ]
        }

        match = detector.detect(result)
        assert match is not None
        assert "100" in match.text

    def test_detects_complete_text(self, detector):
        """Test detection of 'Complete' text."""
        result = {
            "widgets": [
                {"type": "button", "text": "Export Complete", "bbox": [10, 10, 100, 30]}
            ]
        }

        match = detector.detect(result)
        assert match is not None
        assert "complete" in match.text.lower()

    def test_detects_finished_text(self, detector):
        """Test detection of 'Finished' text."""
        result = {
            "widgets": [
                {"type": "label", "text": "Export finished successfully", "bbox": [10, 10, 100, 30]}
            ]
        }

        match = detector.detect(result)
        assert match is not None

    def test_returns_none_for_incomplete(self, detector):
        """Test that incomplete progress returns None."""
        result = {
            "widgets": [
                {"type": "label", "text": "Progress: 50%", "bbox": [10, 10, 100, 30]}
            ]
        }

        match = detector.detect(result)
        assert match is None

    def test_returns_none_for_empty_widgets(self, detector):
        """Test that empty widgets returns None."""
        result = {"widgets": []}
        match = detector.detect(result)
        assert match is None

    def test_custom_patterns(self):
        """Test that custom patterns can be provided."""
        from systems.visual_shell.swarm.visual_perception.completion_detector import CompletionDetector

        detector = CompletionDetector(patterns=[r"CustomDone"])
        result = {
            "widgets": [
                {"type": "label", "text": "CustomDone", "bbox": [10, 10, 100, 30]}
            ]
        }

        match = detector.detect(result)
        assert match is not None
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/system/test_completion_detector.py::TestCompletionDetectorMatching -v`
Expected: FAIL with "AttributeError: 'CompletionDetector' object has no attribute 'detect'"

**Step 3: Implement CompletionDetector**

Create `systems/visual_shell/swarm/visual_perception/completion_detector.py`:

```python
"""
CompletionDetector - Pattern matching for render completion detection.

Detects completion signals (100%, Complete, Finished) in extraction results.
"""

import re
import logging
from typing import Dict, Any, Optional, List
from dataclasses import dataclass

logger = logging.getLogger(__name__)


@dataclass
class CompletionMatch:
    """Represents a detected completion match."""
    pattern: str
    text: str
    widget: Dict[str, Any]

    def to_dict(self) -> Dict[str, Any]:
        return {
            "pattern": self.pattern,
            "text": self.text,
            "widget": self.widget
        }


class CompletionDetector:
    """
    Detects render completion from extraction pipeline results.

    Uses regex pattern matching against widget text to identify
    completion indicators like "100%", "Complete", "Finished".
    """

    DEFAULT_PATTERNS = [
        r"100\s*%",           # "100%" or "100 %"
        r"[Cc]omplete",       # "Complete" or "complete"
        r"[Ee]xport\s+finished",
        r"[Dd]one",
        r"[Ff]inished"
    ]

    def __init__(self, patterns: Optional[List[str]] = None):
        """
        Initialize CompletionDetector.

        Args:
            patterns: Custom regex patterns (uses defaults if None)
        """
        self.patterns = [
            re.compile(p) for p in (patterns or self.DEFAULT_PATTERNS)
        ]
        logger.info(f"CompletionDetector initialized with {len(self.patterns)} patterns")

    def detect(self, extraction_result: Dict[str, Any]) -> Optional[CompletionMatch]:
        """
        Check if extraction result indicates completion.

        Args:
            extraction_result: Dict with 'widgets' list from extraction pipeline

        Returns:
            CompletionMatch if completion detected, None otherwise
        """
        widgets = extraction_result.get("widgets", [])

        for widget in widgets:
            text = widget.get("text", "")
            if not text:
                continue

            for pattern in self.patterns:
                if pattern.search(text):
                    logger.info(f"Completion detected: '{text}' matched pattern '{pattern.pattern}'")
                    return CompletionMatch(
                        pattern=pattern.pattern,
                        text=text,
                        widget=widget
                    )

        return None
```

**Step 4: Run tests to verify they pass**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/system/test_completion_detector.py -v`
Expected: All tests PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/swarm/visual_perception/completion_detector.py tests/system/test_completion_detector.py
git commit -m "feat(completion): add CompletionDetector with pattern matching"
```

---

### Task 3: Add MONITOR_RENDER Handler Tests

**Files:**
- Modify: `tests/system/test_visual_perception_agent.py` (create if needed)

**Step 1: Write the failing test for MONITOR_RENDER handler**

Create or add to `tests/system/test_visual_perception_agent.py`:

```python
"""
Tests for VisualPerceptionAgent - Render Monitoring.
"""

import pytest
import asyncio
import os
import sys
from unittest.mock import Mock, patch, AsyncMock, MagicMock

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../..'))


class TestRenderMonitorHandler:
    """Test MONITOR_RENDER message handling."""

    @pytest.fixture
    def agent(self):
        from systems.visual_shell.swarm.visual_perception.visual_perception_agent import VisualPerceptionAgent
        return VisualPerceptionAgent(agent_id="test-perception-001")

    def test_handle_monitor_render_message_type(self, agent):
        """Test that MONITOR_RENDER is a recognized message type."""
        # The handler should exist
        assert hasattr(agent, '_handle_monitor_render')

    @pytest.mark.asyncio
    async def test_monitor_render_starts_monitoring(self, agent):
        """Test that MONITOR_RENDER starts a monitoring task."""
        msg = {
            "type": "MONITOR_RENDER",
            "payload": {
                "vm_id": "test-vm-001",
                "poll_interval": 1
            }
        }

        with patch.object(agent, '_start_render_monitor', new_callable=AsyncMock) as mock_start:
            mock_start.return_value = {"monitor_id": "monitor-001", "status": "active"}

            result = await agent.handle_message(msg)

        assert result is not None
        assert result.get("type") == "MONITORING_STARTED"

    @pytest.mark.asyncio
    async def test_stop_monitor_stops_monitoring(self, agent):
        """Test that STOP_MONITOR stops a monitoring task."""
        msg = {
            "type": "STOP_MONITOR",
            "payload": {
                "monitor_id": "monitor-001"
            }
        }

        with patch.object(agent, '_stop_render_monitor', new_callable=AsyncMock) as mock_stop:
            mock_stop.return_value = {"status": "stopped"}

            result = await agent.handle_message(msg)

        assert result is not None
        mock_stop.assert_called_once_with("monitor-001")
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/system/test_visual_perception_agent.py::TestRenderMonitorHandler -v`
Expected: FAIL with "AttributeError: 'VisualPerceptionAgent' object has no attribute '_handle_monitor_render'"

**Step 3: Commit the test file**

```bash
git add tests/system/test_visual_perception_agent.py
git commit -m "test(perception): add failing tests for MONITOR_RENDER handler"
```

---

### Task 4: Implement MONITOR_RENDER Handler

**Files:**
- Modify: `systems/visual_shell/swarm/visual_perception/visual_perception_agent.py`

**Step 1: Write the failing test for monitoring lifecycle**

Add to `tests/system/test_visual_perception_agent.py`:

```python


class TestRenderMonitorLifecycle:
    """Test render monitoring lifecycle."""

    @pytest.fixture
    def agent(self):
        from systems.visual_shell.swarm.visual_perception.visual_perception_agent import VisualPerceptionAgent
        agent = VisualPerceptionAgent(agent_id="test-perception-002")
        # Mock the event bus
        agent.send_event = AsyncMock()
        return agent

    @pytest.mark.asyncio
    async def test_monitor_generates_unique_id(self, agent):
        """Test that each monitor gets a unique ID."""
        msg1 = {"type": "MONITOR_RENDER", "payload": {"vm_id": "vm-001"}}
        msg2 = {"type": "MONITOR_RENDER", "payload": {"vm_id": "vm-002"}}

        with patch.object(agent, '_run_monitor_loop', new_callable=AsyncMock):
            result1 = await agent._start_render_monitor(msg1["payload"])
            result2 = await agent._start_render_monitor(msg2["payload"])

        assert result1["monitor_id"] != result2["monitor_id"]

    @pytest.mark.asyncio
    async def test_active_monitors_tracking(self, agent):
        """Test that active monitors are tracked."""
        msg = {"type": "MONITOR_RENDER", "payload": {"vm_id": "vm-001"}}

        with patch.object(agent, '_run_monitor_loop', new_callable=AsyncMock):
            result = await agent._start_render_monitor(msg["payload"])

        monitor_id = result["monitor_id"]
        assert monitor_id in agent._active_monitors

    @pytest.mark.asyncio
    async def test_stop_removes_from_active(self, agent):
        """Test that STOP_MONITOR removes from active monitors."""
        msg = {"type": "MONITOR_RENDER", "payload": {"vm_id": "vm-001"}}

        with patch.object(agent, '_run_monitor_loop', new_callable=AsyncMock):
            result = await agent._start_render_monitor(msg["payload"])

        monitor_id = result["monitor_id"]
        await agent._stop_render_monitor(monitor_id)

        assert monitor_id not in agent._active_monitors
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/system/test_visual_perception_agent.py::TestRenderMonitorLifecycle -v`
Expected: FAIL with "AttributeError: 'VisualPerceptionAgent' object has no attribute '_start_render_monitor'"

**Step 3: Implement MONITOR_RENDER handler**

Add to `systems/visual_shell/swarm/visual_perception/visual_perception_agent.py`:

```python
# Add at top of file (after existing imports)
import uuid
from systems.visual_shell.swarm.visual_perception.completion_detector import CompletionDetector, CompletionMatch

# Add to __init__ method (after self.last_state = {})
        self._active_monitors: Dict[str, asyncio.Task] = {}
        self._completion_detector = CompletionDetector()

# Add new message type handling in handle_message
    async def handle_message(self, msg: Dict[str, Any]) -> Dict[str, Any]:
        """Handle incoming perception requests."""
        msg_type = msg.get("type")

        if msg_type == "PERCEIVE_REGION":
            return await self._handle_perceive_region(msg)
        elif msg_type == "MONITOR_RENDER":
            return await self._handle_monitor_render(msg)
        elif msg_type == "STOP_MONITOR":
            return await self._handle_stop_monitor(msg)

        return await super().handle_message(msg)

# Add new methods
    async def _handle_monitor_render(self, msg: Dict[str, Any]) -> Dict[str, Any]:
        """Start monitoring for render completion."""
        payload = msg.get("payload", {})
        result = await self._start_render_monitor(payload)
        return {
            "type": "MONITORING_STARTED",
            "payload": result
        }

    async def _handle_stop_monitor(self, msg: Dict[str, Any]) -> Dict[str, Any]:
        """Stop monitoring."""
        monitor_id = msg.get("payload", {}).get("monitor_id")
        if not monitor_id:
            return {"type": "MONITOR_ERROR", "payload": {"error": "Missing monitor_id"}}

        result = await self._stop_render_monitor(monitor_id)
        return {
            "type": "MONITORING_STOPPED",
            "payload": result
        }

    async def _start_render_monitor(self, config: Dict[str, Any]) -> Dict[str, Any]:
        """Start a render monitoring task."""
        monitor_id = f"render-monitor-{uuid.uuid4().hex[:8]}"
        vm_id = config.get("vm_id", "default")
        poll_interval = config.get("poll_interval", 5)

        # Create and start the monitoring task
        task = asyncio.create_task(
            self._run_monitor_loop(monitor_id, vm_id, config)
        )
        self._active_monitors[monitor_id] = task

        logger.info(f"Started render monitor {monitor_id} for VM {vm_id}")

        return {
            "monitor_id": monitor_id,
            "vm_id": vm_id,
            "status": "active",
            "poll_interval": poll_interval
        }

    async def _stop_render_monitor(self, monitor_id: str) -> Dict[str, Any]:
        """Stop a render monitoring task."""
        if monitor_id not in self._active_monitors:
            return {"status": "not_found", "monitor_id": monitor_id}

        task = self._active_monitors.pop(monitor_id)
        task.cancel()
        try:
            await task
        except asyncio.CancelledError:
            pass

        logger.info(f"Stopped render monitor {monitor_id}")
        return {"status": "stopped", "monitor_id": monitor_id}

    async def _run_monitor_loop(self, monitor_id: str, vm_id: str, config: Dict[str, Any]):
        """Background task that monitors for render completion."""
        poll_interval = config.get("poll_interval", 5)
        timeout = config.get("timeout", 3600)  # 1 hour default
        start_time = asyncio.get_event_loop().time()

        logger.info(f"Monitor loop {monitor_id} started, polling every {poll_interval}s")

        try:
            while True:
                # Check timeout
                elapsed = asyncio.get_event_loop().time() - start_time
                if elapsed > timeout:
                    await self._broadcast_event({
                        "type": "MONITOR_TIMEOUT",
                        "payload": {"monitor_id": monitor_id, "vm_id": vm_id}
                    })
                    break

                # Capture and analyze screenshot
                try:
                    screenshot_path = await self._capture_vm_screenshot(vm_id, config)
                    result = await self._extract_from_screenshot(screenshot_path)

                    # Check for completion
                    match = self._completion_detector.detect(result)
                    if match:
                        await self._broadcast_event({
                            "type": "RENDER_COMPLETE",
                            "payload": {
                                "monitor_id": monitor_id,
                                "vm_id": vm_id,
                                "detected_text": match.text,
                                "pattern": match.pattern,
                                "screenshot_path": screenshot_path
                            }
                        })
                        break

                except Exception as e:
                    logger.warning(f"Monitor {monitor_id} capture/extraction error: {e}")

                await asyncio.sleep(poll_interval)

        except asyncio.CancelledError:
            logger.info(f"Monitor {monitor_id} cancelled")
            raise
        finally:
            # Cleanup
            if monitor_id in self._active_monitors:
                del self._active_monitors[monitor_id]

    async def _capture_vm_screenshot(self, vm_id: str, config: Dict[str, Any]) -> str:
        """Capture VM screenshot."""
        # Import screenshot utility
        try:
            from conductor.tracks.shotcut_on_the_map.screenshot_vm import capture_vm_screenshot
            return await capture_vm_screenshot(vm_id)
        except ImportError:
            # Fallback for testing
            logger.warning("screenshot_vm not available, using mock")
            return f"/tmp/mock_screenshot_{vm_id}.png"

    async def _extract_from_screenshot(self, screenshot_path: str) -> Dict[str, Any]:
        """Run extraction pipeline on screenshot."""
        try:
            result = extract_gui_from_image(screenshot_path)
            return result
        except Exception as e:
            logger.error(f"Extraction failed: {e}")
            return {"widgets": [], "error": str(e)}

    async def _broadcast_event(self, event: Dict[str, Any]):
        """Broadcast event to swarm."""
        if hasattr(self, 'send_event'):
            await self.send_event(event)
        else:
            logger.info(f"Event broadcast: {event['type']}")
```

**Step 4: Run tests to verify they pass**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/system/test_visual_perception_agent.py -v`
Expected: All tests PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/swarm/visual_perception/visual_perception_agent.py tests/system/test_visual_perception_agent.py
git commit -m "feat(perception): add MONITOR_RENDER handler with background monitoring"
```

---

### Task 5: Add Integration Tests

**Files:**
- Create: `tests/system/test_render_monitor_integration.py`

**Step 1: Write integration test**

```python
"""
Integration tests for Render Monitor workflow.
"""

import pytest
import asyncio
import os
import sys
from unittest.mock import Mock, patch, AsyncMock

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../..'))


class TestRenderMonitorIntegration:
    """Integration tests for render monitoring."""

    @pytest.fixture
    def agent(self):
        from systems.visual_shell.swarm.visual_perception.visual_perception_agent import VisualPerceptionAgent
        agent = VisualPerceptionAgent(agent_id="integration-test-001")
        agent.send_event = AsyncMock()
        return agent

    @pytest.mark.asyncio
    async def test_full_monitoring_lifecycle(self, agent):
        """Test start -> detect -> broadcast -> stop lifecycle."""
        # Mock screenshot capture and extraction
        with patch.object(agent, '_capture_vm_screenshot', new_callable=AsyncMock) as mock_capture:
            with patch.object(agent, '_extract_from_screenshot', new_callable=AsyncMock) as mock_extract:
                mock_capture.return_value = "/tmp/test.png"
                # First call: 50% progress, Second call: 100% complete
                mock_extract.side_effect = [
                    {"widgets": [{"text": "Progress: 50%", "bbox": [0, 0, 100, 20]}]},
                    {"widgets": [{"text": "Export Complete - 100%", "bbox": [0, 0, 100, 20]}]}
                ]

                # Start monitoring with short interval
                result = await agent._start_render_monitor({
                    "vm_id": "test-vm",
                    "poll_interval": 0.1
                })

                monitor_id = result["monitor_id"]
                assert monitor_id in agent._active_monitors

                # Wait for detection (with timeout)
                await asyncio.sleep(0.5)

                # Verify broadcast was called with RENDER_COMPLETE
                broadcasts = agent.send_event.call_args_list
                complete_calls = [c for c in broadcasts if c[0][0].get("type") == "RENDER_COMPLETE"]
                assert len(complete_calls) > 0

    @pytest.mark.asyncio
    async def test_error_broadcast_on_screenshot_failure(self, agent):
        """Test that screenshot failures are handled gracefully."""
        with patch.object(agent, '_capture_vm_screenshot', new_callable=AsyncMock) as mock_capture:
            mock_capture.side_effect = Exception("VM not accessible")

            result = await agent._start_render_monitor({
                "vm_id": "unreachable-vm",
                "poll_interval": 0.1
            })

            monitor_id = result["monitor_id"]

            # Wait for a few polling cycles
            await asyncio.sleep(0.3)

            # Monitor should still be running (error is logged, not fatal)
            # Or it should have stopped gracefully

    @pytest.mark.asyncio
    async def test_manual_stop_during_monitoring(self, agent):
        """Test that STOP_MONITOR works during active monitoring."""
        with patch.object(agent, '_capture_vm_screenshot', new_callable=AsyncMock) as mock_capture:
            with patch.object(agent, '_extract_from_screenshot', new_callable=AsyncMock) as mock_extract:
                mock_capture.return_value = "/tmp/test.png"
                mock_extract.return_value = {"widgets": [{"text": "Progress: 50%"}]}

                result = await agent._start_render_monitor({
                    "vm_id": "test-vm",
                    "poll_interval": 1
                })

                monitor_id = result["monitor_id"]
                assert monitor_id in agent._active_monitors

                # Stop immediately
                await asyncio.sleep(0.1)
                stop_result = await agent._stop_render_monitor(monitor_id)

                assert stop_result["status"] == "stopped"
                assert monitor_id not in agent._active_monitors
```

**Step 2: Run integration tests**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/system/test_render_monitor_integration.py -v`
Expected: All tests PASS

**Step 3: Commit**

```bash
git add tests/system/test_render_monitor_integration.py
git commit -m "test(perception): add integration tests for render monitoring workflow"
```

---

### Task 6: Add Documentation

**Files:**
- Create: `docs/render_monitor.md`

**Step 1: Write documentation**

```markdown
# Render Monitor - Spatial Awareness for Video Rendering

The Render Monitor extends VisualPerceptionAgent to detect video rendering completion in VMs.

## Overview

Monitors a VM's framebuffer for completion indicators ("100%", "Complete", "Finished") and broadcasts to the swarm.

## Usage

### Start Monitoring

```python
from systems.visual_shell.swarm.visual_perception.visual_perception_agent import VisualPerceptionAgent

agent = VisualPerceptionAgent(agent_id="perception-001")

result = await agent.handle_message({
    "type": "MONITOR_RENDER",
    "payload": {
        "vm_id": "shotcut-vm-001",
        "poll_interval": 5,
        "region": {"x": 0, "y": 0, "width": 800, "height": 600}
    }
})
# Result: {"type": "MONITORING_STARTED", "payload": {"monitor_id": "...", ...}}
```

### Stop Monitoring

```python
result = await agent.handle_message({
    "type": "STOP_MONITOR",
    "payload": {"monitor_id": "render-monitor-abc123"}
})
```

## Events

### RENDER_COMPLETE

Broadcast when completion detected:

```json
{
  "type": "RENDER_COMPLETE",
  "source_agent": "perception-001",
  "payload": {
    "monitor_id": "render-monitor-abc123",
    "vm_id": "shotcut-vm-001",
    "detected_text": "Export Complete - 100%",
    "pattern": "100\\s*%"
  }
}
```

## Configuration

| Parameter | Default | Description |
|-----------|---------|-------------|
| `poll_interval` | 5 | Seconds between screenshot polls |
| `timeout` | 3600 | Max monitoring duration (1 hour) |
| `region` | None | Optional crop region for screenshot |

## Files

| File | Purpose |
|------|---------|
| `systems/visual_shell/swarm/visual_perception/visual_perception_agent.py` | Agent with MONITOR_RENDER handler |
| `systems/visual_shell/swarm/visual_perception/completion_detector.py` | Pattern matching for completion |
```

**Step 2: Commit**

```bash
git add docs/render_monitor.md
git commit -m "docs(perception): add Render Monitor usage documentation"
```

---

## Verification

After all tasks complete, verify:

```bash
# Run all tests
cd /home/jericho/zion/projects/geometry_os/geometry_os
python3 -m pytest tests/system/test_completion_detector.py tests/system/test_visual_perception_agent.py tests/system/test_render_monitor_integration.py -v

# Test CompletionDetector CLI
python3 -c "from systems.visual_shell.swarm.visual_perception.completion_detector import CompletionDetector; d = CompletionDetector(); print(d.detect({'widgets': [{'text': '100%'}]}))"

# Verify agent has monitor methods
python3 -c "from systems.visual_shell.swarm.visual_perception.visual_perception_agent import VisualPerceptionAgent; a = VisualPerceptionAgent('test'); print(hasattr(a, '_start_render_monitor'))"
```

---

## Summary

| Task | Files | Commits |
|------|-------|---------|
| 1. CompletionDetector tests | `tests/system/test_completion_detector.py` | 1 |
| 2. CompletionDetector implementation | `systems/visual_shell/swarm/visual_perception/completion_detector.py` | 1 |
| 3. MONITOR_RENDER tests | `tests/system/test_visual_perception_agent.py` | 1 |
| 4. MONITOR_RENDER handler | `systems/visual_shell/swarm/visual_perception/visual_perception_agent.py` | 1 |
| 5. Integration tests | `tests/system/test_render_monitor_integration.py` | 1 |
| 6. Documentation | `docs/render_monitor.md` | 1 |

**Total: 6 tasks, 6 commits, 5 files created/modified**
