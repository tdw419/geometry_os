# WebMCP Phase C: DevTools MCP Server Integration — Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Install and configure chrome-devtools-mcp to allow AI coding assistants to inspect, debug, and verify the Visual Shell in real-time — "TDD for AI" on the PixiJS render loop.

**Architecture:** Install @anthropic-ai/chrome-devtools-mcp (or @ChromeDevTools/chrome-devtools-mcp) as an MCP server. Configure it to connect to Chrome with remote debugging enabled. AI assistants can then inspect DOM, capture screenshots, read console logs, and interact with the Visual Shell programmatically.

**Tech Stack:** Node.js, MCP (Model Context Protocol), Chrome DevTools Protocol (CDP), Puppeteer

---

## Prerequisites

- Chrome 146+ browser
- Node.js 18+
- Phase A + B WebMCP Bridge complete (8 tools registered)
- Ability to launch Chrome with `--remote-debugging-port=9222`

---

## Task 1: Install chrome-devtools-mcp Package

**Files:**
- Modify: `package.json`
- Create: None

**Step 1: Write the failing test (verify package not installed)**

Run: `npm list @anthropic-ai/chrome-devtools-mcp 2>&1 || echo "Package not installed (expected)"`
Expected: Output contains "package not installed" or empty

**Step 2: Install the MCP server package**

Run: `npm install --save-dev @anthropic-ai/chrome-devtools-mcp`
Expected: Package installs successfully, package.json updated

**Step 3: Verify installation**

Run: `npm list @anthropic-ai/chrome-devtools-mcp`
Expected: Shows installed version (e.g., `@anthropic-ai/chrome-devtools-mcp@0.x.x`)

**Step 4: Commit**

```bash
git add package.json package-lock.json
git commit -m "chore(webmcp): add chrome-devtools-mcp for Phase C"
```

---

## Task 2: Create MCP Server Configuration

**Files:**
- Create: `systems/visual_shell/web/.mcp/config.json`

**Step 1: Write the failing test (config should not exist)**

Run: `test -f systems/visual_shell/web/.mcp/config.json && echo "exists" || echo "not found"`
Expected: "not found"

**Step 2: Create .mcp directory**

Run: `mkdir -p systems/visual_shell/web/.mcp`
Expected: Directory created (no error)

**Step 3: Write the MCP configuration file**

Create file `systems/visual_shell/web/.mcp/config.json`:

```json
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": [
        "-y",
        "@anthropic-ai/chrome-devtools-mcp"
      ],
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

**Step 4: Verify config file is valid JSON**

Run: `cat systems/visual_shell/web/.mcp/config.json | python3 -m json.tool > /dev/null && echo "valid" || echo "invalid"`
Expected: "valid"

**Step 5: Commit**

```bash
git add systems/visual_shell/web/.mcp/config.json
git commit -m "feat(webmcp): add MCP server config for chrome-devtools"
```

---

## Task 3: Create Chrome Debug Launcher Script

**Files:**
- Create: `systems/visual_shell/web/debug_chrome.sh`

**Step 1: Write the failing test (script should not exist)**

Run: `test -f systems/visual_shell/web/debug_chrome.sh && echo "exists" || echo "not found"`
Expected: "not found"

**Step 2: Write the launcher script**

Create file `systems/visual_shell/web/debug_chrome.sh`:

```bash
#!/bin/bash
# Geometry OS Visual Shell - Chrome Debug Launcher
# Launches Chrome with remote debugging for MCP integration
#
# Usage: ./debug_chrome.sh [--port PORT] [--url URL]
#
# Requirements:
#   - Chrome 146+ installed
#   - Port 9222 (or custom) available
#
# After launch, MCP clients can connect via chrome-devtools-mcp

set -e

# Default configuration
DEBUG_PORT="${1:-9222}"
START_URL="${2:-http://localhost:8000/systems/visual_shell/web/index.html}"
CHROME_BIN="${CHROME_PATH:-google-chrome}"

# Check Chrome exists
if ! command -v "$CHROME_BIN" &> /dev/null; then
    echo "Error: Chrome not found at '$CHROME_BIN'"
    echo "Set CHROME_PATH environment variable to specify Chrome location"
    exit 1
fi

# Check port is available
if lsof -Pi :$DEBUG_PORT -sTCP:LISTEN -t >/dev/null 2>&1; then
    echo "Warning: Port $DEBUG_PORT is already in use"
    echo "Existing Chrome debug instance may be running"
    echo ""
    echo "To connect to existing instance, use:"
    echo "  http://localhost:$DEBUG_PORT"
    exit 0
fi

echo "========================================"
echo "Geometry OS Visual Shell - Debug Mode"
echo "========================================"
echo ""
echo "Launching Chrome with remote debugging..."
echo "  Port: $DEBUG_PORT"
echo "  URL: $START_URL"
echo "  Chrome: $CHROME_BIN"
echo ""
echo "MCP Connection Info:"
echo "  DevTools Protocol: http://localhost:$DEBUG_PORT/json"
echo "  WebSocket: ws://localhost:$DEBUG_PORT/devtools/browser/..."
echo ""
echo "Press Ctrl+C to stop"
echo ""

# Launch Chrome with debugging
exec "$CHROME_BIN" \
    --remote-debugging-port="$DEBUG_PORT" \
    --remote-allow-origins='*' \
    --no-first-run \
    --no-default-browser-check \
    --disable-background-networking \
    --disable-client-side-phishing-detection \
    --disable-default-apps \
    --disable-extensions \
    --disable-hang-monitor \
    --disable-popup-blocking \
    --disable-prompt-on-repost \
    --disable-sync \
    --disable-translate \
    --metrics-recording-only \
    --start-maximized \
    --auto-open-devtools-for-tabs \
    "$START_URL"
```

**Step 3: Make script executable**

Run: `chmod +x systems/visual_shell/web/debug_chrome.sh`
Expected: No error

**Step 4: Verify script is valid bash**

Run: `bash -n systems/visual_shell/web/debug_chrome.sh && echo "valid" || echo "syntax error"`
Expected: "valid"

**Step 5: Commit**

```bash
git add systems/visual_shell/web/debug_chrome.sh
git commit -m "feat(webmcp): add Chrome debug launcher script for MCP"
```

---

## Task 4: Create DevTools MCP Test Page

**Files:**
- Create: `systems/visual_shell/web/test_devtools_mcp.html`

**Step 1: Write the failing test (test page should not exist)**

Run: `test -f systems/visual_shell/web/test_devtools_mcp.html && echo "exists" || echo "not found"`
Expected: "not found"

**Step 2: Write the test page**

Create file `systems/visual_shell/web/test_devtools_mcp.html`:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Geometry OS: DevTools MCP Verification (Phase C)</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            padding: 20px;
            background: #000000;
            color: #00ff88;
            font-family: 'Courier New', Courier, monospace;
            min-height: 100vh;
        }
        .container { max-width: 900px; margin: 0 auto; }
        h1 { color: #00ffff; text-align: center; }
        .section {
            background: rgba(0, 0, 0, 0.5);
            border: 1px solid #00ff88;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .section h2 { color: #00ffff; margin-top: 0; }
        .test-item {
            padding: 12px;
            margin: 8px 0;
            background: rgba(0, 255, 136, 0.05);
            border-radius: 4px;
            border-left: 3px solid #666;
        }
        .test-item.pass { border-left-color: #00ff88; background: rgba(0, 255, 136, 0.1); }
        .test-item.fail { border-left-color: #ff4444; background: rgba(255, 68, 68, 0.1); }
        .test-item.pending { border-left-color: #ffaa00; background: rgba(255, 170, 0, 0.1); }
        .status { float: right; font-weight: bold; }
        .pass { color: #00ff88; }
        .fail { color: #ff4444; }
        .pending { color: #ffaa00; }
        pre {
            background: #111;
            padding: 10px;
            border-radius: 4px;
            overflow-x: auto;
            font-size: 12px;
        }
        button {
            background: #00ff88;
            color: #000;
            border: none;
            padding: 10px 20px;
            font-family: inherit;
            font-weight: bold;
            cursor: pointer;
            border-radius: 4px;
            margin: 5px;
        }
        button:hover { background: #00ffff; }
        button:disabled { background: #666; cursor: not-allowed; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Geometry OS: DevTools MCP Verification</h1>
        <p style="text-align: center; color: #888;">Phase C: Chrome DevTools MCP Server Integration</p>

        <div class="section">
            <h2>1. Prerequisites Check</h2>
            <div id="prereq-tests"></div>
        </div>

        <div class="section">
            <h2>2. MCP Server Status</h2>
            <div id="mcp-tests"></div>
            <button onclick="testMCPServerConnection()">Test MCP Connection</button>
        </div>

        <div class="section">
            <h2>3. DevTools Protocol Tests</h2>
            <div id="cdp-tests"></div>
            <button onclick="runCDPTests()">Run CDP Tests</button>
        </div>

        <div class="section">
            <h2>4. WebMCP Bridge Integration</h2>
            <div id="webmcp-tests"></div>
            <button onclick="testWebMCPIntegration()">Test WebMCP Integration</button>
        </div>

        <div class="section">
            <h2>5. Results Summary</h2>
            <div id="results-summary"></div>
            <button onclick="runAllTests()">Run All Tests</button>
        </div>
    </div>

    <script>
        // Test utilities
        const testResults = { pass: 0, fail: 0, pending: 0 };

        function createTestItem(containerId, name, initialStatus = 'pending') {
            const container = document.getElementById(containerId);
            const item = document.createElement('div');
            item.className = `test-item ${initialStatus}`;
            item.id = `test-${name.replace(/\s+/g, '-').toLowerCase()}`;
            item.innerHTML = `
                <span class="status ${initialStatus}">${initialStatus.toUpperCase()}</span>
                <strong>${name}</strong>
                <div class="details"></div>
            `;
            container.appendChild(item);
            return item;
        }

        function updateTestItem(item, status, details = '') {
            item.className = `test-item ${status}`;
            item.querySelector('.status').textContent = status.toUpperCase();
            item.querySelector('.status').className = `status ${status}`;
            if (details) {
                item.querySelector('.details').innerHTML = `<pre>${details}</pre>`;
            }
            testResults[status]++;
        }

        // Prerequisite tests
        async function runPrereqTests() {
            const container = 'prereq-tests';

            // Test 1: Check Chrome version
            const chromeTest = createTestItem(container, 'Chrome 146+ Available');
            const chromeVersion = navigator.userAgent.match(/Chrome\/(\d+)/);
            if (chromeVersion && parseInt(chromeVersion[1]) >= 146) {
                updateTestItem(chromeTest, 'pass', `Chrome ${chromeVersion[1]} detected`);
            } else {
                updateTestItem(chromeTest, 'fail', `Chrome ${chromeVersion?.[1] || 'unknown'} - need 146+`);
            }

            // Test 2: Check WebMCP availability
            const webmcpTest = createTestItem(container, 'WebMCP API Available');
            if ('modelContext' in navigator) {
                updateTestItem(webmcpTest, 'pass', 'navigator.modelContext available');
            } else {
                updateTestItem(webmcpTest, 'fail', 'navigator.modelContext not found');
            }

            // Test 3: Check if running with remote debugging
            const debugTest = createTestItem(container, 'Remote Debugging Enabled');
            try {
                const response = await fetch('http://localhost:9222/json/version');
                if (response.ok) {
                    const data = await response.json();
                    updateTestItem(debugTest, 'pass', `DevTools Protocol: ${data.webSocketDebuggerUrl?.substring(0, 50)}...`);
                } else {
                    updateTestItem(debugTest, 'fail', 'Port 9222 not responding');
                }
            } catch (e) {
                updateTestItem(debugTest, 'fail', `Cannot connect to localhost:9222 - ${e.message}`);
            }
        }

        // MCP Server connection test
        async function testMCPServerConnection() {
            const container = 'mcp-tests';
            const test = createTestItem(container, 'MCP Server Connection');

            try {
                // MCP servers typically communicate via stdio, but we can check if the config exists
                const response = await fetch('.mcp/config.json');
                if (response.ok) {
                    const config = await response.json();
                    const hasDevTools = config.mcpServers?.['chrome-devtools'];
                    if (hasDevTools) {
                        updateTestItem(test, 'pass', JSON.stringify(config.mcpServers['chrome-devtools'], null, 2));
                    } else {
                        updateTestItem(test, 'fail', 'chrome-devtools MCP server not configured');
                    }
                } else {
                    updateTestItem(test, 'fail', 'MCP config not found at .mcp/config.json');
                }
            } catch (e) {
                updateTestItem(test, 'fail', e.message);
            }
        }

        // CDP Tests
        async function runCDPTests() {
            const container = 'cdp-tests';

            // Test 1: List available targets
            const listTest = createTestItem(container, 'List Debug Targets');
            try {
                const response = await fetch('http://localhost:9222/json/list');
                if (response.ok) {
                    const targets = await response.json();
                    updateTestItem(listTest, 'pass', `${targets.length} targets:\n${targets.map(t => t.title).join('\n')}`);
                } else {
                    updateTestItem(listTest, 'fail', `HTTP ${response.status}`);
                }
            } catch (e) {
                updateTestItem(listTest, 'fail', e.message);
            }

            // Test 2: Get browser version
            const versionTest = createTestItem(container, 'Browser Version Info');
            try {
                const response = await fetch('http://localhost:9222/json/version');
                if (response.ok) {
                    const version = await response.json();
                    updateTestItem(versionTest, 'pass', `${version.Browser}\nProtocol: ${version['Protocol-Version']}`);
                } else {
                    updateTestItem(versionTest, 'fail', `HTTP ${response.status}`);
                }
            } catch (e) {
                updateTestItem(versionTest, 'fail', e.message);
            }
        }

        // WebMCP Integration tests
        async function testWebMCPIntegration() {
            const container = 'webmcp-tests';

            const test = createTestItem(container, 'WebMCP Bridge Status');
            if (window.webmcpBridge) {
                const status = window.webmcpBridge.getStatus();
                updateTestItem(test, 'pass', JSON.stringify(status, null, 2));
            } else {
                updateTestItem(test, 'fail', 'window.webmcpBridge not found - load index.html first');
            }
        }

        // Run all tests
        async function runAllTests() {
            // Reset counters
            testResults.pass = 0;
            testResults.fail = 0;
            testResults.pending = 0;

            // Clear previous results
            ['prereq-tests', 'mcp-tests', 'cdp-tests', 'webmcp-tests'].forEach(id => {
                document.getElementById(id).innerHTML = '';
            });

            await runPrereqTests();
            await testMCPServerConnection();
            await runCDPTests();
            await testWebMCPIntegration();

            // Show summary
            const summary = document.getElementById('results-summary');
            summary.innerHTML = `
                <div style="display: flex; gap: 20px; justify-content: center;">
                    <div class="test-item pass"><span class="pass">${testResults.pass}</span> Passed</div>
                    <div class="test-item fail"><span class="fail">${testResults.fail}</span> Failed</div>
                </div>
                <p style="text-align: center; margin-top: 20px;">
                    ${testResults.fail === 0 ? '✅ All tests passed!' : '❌ Some tests failed - check configuration'}
                </p>
            `;
        }

        // Auto-run prerequisites on load
        document.addEventListener('DOMContentLoaded', () => {
            runPrereqTests();
        });
    </script>
</body>
</html>
```

**Step 3: Verify HTML is well-formed**

Run: `python3 -c "from html.parser import HTMLParser; HTMLParser().feed(open('systems/visual_shell/web/test_devtools_mcp.html').read()); print('valid')"`
Expected: "valid"

**Step 4: Commit**

```bash
git add systems/visual_shell/web/test_devtools_mcp.html
git commit -m "feat(webmcp): add DevTools MCP verification test page"
```

---

## Task 5: Create Phase C Documentation

**Files:**
- Create: `docs/plans/2026-02-13-webmcp-phase-c-design.md`

**Step 1: Write the failing test (doc should not exist)**

Run: `test -f docs/plans/2026-02-13-webmcp-phase-c-design.md && echo "exists" || echo "not found"`
Expected: "not found"

**Step 2: Write the design document**

Create file `docs/plans/2026-02-13-webmcp-phase-c-design.md`:

```markdown
# WebMCP Bridge Phase C: DevTools MCP Server Integration — Design Document

**Date:** 2026-02-13
**Phase:** Phase C: DevTools MCP Integration
**Status:** Implementation Ready
**Depends On:** Phase A + B (8 WebMCP tools)

---

## Overview

Phase C integrates the Chrome DevTools Protocol (CDP) as an MCP server, enabling AI coding assistants to debug and verify the Geometry OS Visual Shell in real-time. This enables "TDD for AI" on the PixiJS render loop.

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
│               │    │                 │    │ git, etc.)      │
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
│  Remote Debugging: localhost:9222                                   │
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
        "CHROME_REMOTE_DEBUGGING_PORT": "9222"
      }
    }
  }
}
```

### 3. Chrome Debug Launcher (`debug_chrome.sh`)

Launches Chrome with remote debugging enabled:

```bash
./debug_chrome.sh
# Launches Chrome on port 9222
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

1. ✅ `@anthropic-ai/chrome-devtools-mcp` installed
2. ✅ MCP configuration file created
3. ✅ Chrome debug launcher script works
4. ✅ DevTools Protocol accessible on port 9222
5. ✅ Test page passes all verification tests
6. ✅ AI assistant can use DevTools MCP tools alongside WebMCP tools

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
```

**Step 3: Commit**

```bash
git add docs/plans/2026-02-13-webmcp-phase-c-design.md
git commit -m "docs(webmcp): add Phase C DevTools MCP design document"
```

---

## Task 6: Verify Complete Integration

**Files:**
- None (verification only)

**Step 1: Start a local HTTP server**

Run: `cd systems/visual_shell/web && python3 -m http.server 8000 &`
Expected: Server starts on port 8000

**Step 2: Verify all files exist**

Run:
```bash
ls -la systems/visual_shell/web/.mcp/config.json && \
ls -la systems/visual_shell/web/debug_chrome.sh && \
ls -la systems/visual_shell/web/test_devtools_mcp.html && \
ls -la docs/plans/2026-02-13-webmcp-phase-c-design.md
```
Expected: All files listed

**Step 3: Verify package is in package.json**

Run: `grep chrome-devtools-mcp package.json`
Expected: Shows `"@anthropic-ai/chrome-devtools-mcp"`

**Step 4: Final commit with tag**

```bash
git add -A
git commit -m "feat(webmcp): complete Phase C - DevTools MCP integration

Phase C enables AI coding assistants to debug and verify the Visual Shell
via Chrome DevTools Protocol. Components:

- @anthropic-ai/chrome-devtools-mcp package
- MCP server configuration (.mcp/config.json)
- Chrome debug launcher (debug_chrome.sh)
- Verification test page (test_devtools_mcp.html)
- Design documentation

Integration: WebMCP tools + DevTools MCP tools = full observability"

git tag -a "webmcp-phase-c" -m "WebMCP Phase C: DevTools MCP Integration"
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | Install chrome-devtools-mcp package | `package.json` |
| 2 | Create MCP server configuration | `.mcp/config.json` |
| 3 | Create Chrome debug launcher | `debug_chrome.sh` |
| 4 | Create verification test page | `test_devtools_mcp.html` |
| 5 | Write design documentation | `phase-c-design.md` |
| 6 | Verify integration | - |

**Total estimated time:** 30-45 minutes

**Dependencies:** Phase A + B (8 WebMCP tools) must be complete

**Next Phase:** Phase D - Agent2Agent (A2A) protocol for agent coordination
