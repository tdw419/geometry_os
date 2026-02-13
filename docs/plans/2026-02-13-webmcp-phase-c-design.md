# WebMCP Bridge Phase C: DevTools MCP Server Integration — Design Document

**Date:** 2026-02-13
**Phase:** Phase C: DevTools MCP Integration
**Status:** Design Approved
**Depends On:** Phase A + B (8 WebMCP tools)

---

## Overview

Phase C integrates Chrome DevTools Protocol (CDP) as an MCP server, enabling AI coding assistants to debug and verify Geometry OS Visual Shell in real-time. This enables "TDD for AI" on the PixiJS render loop.

**Paradigm:** "The AI can see what the user sees, and debug what the user debugs."

---

## Architecture

```
┌──────────────────────────────────────────────────────────────────────┐
│                    AI Coding Assistant (Claude, etc.)                │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │  MCP Client                                                  │   │
│  │  • Calls WebMCP tools (navigate_map, get_os_state, etc.)    │   │
│  │  • Calls DevTools MCP tools (screenshot, console, DOM)      │   │
│  └───────────────────────────┬──────────────────────────────────┘   │
│                              │                                       │
└──────────────────────────────┼───────────────────────────────────────┘
                               │ MCP Protocol
        ┌──────────────────────┼──────────────────────┐
        ▼                      ▼                      ▼
┌───────────────┐    ┌─────────────────┐    ┌─────────────────┐
│ WebMCP        │    │ chrome-devtools │    │ Other MCP       │
│ (In-Browser)  │    │ -mcp            │    │ Servers         │
│ 8 tools       │    │ (Node.js)       │    │ (filesystem,    │
│               │    │                 │    │  git, etc.)     │
└───────┬───────┘    └────────┬────────┘    └─────────────────┘
        │                     │
        │                     │ CDP (WebSocket)
        ▼                     ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    Chrome 146+ Browser                               │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │  Visual Shell (index.html)                                   │   │
│  │  • PixiJS v8 WebGPU Renderer                                 │   │
│  │  • WebMCP Bridge (8 tools)                                   │   │
│  │  • Infinite Map, Pixel CPU, Evolution Engine                 │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                                                                      │
│  Remote Debugging: localhost:9222                                     │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Components

### 1. chrome-devtools-mcp

Node.js MCP server that provides CDP access:

**Installation:**
```bash
npm install --save-dev @anthropic-ai/chrome-devtools-mcp
```

**Capabilities:**
- `browser_screenshot` - Capture page screenshots
- `browser_click` - Click elements
- `browser_type` - Type text
- `browser_evaluate` - Execute JavaScript
- `browser_get_console` - Read console logs
- `browser_get_network` - Monitor network requests
- `browser_get_performance` - Performance metrics

### 2. MCP Configuration (`.mcp/config.json`)

```json
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/chrome-devtools-mcp"],
      "env": {
        "CHROME_PATH": "/usr/bin/google-chrome",
        "CHROME_REMOTE_DEBUGGING_PORT": "9222",
        "CHROME_START_URL": "http://localhost:8000/systems/visual_shell/web/index.html"
      }
    }
  },
  "geometryOS": {
    "description": "MCP configuration for Geometry OS Visual Shell debugging",
    "webmcpTools": [
      "navigate_map",
      "get_os_state",
      "execute_pixel_program",
      "load_rts_cartridge",
      "query_hilbert_address",
      "trigger_evolution",
      "send_llm_prompt",
      "spawn_area_agent"
    ],
    "devtoolsCapabilities": [
      "screenshot",
      "console_logs",
      "dom_inspection",
      "network_monitoring",
      "performance_metrics",
      "gpu_state"
    ]
  }
}
```

### 3. Chrome Debug Launcher (`debug_chrome.sh`)

Launches Chrome with remote debugging enabled:

```bash
#!/bin/bash
# Usage: ./debug_chrome.sh [--port PORT] [--url URL]

DEBUG_PORT="${1:-9222}"
START_URL="${2:-http://localhost:8000/systems/visual_shell/web/index.html}"
CHROME_BIN="${CHROME_PATH:-google-chrome}"

exec "$CHROME_BIN" \
    --remote-debugging-port="$DEBUG_PORT" \
    --remote-allow-origins='*' \
    --no-first-run \
    --no-default-browser-check \
    --disable-background-networking \
    "$START_URL"
```

---

## Usage Workflow

### Step 1: Launch Chrome with Debugging

```bash
cd systems/visual_shell/web
./debug_chrome.sh
```

### Step 2: Verify DevTools Protocol

Visit `http://localhost:9222/json` to see available targets.

### Step 3: Use MCP Tools

AI assistant can now:

1. **Take Screenshots:**
   ```
   Use browser_screenshot to capture Visual Shell state
   ```

2. **Read Console:**
   ```
   Use browser_get_console to see WebMCP bridge logs
   ```

3. **Inspect DOM:**
   ```
   Use browser_evaluate to query PixiJS stage children
   ```

4. **Verify WebMCP:**
   ```
   Use browser_evaluate: window.webmcpBridge.getStatus()
   ```

---

## Integration with WebMCP Tools

The DevTools MCP complements WebMCP tools:

| Scenario | WebMCP Tool | DevTools MCP Tool |
|----------|-------------|-------------------|
| Navigate map | `navigate_map` | `browser_evaluate` |
| Read OS state | `get_os_state` | `browser_get_console` |
| Debug rendering | - | `browser_screenshot` |
| Inspect GPU | `execute_pixel_program` | `browser_get_performance` |
| Verify cartridge | `load_rts_cartridge` | `browser_screenshot` |

---

## Testing

### Test Page

Open `test_devtools_mcp.html` to verify:

1. Chrome 146+ with remote debugging
2. DevTools Protocol accessible on port 9222
3. MCP server configuration valid
4. WebMCP bridge integration working

### Manual Test

```bash
# Terminal 1: Launch Chrome
./debug_chrome.sh

# Terminal 2: Check DevTools
curl http://localhost:9222/json/version

# Terminal 3: Run test page
python3 -m http.server 8000
# Open http://localhost:8000/systems/visual_shell/web/test_devtools_mcp.html
```

---

## Files Created/Modified

| File | Action | Lines |
|------|--------|-------|
| `package.json` | Modified | +1 |
| `systems/visual_shell/web/.mcp/config.json` | Created | 30 |
| `systems/visual_shell/web/debug_chrome.sh` | Created | 65 |
| `systems/visual_shell/web/test_devtools_mcp.html` | Created | 200 |
| `docs/plans/2026-02-13-webmcp-phase-c-design.md` | Created | 150 |

---

## Success Criteria

1. `@anthropic-ai/chrome-devtools-mcp` installed
2. MCP configuration file created
3. Chrome debug launcher script works
4. DevTools Protocol accessible on port 9222
5. Test page passes all verification tests
6. AI assistant can use DevTools MCP tools alongside WebMCP tools

---

## Future Phases

**Phase D:** Agent2Agent (A2A) protocol for horizontal agent coordination

---

## References

- [chrome-devtools-mcp](https://github.com/anthropics/anthropic-quickstarts/tree/main/mcp-server-chrome)
- [Chrome DevTools Protocol](https://chromedevtools.github.io/devtools-protocol/)
- [MCP Specification](https://modelcontextprotocol.io/)
- Phase A Design: `docs/plans/2026-02-12-webmcp-bridge-design.md`
- Phase B Design: `docs/plans/2026-02-12-webmcp-phase-b-design.md`
