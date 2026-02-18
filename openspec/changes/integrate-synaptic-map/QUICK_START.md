# Synaptic Map - Quick Start Guide

## Overview
The **Synaptic Map** is an LLM-powered semantic navigation layer for Geometry OS. It translates natural language into geometric transformations, enabling intuitive interaction with the visual substrate.

## Architecture Components

### 1. Intent Layer
- **Purpose**: Capture user natural language input
- **Location**: `systems/infinite_map_rs/src/synapse/intent.rs`
- **Key Types**:
  - `Intent`: User input with timestamp and confidence
  - `IntentOverlay`: UI state for text input

### 2. Morphology Commands
- **Purpose**: Define geometric transformation language
- **Location**: `systems/infinite_map_rs/src/synapse/morphology.rs`
- **Available Commands**:
  ```rust
  Navigate { x, y, z, duration }
  AdjustAesthetics { chaos, temperature, saturation }
  CreateBrick { x, y, z, description }
  Highlight { center, radius, color, duration }
  CameraControl { fov, target, distance }
  SpawnEffect { effect, position, scale }
  Query { query_type, target }
  ```

### 3. Daemon Bridge
- **Purpose**: Communicate with LM Studio for intent interpretation
- **Location**: `systems/infinite_map_rs/src/synapse/daemon_bridge.rs`
- **API Endpoint**: `http://localhost:1234/v1/chat/completions`

## Usage Examples

### Example 1: Navigate to Coordinates
**User Input**: "Take me to the memory tower at 100, 0, 200"

**LLM Response**:
```json
{
  "commands": [
    {
      "type": "Navigate",
      "params": {"x": 100.0, "y": 0.0, "z": 200.0, "duration": 2.0}
    }
  ],
  "confidence": 0.92
}
```

### Example 2: Adjust Visual Aesthetics
**User Input**: "Make it more chaotic and warmer"

**LLM Response**:
```json
{
  "commands": [
    {
      "type": "AdjustAesthetics",
      "params": {
        "chaos": 0.8,
        "temperature": 0.5,
        "saturation": null
      }
    }
  ],
  "confidence": 0.85
}
```

### Example 3: Create New Content
**User Input**: "Create a glowing pyramid here"

**LLM Response**:
```json
{
  "commands": [
    {
      "type": "CreateBrick",
      "params": {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "description": "glowing pyramid structure"
      }
    }
  ],
  "confidence": 0.78
}
```

### Example 4: Highlight Region
**User Input**: "Highlight the area around the neural cluster"

**LLM Response**:
```json
{
  "commands": [
    {
      "type": "Highlight",
      "params": {
        "center": [150.0, 0.0, 150.0],
        "radius": 75.0,
        "color": [0.0, 1.0, 1.0, 0.4],
        "duration": 5.0
      }
    }
  ],
  "confidence": 0.80
}
```

## Integration Checklist

### Prerequisites
- [ ] LM Studio running on `http://localhost:1234`
- [ ] Model loaded in LM Studio (e.g., `llama-3.2-3b-instruct`)
- [ ] `reqwest` dependency added to `Cargo.toml`

### Phase 1: Core Infrastructure ✅
- [x] Synapse module created
- [x] Intent types defined
- [x] Morphology commands implemented
- [x] Daemon bridge functional
- [x] Visual command bridge extended

### Phase 2: UI Integration (TODO)
- [ ] Add `SynapticMap` to `InfiniteMapApp`
- [ ] Implement keyboard binding (`Space + /`)
- [ ] Render intent overlay as GPU texture
- [ ] Connect input to `process_intent()`

### Phase 3: Execution Pipeline (TODO)
- [ ] Wire `MorphologyExecutor` to camera controller
- [ ] Connect to renderer for aesthetic adjustments
- [ ] Implement brick generation
- [ ] Build effect system

## Testing

### Test LM Studio Connection
```bash
curl http://localhost:1234/v1/models
```

### Test Command Parsing (Manual)
```rust
use crate::synapse::daemon_bridge::CognitiveDaemonBridge;

let bridge = CognitiveDaemonBridge::new("http://localhost:1234".to_string());
let intent = Intent::new("Navigate to 100, 0, 200".to_string());
let commands = bridge.interpret_intent(&intent).await?;
```

### Verify Build
```bash
cd systems/infinite_map_rs
cargo check
```

## LLM System Prompt

The daemon uses this system prompt to guide LLM responses:

```
You are the Cognitive Daemon for Geometry OS, a visual computing substrate.

Your role is to interpret natural language user intent and translate it into 
geometric morphology commands.

Available command types:
- Navigate: Move camera to coordinates
- AdjustAesthetics: Modify visual parameters (chaos, temperature, saturation)
- CreateBrick: Generate new visual content
- Highlight: Draw attention to regions
- CameraControl: Adjust camera parameters
- SpawnEffect: Create visual effects
- Query: Retrieve information

Respond ONLY with valid JSON in this format:
{
  "commands": [
    {
      "type": "Navigate",
      "params": {"x": 0.0, "y": 0.0, "z": 0.0, "duration": 1.0}
    }
  ],
  "confidence": 0.85,
  "reasoning": "Brief explanation"
}

Be precise, creative, and maintain geometric integrity.
```

## Troubleshooting

### LM Studio Connection Failed
- Verify LM Studio is running: `curl http://localhost:1234/v1/models`
- Check firewall settings
- Ensure model is loaded in LM Studio UI

### Invalid JSON Response
- Check LM Studio logs for parsing errors
- Verify system prompt is correctly set
- Try adjusting temperature (lower = more structured)

### Commands Not Executing
- Verify `MorphologyExecutor` is wired to substrate
- Check logs for execution errors
- Ensure camera/renderer references are valid

## Performance Considerations

### Latency
- LLM calls: 100ms-2s (async, non-blocking)
- Command parsing: <1ms
- Execution: Varies by command type

### Memory Overhead
- Intent history: ~100 entries max
- Command history: ~100 entries max
- Total: <1MB RAM

### VRAM Impact
- Current: 0 (no GPU resources)
- Phase 2 (overlay): ~4MB for text rendering

## Next Steps

1. **Implement Intent Overlay UI** (Phase 2)
2. **Wire Executor to Substrate** (Phase 3)
3. **Add Voice Input** (Future: Whisper integration)
4. **Implement Command Batching** (Optimization)
5. **Add Gesture Recognition** (Multimodal input)

---

**Status**: Core infrastructure complete. Ready for UI integration.
