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
