# Spatial Render Monitor Design

**Date:** 2026-02-20
**Status:** Approved
**Approach:** Extend VisualPerceptionAgent

## Overview

Enable the VisualPerceptionAgent to monitor video rendering in the Shotcut VM and notify the swarm when rendering completes. This provides "spatial awareness" for the swarm to react to visual state changes on the infinite map.

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    VisualPerceptionAgent                     │
│                                                              │
│  ┌─────────────────┐    ┌─────────────────────────────────┐ │
│  │ MONITOR_RENDER  │───▶│     RenderMonitor Loop          │ │
│  │ (start/stop)    │    │  (5s interval screenshot poll)  │ │
│  └─────────────────┘    └──────────┬──────────────────────┘ │
│                                    │                         │
│                         ┌──────────▼──────────┐              │
│                         │  CompletionDetector │              │
│                         │  (OCR: 100%/Complete)│              │
│                         └──────────┬──────────┘              │
│                                    │                         │
│                         ┌──────────▼──────────┐              │
│                         │ RENDER_COMPLETE     │              │
│                         │ (broadcast to swarm)│              │
│                         └─────────────────────┘              │
└─────────────────────────────────────────────────────────────┘
          │                                        │
          ▼                                        ▼
   screenshot_vm.py                         Swarm EventBus
   (VM framebuffer)                         (notify agents)
```

## Key Components

1. **RenderMonitor Loop** - Async background task polling every 5s
2. **CompletionDetector** - OCR-based pattern matching for "100%" or "Complete"
3. **Swarm Broadcast** - Uses existing A2A event bus to notify agents

## Message Protocol

### Request: Start Monitoring

```json
{
  "type": "MONITOR_RENDER",
  "payload": {
    "vm_id": "shotcut-vm-001",
    "region": {"x": 0, "y": 0, "width": 800, "height": 600},
    "poll_interval": 5,
    "completion_patterns": ["100%", "Complete", "Export finished"],
    "callback_agent": "shotcut-orchestrator"
  }
}
```

### Response: Monitoring Started

```json
{
  "type": "MONITORING_STARTED",
  "payload": {
    "monitor_id": "render-monitor-001",
    "vm_id": "shotcut-vm-001",
    "status": "active"
  }
}
```

### Broadcast: Render Complete

```json
{
  "type": "RENDER_COMPLETE",
  "payload": {
    "monitor_id": "render-monitor-001",
    "vm_id": "shotcut-vm-001",
    "detected_text": "Export Complete - 100%",
    "timestamp": "2026-02-20T12:34:56Z",
    "screenshot_path": "/tmp/render_complete_001.png"
  }
}
```

### Request: Stop Monitoring

```json
{
  "type": "STOP_MONITOR",
  "payload": {
    "monitor_id": "render-monitor-001"
  }
}
```

## Detection Logic

```python
class CompletionDetector:
    """Detects render completion from screenshot."""

    COMPLETION_PATTERNS = [
        r"100\s*%",           # "100%" or "100 %"
        r"[Cc]omplete",       # "Complete" or "complete"
        r"[Ee]xport\s+finished",
        r"[Dd]one",
        r"[Ff]inished"
    ]

    def detect(self, extraction_result: Dict) -> Optional[Match]:
        """
        Check if extraction result indicates completion.

        Returns Match object with detected pattern, or None.
        """
        widgets = extraction_result.get("widgets", [])

        for widget in widgets:
            text = widget.get("text", "")
            for pattern in self.COMPLETION_PATTERNS:
                if re.search(pattern, text):
                    return Match(
                        pattern=pattern,
                        text=text,
                        widget=widget
                    )
        return None
```

### Detection Flow

1. Screenshot → ExtractionPipeline → widgets list
2. For each widget, check text against `COMPLETION_PATTERNS`
3. First match triggers completion broadcast
4. Monitor auto-stops after detection (configurable)

## Integration Points

### Screenshot Capture

Uses existing `screenshot_vm.py`:

```python
from conductor.tracks.shotcut_on_the_map.screenshot_vm import capture_vm_screenshot

async def _capture_region(self, vm_id: str, region: Dict) -> str:
    screenshot_path = await capture_vm_screenshot(vm_id)

    if region:
        from PIL import Image
        img = Image.open(screenshot_path)
        cropped = img.crop((
            region["x"], region["y"],
            region["x"] + region["width"],
            region["y"] + region["height"]
        ))
        cropped_path = f"/tmp/region_{vm_id}.png"
        cropped.save(cropped_path)
        return cropped_path

    return screenshot_path
```

### Swarm Broadcast

Uses existing WorkerAgent event bus:

```python
async def _broadcast_completion(self, payload: Dict):
    await self.send_event({
        "type": "RENDER_COMPLETE",
        "source_agent": self.agent_id,
        "payload": payload
    })
```

### Files to Modify

| File | Change |
|------|--------|
| `systems/visual_shell/swarm/visual_perception/visual_perception_agent.py` | Add MONITOR_RENDER handler |
| `systems/visual_shell/swarm/visual_perception/completion_detector.py` | **NEW** - Pattern matching logic |
| `tests/system/test_visual_perception_agent.py` | Add render monitoring tests |

## Error Handling

| Error Scenario | Handling |
|----------------|----------|
| **Screenshot fails** | Retry 3 times with 1s backoff, then broadcast `MONITOR_ERROR` |
| **OCR returns empty** | Log warning, continue monitoring (UI might be blank temporarily) |
| **VM not found** | Broadcast `MONITOR_ERROR` with "VM_NOT_FOUND", auto-stop |
| **Timeout (no completion)** | Configurable timeout (default: 1 hour), broadcast `MONITOR_TIMEOUT` |
| **Agent shutdown** | Cleanup background task, save monitor state for recovery |

### Exception Classes

```python
class RenderMonitorError(Exception):
    """Base exception for render monitoring."""
    pass

class ScreenshotError(RenderMonitorError):
    """Failed to capture screenshot."""
    pass

class VMNotFoundError(RenderMonitorError):
    """VM ID not found."""
    pass

class MonitorTimeoutError(RenderMonitorError):
    """Monitoring timed out without completion."""
    pass
```

### Error Broadcast Example

```json
{
  "type": "MONITOR_ERROR",
  "payload": {
    "monitor_id": "render-monitor-001",
    "error": "SCREENSHOT_FAILED",
    "message": "Failed to capture screenshot after 3 retries",
    "vm_id": "shotcut-vm-001"
  }
}
```

## Testing Strategy

### Unit Tests

| Test | Description |
|------|-------------|
| `test_completion_detector_patterns` | Verify regex patterns match expected text |
| `test_monitor_start_stop` | Start/stop monitoring lifecycle |
| `test_broadcast_on_completion` | Verify RENDER_COMPLETE broadcast |
| `test_error_handling_screenshot_fail` | Mock screenshot failure, verify error broadcast |

### Integration Tests

| Test | Description |
|------|-------------|
| `test_e2e_render_monitoring` | Start monitor, feed mock screenshots, detect completion |
| `test_vm_not_found_error` | Request monitoring for non-existent VM |
| `test_timeout_handling` | Verify timeout broadcast after configured time |

### Test Fixtures

```python
MOCK_COMPLETION_SCREENSHOT = "tests/fixtures/render_complete_100.png"
MOCK_PROGRESS_SCREENSHOT = "tests/fixtures/render_progress_50.png"
MOCK_ERROR_SCREENSHOT = "tests/fixtures/render_error.png"
```

### Manual Verification

```bash
# 1. Start Shotcut VM
python conductor/tracks/shotcut-on-the-map/boot_VM_via_ws.py

# 2. Start VisualPerceptionAgent
python systems/visual_shell/swarm/visual_perception/visual_perception_agent.py --id perception-001

# 3. Send MONITOR_RENDER request
# 4. Trigger render in Shotcut
# 5. Verify RENDER_COMPLETE broadcast received
```

## Success Criteria

- [ ] `MONITOR_RENDER` starts background monitoring task
- [ ] Screenshots captured every 5 seconds
- [ ] "100%" or "Complete" text detected via OCR
- [ ] `RENDER_COMPLETE` broadcast to swarm
- [ ] `STOP_MONITOR` cleanly stops monitoring
- [ ] All unit and integration tests passing
