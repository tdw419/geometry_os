---
spec: directive-control-surface
phase: research
created: 2026-02-21T17:00:00Z
---

# Research: Directive Control Surface

## Executive Summary

**Feasibility: HIGH** - Direct pattern reuse from existing `evolution_ctl.sh`.

The Directive Control Surface creates a production-ready daemon management interface for the DirectiveAgent, following established patterns from the Evolution Daemon control system.

## Existing Patterns Found

### 1. evolution_ctl.sh Pattern

**Location:** `systems/visual_shell/swarm/evolution/evolution_ctl.sh`

**Key Features:**
- `start|stop|status|tail|report|restart|dry-run` commands
- PID file management for process tracking
- Heartbeat file for runtime status
- Log file in dedicated directory
- Graceful shutdown with SIGTERM → SIGKILL fallback
- Color-coded output for readability

**Reusable Components:**
- `check_daemon_running()` - PID validation
- `wait_for_shutdown()` - Graceful stop logic
- `cmd_status()` - Heartbeat display with Python JSON parsing

### 2. DirectiveAgent Current State

**Location:** `systems/intelligence/directive_agent.py`

**Existing Features:**
- `run_forever()` - Continuous polling loop
- `process_one_cycle()` - Single execution pass
- `main()` - Entry point with basic logging

**Gaps Identified:**
- No heartbeat file writing
- No CLI argument parsing
- No daemon control script

### 3. Heartbeat Pattern (Evolution Daemon)

**Structure:**
```json
{
  "timestamp": "2026-02-21T12:00:00Z",
  "pid": 12345,
  "running": true,
  "uptime_seconds": 3600,
  "directives_processed": 42
}
```

## Technical Analysis

### Required Changes

| Component | Change | Complexity |
|-----------|--------|------------|
| DirectiveAgent | Add heartbeat support | Low |
| DirectiveAgent | Add CLI arguments | Low |
| New file | directive_ctl.sh | Low (copy pattern) |
| Tests | Heartbeat tests | Low |
| Tests | Control script tests | Low |
| Docs | README update | Low |

### Dependencies

- `argparse` - Standard library (available)
- `json` - Standard library (available)
- `pathlib` - Standard library (available)
- `requests` - Already used by DirectiveAgent

### Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Pattern mismatch | Low | Low | Direct copy from evolution_ctl.sh |
| WordPress not running | Medium | Low | Graceful error handling exists |
| Log directory missing | Low | Low | mkdir -p in control script |

## Recommendations

1. **Follow evolution_ctl.sh pattern exactly** - Proven production code
2. **Minimal DirectiveAgent changes** - Only add heartbeat + CLI
3. **Reuse test patterns** - Heartbeat tests follow existing test style
4. **Single commit per task** - Clean git history

## Estimated Effort

| Phase | Tasks | Time |
|-------|-------|------|
| POC (Heartbeat + CLI + Script) | 3 | 30 min |
| Testing | 2 | 20 min |
| Documentation | 1 | 10 min |
| Quality Gate | 1 | 10 min |
| **Total** | **7** | **~70 min** |

## Conclusion

This is a straightforward implementation with high confidence. The pattern is proven, the codebase is ready, and the changes are minimal.
