# Phase N: AI-Assisted IDE Tools - Design Document

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable AI agents to autonomously write, test, debug, and deploy code through WebMCP tools.

**Architecture:** Hybrid runtime - browser for WGSL/JS/tests, WebSocket bridge for Python/debug. Four focused tools that leverage existing builder infrastructure.

**Tech Stack:** WebMCP, WASM, WGSL shaders, WebSocket bridge, PixiJS

---

## Overview

Phase N adds 4 WebMCP tools for AI-assisted development:

| # | Tool | Runtime | Purpose |
|---|------|---------|---------|
| 36 | `ide_compile` | Hybrid | Compile WGSL (browser) or Python (bridge) |
| 37 | `ide_test` | Browser | Run tests, capture results as JSON |
| 38 | `ide_debug` | Bridge | Set breakpoints, step, inspect variables |
| 39 | `ide_deploy` | Browser | Assemble .rts.png and place on map |

## Tool Interfaces

### ide_compile

```javascript
// Input
{
  source: string,      // Code to compile
  language: "wgsl" | "python" | "javascript",
  options?: {
    optimize: boolean,
    target?: string    // e.g., "webgpu", "native"
  }
}

// Output
{
  success: boolean,
  errors: [{ line, column, message }],
  warnings: [{ line, column, message }],
  output?: {
    bytecode?: string,  // For WGSL
    ast?: object        // For analysis
  }
}
```

### ide_test

```javascript
// Input
{
  test_type: "pytest" | "mocha" | "custom",
  test_file?: string,   // Specific file or
  test_pattern?: string, // Glob pattern
  working_dir?: string
}

// Output
{
  success: boolean,
  total: number,
  passed: number,
  failed: number,
  results: [{
    name: string,
    status: "pass" | "fail" | "skip",
    duration_ms: number,
    error?: string
  }]
}
```

### ide_debug

```javascript
// Input
{
  action: "set_breakpoint" | "remove_breakpoint" | "step" | "continue" | "inspect",
  breakpoint?: { file, line },
  variable?: string  // For inspect action
}

// Output
{
  success: boolean,
  state?: {
    paused: boolean,
    file?: string,
    line?: number,
    variables?: { name: value },
    call_stack?: string[]
  }
}
```

### ide_deploy

```javascript
// Input
{
  source_region: { x, y, width, height },  // Map region
  name: string,
  description?: string,
  entry_point?: string
}

// Output
{
  success: boolean,
  cartridge: {
    path: string,        // .rts.png path
    hash: string,        // SHA256
    size_bytes: number
  },
  location: { x, y }     // Where placed on map
}
```

## Hybrid Runtime Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    WebMCP Bridge                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              ide_compile handler                     │   │
│  │  ┌─────────────┐    ┌──────────────┐                │   │
│  │  │ language?   │    │              │                │   │
│  │  │ wgsl/js     │───▶│ Browser WASM │                │   │
│  │  │ python      │───▶│ WebSocket    │──▶ Python Srv  │   │
│  │  └─────────────┘    └──────────────┘                │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              ide_test handler                        │   │
│  │  • Runs in browser via WASM test runners            │   │
│  │  • Returns structured JSON results                   │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              ide_debug handler                       │   │
│  │  • Requires WebSocket connection to debug server     │   │
│  │  • Falls back to mock mode if unavailable           │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              ide_deploy handler                      │   │
│  │  • Uses existing builder_assemble_cartridge         │   │
│  │  • Calls builder_place_tile to position on map      │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

### Runtime Matrix

| Tool | WGSL | JavaScript | Python | Fallback |
|------|------|------------|--------|----------|
| `ide_compile` | ✅ Browser | ✅ Browser | ⚠️ Bridge | Return error |
| `ide_test` | ✅ Mock | ✅ WASM | ⚠️ Bridge | Mock results |
| `ide_debug` | ❌ | ❌ | ⚠️ Bridge Only | Mock state |
| `ide_deploy` | ✅ Browser | ✅ Browser | ✅ Browser | N/A |

## Files

| File | Action | Description |
|------|--------|-------------|
| `systems/visual_shell/web/ide_tools.js` | Create | ES module with IDETools class |
| `systems/visual_shell/web/webmcp_bridge.js` | Modify | Add 4 tool registrations |
| `systems/visual_shell/web/test_ide_tools.html` | Create | 12 automated browser tests |

## Testing Strategy

### Test Page: test_ide_tools.html

**12 Automated Tests:**

| # | Tool | Test Case |
|---|------|-----------|
| 1 | `ide_compile` | WGSL compiles successfully |
| 2 | `ide_compile` | Invalid WGSL returns errors |
| 3 | `ide_compile` | JavaScript compiles |
| 4 | `ide_compile` | Python requires bridge (fallback) |
| 5 | `ide_test` | Run mock test suite |
| 6 | `ide_test` | Capture pass/fail counts |
| 7 | `ide_test` | Test filtering by pattern |
| 8 | `ide_debug` | Set breakpoint (mock mode) |
| 9 | `ide_debug` | Step through code |
| 10 | `ide_debug` | Inspect variable |
| 11 | `ide_deploy` | Assemble cartridge from region |
| 12 | Full Cycle | Write → Compile → Test → Deploy |

### Mock Mode

When backend unavailable, tools return realistic mock data:

```javascript
// Mock ide_test response
{
  success: true,
  total: 5,
  passed: 4,
  failed: 1,
  results: [
    { name: "test_compile", status: "pass", duration_ms: 12 },
    { name: "test_run", status: "pass", duration_ms: 45 },
    { name: "test_error", status: "fail", duration_ms: 8, error: "Assertion failed" },
    { name: "test_skip", status: "skip", duration_ms: 0 },
    { name: "test_final", status: "pass", duration_ms: 23 }
  ]
}
```

## Success Criteria

- [ ] All 12 browser tests pass
- [ ] All 4 tools return structured JSON
- [ ] Fallback mode works without server
- [ ] WebMCP tools registered (total: 93)
- [ ] Design document committed
- [ ] Implementation plan created

## Dependencies

- Phase E: WebMCP Reliability (WebSocket bridge)
- Phase F: AI Visual Builder (builder tools)
- Phase J.2: Neural IDE (tile types, shaders)

## Version

- WebMCP Bridge: v2.1.0
- Total Tools: 93 (89 existing + 4 new)
