---
spec: evolution-daemon-wordpress-gui
phase: research
created: 2026-02-21T11:32:00Z
generated: auto
---

# Research: Evolution Daemon WordPress GUI Integration

## Executive Summary

Connecting Evolution Daemon to WordPress GUI via Playwright bridge. High feasibility - all prerequisites exist: V11+ safety pipeline, Visual Bridge (port 8768), WordPress Memory Provider, Playwright bridge at (3200, 1200).

## Codebase Analysis

### Existing Patterns

| Component | File | Pattern |
|-----------|------|---------|
| WebSocket Bridge | `systems/visual_shell/api/visual_bridge.py` | Async WebSocket hub on port 8768 |
| Evolution Agent | `systems/evolution_daemon/evolution_daemon.py` | Async cycle-based daemon with safety pipeline |
| Content Analysis | `systems/evolution_daemon/safety/guardian_gate.py` | Proposal validation via GuardianGate |
| Memory Sync | `systems/neural_city/synaptic_query_engine.py` | SynapticQueryEngine for semantic search |
| WebMCP Bridge | `systems/visual_shell/api/evolution_webmcp_bridge.py` | WordPress REST API integration |

### Dependencies

- `websockets` - Already used in visual_bridge.py
- `requests` - For WordPress REST API calls
- `pytest` + `pytest-asyncio` - Test framework
- `ai-publisher.php` - WordPress endpoint at localhost:8080

### Constraints

1. WordPress GUI runs at (3200, 1200) tile coordinates
2. Playwright bridge must be running for GUI actions
3. Visual Bridge (port 8768) required for memory sync
4. Safety pipeline (V11+) must approve all changes
5. WordPress REST API requires authentication (ai-publisher.php)

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | All components exist, just need wiring |
| Effort Estimate | M | 7 tasks, each ~1-2 hours |
| Risk Level | Low | Safety pipeline protects against bad changes |

## Architecture Components

### ContentAnalyzer
- Analyze WordPress posts for improvement opportunities
- Calculate readability, word count, structure metrics
- Generate ImprovementProposal with confidence scores

### EvolutionAgent
- Run evolution cycles on WordPress content
- Fetch posts via ai-publisher.php REST endpoint
- Filter proposals by confidence threshold

### ActionExecutor
- Execute approved proposals via Playwright bridge
- Navigate to post edit pages, update content, publish
- WebSocket communication with visual_bridge.py

### BridgeService
- Coordinate all components
- Cycle-based execution with configurable interval
- Trigger memory sync after improvements

## Recommendations

1. Start with report-only mode (--auto-execute=false) for safety
2. Use min_confidence=0.6 to filter weak proposals
3. Wire into existing VisualBridge (port 8768) for memory sync
4. Reuse GuardianGate for proposal validation before execution
5. Create CLI entry point for easy daemon management
