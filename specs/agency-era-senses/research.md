---
spec: agency-era-senses
phase: research
created: 2026-02-23T12:00:00Z
generated: auto
---

# Research: Agency Era Phase 2 - Broad Senses

## Executive Summary

Feasible. Python pathlib + httpx/aiohttp provide robust foundations. Existing GuardianGate pattern provides security model. Mixin approach integrates cleanly with SwarmAgent.

## Codebase Analysis

### Existing Patterns

| Pattern | File | Usage |
|---------|------|-------|
| SwarmAgent base | `systems/swarm/swarm_agent.py` | Mixin-compatible class structure |
| GuardianGate sandbox | `systems/evolution_daemon/safety/guardian_gate.py` | REJECTION_PATTERNS for unsafe code |
| SandboxManager | `systems/evolution_daemon/safety/sandbox_manager.py` | Path validation, timeout handling |
| Sandbox executor | `systems/visual_shell/swarm/sandbox.py` | Async execution with timeout |

### Dependencies

| Dependency | Available | Purpose |
|------------|-----------|---------|
| pathlib | stdlib | Path operations, validation |
| httpx | via aiohttp | Async HTTP client |
| asyncio | stdlib | Timeout, async execution |
| logging | stdlib | Debug/error tracking |

### Constraints

1. **No arbitrary command execution** - GuardianGate blocks exec(), eval(), subprocess
2. **Path sandboxing** - Only whitelisted directories accessible
3. **Rate limiting** - Web requests must be bounded
4. **Timeout enforcement** - All operations must have timeouts

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Standard patterns, existing infrastructure |
| Effort Estimate | S | 2 classes + tests, ~200 LOC |
| Risk Level | Low | No novel code, proven patterns |

## Recommendations

1. Use mixin pattern - `class EngineerAgent(SwarmAgent, FilesystemSense, WebSense)`
2. Borrow GuardianGate's REJECTION_PATTERNS for path validation
3. Use asyncio.timeout for all I/O operations
4. Config-driven allowed_paths list
