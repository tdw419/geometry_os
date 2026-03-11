# Glass Box Introspection Interface - Design Document

> **Status:** Approved
> **Date:** 2026-02-19
> **Component:** Neural City / Visual Shell

## Overview

The Glass Box is a street-level introspection interface for Neural City. When a user clicks on a building (agent), a semi-transparent overlay panel slides in from the right, revealing the agent's internal state and providing control actions.

## Morphological Contract

### Interaction Paradigm
- **Click In:** Click on building → Overlay panel slides in, building highlighted
- **Click Out:** Click outside overlay or X button → Panel slides out, highlight removed

### Visual Metaphor
The building becomes "glass" - semi-transparent with internal workings visible through the overlay panel.

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     Neural City Canvas                          │
│  ┌─────────────────────────────────────┬──────────────────────┐│
│  │                                     │  ┌────────────────┐  ││
│  │    City View (clickable buildings)  │  │ GLASS BOX      │  ││
│  │                                     │  │ ┌────────────┐ │  ││
│  │    [Building selected] ───────────▶ │  │ │Thought     │ │  ││
│  │    ○ Highlighted building           │  │ │Stream      │ │  ││
│  │    ○ Other buildings dimmed         │  │ ├────────────┤ │  ││
│  │                                     │  │ │Intent Map  │ │  ││
│  │                                     │  │ ├────────────┤ │  ││
│  │                                     │  │ │Metabolic   │ │  ││
│  │                                     │  │ │Pulse       │ │  ││
│  │                                     │  │ ├────────────┤ │  ││
│  │                                     │  │ │Comm Log    │ │  ││
│  │                                     │  │ ├────────────┤ │  ││
│  │                                     │  │ │[Controls]  │ │  ││
│  │                                     │  │ └────────────┘ │  ││
│  └─────────────────────────────────────┴──┴────────────────┘  ││
│                                           [Click outside → Close]│
└─────────────────────────────────────────────────────────────────┘
```

## Data Panels

### 1. Thought Stream Panel
Real-time log of agent decisions, inferences, and reasoning.

```
┌─────────────────────────────────────┐
│ 💭 Thought Stream              [Live]│
├─────────────────────────────────────┤
│ 14:32:01 ▸ Analyzing user request... │
│ 14:32:02 ▸ Querying knowledge base   │
│ 14:32:03 ▸ Formulating response      │
│ 14:32:05 ▸ Decision: EXECUTE         │
│                    ▼ scroll for more  │
└─────────────────────────────────────┘
```

- Scrolling log with timestamps
- Color-coded: inference (blue), action (green), error (red)
- "Live" indicator when agent is active

### 2. Intent Map Panel
Current goals and planned trajectory.

```
┌─────────────────────────────────────┐
│ 🎯 Intent Map                       │
├─────────────────────────────────────┤
│ Current Goal:                       │
│   "Optimize rendering pipeline"     │
│                                     │
│ Planned Trajectory:                 │
│   1. ✓ Profile current FPS          │
│   2. ○ Identify bottleneck          │
│   3. ○ Apply WGSL optimization      │
│   4. ○ Verify improvement           │
└─────────────────────────────────────┘
```

- Current goal display
- Step-by-step trajectory with checkmarks
- Progress indicator

### 3. Metabolic Pulse Panel
Real-time metrics for this specific agent.

```
┌─────────────────────────────────────┐
│ 📊 Metabolic Pulse                  │
├─────────────────────────────────────┤
│ IPC:    ████████░░ 0.78             │
│ Memory: ██████░░░░ 248MB / 512MB    │
│ Activity: ████████░░ High            │
│                                     │
│ [═══════════════════] 60s chart     │
└─────────────────────────────────────┘
```

- Progress bars for IPC, Memory, Activity
- Mini time-series chart (last 60 seconds)
- Activity level indicator

### 4. Communication Log Panel
Inbound/outbound agent messages.

```
┌─────────────────────────────────────┐
│ 📡 Communication Log                │
├─────────────────────────────────────┤
│ → agent-hypervisor: memory_request  │
│ ← agent-memory: granted 64MB        │
│ → broadcast: tectonic_complete      │
│ ← agent-cognitive: ack              │
└─────────────────────────────────────┘
```

- Direction indicators (→ outbound, ← inbound)
- Event type + summary
- Timestamp on hover

## Control Actions

```
┌─────────────────────────────────────────────────┐
│ 🎮 Agent Controls                               │
├─────────────────────────────────────────────────┤
│  [📍 Relocate] [🗑️ Evict] [🐛 Debug] [💬 Command]│
└─────────────────────────────────────────────────┘
```

| Action | Behavior | Confirmation |
|--------|----------|--------------|
| **Relocate** | Opens district selector, moves building | Yes |
| **Evict** | Removes agent, building fades out | Yes + type "EVICT" |
| **Debug Dump** | Console.log full agent state | No |
| **Send Command** | Opens text input, sends via telemetry | No |

## Data Source Strategy

**Phase 1: Mock Data**
- Generate realistic agent state for demo
- 4-5 sample agents with varied data
- Simulated thought streams, goals, metrics

**Phase 2: Real Integration**
- WebSocket protocol for agent state queries
- HTTP API fallback for Python agent subsystem
- Event-driven updates via TelemetryBus

## File Structure

```
systems/visual_shell/web/
├── js/
│   ├── GlassBoxOverlay.js      # Main overlay component
│   ├── AgentDataPanel.js       # 4-panel data display
│   └── AgentController.js      # Control action handlers
├── css/
│   └── glass_box.css           # Overlay styling
└── tests/
    ├── test_glass_box_overlay.js
    └── test_agent_data_panel.js
```

## Modifications to Existing Files

| File | Change |
|------|--------|
| `NeuralCityEngine.js` | Add click handler on buildings, dispatch to GlassBoxOverlay |
| `CityOrchestrator.js` | Add `relocateAgent()`, `evictAgent()` methods |
| `neural_city_demo.html` | Import new Glass Box components |
| `TelemetryBus.js` | Add `agent_command` event type |

## Success Criteria

1. **Click Selection:** Clicking a building opens the Glass Box overlay
2. **Data Display:** All 4 panels show agent data correctly
3. **Controls Work:** All 4 actions function with appropriate confirmations
4. **Close Behavior:** Clicking outside closes overlay cleanly
5. **Visual Feedback:** Building highlights and dims appropriately
6. **Performance:** No frame rate drop when overlay is open

## Future Extensions

- **Multi-select:** Shift-click to compare multiple agents
- **Deep Dive Mode:** Full-screen zoom variant
- **Export:** Save agent state to file
- **Time Travel:** Replay historical agent state
