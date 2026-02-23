---
spec: wordpress-web-terminal
phase: research
created: 2026-02-22T12:00:00Z
generated: auto
---

# Research: WordPress Web Terminal

## Executive Summary

Feasibility: **High**. All infrastructure components exist: Visual Bridge (WebSocket hub), TerminalVatBridge (PTY spawning), and a reference WordPress plugin (ASCII Desktop Control) with established patterns. Implementation requires extending existing systems, not building from scratch.

## Codebase Analysis

### Existing Patterns

| Component | File | Pattern |
|-----------|------|---------|
| WebSocket Hub | `systems/visual_shell/api/visual_bridge.py` | Async WebSocket on port 8768, HTTP API on 8769 |
| PTY Spawning | `systems/visual_shell/api/terminal_vat_bridge.py` | Rust API (4445) + Python bridge, VAT integration |
| WordPress Plugin | `wordpress_zone/.../ascii-desktop-control/` | Class-based, AJAX handlers, REST API, admin pages |
| Session Auth | `visual_bridge.py:161-192` | Token-based agent task queue |

### Dependencies

| Dependency | Purpose | Status |
|------------|---------|--------|
| xterm.js (v5.3.0) | Terminal emulator | CDN available |
| xterm-addon-fit | Auto-resize | CDN available |
| websockets (Python) | Server-side WS | Installed |
| aiohttp | HTTP endpoints | Installed |
| pty/termios (Python stdlib) | PTY handling | Available |

### Constraints

1. **Visual Bridge must run**: Terminal requires WebSocket connection to port 8768
2. **Admin-only access**: WordPress `manage_options` capability required
3. **PTY process isolation**: Each session spawns independent shell process
4. **Single-server deployment**: WebSocket and WordPress must share network

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | All components exist, proven patterns |
| Effort Estimate | M | 6 tasks, ~4-6 hours total |
| Risk Level | Low | Isolated plugin, no core modifications |

## Recommendations

1. **Extend Visual Bridge minimally**: Add terminal-specific message handlers without touching existing functionality
2. **Follow ASCII Desktop Control pattern**: Class-based plugin with AJAX/REST handlers
3. **Use CDN for xterm.js**: Avoid bundling, ensures latest security patches
4. **Implement PTY via Python stdlib**: Use `pty.openpty()` + `os.fork()` for simplicity (no Rust dependency for basic PTY)
