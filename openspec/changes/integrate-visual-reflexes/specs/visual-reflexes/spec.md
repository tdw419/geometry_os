# Spec: Visual Reflex Protocol

## ADDED

### Message: `REFLEX_ACTION`
Sent from Server -> Client when the Neural Cortex triggers a reflex.

```json
{
  "type": "REFLEX_ACTION",
  "payload": {
    "reflex_type": "audio_pulse",  // or "input_focus", "void_stare", "startle"
    "intensity": 0.85,            // 0.0 to 1.0
    "vector": [0.1, 0.2, ...],    // Optional: Full neural vector
    "timestamp": 123456789.0
  }
}
```

### Message: `SENSORY_UPDATE`
Continuous stream (optional, for debugging) of raw sensory data.

```json
{
  "type": "SENSORY_UPDATE",
  "payload": {
    "audio": { "bass": 0.5, "volume": 0.2 },
    "input": { "velocity": 12.0, "focus": true }
  }
}
```
