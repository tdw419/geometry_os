# A2A Area Agent Integration Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Integrate A2A Router with spawned area agents so they can discover peers, send messages, and coordinate via the A2A protocol.

**Architecture:** Extend the existing `spawn_area_agent` WebMCP tool to initialize an A2A client for each spawned agent. The agent will auto-register with the A2A Router backend, enabling peer-to-peer communication with other spawned agents.

**Tech Stack:** JavaScript (WebMCP Bridge), Python (A2A Router), WebSocket, JSON messaging

---

## Prerequisites

- ✅ A2A Router backend exists: `systems/pixel_compiler/a2a_router.py`
- ✅ A2A Router client exists: `systems/visual_shell/web/a2a_router_client.js`
- ✅ A2A Router tests exist: `systems/pixel_compiler/tests/test_a2a_router.py`
- ✅ Reliability features complete: Circuit Breaker, Retry, Health Monitoring

---

## Task 1: Add A2A Integration to spawn_area_agent

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js` (spawn_area_agent handler)
- Test: `systems/visual_shell/web/test_a2a_integration.html` (new)

**Step 1: Check current spawn_area_agent implementation**

Run: `grep -n "spawn_area_agent" systems/visual_shell/web/webmcp_bridge.js | head -20`

Expected: Find the handler around line 1200-1400

**Step 2: Add A2A configuration option to spawn_area_agent schema**

In `webmcp_bridge.js`, find the `#registerSpawnAreaAgent` method and update the inputSchema:

```javascript
// Add to inputSchema properties (after monitor_interval):
a2a_config: {
    type: 'object',
    description: 'A2A protocol configuration for agent communication',
    properties: {
        enabled: { type: 'boolean', default: true },
        auto_discover: { type: 'boolean', default: true },
        topics: {
            type: 'array',
            items: { type: 'string' },
            description: 'Topics to subscribe to (e.g., ["region_updates", "alerts"])'
        }
    }
}
```

**Step 3: Add A2A client initialization in spawn_area_agent handler**

In the `#handleSpawnAreaAgent` method, after creating the agent:

```javascript
// After agent creation, initialize A2A if enabled
if (params.a2a_config?.enabled !== false) {
    try {
        const a2aClient = new A2AMessageRouter(agentId, {
            wsUrl: 'ws://localhost:8766',
            ...params.a2a_config
        });

        await a2aClient.connect();

        // Subscribe to topics
        if (params.a2a_config?.topics) {
            for (const topic of params.a2a_config.topics) {
                await a2aClient.subscribe(topic);
            }
        }

        // Store A2A client reference for later use
        this.#agentA2AClients = this.#agentA2AClients || new Map();
        this.#agentA2AClients.set(agentId, a2aClient);

        console.log(`🤝 WebMCP: A2A enabled for agent ${agentId}`);
    } catch (a2aErr) {
        console.warn(`🤝 WebMCP: A2A connection failed for ${agentId}:`, a2aErr.message);
        // Non-fatal - agent still functions without A2A
    }
}
```

**Step 4: Add private field for A2A clients**

At the top of the WebMCPBridge class, add:

```javascript
/** @type {Map<string, A2AMessageRouter>} */
#agentA2AClients = new Map();
```

**Step 5: Verify syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js`

Expected: No syntax errors

**Step 6: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add A2A integration to spawn_area_agent tool"
```

---

## Task 2: Add get_a2a_client Helper Method

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Add getter method for A2A client**

Add after the spawn_area_agent handler:

```javascript
/**
 * Get the A2A client for a specific agent
 * @param {string} agentId - Agent ID
 * @returns {A2AMessageRouter|null} A2A client or null if not connected
 */
getAgentA2AClient(agentId) {
    return this.#agentA2AClients.get(agentId) || null;
}

/**
 * Get all agents with active A2A connections
 * @returns {string[]} List of agent IDs with A2A enabled
 */
getAgentsWithA2A() {
    return Array.from(this.#agentA2AClients.keys());
}
```

**Step 2: Verify syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js`

Expected: No syntax errors

**Step 3: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add getAgentA2AClient helper methods"
```

---

## Task 3: Create A2A Integration Test Page

**Files:**
- Create: `systems/visual_shell/web/test_a2a_integration.html`

**Step 1: Create the test page**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WebMCP A2A Area Agent Integration Test</title>
    <style>
        body {
            font-family: 'Courier New', monospace;
            background: #0a0a0f;
            color: #00ff88;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        h1 { color: #00ffff; border-bottom: 1px solid #333; padding-bottom: 10px; }
        h2 { color: #ff00ff; margin-top: 30px; }
        .test-section {
            background: #111;
            border: 1px solid #333;
            padding: 15px;
            margin: 10px 0;
            border-radius: 4px;
        }
        .test-result {
            padding: 10px;
            margin: 5px 0;
            border-radius: 4px;
        }
        .pass { background: #001a00; border-left: 3px solid #00ff00; }
        .fail { background: #1a0000; border-left: 3px solid #ff0000; }
        .pending { background: #1a1a00; border-left: 3px solid #ffff00; }
        button {
            background: #222;
            color: #00ff88;
            border: 1px solid #00ff88;
            padding: 8px 16px;
            cursor: pointer;
            margin: 5px;
            font-family: inherit;
        }
        button:hover { background: #00ff88; color: #000; }
        pre {
            background: #000;
            padding: 10px;
            overflow-x: auto;
            font-size: 12px;
        }
        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        #agent-list {
            min-height: 100px;
            background: #000;
            padding: 10px;
            border-radius: 4px;
        }
        .agent-card {
            background: #111;
            border: 1px solid #333;
            padding: 10px;
            margin: 5px 0;
            border-radius: 4px;
        }
        .agent-card.has-a2a { border-color: #00ff88; }
    </style>
</head>
<body>
    <h1>🤝 WebMCP A2A Area Agent Integration Test</h1>

    <div class="test-section">
        <h2>Prerequisites</h2>
        <div id="prereq-results"></div>
    </div>

    <div class="test-section">
        <h2>Spawn Agents with A2A</h2>
        <div class="grid">
            <div>
                <h3>Agent 1 (Monitor)</h3>
                <button onclick="spawnAgent1()">Spawn Monitor Agent</button>
                <div id="agent1-result"></div>
            </div>
            <div>
                <h3>Agent 2 (Executor)</h3>
                <button onclick="spawnAgent2()">Spawn Executor Agent</button>
                <div id="agent2-result"></div>
            </div>
        </div>
    </div>

    <div class="test-section">
        <h2>Active Agents</h2>
        <div id="agent-list">No agents spawned yet</div>
        <button onclick="refreshAgentList()">Refresh List</button>
    </div>

    <div class="test-section">
        <h2>A2A Integration Tests</h2>
        <div id="integration-results"></div>
        <button onclick="runIntegrationTests()">Run Integration Tests</button>
    </div>

    <div id="summary" style="margin-top: 20px; padding: 20px; background: #111;">
        <strong>Test Summary:</strong> <span id="summary-text">Run tests to see results</span>
    </div>

    <script src="webmcp_bridge.js"></script>
    <script src="a2a_router_client.js"></script>
    <script>
        const results = { passed: 0, failed: 0, pending: 0 };
        let spawnedAgents = [];

        function updateSummary() {
            document.getElementById('summary-text').innerHTML =
                `<span style="color:#00ff00">${results.passed} passed</span> | ` +
                `<span style="color:#ff0000">${results.failed} failed</span> | ` +
                `<span style="color:#ffff00">${results.pending} pending</span>`;
        }

        function addResult(containerId, test, status, message = '') {
            const container = document.getElementById(containerId);
            const div = document.createElement('div');
            div.className = `test-result ${status}`;
            div.innerHTML = `<strong>${test}</strong>: ${status.toUpperCase()}${message ? `<br><pre>${message}</pre>` : ''}`;
            container.appendChild(div);
            results[status === 'pass' ? 'passed' : status === 'fail' ? 'failed' : 'pending']++;
            updateSummary();
        }

        async function testPrerequisites() {
            const container = 'prereq-results';

            // Check WebMCP Bridge
            const bridgeReady = typeof window.webmcpBridge !== 'undefined';
            addResult(container, 'WebMCP Bridge loaded', bridgeReady ? 'pass' : 'fail');

            // Check A2A Client
            const a2aReady = typeof A2AMessageRouter !== 'undefined';
            addResult(container, 'A2A Router Client loaded', a2aReady ? 'pass' : 'fail');

            // Check A2A Router backend (WebSocket)
            try {
                const ws = new WebSocket('ws://localhost:8766');
                await new Promise((resolve, reject) => {
                    ws.onopen = () => { ws.close(); resolve(); };
                    ws.onerror = () => reject(new Error('Connection failed'));
                    setTimeout(() => reject(new Error('Timeout')), 3000);
                });
                addResult(container, 'A2A Router backend reachable', 'pass');
            } catch (e) {
                addResult(container, 'A2A Router backend reachable', 'pending',
                    'Backend not running (start with: python systems/pixel_compiler/a2a_router.py)');
            }

            return bridgeReady && a2aReady;
        }

        async function spawnAgent1() {
            const container = 'agent1-result';
            document.getElementById(container).innerHTML = '<div class="test-result pending">Spawning...</div>';

            try {
                const result = await navigator.modelContext.callTool('spawn_area_agent', {
                    agent_type: 'monitor',
                    region: { x: 0, y: 0, width: 100, height: 100 },
                    a2a_config: {
                        enabled: true,
                        topics: ['region_updates', 'alerts']
                    }
                });

                if (result.success) {
                    spawnedAgents.push({ id: result.agent_id, type: 'monitor' });
                    document.getElementById(container).innerHTML =
                        `<div class="test-result pass">
                            Agent spawned: ${result.agent_id}<br>
                            A2A: ${result.a2a_enabled ? 'Enabled' : 'Disabled'}
                        </div>`;
                    refreshAgentList();
                } else {
                    document.getElementById(container).innerHTML =
                        `<div class="test-result fail">${result.error}</div>`;
                }
            } catch (e) {
                document.getElementById(container).innerHTML =
                    `<div class="test-result fail">Error: ${e.message}</div>`;
            }
        }

        async function spawnAgent2() {
            const container = 'agent2-result';
            document.getElementById(container).innerHTML = '<div class="test-result pending">Spawning...</div>';

            try {
                const result = await navigator.modelContext.callTool('spawn_area_agent', {
                    agent_type: 'executor',
                    region: { x: 100, y: 0, width: 100, height: 100 },
                    a2a_config: {
                        enabled: true,
                        topics: ['region_updates']
                    }
                });

                if (result.success) {
                    spawnedAgents.push({ id: result.agent_id, type: 'executor' });
                    document.getElementById(container).innerHTML =
                        `<div class="test-result pass">
                            Agent spawned: ${result.agent_id}<br>
                            A2A: ${result.a2a_enabled ? 'Enabled' : 'Disabled'}
                        </div>`;
                    refreshAgentList();
                } else {
                    document.getElementById(container).innerHTML =
                        `<div class="test-result fail">${result.error}</div>`;
                }
            } catch (e) {
                document.getElementById(container).innerHTML =
                    `<div class="test-result fail">Error: ${e.message}</div>`;
            }
        }

        function refreshAgentList() {
            const container = document.getElementById('agent-list');

            if (spawnedAgents.length === 0) {
                container.innerHTML = 'No agents spawned yet';
                return;
            }

            const agentsWithA2A = window.webmcpBridge?.getAgentsWithA2A() || [];

            container.innerHTML = spawnedAgents.map(agent => {
                const hasA2A = agentsWithA2A.includes(agent.id);
                return `<div class="agent-card ${hasA2A ? 'has-a2a' : ''}">
                    <strong>${agent.id}</strong><br>
                    Type: ${agent.type}<br>
                    A2A: ${hasA2A ? '✅ Connected' : '❌ Not connected'}
                </div>`;
            }).join('');
        }

        async function runIntegrationTests() {
            const container = 'integration-results';
            container.innerHTML = '';
            results.passed = 0; results.failed = 0; results.pending = 0;

            // Test 1: Agents can be spawned with A2A
            addResult(container, 'Agents spawned with A2A config',
                spawnedAgents.length >= 2 ? 'pass' : 'pending',
                `${spawnedAgents.length}/2 agents`);

            // Test 2: A2A clients are registered
            const agentsWithA2A = window.webmcpBridge?.getAgentsWithA2A() || [];
            addResult(container, 'A2A clients registered',
                agentsWithA2A.length >= 2 ? 'pass' : 'pending',
                `${agentsWithA2A.length}/2 connected`);

            // Test 3: getAgentA2AClient returns valid client
            if (spawnedAgents.length > 0) {
                const client = window.webmcpBridge?.getAgentA2AClient(spawnedAgents[0].id);
                addResult(container, 'getAgentA2AClient returns client',
                    client ? 'pass' : 'fail');
            }

            // Test 4: A2A client has expected methods
            if (spawnedAgents.length > 0) {
                const client = window.webmcpBridge?.getAgentA2AClient(spawnedAgents[0].id);
                if (client) {
                    const hasMethods = typeof client.send === 'function' &&
                                      typeof client.discover === 'function' &&
                                      typeof client.subscribe === 'function';
                    addResult(container, 'A2A client has expected methods',
                        hasMethods ? 'pass' : 'fail');
                }
            }

            updateSummary();
        }

        // Auto-run prerequisites on load
        window.addEventListener('load', () => {
            setTimeout(testPrerequisites, 500);
        });
    </script>
</body>
</html>
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/test_a2a_integration.html
git commit -m "test(webmcp): add A2A Area Agent integration test page"
```

---

## Task 4: Add A2A Integration Python Tests

**Files:**
- Modify: `systems/pixel_compiler/tests/test_a2a_router.py`

**Step 1: Add integration test class**

Append to `test_a2a_router.py`:

```python


class TestA2AAreaAgentIntegration:
    """Tests for A2A integration with spawned area agents."""

    @pytest.fixture
    def router(self):
        """Create a fresh A2A router for each test."""
        return A2ARouter()

    @pytest.mark.asyncio
    async def test_agent_auto_register_on_connect(self, router):
        """Agent is automatically registered when connecting to router."""
        mock_conn = AsyncMock()

        # Simulate agent connecting
        await router.register_agent(
            "area-agent-001",
            mock_conn,
            {
                "agent_type": "monitor",
                "region": {"x": 0, "y": 0, "width": 100, "height": 100},
                "capabilities": ["scan", "detect"]
            }
        )

        # Verify registration
        assert "area-agent-001" in router.peer_registry
        assert router.peer_registry["area-agent-001"].agent_type == "monitor"

    @pytest.mark.asyncio
    async def test_multiple_agents_can_discover_each_other(self, router):
        """Multiple spawned agents can discover each other."""
        # Spawn multiple agents
        for i in range(3):
            await router.register_agent(
                f"area-agent-{i:03d}",
                AsyncMock(),
                {
                    "agent_type": "monitor" if i < 2 else "executor",
                    "region": {"x": i * 100, "y": 0, "width": 100, "height": 100}
                }
            )

        # Discover monitors
        monitors = await router.discover_peers(agent_type="monitor")
        assert len(monitors) == 2

        # Discover executors
        executors = await router.discover_peers(agent_type="executor")
        assert len(executors) == 1

    @pytest.mark.asyncio
    async def test_agents_in_adjacent_regions_can_communicate(self, router):
        """Agents in overlapping/adjacent regions can find each other."""
        # Agent 1: region (0,0) to (100,100)
        await router.register_agent(
            "agent-left",
            AsyncMock(),
            {
                "agent_type": "monitor",
                "region": {"x": 0, "y": 0, "width": 100, "height": 100}
            }
        )

        # Agent 2: region (90,0) to (190,100) - overlaps with Agent 1
        await router.register_agent(
            "agent-right",
            AsyncMock(),
            {
                "agent_type": "monitor",
                "region": {"x": 90, "y": 0, "width": 100, "height": 100}
            }
        )

        # Find agents overlapping with agent-left's region
        overlapping = await router.discover_peers(
            region_overlaps={"x": 0, "y": 0, "width": 100, "height": 100}
        )

        # Should find both (agent-left and overlapping agent-right)
        assert len(overlapping) == 2

    @pytest.mark.asyncio
    async def test_agent_broadcast_to_type(self, router):
        """Agent can broadcast to all agents of a specific type."""
        mock_monitor = AsyncMock()
        mock_executor = AsyncMock()

        await router.register_agent("sender", AsyncMock(), {"agent_type": "coordinator"})
        await router.register_agent("monitor-1", mock_monitor, {"agent_type": "monitor"})
        await router.register_agent("executor-1", mock_executor, {"agent_type": "executor"})

        # Broadcast to monitors only
        result = await router.broadcast(
            "sender",
            agent_type="monitor",
            message={"message_type": "task_available"}
        )

        assert result["delivered_count"] == 1
        # Monitor should have received message
        mock_monitor.send.assert_called_once()
        # Executor should NOT have received message
        mock_executor.send.assert_not_called()
```

**Step 2: Run tests to verify they pass**

Run: `python -m pytest systems/pixel_compiler/tests/test_a2a_router.py -v`

Expected: All tests pass (including new integration tests)

**Step 3: Commit**

```bash
git add systems/pixel_compiler/tests/test_a2a_router.py
git commit -m "test(a2a): add Area Agent integration tests"
```

---

## Task 5: Final Verification

**Step 1: Run all Python tests**

Run: `python -m pytest systems/pixel_compiler/tests/test_a2a_router.py -v`

Expected: All tests pass

**Step 2: Verify JavaScript syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js && node --check systems/visual_shell/web/a2a_router_client.js`

Expected: No syntax errors

**Step 3: Verify test page exists**

Run: `ls -la systems/visual_shell/web/test_a2a_integration.html`

Expected: File exists

**Step 4: Final commit (if any uncommitted changes)**

```bash
git add -A
git commit -m "feat(webmcp): complete A2A Area Agent integration

- Add A2A config option to spawn_area_agent tool
- Auto-initialize A2A client for spawned agents
- Add getAgentA2AClient helper methods
- Create A2A integration test page
- Add Python integration tests for multi-agent scenarios

Area agents can now:
- Discover peers by type/region
- Send direct messages via A2A
- Broadcast to agent types
- Subscribe to topics"
```

---

## Success Criteria

1. ✅ `spawn_area_agent` accepts `a2a_config` parameter
2. ✅ Spawned agents auto-connect to A2A router
3. ✅ `getAgentA2AClient(agentId)` returns A2A client
4. ✅ `getAgentsWithA2A()` returns list of connected agents
5. ✅ Integration test page validates A2A functionality
6. ✅ Python tests cover multi-agent scenarios
7. ✅ All tests pass
8. ✅ JavaScript syntax valid

---

## References

- A2A Router: `systems/pixel_compiler/a2a_router.py`
- A2A Client: `systems/visual_shell/web/a2a_router_client.js`
- Phase D Design: `docs/plans/2026-02-13-webmcp-phase-d-design.md`
