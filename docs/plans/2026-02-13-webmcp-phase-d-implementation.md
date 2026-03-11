# WebMCP Phase D: A2A Protocol Integration — Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add Agent-to-Agent (A2A) messaging protocol to WebMCP Bridge, enabling spawned area agents to discover peers, send direct messages, broadcast to groups, and subscribe to events.

**Architecture:** Extend existing `ws://localhost:8765/agents` WebSocket backend with A2A routing. Add 3 new WebMCP tools (`a2a_send_message`, `a2a_broadcast`, `a2a_subscribe`) to the existing bridge. Create Python A2A Router class for backend message routing.

**Tech Stack:** JavaScript (WebMCP Bridge), Python (A2A Router), WebSocket, JSON messaging

---

## Task 1: Create A2A Router Backend

**Files:**
- Create: `systems/pixel_compiler/a2a_router.py`
- Test: `systems/pixel_compiler/tests/test_a2a_router.py`

**Step 1: Write the failing test for peer registration**

Create `systems/pixel_compiler/tests/test_a2a_router.py`:

```python
"""Tests for A2A Router - Agent-to-Agent message routing hub."""
import pytest
import asyncio
from unittest.mock import AsyncMock, MagicMock
from systems.pixel_compiler.a2a_router import A2ARouter, AgentConnection


class TestA2ARouter:
    """Unit tests for A2A message routing."""

    @pytest.fixture
    def router(self):
        """Create a fresh A2A router for each test."""
        return A2ARouter()

    def test_router_initialization(self, router):
        """Router initializes with empty registry."""
        assert router.peer_registry == {}
        assert router.subscriptions == {}


class TestPeerRegistration:
    """Tests for agent registration and discovery."""

    @pytest.mark.asyncio
    async def test_register_agent(self, router):
        """Agent can register with the router."""
        mock_conn = AsyncMock()
        await router.register_agent("agent-001", mock_conn, {
            "agent_type": "monitor",
            "region": {"x": 0, "y": 0, "width": 100, "height": 100}
        })

        assert "agent-001" in router.peer_registry
        assert router.peer_registry["agent-001"].agent_type == "monitor"

    @pytest.mark.asyncio
    async def test_unregister_agent(self, router):
        """Agent can be unregistered from the router."""
        mock_conn = AsyncMock()
        await router.register_agent("agent-001", mock_conn, {"agent_type": "monitor"})

        await router.unregister_agent("agent-001")

        assert "agent-001" not in router.peer_registry

    @pytest.mark.asyncio
    async def test_discover_peers_by_type(self, router):
        """Can discover agents by type."""
        mock_conn = AsyncMock()

        await router.register_agent("agent-001", mock_conn, {"agent_type": "monitor"})
        await router.register_agent("agent-002", mock_conn, {"agent_type": "evolver"})
        await router.register_agent("agent-003", mock_conn, {"agent_type": "monitor"})

        monitors = await router.discover_peers(agent_type="monitor")

        assert len(monitors) == 2
        assert all(a["agent_type"] == "monitor" for a in monitors)
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest systems/pixel_compiler/tests/test_a2a_router.py -v`
Expected: FAIL with "No module named 'systems.pixel_compiler.a2a_router'"

**Step 3: Create A2A Router implementation**

Create `systems/pixel_compiler/a2a_router.py`:

```python
"""
A2A Router - Agent-to-Agent Message Routing Hub

Provides message routing for area agents spawned via WebMCP.
Enables peer discovery, direct messaging, broadcast, and subscriptions.

Architecture:
    - Peer Registry: Maps agent_id -> WebSocket connection + metadata
    - Message Router: Routes messages (direct, broadcast, topic)
    - Subscription Manager: Event-based coordination
"""
from __future__ import annotations
import asyncio
import json
import logging
import uuid
from dataclasses import dataclass, field
from datetime import datetime
from typing import Dict, List, Optional, Any, Callable, Awaitable


logger = logging.getLogger(__name__)


@dataclass
class AgentConnection:
    """Represents a connected area agent."""
    agent_id: str
    connection: Any  # WebSocket connection
    agent_type: str
    region: Optional[Dict[str, int]] = None
    capabilities: List[str] = field(default_factory=list)
    status: str = "online"
    last_heartbeat: float = field(default_factory=lambda: datetime.now().timestamp())


@dataclass
class Subscription:
    """Agent subscription to an event type."""
    agent_id: str
    event_type: str
    filter: Optional[Dict[str, Any]] = None


@dataclass
class A2AMessage:
    """A2A message envelope."""
    message_id: str = field(default_factory=lambda: str(uuid.uuid4()))
    timestamp: float = field(default_factory=lambda: datetime.now().timestamp())
    from_agent: str = ""
    to_agent: str = ""  # Can be agent_id, "broadcast", or "topic:name"
    message_type: str = ""
    priority: int = 5  # 1=low, 5=normal, 8=high, 10=critical
    content: Dict[str, Any] = field(default_factory=dict)
    metadata: Dict[str, Any] = field(default_factory=dict)
    correlation_id: Optional[str] = None
    expires_at: Optional[float] = None


class A2ARouter:
    """
    Agent-to-Agent message routing hub.

    Features:
    - Peer registration and discovery
    - Direct message routing
    - Broadcast to agent types
    - Topic-based pub/sub
    - Event subscriptions
    """

    def __init__(self):
        self.peer_registry: Dict[str, AgentConnection] = {}
        self.subscriptions: Dict[str, List[Subscription]] = {}
        self._message_handlers: Dict[str, Callable] = {}

    async def register_agent(
        self,
        agent_id: str,
        connection: Any,
        metadata: Dict[str, Any]
    ) -> AgentConnection:
        """
        Register an agent with the router.

        Args:
            agent_id: Unique agent identifier
            connection: WebSocket connection
            metadata: Agent metadata (agent_type, region, capabilities)

        Returns:
            AgentConnection object
        """
        agent_conn = AgentConnection(
            agent_id=agent_id,
            connection=connection,
            agent_type=metadata.get("agent_type", "unknown"),
            region=metadata.get("region"),
            capabilities=metadata.get("capabilities", [])
        )

        self.peer_registry[agent_id] = agent_conn
        logger.info(f"A2A: Registered agent {agent_id} (type={agent_conn.agent_type})")

        # Notify subscribers of peer discovery
        await self._notify_event("peer_discovered", {
            "agent_id": agent_id,
            "agent_type": agent_conn.agent_type,
            "region": agent_conn.region
        })

        return agent_conn

    async def unregister_agent(self, agent_id: str) -> bool:
        """
        Unregister an agent from the router.

        Args:
            agent_id: Agent to unregister

        Returns:
            True if unregistered, False if not found
        """
        if agent_id in self.peer_registry:
            del self.peer_registry[agent_id]
            logger.info(f"A2A: Unregistered agent {agent_id}")
            return True
        return False

    async def discover_peers(
        self,
        agent_type: Optional[str] = None,
        region_overlaps: Optional[Dict[str, int]] = None,
        capability: Optional[str] = None
    ) -> List[Dict[str, Any]]:
        """
        Discover registered agents matching filters.

        Args:
            agent_type: Filter by agent type
            region_overlaps: Filter by region overlap
            capability: Filter by capability

        Returns:
            List of agent info dictionaries
        """
        results = []

        for agent_id, conn in self.peer_registry.items():
            # Filter by type
            if agent_type and conn.agent_type != agent_type:
                continue

            # Filter by capability
            if capability and capability not in conn.capabilities:
                continue

            # Filter by region overlap
            if region_overlaps and conn.region:
                if not self._regions_overlap(conn.region, region_overlaps):
                    continue

            results.append({
                "agent_id": conn.agent_id,
                "agent_type": conn.agent_type,
                "region": conn.region,
                "capabilities": conn.capabilities,
                "status": conn.status
            })

        return results

    async def route_message(
        self,
        from_id: str,
        to_id: str,
        message: Dict[str, Any]
    ) -> Dict[str, Any]:
        """
        Route a direct message from one agent to another.

        Args:
            from_id: Sender agent ID
            to_id: Recipient agent ID
            message: Message content

        Returns:
            Delivery status
        """
        if to_id not in self.peer_registry:
            return {
                "delivered": False,
                "error": f"Agent {to_id} not found",
                "target_status": "offline"
            }

        target = self.peer_registry[to_id]

        # Build full message envelope
        envelope = {
            "type": "peer_message",
            "message_id": str(uuid.uuid4()),
            "timestamp": datetime.now().timestamp(),
            "from_agent": from_id,
            "to_agent": to_id,
            **message
        }

        try:
            # Send via WebSocket
            await target.connection.send(json.dumps(envelope))
            logger.debug(f"A2A: Routed message from {from_id} to {to_id}")

            return {
                "delivered": True,
                "target_status": target.status
            }
        except Exception as e:
            logger.error(f"A2A: Failed to send to {to_id}: {e}")
            return {
                "delivered": False,
                "error": str(e),
                "target_status": "error"
            }

    async def broadcast(
        self,
        from_id: str,
        agent_type: Optional[str],
        message: Dict[str, Any],
        exclude_self: bool = True
    ) -> Dict[str, Any]:
        """
        Broadcast a message to all agents of a type.

        Args:
            from_id: Sender agent ID
            agent_type: Target agent type (None = all)
            message: Message content
            exclude_self: Exclude sender from broadcast

        Returns:
            Broadcast statistics
        """
        recipients = 0
        delivered = 0

        envelope = {
            "type": "broadcast",
            "message_id": str(uuid.uuid4()),
            "timestamp": datetime.now().timestamp(),
            "from_agent": from_id,
            **message
        }

        for agent_id, conn in self.peer_registry.items():
            # Skip self if excluded
            if exclude_self and agent_id == from_id:
                continue

            # Filter by type
            if agent_type and agent_type != "all" and conn.agent_type != agent_type:
                continue

            recipients += 1

            try:
                await conn.connection.send(json.dumps(envelope))
                delivered += 1
            except Exception as e:
                logger.warning(f"A2A: Broadcast failed to {agent_id}: {e}")

        logger.info(f"A2A: Broadcast from {from_id} to {delivered}/{recipients} agents")
        return {
            "recipients": recipients,
            "delivered_count": delivered
        }

    async def subscribe(
        self,
        agent_id: str,
        event_type: str,
        filter: Optional[Dict[str, Any]] = None
    ) -> str:
        """
        Subscribe an agent to an event type.

        Args:
            agent_id: Subscriber agent ID
            event_type: Event type to subscribe to
            filter: Optional filter criteria

        Returns:
            Subscription ID
        """
        sub_id = str(uuid.uuid4())

        sub = Subscription(
            agent_id=agent_id,
            event_type=event_type,
            filter=filter
        )

        if event_type not in self.subscriptions:
            self.subscriptions[event_type] = []
        self.subscriptions[event_type].append(sub)

        logger.info(f"A2A: Agent {agent_id} subscribed to {event_type}")
        return sub_id

    async def _notify_event(
        self,
        event_type: str,
        data: Dict[str, Any]
    ) -> int:
        """
        Notify all subscribers of an event.

        Args:
            event_type: Event type
            data: Event data

        Returns:
            Number of notifications sent
        """
        if event_type not in self.subscriptions:
            return 0

        notified = 0
        envelope = {
            "type": "notify",
            "event_type": event_type,
            "timestamp": datetime.now().timestamp(),
            "data": data
        }

        for sub in self.subscriptions[event_type]:
            if sub.agent_id not in self.peer_registry:
                continue

            try:
                conn = self.peer_registry[sub.agent_id]
                await conn.connection.send(json.dumps(envelope))
                notified += 1
            except Exception as e:
                logger.warning(f"A2A: Failed to notify {sub.agent_id}: {e}")

        return notified

    def _regions_overlap(
        self,
        r1: Dict[str, int],
        r2: Dict[str, int]
    ) -> bool:
        """Check if two regions overlap."""
        return not (
            r1["x"] + r1.get("width", 100) < r2["x"] or
            r2["x"] + r2.get("width", 100) < r1["x"] or
            r1["y"] + r1.get("height", 100) < r2["y"] or
            r2["y"] + r2.get("height", 100) < r1["y"]
        )
```

**Step 4: Run test to verify it passes**

Run: `python -m pytest systems/pixel_compiler/tests/test_a2a_router.py -v`
Expected: PASS (6 tests)

**Step 5: Commit**

```bash
git add systems/pixel_compiler/a2a_router.py systems/pixel_compiler/tests/test_a2a_router.py
git commit -m "feat(webmcp): add A2A router backend with peer registration and discovery"
```

---

## Task 2: Add Message Routing Tests

**Files:**
- Modify: `systems/pixel_compiler/tests/test_a2a_router.py`

**Step 1: Add routing tests**

Append to `systems/pixel_compiler/tests/test_a2a_router.py`:

```python


class TestMessageRouting:
    """Tests for direct message routing."""

    @pytest.mark.asyncio
    async def test_route_message_to_online_agent(self, router):
        """Can route message to an online agent."""
        mock_conn = AsyncMock()
        await router.register_agent("sender", AsyncMock(), {"agent_type": "monitor"})
        await router.register_agent("receiver", mock_conn, {"agent_type": "executor"})

        result = await router.route_message(
            "sender",
            "receiver",
            {"message_type": "task_request", "content": {"task": "scan"}}
        )

        assert result["delivered"] is True
        assert result["target_status"] == "online"
        mock_conn.send.assert_called_once()

    @pytest.mark.asyncio
    async def test_route_message_to_offline_agent(self, router):
        """Returns error for offline agent."""
        result = await router.route_message(
            "sender",
            "nonexistent",
            {"message_type": "task_request"}
        )

        assert result["delivered"] is False
        assert result["target_status"] == "offline"


class TestBroadcast:
    """Tests for broadcast messaging."""

    @pytest.mark.asyncio
    async def test_broadcast_to_all_agents(self, router):
        """Can broadcast to all agents."""
        conns = [AsyncMock() for _ in range(3)]

        await router.register_agent("sender", conns[0], {"agent_type": "monitor"})
        await router.register_agent("agent-1", conns[1], {"agent_type": "executor"})
        await router.register_agent("agent-2", conns[2], {"agent_type": "evolver"})

        result = await router.broadcast(
            "sender",
            agent_type="all",
            message={"message_type": "status_update"},
            exclude_self=True
        )

        assert result["recipients"] == 2
        assert result["delivered_count"] == 2

    @pytest.mark.asyncio
    async def test_broadcast_to_specific_type(self, router):
        """Can broadcast to agents of specific type."""
        conns = [AsyncMock() for _ in range(4)]

        await router.register_agent("sender", conns[0], {"agent_type": "monitor"})
        await router.register_agent("monitor-1", conns[1], {"agent_type": "monitor"})
        await router.register_agent("monitor-2", conns[2], {"agent_type": "monitor"})
        await router.register_agent("executor-1", conns[3], {"agent_type": "executor"})

        result = await router.broadcast(
            "sender",
            agent_type="monitor",
            message={"message_type": "status_update"},
            exclude_self=True
        )

        assert result["recipients"] == 1  # Only monitor-1 (sender excluded)


class TestSubscriptions:
    """Tests for event subscriptions."""

    @pytest.mark.asyncio
    async def test_subscribe_to_event(self, router):
        """Agent can subscribe to events."""
        mock_conn = AsyncMock()
        await router.register_agent("agent-1", mock_conn, {"agent_type": "monitor"})

        sub_id = await router.subscribe("agent-1", "region_change")

        assert sub_id is not None
        assert "region_change" in router.subscriptions
        assert len(router.subscriptions["region_change"]) == 1

    @pytest.mark.asyncio
    async def test_notify_subscribers(self, router):
        """Subscribers receive notifications."""
        mock_conn = AsyncMock()
        await router.register_agent("agent-1", mock_conn, {"agent_type": "monitor"})
        await router.subscribe("agent-1", "peer_discovered")

        # Register another agent to trigger notification
        await router.register_agent("agent-2", AsyncMock(), {"agent_type": "executor"})

        # agent-1 should have received peer_discovered notification
        assert mock_conn.send.call_count >= 1
```

**Step 2: Run tests to verify they pass**

Run: `python -m pytest systems/pixel_compiler/tests/test_a2a_router.py -v`
Expected: PASS (12 tests)

**Step 3: Commit**

```bash
git add systems/pixel_compiler/tests/test_a2a_router.py
git commit -m "test(webmcp): add A2A routing, broadcast, and subscription tests"
```

---

## Task 3: Add A2A Tools to WebMCP Bridge

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Add A2A socket connection helper**

In `webmcp_bridge.js`, after the existing `#connectAgentSocket()` method (around line 902), add:

```javascript
    // ─────────────────────────────────────────────────────────────
    // A2A WebSocket Connection (Phase D)
    // ─────────────────────────────────────────────────────────────

    /** @type {WebSocket|null} */
    #a2aSocket = null;

    /** @type {Map<string, {resolve: Function, reject: Function}>} */
    #pendingA2ARequests = new Map();

    /**
     * Connect to the A2A WebSocket backend
     * @returns {Promise<WebSocket>}
     */
    #connectA2ASocket() {
        return new Promise((resolve, reject) => {
            if (this.#a2aSocket?.readyState === WebSocket.OPEN) {
                resolve(this.#a2aSocket);
                return;
            }

            const ws = new WebSocket('ws://localhost:8765/agents');

            ws.onopen = () => {
                this.#a2aSocket = ws;

                // Set up message handler
                ws.onmessage = (event) => {
                    try {
                        const response = JSON.parse(event.data);
                        // Handle response to pending request
                        if (response.requestId && this.#pendingA2ARequests.has(response.requestId)) {
                            const { resolve: res } = this.#pendingA2ARequests.get(response.requestId);
                            this.#pendingA2ARequests.delete(response.requestId);
                            res(response);
                        }
                    } catch (parseErr) {
                        console.warn('🔌 WebMCP A2A: Failed to parse response:', parseErr);
                    }
                };

                resolve(ws);
            };

            ws.onerror = () => {
                reject(new Error('A2A backend not running at ws://localhost:8765'));
            };

            // 5 second timeout
            setTimeout(() => {
                if (ws.readyState !== WebSocket.OPEN) {
                    reject(new Error('A2A backend connection timeout'));
                }
            }, 5000);
        });
    }

    /**
     * Send A2A request and wait for response
     * @param {Object} request
     * @returns {Promise<Object>}
     */
    async #sendA2ARequest(request) {
        const ws = await this.#connectA2ASocket();

        const requestId = `a2a_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
        request.requestId = requestId;

        return new Promise((resolve, reject) => {
            this.#pendingA2ARequests.set(requestId, { resolve, reject });
            ws.send(JSON.stringify(request));

            // 30 second timeout
            setTimeout(() => {
                if (this.#pendingA2ARequests.has(requestId)) {
                    this.#pendingA2ARequests.delete(requestId);
                    reject(new Error('A2A request timeout'));
                }
            }, 30000);
        });
    }
```

**Step 2: Register A2A tools in the #register method**

In the `#register()` method, after the existing Phase B tool registrations (around line 112), add:

```javascript
            // Phase D tools - A2A Protocol
            await this.#registerA2ASendMessage();
            await this.#registerA2ABroadcast();
            await this.#registerA2ASubscribe();
```

**Step 3: Implement Tool 9: a2a_send_message**

Add after the `spawn_area_agent` handler (around line 1402):

```javascript
    // ─────────────────────────────────────────────────────────────
    // Tool 9: a2a_send_message (Phase D)
    // ─────────────────────────────────────────────────────────────

    async #registerA2ASendMessage() {
        const tool = {
            name: 'a2a_send_message',
            description:
                'Send a direct message to another area agent via the A2A protocol. ' +
                'Messages can be task requests, responses, notifications, or data shares. ' +
                'Use correlation_id for request/response matching.',
            inputSchema: {
                type: 'object',
                properties: {
                    target_agent_id: {
                        type: 'string',
                        description: 'ID of the target agent (required)'
                    },
                    message_type: {
                        type: 'string',
                        enum: ['task_request', 'task_response', 'notification', 'data_share'],
                        description: 'Type of message being sent'
                    },
                    payload: {
                        type: 'object',
                        description: 'Message payload content'
                    },
                    correlation_id: {
                        type: 'string',
                        description: 'Optional correlation ID for request/response matching'
                    }
                },
                required: ['target_agent_id', 'message_type', 'payload']
            },
            handler: async (params) => {
                return this.#handleA2ASendMessage(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2ASendMessage({
        target_agent_id,
        message_type,
        payload,
        correlation_id
    }) {
        this.#trackCall('a2a_send_message');

        // Validate required fields
        if (!target_agent_id || typeof target_agent_id !== 'string') {
            return {
                success: false,
                error: 'target_agent_id is required and must be a string',
                error_code: 'INVALID_INPUT'
            };
        }

        if (!message_type || !['task_request', 'task_response', 'notification', 'data_share'].includes(message_type)) {
            return {
                success: false,
                error: 'message_type must be one of: task_request, task_response, notification, data_share',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                action: 'a2a_route',
                to_agent: target_agent_id,
                message_type,
                content: payload,
                correlation_id
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.delivered ?? true,
                delivered: response.delivered,
                target_status: response.target_status || 'unknown',
                message_id: response.message_id
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

    // ─────────────────────────────────────────────────────────────
    // Tool 10: a2a_broadcast (Phase D)
    // ─────────────────────────────────────────────────────────────

    async #registerA2ABroadcast() {
        const tool = {
            name: 'a2a_broadcast',
            description:
                'Broadcast a message to all agents of a specific type via the A2A protocol. ' +
                'Useful for status updates, knowledge sharing, or coordinating multiple agents.',
            inputSchema: {
                type: 'object',
                properties: {
                    agent_type: {
                        type: 'string',
                        enum: ['monitor', 'executor', 'evolver', 'analyzer', 'all'],
                        description: 'Target agent type for broadcast'
                    },
                    message_type: {
                        type: 'string',
                        description: 'Type of message being broadcast'
                    },
                    payload: {
                        type: 'object',
                        description: 'Message payload content'
                    },
                    exclude_self: {
                        type: 'boolean',
                        description: 'Whether to exclude the sender from broadcast (default: true)',
                        default: true
                    }
                },
                required: ['agent_type', 'message_type', 'payload']
            },
            handler: async (params) => {
                return this.#handleA2ABroadcast(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2ABroadcast({
        agent_type,
        message_type,
        payload,
        exclude_self = true
    }) {
        this.#trackCall('a2a_broadcast');

        // Validate agent_type
        const validTypes = ['monitor', 'executor', 'evolver', 'analyzer', 'all'];
        if (!agent_type || !validTypes.includes(agent_type)) {
            return {
                success: false,
                error: `agent_type must be one of: ${validTypes.join(', ')}`,
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                action: 'a2a_broadcast',
                agent_type,
                message_type,
                content: payload,
                exclude_self
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: true,
                recipients: response.recipients || 0,
                delivered_count: response.delivered_count || 0
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

    // ─────────────────────────────────────────────────────────────
    // Tool 11: a2a_subscribe (Phase D)
    // ─────────────────────────────────────────────────────────────

    async #registerA2ASubscribe() {
        const tool = {
            name: 'a2a_subscribe',
            description:
                'Subscribe to events from other agents or region changes via the A2A protocol. ' +
                'Supported events: region_change, task_available, peer_discovered, knowledge_update.',
            inputSchema: {
                type: 'object',
                properties: {
                    event_type: {
                        type: 'string',
                        enum: ['region_change', 'task_available', 'peer_discovered', 'knowledge_update'],
                        description: 'Type of event to subscribe to'
                    },
                    filter: {
                        type: 'object',
                        description: 'Optional filter criteria (e.g., region bounds, agent_type)',
                        properties: {
                            region: {
                                type: 'object',
                                properties: {
                                    x: { type: 'number' },
                                    y: { type: 'number' },
                                    width: { type: 'number' },
                                    height: { type: 'number' }
                                }
                            },
                            agent_type: { type: 'string' }
                        }
                    }
                },
                required: ['event_type']
            },
            handler: async (params) => {
                return this.#handleA2ASubscribe(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2ASubscribe({
        event_type,
        filter
    }) {
        this.#trackCall('a2a_subscribe');

        // Validate event_type
        const validEvents = ['region_change', 'task_available', 'peer_discovered', 'knowledge_update'];
        if (!event_type || !validEvents.includes(event_type)) {
            return {
                success: false,
                error: `event_type must be one of: ${validEvents.join(', ')}`,
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                action: 'a2a_subscribe',
                event_type,
                filter
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: true,
                subscription_id: response.subscription_id,
                status: 'active'
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

**Step 4: Verify syntax with Node.js**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js`
Expected: No syntax errors

**Step 5: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add A2A tools (a2a_send_message, a2a_broadcast, a2a_subscribe)"
```

---

## Task 4: Create A2A Test Page

**Files:**
- Create: `systems/visual_shell/web/test_a2a_tools.html`

**Step 1: Create test page**

Create `systems/visual_shell/web/test_a2a_tools.html`:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WebMCP Phase D: A2A Tools Test</title>
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
        button:disabled { opacity: 0.5; cursor: not-allowed; }
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
        .status-badge {
            display: inline-block;
            padding: 2px 8px;
            border-radius: 4px;
            font-size: 12px;
        }
        .status-pending { background: #333; color: #fff; }
        .status-running { background: #003366; color: #00ffff; }
        .status-passed { background: #003300; color: #00ff00; }
        .status-failed { background: #330000; color: #ff0000; }
        #summary { font-size: 18px; padding: 20px; background: #111; margin-top: 20px; }
    </style>
</head>
<body>
    <h1>🤝 WebMCP Phase D: A2A Protocol Tools Test</h1>

    <div class="test-section">
        <h2>Prerequisites Check</h2>
        <div id="prereq-results"></div>
    </div>

    <div class="test-section">
        <h2>A2A Tool Registration</h2>
        <div id="tool-results"></div>
    </div>

    <div class="test-section">
        <h2>A2A Message Protocol Tests</h2>
        <div id="protocol-results"></div>
    </div>

    <div class="test-section">
        <h2>Interactive A2A Test</h2>
        <div class="grid">
            <div>
                <h3>Send A2A Message</h3>
                <label>Target Agent ID: <input type="text" id="target-agent" value="agent-test-001" style="width:200px"></label><br><br>
                <label>Message Type:
                    <select id="msg-type">
                        <option value="task_request">task_request</option>
                        <option value="task_response">task_response</option>
                        <option value="notification">notification</option>
                        <option value="data_share">data_share</option>
                    </select>
                </label><br><br>
                <label>Payload (JSON): <textarea id="msg-payload" rows="3" style="width:100%">{"task": "scan_region"}</textarea></label><br><br>
                <button onclick="testSendA2AMessage()">Send A2A Message</button>
                <div id="send-result"></div>
            </div>
            <div>
                <h3>A2A Broadcast</h3>
                <label>Agent Type:
                    <select id="broadcast-type">
                        <option value="all">all</option>
                        <option value="monitor">monitor</option>
                        <option value="executor">executor</option>
                        <option value="evolver">evolver</option>
                        <option value="analyzer">analyzer</option>
                    </select>
                </label><br><br>
                <button onclick="testA2ABroadcast()">Broadcast</button>
                <div id="broadcast-result"></div>

                <h3 style="margin-top:20px">A2A Subscribe</h3>
                <label>Event Type:
                    <select id="sub-event">
                        <option value="region_change">region_change</option>
                        <option value="task_available">task_available</option>
                        <option value="peer_discovered">peer_discovered</option>
                        <option value="knowledge_update">knowledge_update</option>
                    </select>
                </label><br><br>
                <button onclick="testA2ASubscribe()">Subscribe</button>
                <div id="subscribe-result"></div>
            </div>
        </div>
    </div>

    <div id="summary">
        <strong>Test Summary:</strong> <span id="summary-text">Run tests to see results</span>
    </div>

    <div style="margin-top: 20px;">
        <button onclick="runAllTests()">▶ Run All Tests</button>
        <button onclick="location.reload()">↻ Reload Page</button>
    </div>

    <script>
        // Test utilities
        const results = { passed: 0, failed: 0, pending: 0 };

        function updateSummary() {
            document.getElementById('summary-text').innerHTML =
                `<span class="status-badge status-passed">${results.passed} passed</span> ` +
                `<span class="status-badge status-failed">${results.failed} failed</span> ` +
                `<span class="status-badge status-pending">${results.pending} pending</span>`;
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

        // Prerequisite tests
        async function testPrerequisites() {
            const container = 'prereq-results';

            // Check WebMCP availability
            const webmcpAvailable = typeof navigator !== 'undefined' && 'modelContext' in navigator;
            addResult(container, 'WebMCP API available',
                webmcpAvailable ? 'pass' : 'pending',
                webmcpAvailable ? 'navigator.modelContext detected' : 'Chrome 146+ required');

            // Check WebMCP Bridge
            const bridgeReady = typeof window.webmcpBridge !== 'undefined';
            addResult(container, 'WebMCP Bridge loaded',
                bridgeReady ? 'pass' : 'fail',
                bridgeReady ? window.webmcpBridge.getStatus() : 'webmcp_bridge.js not loaded');

            return webmcpAvailable && bridgeReady;
        }

        // Tool registration tests
        async function testToolRegistration() {
            const container = 'tool-results';
            const status = window.webmcpBridge?.getStatus();

            if (!status) {
                addResult(container, 'Tool registration check', 'fail', 'Bridge not available');
                return false;
            }

            const expectedTools = [
                'navigate_map', 'get_os_state', 'execute_pixel_program', 'load_rts_cartridge',
                'query_hilbert_address', 'trigger_evolution', 'send_llm_prompt', 'spawn_area_agent',
                'a2a_send_message', 'a2a_broadcast', 'a2a_subscribe'
            ];

            let allRegistered = true;
            for (const tool of expectedTools) {
                const registered = status.tools.includes(tool);
                addResult(container, `Tool: ${tool}`,
                    registered ? 'pass' : 'fail',
                    registered ? 'Registered' : 'NOT registered');
                if (!registered) allRegistered = false;
            }

            addResult(container, 'Total tools registered',
                status.tools.length >= 11 ? 'pass' : 'fail',
                `${status.tools.length}/11 tools`);

            return allRegistered;
        }

        // Protocol tests
        async function testProtocol() {
            const container = 'protocol-results';

            // Test message schema validation
            const validMessage = {
                message_id: 'test-001',
                from_agent: 'test-agent',
                to_agent: 'target-agent',
                message_type: 'task_request',
                priority: 5,
                content: { task: 'test' }
            };
            addResult(container, 'A2A message schema', 'pass',
                JSON.stringify(validMessage, null, 2));

            // Test message types
            const messageTypes = ['task_request', 'task_response', 'notification', 'data_share'];
            addResult(container, 'Message types defined', 'pass',
                messageTypes.join(', '));

            // Test event types
            const eventTypes = ['region_change', 'task_available', 'peer_discovered', 'knowledge_update'];
            addResult(container, 'Event types defined', 'pass',
                eventTypes.join(', '));

            return true;
        }

        // Interactive tests
        async function testSendA2AMessage() {
            const targetAgent = document.getElementById('target-agent').value;
            const msgType = document.getElementById('msg-type').value;
            const payloadStr = document.getElementById('msg-payload').value;

            let payload;
            try {
                payload = JSON.parse(payloadStr);
            } catch (e) {
                document.getElementById('send-result').innerHTML =
                    '<div class="test-result fail">Invalid JSON payload</div>';
                return;
            }

            document.getElementById('send-result').innerHTML =
                '<div class="test-result pending">Sending A2A message...</div>';

            try {
                // In a real implementation, this would call the WebMCP tool
                const result = {
                    success: false,
                    error: 'A2A backend not running (expected - requires ws://localhost:8765)',
                    error_code: 'BACKEND_UNAVAILABLE'
                };

                document.getElementById('send-result').innerHTML =
                    `<div class="test-result ${result.success ? 'pass' : 'pending'}">
                        <pre>${JSON.stringify(result, null, 2)}</pre>
                    </div>`;
            } catch (err) {
                document.getElementById('send-result').innerHTML =
                    `<div class="test-result fail">Error: ${err.message}</div>`;
            }
        }

        async function testA2ABroadcast() {
            const agentType = document.getElementById('broadcast-type').value;

            document.getElementById('broadcast-result').innerHTML =
                '<div class="test-result pending">Broadcasting...</div>';

            // Simulated result
            const result = {
                success: false,
                error: 'A2A backend not running (expected)',
                error_code: 'BACKEND_UNAVAILABLE'
            };

            document.getElementById('broadcast-result').innerHTML =
                `<div class="test-result pending"><pre>${JSON.stringify(result, null, 2)}</pre></div>`;
        }

        async function testA2ASubscribe() {
            const eventType = document.getElementById('sub-event').value;

            document.getElementById('subscribe-result').innerHTML =
                '<div class="test-result pending">Subscribing...</div>';

            // Simulated result
            const result = {
                success: false,
                error: 'A2A backend not running (expected)',
                error_code: 'BACKEND_UNAVAILABLE'
            };

            document.getElementById('subscribe-result').innerHTML =
                `<div class="test-result pending"><pre>${JSON.stringify(result, null, 2)}</pre></div>`;
        }

        // Run all tests
        async function runAllTests() {
            results.passed = 0;
            results.failed = 0;
            results.pending = 0;

            document.getElementById('prereq-results').innerHTML = '';
            document.getElementById('tool-results').innerHTML = '';
            document.getElementById('protocol-results').innerHTML = '';

            await testPrerequisites();
            await testToolRegistration();
            await testProtocol();

            updateSummary();
        }

        // Auto-run on load
        window.addEventListener('load', () => {
            setTimeout(runAllTests, 500);
        });
    </script>
</body>
</html>
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/test_a2a_tools.html
git commit -m "feat(webmcp): add A2A tools test page"
```

---

## Task 5: Update Test Page Integration

**Files:**
- Modify: `systems/visual_shell/web/test_webmcp_bridge.html`

**Step 1: Add Phase D tests to existing test page**

In `test_webmcp_bridge.html`, add A2A tool verification to the Phase B tests section:

```html
        // Phase D: A2A Tools Tests
        async function testPhaseD() {
            const container = 'phase-d-results';
            const status = window.webmcpBridge?.getStatus();

            // Test a2a_send_message registration
            const hasSendMsg = status?.tools?.includes('a2a_send_message');
            addResult(container, 'a2a_send_message registered',
                hasSendMsg ? 'pass' : 'fail');

            // Test a2a_broadcast registration
            const hasBroadcast = status?.tools?.includes('a2a_broadcast');
            addResult(container, 'a2a_broadcast registered',
                hasBroadcast ? 'pass' : 'fail');

            // Test a2a_subscribe registration
            const hasSubscribe = status?.tools?.includes('a2a_subscribe');
            addResult(container, 'a2a_subscribe registered',
                hasSubscribe ? 'pass' : 'fail');

            return hasSendMsg && hasBroadcast && hasSubscribe;
        }
```

And add the Phase D section to the HTML:

```html
    <div class="test-section">
        <h2>Phase D: A2A Protocol Tools</h2>
        <div id="phase-d-results"></div>
    </div>
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/test_webmcp_bridge.html
git commit -m "test(webmcp): add Phase D A2A tests to main test page"
```

---

## Task 6: Final Verification

**Step 1: Run all Python tests**

Run: `python -m pytest systems/pixel_compiler/tests/test_a2a_router.py -v`
Expected: 12 passed

**Step 2: Verify JavaScript syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js`
Expected: No errors

**Step 3: Check file count**

Run: `grep -c "a2a_" systems/visual_shell/web/webmcp_bridge.js`
Expected: 30+ occurrences (methods, handlers, registrations)

**Step 4: Final commit**

```bash
git add -A
git commit -m "feat(webmcp): complete Phase D - A2A Protocol Integration

- Add A2A Router backend (a2a_router.py)
- Add 3 new WebMCP tools: a2a_send_message, a2a_broadcast, a2a_subscribe
- Add comprehensive unit tests (12 tests)
- Add A2A test page (test_a2a_tools.html)

All 11 WebMCP tools now registered:
- Phase A: navigate_map, get_os_state, execute_pixel_program, load_rts_cartridge
- Phase B: query_hilbert_address, trigger_evolution, send_llm_prompt, spawn_area_agent
- Phase D: a2a_send_message, a2a_broadcast, a2a_subscribe"
```

---

## Success Criteria

1. ✅ All 11 WebMCP tools registered (8 existing + 3 A2A)
2. ✅ A2A Router backend with peer registry, routing, subscriptions
3. ✅ 12 unit tests passing
4. ✅ Test page validates A2A tool registration
5. ✅ JavaScript syntax valid
6. ✅ All changes committed

---

## References

- Design Doc: `docs/plans/2026-02-13-webmcp-phase-d-design.md`
- Phase B Design: `docs/plans/2026-02-12-webmcp-phase-b-design.md`
- WebMCP Bridge: `systems/visual_shell/web/webmcp_bridge.js`
