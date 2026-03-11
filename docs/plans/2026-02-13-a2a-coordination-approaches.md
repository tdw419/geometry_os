# A2A Coordination System - Approaches for Completion

**Date:** 2026-02-13
**Status:** Proposed
**Related:** Phase D (A2A Protocol), Task #10

## Context

The A2A (Agent-to-Agent) coordination system has the following components completed:

| Component | Status | Tests | Location |
|-----------|---------|--------|----------|
| Python Router Backend | ✅ Complete | 22 tests | `a2a_router.py` |
| Lock/Barrier Primitives | ✅ Complete | 8 tests | `_handle_lock_*`, `_handle_barrier_*` |
| WebMCP Bridge Tools | ✅ Complete | - | `webmcp_bridge.js` |
| Test Page UI | ✅ Complete | - | `test_a2a_tools.html` |

**What remains:** End-to-end integration and documentation

---

## Approaches

### Approach A: Standalone Server (Minimal Integration)

**Description:** Run the A2A router as a standalone Python process that the frontend connects to via WebSocket.

**Architecture:**
```
[Browser] --WebSocket--> [Python A2A Router :8766]
     |                           |
     v                           v
[WebMCP Tools]           [Agent Registry + Coordination]
```

**Implementation:**
```bash
# Terminal 1: Start A2A router
python3 -m systems.pixel_compiler.a2a_router --port 8766

# Terminal 2: Serve test page
python3 -m http.server 8080 --directory systems/visual_shell/web
```

**Pros:**
- ✅ Zero code changes required (works immediately)
- ✅ Clean separation of concerns
- ✅ Easy to debug (separate logs)
- ✅ Can run router on different machine

**Cons:**
- ❌ Requires manual process management
- ❌ Two terminals to run tests
- ❌ Port conflicts possible (8766)
- ❌ No automatic startup

**Effort:** 1-2 hours (documentation only)

---

### Approach B: Embedded Server (Single Process)

**Description:** Embed the A2A router server within the existing web_server.py, running on a separate port or endpoint.

**Architecture:**
```
                    [web_server.py :8000]
                           |
          +----------------+----------------+
          |                |                |
    [Static Files]   [WebMCP API]   [A2A Router :8766]
          |                |                |
          v                v                v
     [Test Page]    [Builder Tools]   [Coordination]
```

**Implementation:**
```python
# In web_server.py
from systems.pixel_compiler.a2a_router import A2ARouter

class IntegratedServer:
    def __init__(self):
        self.web_app = ...  # existing web app
        self.a2a_router = A2ARouter(host="localhost", port=8766)

    async def start(self):
        await asyncio.gather(
            self.web_app.serve(),
            self.a2a_router.start()
        )
```

**Pros:**
- ✅ Single command to start everything
- ✅ Shared logging and configuration
- ✅ Easier deployment (one process)
- ✅ Can share state between web and A2A

**Cons:**
- ❌ Requires code changes to web_server.py
- ❌ More complex to debug
- ❌ A2A router failure could affect web server
- ❌ Still uses two ports (8000 + 8766)

**Effort:** 4-6 hours (implementation + testing)

---

### Approach C: WebSocket Proxy (Unified Endpoint)

**Description:** Add A2A WebSocket handling to the existing web_server.py on the same port, using path-based routing.

**Architecture:**
```
                    [web_server.py :8000]
                           |
          +----------------+----------------+
          |                |                |
    [GET /]       [GET /api/*]      [WS /a2a]
          |                |                |
          v                v                v
     [Test Page]    [Builder Tools]   [A2A Router Logic]
```

**Implementation:**
```python
# In web_server.py
from systems.pixel_compiler.a2a_router import A2ARouter

# Add WebSocket route
@app.websocket("/a2a")
async def a2a_endpoint(websocket):
    await a2a_router.handle_connection(websocket)

# Or integrate A2A logic directly
class UnifiedRouter(A2ARouter):
    async def handle_connection(self, websocket):
        # Reuse existing A2ARouter methods
        ...
```

**Pros:**
- ✅ Single port (8000) - no conflicts
- ✅ Single command to start
- ✅ CORS handled uniformly
- ✅ Cleaner architecture (all routes in one place)
- ✅ Easier for production deployment

**Cons:**
- ❌ Most code changes required
- ❌ WebSocket handling in existing web server
- ❌ Need to ensure async compatibility
- ❌ May conflict with existing routes

**Effort:** 6-8 hours (implementation + testing + validation)

---

## Comparison Table

| Feature | Approach A | Approach B | Approach C |
|---------|------------|-------------|-------------|
| **Code Changes** | None | Moderate | Significant |
| **Ports Required** | 2 (8000, 8766) | 2 (8000, 8766) | 1 (8000) |
| **Processes** | 2 | 1 | 1 |
| **Setup Complexity** | Low | Medium | High |
| **Debug Simplicity** | High | Medium | Low |
| **Production Ready** | Manual | Good | Best |
| **Time to Complete** | 1-2h | 4-6h | 6-8h |

---

## Recommendation: **Approach A (Standalone Server)**

### Rationale

1. **Immediate Value:** All code is complete. Approach A works *right now* with zero changes.

2. **Focus on Documentation:** The 1-2 hours saved should go toward:
   - Clear startup instructions
   - Troubleshooting guide
   - Example workflows for locks/barriers
   - Integration patterns for agents

3. **Future Flexibility:** Starting with Approach A doesn't prevent B or C later. Once patterns are established, integration can be considered.

4. **Development Speed:** The goal is to enable coordination *features*, not perfect architecture. Standalone server achieves this immediately.

### Immediate Action Items

1. **Create startup script** (`scripts/start_a2a_dev.sh`):
   ```bash
   #!/bin/bash
   # Start A2A router on port 8766
   python3 -m systems.pixel_compiler.a2a_router &
   A2A_PID=$!

   # Start web server on port 8000
   python3 -m systems.pixel_compiler.web_server &
   WEB_PID=$!

   echo "A2A Router running (PID: $A2A_PID)"
   echo "Web Server running (PID: $WEB_PID)"
   echo "Test at: http://localhost:8000/test_a2a_tools.html"

   # Cleanup on exit
   trap "kill $A2A_PID $WEB_PID 2>/dev/null" EXIT
   wait
   ```

2. **Update test page** to connect to actual backend:
   - Remove simulated results
   - Connect to `ws://localhost:8766/a2a`
   - Handle real lock/barrier responses

3. **Create documentation** (`docs/a2a_coordination_guide.md`):
   - How locks work (acquire, hold, release, queue)
   - How barriers work (enter, wait, release)
   - Example multi-agent workflows
   - Troubleshooting common issues

### Future Consideration

If deployment needs require single-process operation, revisit Approach B or C after:
- End-to-end patterns are documented
- Real-world usage identifies bottlenecks
- Performance requirements are clear

---

## Alternative Recommendation (If Integration Required)

**Approach B (Embedded Server)** - If a single-process solution is mandatory:

- Use `asyncio.gather()` to run both servers
- Keep ports separate (8000 for web, 8766 for A2A)
- Add health check endpoint that reports both servers
- Create systemd service file for production

**Estimated additional effort:** 4-6 hours

---

## Summary

| Recommendation | Approach | Timeline | Next Step |
|---------------|-----------|----------|-----------|
| **Primary** | A (Standalone) | 1-2h | Create startup script + docs |
| **Alternative** | B (Embedded) | 4-6h | Integrate into web_server.py |
| **Ideal (Future)** | C (Unified) | 6-8h | Path-based WebSocket routing |

**Decision:** Proceed with **Approach A** for immediate value, document patterns, and defer integration until requirements justify it.
