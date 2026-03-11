# A2A Coordination Primitives Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add 4 WebMCP tools for distributed coordination: `a2a_acquire_lock`, `a2a_release_lock`, `a2a_barrier_enter`, `a2a_barrier_wait`.

**Architecture:** Extend webmcp_bridge.js with 4 new tools that communicate with the existing A2A Router backend via WebSocket. The backend already implements lock and barrier primitives in `a2a_router.py`. We just need frontend tools to expose them.

**Tech Stack:** JavaScript (WebMCP Bridge), Python (A2A Router), WebSocket, JSON messaging

---

## Prerequisites

- ✅ A2A Router backend exists with lock/barrier handlers: `systems/pixel_compiler/a2a_router.py`
- ✅ WebMCP Bridge has A2A WebSocket connection: `#connectA2ASocket()` method
- ✅ A2A message request helper exists: `#sendA2ARequest()` method

---

## Task 1: Add a2a_acquire_lock Tool

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Find where to add new tool registration**

Run: `grep -n "#registerA2ASubscribe\|Phase D tools" systems/visual_shell/web/webmcp_bridge.js | head -5`

Expected: Find registration section around line 515-520

**Step 2: Add tool registration call**

In the `#register()` method, after the existing A2A tool registrations, add:

```javascript
            // Phase D tools - Coordination Primitives
            await this.#registerA2AAcquireLock();
            await this.#registerA2AReleaseLock();
            await this.#registerA2ABarrierEnter();
```

**Step 3: Implement #registerA2AAcquireLock method**

Add after the existing A2A tool implementations (around line 1600):

```javascript
    // ─────────────────────────────────────────────────────────────
    // Tool 12: a2a_acquire_lock (Phase D - Coordination)
    // ─────────────────────────────────────────────────────────────

    async #registerA2AAcquireLock() {
        const tool = {
            name: 'a2a_acquire_lock',
            description:
                'Acquire a distributed lock for exclusive access to a resource. ' +
                'Returns immediately with granted=true if lock is free, or granted=false with queue position if held by another agent. ' +
                'Locks have automatic timeout expiration.',
            inputSchema: {
                type: 'object',
                properties: {
                    lock_id: {
                        type: 'string',
                        description: 'Unique identifier for the lock (e.g., "region-100-200" or "resource-database")'
                    },
                    timeout: {
                        type: 'number',
                        description: 'Lock timeout in seconds (default: 30)',
                        default: 30
                    },
                    agent_id: {
                        type: 'string',
                        description: 'Agent ID requesting the lock (defaults to current session)'
                    }
                },
                required: ['lock_id']
            },
            handler: async (params) => {
                return this.#handleA2AAcquireLock(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2AAcquireLock({ lock_id, timeout = 30, agent_id }) {
        this.#trackCall('a2a_acquire_lock');

        if (!lock_id || typeof lock_id !== 'string') {
            return {
                success: false,
                error: 'lock_id is required and must be a string',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'lock_request',
                lock_id,
                timeout,
                agent_id: agent_id || this.#sessionId || 'default-agent'
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: true,
                lock_id,
                granted: response.granted ?? false,
                expires_at: response.expires_at,
                queue_position: response.queue_position
            };

        } catch (err) {
            const errorCode = err.message.includes('backend not running')
                ? 'BACKEND_UNAVAILABLE'
                : 'EXECUTION_FAILED';

            return {
                success: false,
                error: err.message,
                error_code: errorCode
            };
        }
    }
```

**Step 4: Verify syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js`

Expected: No syntax errors

**Step 5: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add a2a_acquire_lock tool for distributed locking"
```

---

## Task 2: Add a2a_release_lock Tool

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Implement #registerA2AReleaseLock method**

Add after #registerA2AAcquireLock:

```javascript
    // ─────────────────────────────────────────────────────────────
    // Tool 13: a2a_release_lock (Phase D - Coordination)
    // ─────────────────────────────────────────────────────────────

    async #registerA2AReleaseLock() {
        const tool = {
            name: 'a2a_release_lock',
            description:
                'Release a distributed lock that was previously acquired. ' +
                'The next agent in the queue (if any) will be automatically granted the lock.',
            inputSchema: {
                type: 'object',
                properties: {
                    lock_id: {
                        type: 'string',
                        description: 'Unique identifier for the lock to release'
                    },
                    agent_id: {
                        type: 'string',
                        description: 'Agent ID releasing the lock (defaults to current session)'
                    }
                },
                required: ['lock_id']
            },
            handler: async (params) => {
                return this.#handleA2AReleaseLock(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2AReleaseLock({ lock_id, agent_id }) {
        this.#trackCall('a2a_release_lock');

        if (!lock_id || typeof lock_id !== 'string') {
            return {
                success: false,
                error: 'lock_id is required and must be a string',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'lock_release',
                lock_id,
                agent_id: agent_id || this.#sessionId || 'default-agent'
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.released ?? true,
                lock_id,
                released: response.released,
                error: response.error
            };

        } catch (err) {
            const errorCode = err.message.includes('backend not running')
                ? 'BACKEND_UNAVAILABLE'
                : 'EXECUTION_FAILED';

            return {
                success: false,
                error: err.message,
                error_code: errorCode
            };
        }
    }
```

**Step 2: Verify syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js`

Expected: No syntax errors

**Step 3: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add a2a_release_lock tool"
```

---

## Task 3: Add a2a_barrier_enter Tool

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Implement #registerA2ABarrierEnter method**

Add after #registerA2AReleaseLock:

```javascript
    // ─────────────────────────────────────────────────────────────
    // Tool 14: a2a_barrier_enter (Phase D - Coordination)
    // ─────────────────────────────────────────────────────────────

    async #registerA2ABarrierEnter() {
        const tool = {
            name: 'a2a_barrier_enter',
            description:
                'Enter a synchronization barrier and wait for other agents. ' +
                'When the expected number of agents have entered, all are released simultaneously. ' +
                'Useful for coordinating multi-agent workflows at specific checkpoints.',
            inputSchema: {
                type: 'object',
                properties: {
                    barrier_id: {
                        type: 'string',
                        description: 'Unique identifier for the barrier (e.g., "phase-1-complete")'
                    },
                    expected_count: {
                        type: 'number',
                        description: 'Number of agents that must enter before release (default: 2)',
                        default: 2
                    },
                    agent_id: {
                        type: 'string',
                        description: 'Agent ID entering the barrier (defaults to current session)'
                    }
                },
                required: ['barrier_id']
            },
            handler: async (params) => {
                return this.#handleA2ABarrierEnter(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2ABarrierEnter({ barrier_id, expected_count = 2, agent_id }) {
        this.#trackCall('a2a_barrier_enter');

        if (!barrier_id || typeof barrier_id !== 'string') {
            return {
                success: false,
                error: 'barrier_id is required and must be a string',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'barrier_enter',
                barrier_id,
                expected_count,
                agent_id: agent_id || this.#sessionId || 'default-agent'
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: true,
                barrier_id,
                released: response.released ?? false,
                arrived_count: response.arrived_count,
                expected_count: response.expected_count ?? expected_count
            };

        } catch (err) {
            const errorCode = err.message.includes('backend not running')
                ? 'BACKEND_UNAVAILABLE'
                : 'EXECUTION_FAILED';

            return {
                success: false,
                error: err.message,
                error_code: errorCode
            };
        }
    }
```

**Step 2: Verify syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js`

Expected: No syntax errors

**Step 3: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add a2a_barrier_enter tool for synchronization"
```

---

## Task 4: Add Python Tests for Coordination Primitives

**Files:**
- Modify: `systems/pixel_compiler/tests/test_a2a_router.py`

**Step 1: Add coordination tests class**

Append to `test_a2a_router.py`:

```python


class TestA2ACoordinationPrimitives:
    """Tests for distributed coordination primitives (locks and barriers)."""

    @pytest.fixture
    def router(self):
        """Create a fresh A2A router for each test."""
        return A2ARouter()

    # === Lock Tests ===

    @pytest.mark.asyncio
    async def test_acquire_lock_free(self, router):
        """Can acquire a lock when it's free."""
        mock_conn = AsyncMock()
        await router.register_agent("agent-1", mock_conn, {"agent_type": "monitor"})

        result = await router._handle_lock_request({
            "agent_id": "agent-1",
            "lock_id": "test-lock",
            "timeout": 30
        }, mock_conn)

        assert result["type"] == "ack"
        assert result["granted"] is True
        assert "expires_at" in result

    @pytest.mark.asyncio
    async def test_acquire_lock_held_by_other(self, router):
        """Lock request is queued when held by another agent."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router.register_agent("agent-1", mock_conn1, {"agent_type": "monitor"})
        await router.register_agent("agent-2", mock_conn2, {"agent_type": "executor"})

        # Agent 1 acquires lock
        await router._handle_lock_request({
            "agent_id": "agent-1",
            "lock_id": "test-lock",
            "timeout": 30
        }, mock_conn1)

        # Agent 2 tries to acquire
        result = await router._handle_lock_request({
            "agent_id": "agent-2",
            "lock_id": "test-lock",
            "timeout": 30
        }, mock_conn2)

        assert result["granted"] is False
        assert result["queue_position"] == 1

    @pytest.mark.asyncio
    async def test_release_lock_grants_to_next(self, router):
        """Releasing a lock grants it to next agent in queue."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router.register_agent("agent-1", mock_conn1, {"agent_type": "monitor"})
        await router.register_agent("agent-2", mock_conn2, {"agent_type": "executor"})

        # Agent 1 acquires, Agent 2 queues
        await router._handle_lock_request({
            "agent_id": "agent-1",
            "lock_id": "test-lock",
            "timeout": 30
        }, mock_conn1)

        await router._handle_lock_request({
            "agent_id": "agent-2",
            "lock_id": "test-lock",
            "timeout": 30
        }, mock_conn2)

        # Agent 1 releases
        result = await router._handle_lock_release({
            "agent_id": "agent-1",
            "lock_id": "test-lock"
        }, mock_conn1)

        assert result["released"] is True
        # Agent 2 should have received lock_granted notification
        mock_conn2.send.assert_called()

    @pytest.mark.asyncio
    async def test_lock_reentrant(self, router):
        """Same agent can re-acquire lock they already hold."""
        mock_conn = AsyncMock()
        await router.register_agent("agent-1", mock_conn, {"agent_type": "monitor"})

        # First acquire
        await router._handle_lock_request({
            "agent_id": "agent-1",
            "lock_id": "test-lock",
            "timeout": 30
        }, mock_conn)

        # Re-acquire (reentrant)
        result = await router._handle_lock_request({
            "agent_id": "agent-1",
            "lock_id": "test-lock",
            "timeout": 60
        }, mock_conn)

        assert result["granted"] is True

    # === Barrier Tests ===

    @pytest.mark.asyncio
    async def test_barrier_not_released_until_full(self, router):
        """Barrier does not release until expected count reached."""
        mock_conn = AsyncMock()
        await router.register_agent("agent-1", mock_conn, {"agent_type": "monitor"})

        result = await router._handle_barrier_enter({
            "agent_id": "agent-1",
            "barrier_id": "test-barrier",
            "expected_count": 2
        }, mock_conn)

        assert result["released"] is False
        assert result["arrived_count"] == 1
        assert result["expected_count"] == 2

    @pytest.mark.asyncio
    async def test_barrier_releases_when_full(self, router):
        """Barrier releases all agents when expected count reached."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router.register_agent("agent-1", mock_conn1, {"agent_type": "monitor"})
        await router.register_agent("agent-2", mock_conn2, {"agent_type": "executor"})

        # Agent 1 enters
        await router._handle_barrier_enter({
            "agent_id": "agent-1",
            "barrier_id": "test-barrier",
            "expected_count": 2
        }, mock_conn1)

        # Agent 2 enters - should trigger release
        result = await router._handle_barrier_enter({
            "agent_id": "agent-2",
            "barrier_id": "test-barrier",
            "expected_count": 2
        }, mock_conn2)

        assert result["released"] is True
        assert result["arrived_count"] == 2
        # Both agents should have received barrier_release notification
        mock_conn1.send.assert_called()
        mock_conn2.send.assert_called()
```

**Step 2: Run tests to verify they pass**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py -v`

Expected: All tests pass (should have 24+ tests now)

**Step 3: Commit**

```bash
git add systems/pixel_compiler/tests/test_a2a_router.py
git commit -m "test(a2a): add coordination primitives tests (locks and barriers)"
```

---

## Task 5: Update Test Page

**Files:**
- Modify: `systems/visual_shell/web/test_a2a_tools.html`

**Step 1: Add coordination tools test section**

Find the Phase D tests section and add:

```html
    <div class="test-section">
        <h2>Phase D: Coordination Primitives</h2>
        <div class="grid">
            <div>
                <h3>Distributed Lock</h3>
                <label>Lock ID: <input type="text" id="lock-id" value="region-0-0" style="width:150px"></label><br><br>
                <label>Timeout: <input type="number" id="lock-timeout" value="30" style="width:60px"> seconds</label><br><br>
                <button onclick="testAcquireLock()">Acquire Lock</button>
                <button onclick="testReleaseLock()">Release Lock</button>
                <div id="lock-result"></div>
            </div>
            <div>
                <h3>Barrier Sync</h3>
                <label>Barrier ID: <input type="text" id="barrier-id" value="phase-1-complete" style="width:150px"></label><br><br>
                <label>Expected: <input type="number" id="barrier-expected" value="2" style="width:60px"> agents</label><br><br>
                <button onclick="testBarrierEnter()">Enter Barrier</button>
                <div id="barrier-result"></div>
            </div>
        </div>
    </div>
```

**Step 2: Add JavaScript test functions**

Add to the script section:

```javascript
        async function testAcquireLock() {
            const lockId = document.getElementById('lock-id').value;
            const timeout = parseInt(document.getElementById('lock-timeout').value);

            document.getElementById('lock-result').innerHTML =
                '<div class="test-result pending">Acquiring lock...</div>';

            try {
                const result = await navigator.modelContext.callTool('a2a_acquire_lock', {
                    lock_id: lockId,
                    timeout: timeout
                });

                document.getElementById('lock-result').innerHTML =
                    `<div class="test-result ${result.success && result.granted ? 'pass' : 'pending'}">
                        <pre>${JSON.stringify(result, null, 2)}</pre>
                    </div>`;
            } catch (e) {
                document.getElementById('lock-result').innerHTML =
                    `<div class="test-result fail">Error: ${e.message}</div>`;
            }
        }

        async function testReleaseLock() {
            const lockId = document.getElementById('lock-id').value;

            document.getElementById('lock-result').innerHTML =
                '<div class="test-result pending">Releasing lock...</div>';

            try {
                const result = await navigator.modelContext.callTool('a2a_release_lock', {
                    lock_id: lockId
                });

                document.getElementById('lock-result').innerHTML =
                    `<div class="test-result ${result.success ? 'pass' : 'fail'}">
                        <pre>${JSON.stringify(result, null, 2)}</pre>
                    </div>`;
            } catch (e) {
                document.getElementById('lock-result').innerHTML =
                    `<div class="test-result fail">Error: ${e.message}</div>`;
            }
        }

        async function testBarrierEnter() {
            const barrierId = document.getElementById('barrier-id').value;
            const expectedCount = parseInt(document.getElementById('barrier-expected').value);

            document.getElementById('barrier-result').innerHTML =
                '<div class="test-result pending">Entering barrier...</div>';

            try {
                const result = await navigator.modelContext.callTool('a2a_barrier_enter', {
                    barrier_id: barrierId,
                    expected_count: expectedCount
                });

                const status = result.released ? 'pass' : 'pending';
                document.getElementById('barrier-result').innerHTML =
                    `<div class="test-result ${status}">
                        ${result.released ? '🎉 Barrier released!' : `Waiting for ${result.expected_count - result.arrived_count} more agents`}
                        <pre>${JSON.stringify(result, null, 2)}</pre>
                    </div>`;
            } catch (e) {
                document.getElementById('barrier-result').innerHTML =
                    `<div class="test-result fail">Error: ${e.message}</div>`;
            }
        }
```

**Step 3: Commit**

```bash
git add systems/visual_shell/web/test_a2a_tools.html
git commit -m "test(webmcp): add coordination primitives to A2A test page"
```

---

## Task 6: Final Verification

**Step 1: Run all Python tests**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py -v`

Expected: 24+ tests pass

**Step 2: Verify JavaScript syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js`

Expected: No syntax errors

**Step 3: Check tool count**

Run: `grep -c "async #register" systems/visual_shell/web/webmcp_bridge.js`

Expected: 14+ registered tools (8 original + 3 A2A + 3 coordination)

**Step 4: Final commit (if any uncommitted changes)**

```bash
git add -A
git commit -m "feat(webmcp): complete A2A coordination primitives

- Add a2a_acquire_lock tool for distributed locking
- Add a2a_release_lock tool for lock release
- Add a2a_barrier_enter tool for synchronization
- Add comprehensive coordination tests (8 new tests)
- Update test page with coordination UI

Total WebMCP tools: 14
- Phase A: 4 tools (navigate_map, get_os_state, execute_pixel_program, load_rts_cartridge)
- Phase B: 4 tools (query_hilbert_address, trigger_evolution, send_llm_prompt, spawn_area_agent)
- Phase D: 3 A2A tools (a2a_send_message, a2a_broadcast, a2a_subscribe)
- Phase D: 3 coordination tools (a2a_acquire_lock, a2a_release_lock, a2a_barrier_enter)"
```

---

## Success Criteria

1. ✅ `a2a_acquire_lock` tool registered and functional
2. ✅ `a2a_release_lock` tool registered and functional
3. ✅ `a2a_barrier_enter` tool registered and functional
4. ✅ 8 new Python tests for coordination primitives pass
5. ✅ Test page has coordination UI
6. ✅ JavaScript syntax valid
7. ✅ All changes committed

---

## References

- A2A Router Backend: `systems/pixel_compiler/a2a_router.py` (lines 734-880)
- Phase D Design: `docs/plans/2026-02-13-webmcp-phase-d-design.md`
- A2A Integration Plan: `docs/plans/2026-02-13-a2a-area-agent-integration.md`
