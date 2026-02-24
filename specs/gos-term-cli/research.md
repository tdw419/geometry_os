---
spec: gos-term-cli
phase: research
created: 2026-02-23T00:00:00Z
---

# Research: gos-term-cli

## Executive Summary

Comprehensive plan exists at `docs/plans/2026-02-23-gos-term-cli.md` with 5 well-defined tasks. Infrastructure is production-ready: Terminal WebSocket Bridge (port 8769), NEBBus with pub/sub, and existing integration patterns. Research confirms plan is feasible with minor additions: exit code handling, environment variable support, and session reconnection.

## External Research

### Best Practices

| Source | Finding |
|--------|---------|
| [websockets library docs](https://websockets.readthedocs.io/) | Use `async with websockets.connect()` context manager for automatic cleanup |
| [Python CLI best practices](https://clig.dev/) | Support `--help`, `--version`, exit codes 0/1/2, respect `--` end-of-options |
| [PTY handling](https://docs.python.org/3/library/pty.html) | Use `select.select()` for non-blocking reads, handle `OSError` for EOF |

### Prior Art

- **xterm.js + WebSocket**: Standard pattern in WordPress Web Terminal spec (complete)
- **Python websockets CLI**: Similar to `wscat` but Python-native
- **NEB integration pattern**: NEBBridge already bridges NEB events to VisualBridge

### Pitfalls to Avoid

1. **Raw mode cleanup** - Always restore `termios` settings in `finally` block (plan handles this)
2. **Buffer overrun** - Use timeout on WebSocket recv to prevent hanging
3. **Zombie sessions** - Cleanup loop already implemented in TerminalWebSocketBridge
4. **Missing dependencies** - Plan imports `websockets` but should check `ImportError`

## Codebase Analysis

### Existing Infrastructure

| Component | Status | Location |
|-----------|--------|----------|
| Terminal WebSocket Bridge | Production-ready | `systems/visual_shell/api/terminal_websocket_bridge.py` |
| NEBBus | Production-ready | `systems/swarm/neb_bus.py` |
| NEBBridge | Production-ready | `systems/visual_shell/api/neb_bridge.py` |
| Terminal NEB Integration | Tested | `systems/visual_shell/api/tests/test_terminal_neb_integration.py` |
| Visual Bridge | Production-ready | `systems/visual_shell/api/visual_bridge.py` |

### Terminal WebSocket Protocol

```
WebSocket: ws://localhost:8769/terminal?token=<session_id>

Client -> Server:
  {"type": "resize", "cols": 120, "rows": 36}
  {"type": "input", "data": "ls -la\n"}

Server -> Client:
  {"type": "output", "data": "terminal output..."}
  {"type": "exit", "code": 0}  # Not yet implemented!
```

### NEB Event Topics (existing)

```
terminal.session.created  - Published on session create
terminal.session.deleted  - Published on session delete
terminal.input            - Published on user input
terminal.output           - Published on PTY output
gos.term.command          - NEW: CLI should publish this
```

### Constraints

1. **Port 8769** - Terminal WebSocket Bridge default, configurable via `-p`
2. **No exit code** - Current bridge doesn't send `{"type": "exit"}` message
3. **Session affinity** - Sessions auto-created if no token provided
4. **Unicode handling** - Bridge uses UTF-8 with error replacement

## Related Specs

| Spec | Relevance | May Need Update |
|------|-----------|-----------------|
| wordpress-web-terminal | Same terminal infrastructure, xterm.js patterns | No |
| web-terminal-cicd | CI testing for terminal components | Yes - add gos-term CLI tests |
| terminal-clone-pixelrts | Rust PTY, terminal rendering | No |

## Gap Analysis

### Missing from Plan

| Gap | Recommendation | Priority |
|-----|----------------|----------|
| Exit code propagation | Add `{"type": "exit", "code": N}` handling | High |
| `--version` flag | Add to argument parser | Medium |
| Environment variables | Add `-e KEY=VALUE` support | Medium |
| Session reconnection | Add `--session ID` flag | Low |
| Output truncation | NEB already truncates to 1000 chars | N/A |

### Proposed Additions

```python
# Add to argument parser
parser.add_argument('--version', action='version', version='gos-term 1.0.0')
parser.add_argument('-e', '--env', action='append', help='Set env var KEY=VALUE')
parser.add_argument('--session', help='Reconnect to existing session')
```

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | All infrastructure exists and tested |
| Effort Estimate | S | 5 tasks, ~2-3 hours total |
| Risk Level | Low | Well-defined interfaces, existing patterns |

## Quality Commands

| Type | Command | Source |
|------|---------|--------|
| Python Tests | `PYTHONPATH=. pytest systems/visual_shell/api/tests/ -v` | Project convention |
| Test Single File | `PYTHONPATH=. pytest systems/visual_shell/api/tests/test_gos_term_cli.py -v` | Plan specifies |
| Shell Wrapper Test | `bash systems/visual_shell/api/tests/test_gos_term_wrapper.sh` | Plan specifies |

## Recommendations for Requirements

1. **Implement plan as-is** - 5 tasks are well-defined with TDD approach
2. **Add `--version` flag** - Standard CLI convention, minimal effort
3. **Add exit code detection** - Parse prompt or detect shell exit for proper return codes
4. **Document NEB topics** - Add `gos.term.command` topic to NEBBus documentation
5. **Add integration test** - Test full flow: CLI -> WebSocket -> PTY -> Output

## Open Questions

1. Should CLI support multiple commands in sequence? (e.g., `gos-term "cd /tmp && ls"`)
2. Should `-e` environment vars override or append to existing env?
3. Should interactive mode publish all input/output to NEB or only with `--neb`?

## Sources

- `docs/plans/2026-02-23-gos-term-cli.md` - Complete implementation plan
- `systems/visual_shell/api/terminal_websocket_bridge.py` - WebSocket protocol
- `systems/visual_shell/api/neb_bridge.py` - NEB integration pattern
- `systems/swarm/neb_bus.py` - NEBBus API
- `specs/wordpress-web-terminal/.progress.md` - Related terminal work
- `specs/web-terminal-cicd/.progress.md` - CI patterns
