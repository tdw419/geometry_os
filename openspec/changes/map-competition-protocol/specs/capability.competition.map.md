# Capability Specification: Map Competition Protocol

**Spec ID:** `capability.competition.map`  
**Version:** 1.0.0  
**Status:** PROPOSED  

---

## Overview

The Map Competition Protocol enables Darwinian selection among map renderers, where the program controlling the largest territory becomes the substrate for all other applications.

---

## Capability Definition

```yaml
capability:
  name: map_competition
  version: "1.0.0"
  description: "Competitive territory-based renderer selection"
  
  provides:
    - arbiter_service          # Manages competition cycles
    - territory_scoring        # Calculates contender scores
    - coronation_events        # Substrate transitions
    - contender_registration   # Dynamic renderer enrollment
    
  requires:
    - neural_evolution_daemon  # For generating new contenders
    - visual_cortex           # For compositing outputs
    - websocket_server        # For real-time communication
```

---

## API Endpoints

### Arbiter Service

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/arbiter/register` | POST | Register a new contender |
| `/api/arbiter/claim` | POST | Claim territory region |
| `/api/arbiter/report` | POST | Submit render metrics |
| `/api/arbiter/leaderboard` | GET | Current standings |
| `/api/arbiter/history` | GET | Coronation history |
| `ws://localhost:9900/arbiter` | WS | Real-time competition feed |

### Contender Protocol

```typescript
// A contender MUST implement these WebSocket handlers:
interface ContenderProtocol {
  // Receive render region assignment
  on_region_assigned(region: Region): void;
  
  // Receive camera/viewport updates
  on_viewport_update(viewport: Viewport): void;
  
  // Submit frame completed notification
  emit_frame_complete(metrics: RenderMetrics): void;
  
  // Handle coronation (becoming/losing substrate role)
  on_role_change(role: "substrate" | "application"): void;
}
```

---

## Territory Scoring Formula

```
SCORE = AREA × QUALITY × FPS_FACTOR × STABILITY × INFINITY_BONUS

Where:
  AREA          = Total pixels currently rendered
  QUALITY       = Render quality score (0.0 - 1.0)
  FPS_FACTOR    = actual_fps / 60.0, capped at 1.5
  STABILITY     = 1.0 + (0.5 × consistency_over_time)
  INFINITY_BONUS = 2.0 if can_render_arbitrary_coords else 1.0
```

---

## State Machine

```
                    ┌──────────────────┐
                    │    UNREGISTERED  │
                    └────────┬─────────┘
                             │ register()
                             ▼
                    ┌──────────────────┐
                    │    REGISTERED    │◄─────────────────┐
                    └────────┬─────────┘                  │
                             │ claim()                    │
                             ▼                            │
                    ┌──────────────────┐                  │
                 ┌──│    COMPETING     │──┐               │
                 │  └──────────────────┘  │               │
      crowned()  │                        │ dethroned()   │
                 ▼                        ▼               │
        ┌──────────────────┐    ┌──────────────────┐      │
        │    SUBSTRATE     │    │   APPLICATION    │──────┘
        └──────────────────┘    └──────────────────┘
                 │                        ▲
                 │      dethroned()       │
                 └────────────────────────┘
```

---

## Events

```typescript
// Arbiter broadcasts these events
type ArbiterEvent =
  | { type: "contender_registered"; contender_id: string; }
  | { type: "territory_claimed"; contender_id: string; region: Region; }
  | { type: "score_updated"; leaderboard: LeaderboardEntry[]; }
  | { type: "coronation_pending"; new_leader: string; countdown_seconds: number; }
  | { type: "coronation_complete"; new_substrate: string; old_substrate: string; }
  | { type: "contender_crashed"; contender_id: string; };
```

---

## Resource Limits

| Resource | Limit | Enforcement |
|----------|-------|-------------|
| GPU Memory per Contender | 512 MB | Contender terminated if exceeded |
| Max Concurrent Contenders | 8 | Registration blocked |
| Minimum Tenure (Substrate) | 60 seconds | Cannot be dethroned immediately |
| Max Territory Claim | 100% of viewport | Automatic cap |
| Report Frequency | 1 per frame | Rate limited |

---

## Integration Points

### Neural Evolution Daemon

```python
# Arbiter → Evolution: Winning pattern analysis
await evolution.analyze_winner(contender_id, render_strategy)

# Evolution → Arbiter: Spawn mutated contender
await arbiter.register(evolved_contender_config)
```

### Visual Cortex

```python
# Arbiter → Visual Cortex: Composite frame layers
await visual_cortex.set_layer_order(contender_rankings)

# Visual Cortex → Arbiter: Frame timing metrics
await arbiter.report_composite_timing(frame_metrics)
```

### Synaptic Bridge

```python
# User input → All contenders (broadcast)
for contender in active_contenders:
    await contender.broadcast_input(event)
```

---

## Testing Requirements

| Test | Description | Pass Criteria |
|------|-------------|---------------|
| Registration | Contender joins competition | Appears in leaderboard |
| Territory Claim | Contender claims region | Region rendered |
| Score Calculation | Metrics affect score | Score updates within 1s |
| Coronation | New leader crowned | Smooth transition |
| Crash Recovery | Contender fails | Territory redistributed |
| Evolution Spawn | New contender generated | Joins competition automatically |

---

## Security Considerations

1. **Sandboxing**: Contenders run in isolated contexts (separate processes/workers)
2. **Resource Caps**: Hard limits prevent any contender from monopolizing GPU
3. **Capability Permissions**: Substrate role grants additional permissions gradually
4. **Audit Logging**: All coronation events are logged and verifiable
5. **Rollback**: If new substrate fails, immediate fallback to previous

---

## Future Extensions

- **Multi-Region Competition**: Different regions can have different substrates
- **Federation**: Multiple arbiter instances across machines
- **Betting System**: Users can stake tokens on contender outcomes
- **DNA Export**: Winning strategies can be exported/imported
