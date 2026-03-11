# WebMCP Phase G.1: Session Foundation Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add collaborative session management for multiple AI agents to coordinate building on the Infinite Map.

**Architecture:** Extend A2ARouter with BuildSession and SessionAgent dataclasses. Add session management methods (create, join, leave, get_state) to backend. Expose as 4 new WebMCP tools (session_create, session_join, session_leave, session_get_state) in webmcp_bridge.js.

**Tech Stack:** Python (a2a_router.py), JavaScript (webmcp_bridge.js), WebSocket transport, pytest for testing

---

## Task 1: Add BuildSession and SessionAgent Dataclasses

**Files:**
- Modify: `systems/pixel_compiler/a2a_router.py`
- Test: `systems/pixel_compiler/tests/test_a2a_router.py`

**Step 1: Write the failing tests**

Add to `test_a2a_router.py`:

```python


class TestBuildSession:
    """Tests for collaborative build sessions."""

    def test_build_session_dataclass(self):
        """BuildSession dataclass exists with required fields."""
        from systems.pixel_compiler.a2a_router import BuildSession
        import time

        session = BuildSession(
            session_id="sess_001",
            session_name="Test Session",
            created_at=time.time(),
            max_agents=10,
            grid_size=1000,
            coordination_mode="coordinated",
            invite_token="token_abc",
            config={}
        )

        assert session.session_id == "sess_001"
        assert session.session_name == "Test Session"
        assert session.agents == {}
        assert session.regions == {}

    def test_session_agent_dataclass(self):
        """SessionAgent dataclass exists with required fields."""
        from systems.pixel_compiler.a2a_router import SessionAgent
        import time

        agent = SessionAgent(
            agent_id="agent_001",
            session_id="sess_001",
            name="Builder-A",
            role="builder",
            capabilities=["wgsl", "kernel"],
            color="#4CAF50",
            joined_at=time.time()
        )

        assert agent.agent_id == "agent_001"
        assert agent.role == "builder"
        assert agent.regions_claimed == []
        assert agent.tasks_completed == 0
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py::TestBuildSession -v`
Expected: FAIL with "cannot import name 'BuildSession'"

**Step 3: Write minimal implementation**

Add to `a2a_router.py` after the `Task` dataclass (around line 180):

```python
@dataclass
class SessionAgent:
    """Agent participating in a build session."""
    agent_id: str
    session_id: str
    name: str
    role: str  # architect, builder, tester, observer
    capabilities: List[str]
    color: str
    joined_at: float
    regions_claimed: List[str] = field(default_factory=list)
    tasks_completed: int = 0
    status: str = "active"


@dataclass
class RegionClaim:
    """A claimed region in a build session."""
    claim_id: str
    session_id: str
    agent_id: str
    bounds: Dict[str, int]  # {x, y, width, height}
    purpose: str
    claimed_at: float
    expires_at: float
    exclusive: bool = True


@dataclass
class BuildSession:
    """Collaborative build session state."""
    session_id: str
    session_name: str
    created_at: float
    max_agents: int = 10
    grid_size: int = 1000
    coordination_mode: str = "coordinated"  # free, coordinated, sequential
    invite_token: Optional[str] = None
    config: Dict[str, Any] = field(default_factory=dict)
    agents: Dict[str, SessionAgent] = field(default_factory=dict)
    regions: Dict[str, RegionClaim] = field(default_factory=dict)
    tasks: Dict[str, str] = field(default_factory=dict)  # task_id -> status
    status: str = "active"
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py::TestBuildSession -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/pixel_compiler/a2a_router.py systems/pixel_compiler/tests/test_a2a_router.py
git commit -m "feat(a2a): add BuildSession, SessionAgent, RegionClaim dataclasses"
```

---

## Task 2: Add Session Registry to A2ARouter

**Files:**
- Modify: `systems/pixel_compiler/a2a_router.py`
- Test: `systems/pixel_compiler/tests/test_a2a_router.py`

**Step 1: Write the failing test**

Add to `TestBuildSession`:

```python
    @pytest.fixture
    def router(self):
        """Create a fresh A2A router for each test."""
        return A2ARouter()

    def test_sessions_registry_exists(self, router):
        """A2ARouter has a sessions registry."""
        assert hasattr(router, 'sessions')
        assert router.sessions == {}
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py::TestBuildSession::test_sessions_registry_exists -v`
Expected: FAIL with "assert {} == {}" (AttributeError or assertion failure)

**Step 3: Write minimal implementation**

In `A2ARouter.__init__` (around line 195), add:

```python
        # Collaborative build sessions
        self.sessions: Dict[str, BuildSession] = {}
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py::TestBuildSession::test_sessions_registry_exists -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/pixel_compiler/a2a_router.py systems/pixel_compiler/tests/test_a2a_router.py
git commit -m "feat(a2a): add sessions registry to A2ARouter"
```

---

## Task 3: Implement session_create Method

**Files:**
- Modify: `systems/pixel_compiler/a2a_router.py`
- Test: `systems/pixel_compiler/tests/test_a2a_router.py`

**Step 1: Write the failing tests**

Add to `TestBuildSession`:

```python
    @pytest.mark.asyncio
    async def test_create_session(self, router):
        """Can create a new build session."""
        result = await router.create_session(
            session_name="Test Build",
            max_agents=5,
            coordination_mode="coordinated"
        )

        assert result["success"] is True
        assert "session_id" in result
        assert result["session_name"] == "Test Build"
        assert result["max_agents"] == 5
        assert "invite_token" in result

        # Session is stored in registry
        assert result["session_id"] in router.sessions

    @pytest.mark.asyncio
    async def test_create_session_default_values(self, router):
        """Session created with default values."""
        result = await router.create_session(session_name="Default")

        assert result["max_agents"] == 10
        assert result["grid_size"] == 1000
        assert result["coordination_mode"] == "coordinated"
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py::TestBuildSession::test_create_session -v`
Expected: FAIL with "'A2ARouter' object has no attribute 'create_session'"

**Step 3: Write minimal implementation**

Add after the task delegation methods (around line 1050):

```python
    # === Session Management ===

    async def create_session(
        self,
        session_name: str,
        max_agents: int = 10,
        grid_size: int = 1000,
        coordination_mode: str = "coordinated",
        config: Optional[Dict[str, Any]] = None
    ) -> Dict[str, Any]:
        """Create a new collaborative build session."""
        session_id = f"sess_{uuid.uuid4().hex[:8]}"
        invite_token = f"tok_{uuid.uuid4().hex[:12]}"

        session = BuildSession(
            session_id=session_id,
            session_name=session_name,
            created_at=time.time(),
            max_agents=max_agents,
            grid_size=grid_size,
            coordination_mode=coordination_mode,
            invite_token=invite_token,
            config=config or {}
        )

        self.sessions[session_id] = session
        logger.info(f"Created build session {session_id}: {session_name}")

        return {
            "success": True,
            "session_id": session_id,
            "session_name": session_name,
            "created_at": session.created_at,
            "invite_token": invite_token,
            "max_agents": max_agents,
            "grid_size": grid_size,
            "coordination_mode": coordination_mode,
            "state": {
                "agents_count": 0,
                "regions_claimed": 0,
                "tasks_pending": 0
            }
        }
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py::TestBuildSession::test_create -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/pixel_compiler/a2a_router.py systems/pixel_compiler/tests/test_a2a_router.py
git commit -m "feat(a2a): add create_session method for collaborative builds"
```

---

## Task 4: Implement session_join Method

**Files:**
- Modify: `systems/pixel_compiler/a2a_router.py`
- Test: `systems/pixel_compiler/tests/test_a2a_router.py`

**Step 1: Write the failing tests**

Add to `TestBuildSession`:

```python
    @pytest.mark.asyncio
    async def test_join_session(self, router):
        """Agent can join a session."""
        # Create session first
        session = await router.create_session(session_name="Test")

        result = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder-A",
            role="builder",
            capabilities=["wgsl"]
        )

        assert result["success"] is True
        assert "agent_id" in result
        assert result["role"] == "builder"
        assert "assigned_color" in result

    @pytest.mark.asyncio
    async def test_join_nonexistent_session(self, router):
        """Cannot join nonexistent session."""
        result = await router.join_session(
            session_id="sess_nonexistent",
            agent_name="Builder",
            role="builder"
        )

        assert result["success"] is False
        assert "not_found" in result.get("error", "").lower()

    @pytest.mark.asyncio
    async def test_join_session_full(self, router):
        """Cannot join full session."""
        session = await router.create_session(session_name="Full", max_agents=1)
        await router.join_session(
            session_id=session["session_id"],
            agent_name="Agent1",
            role="builder"
        )

        result = await router.join_session(
            session_id=session["session_id"],
            agent_name="Agent2",
            role="builder"
        )

        assert result["success"] is False
        assert "full" in result.get("error", "").lower()
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py::TestBuildSession::test_join_session -v`
Expected: FAIL with "'A2ARouter' object has no attribute 'join_session'"

**Step 3: Write minimal implementation**

Add after `create_session`:

```python
    async def join_session(
        self,
        session_id: str,
        agent_name: str,
        role: str = "builder",
        capabilities: Optional[List[str]] = None,
        invite_token: Optional[str] = None,
        websocket: Optional[Any] = None
    ) -> Dict[str, Any]:
        """Join an existing build session."""
        if session_id not in self.sessions:
            return {"success": False, "error": "session_not_found"}

        session = self.sessions[session_id]

        # Check capacity
        if len(session.agents) >= session.max_agents:
            return {"success": False, "error": "session_full"}

        # Validate invite token if required
        if session.invite_token and invite_token != session.invite_token:
            return {"success": False, "error": "invalid_invite_token"}

        # Generate agent ID and color
        agent_id = f"agent_{uuid.uuid4().hex[:8]}"
        colors = ["#4CAF50", "#2196F3", "#FF9800", "#9C27B0", "#F44336",
                  "#00BCD4", "#795548", "#607D8B", "#E91E63", "#8BC34A"]
        color = colors[len(session.agents) % len(colors)]

        agent = SessionAgent(
            agent_id=agent_id,
            session_id=session_id,
            name=agent_name,
            role=role,
            capabilities=capabilities or [],
            color=color,
            joined_at=time.time()
        )

        session.agents[agent_id] = agent

        logger.info(f"Agent {agent_id} ({agent_name}) joined session {session_id} as {role}")

        return {
            "success": True,
            "agent_id": agent_id,
            "session_id": session_id,
            "role": role,
            "assigned_color": color,
            "session_state": {
                "agents_count": len(session.agents),
                "session_name": session.session_name,
                "coordination_mode": session.coordination_mode
            }
        }
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py::TestBuildSession::test_join -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/pixel_compiler/a2a_router.py systems/pixel_compiler/tests/test_a2a_router.py
git commit -m "feat(a2a): add join_session method with role and capacity support"
```

---

## Task 5: Implement session_leave Method

**Files:**
- Modify: `systems/pixel_compiler/a2a_router.py`
- Test: `systems/pixel_compiler/tests/test_a2a_router.py`

**Step 1: Write the failing tests**

Add to `TestBuildSession`:

```python
    @pytest.mark.asyncio
    async def test_leave_session(self, router):
        """Agent can leave a session."""
        session = await router.create_session(session_name="Test")
        joined = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder",
            role="builder"
        )

        result = await router.leave_session(
            session_id=session["session_id"],
            agent_id=joined["agent_id"]
        )

        assert result["success"] is True
        assert joined["agent_id"] not in router.sessions[session["session_id"]].agents

    @pytest.mark.asyncio
    async def test_leave_releases_regions(self, router):
        """Leaving session releases claimed regions."""
        session = await router.create_session(session_name="Test")
        joined = await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder",
            role="builder"
        )
        agent_id = joined["agent_id"]

        # Claim a region
        await router.claim_region(
            session_id=session["session_id"],
            agent_id=agent_id,
            region={"x": 0, "y": 0, "width": 100, "height": 100},
            purpose="test"
        )

        # Leave session
        result = await router.leave_session(
            session_id=session["session_id"],
            agent_id=agent_id
        )

        assert result["success"] is True
        assert len(result.get("released_regions", [])) == 1
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py::TestBuildSession::test_leave_session -v`
Expected: FAIL with "'A2ARouter' object has no attribute 'leave_session'"

**Step 3: Write minimal implementation**

Add after `join_session`:

```python
    async def leave_session(
        self,
        session_id: str,
        agent_id: str,
        handoff_to: Optional[str] = None
    ) -> Dict[str, Any]:
        """Leave a build session and release claimed regions."""
        if session_id not in self.sessions:
            return {"success": False, "error": "session_not_found"}

        session = self.sessions[session_id]

        if agent_id not in session.agents:
            return {"success": False, "error": "agent_not_in_session"}

        agent = session.agents[agent_id]
        released_regions = []

        # Release all regions claimed by this agent
        for claim_id, claim in list(session.regions.items()):
            if claim.agent_id == agent_id:
                if handoff_to and handoff_to in session.agents:
                    # Transfer to another agent
                    claim.agent_id = handoff_to
                    session.agents[handoff_to].regions_claimed.append(claim_id)
                else:
                    del session.regions[claim_id]
                released_regions.append(claim_id)

        # Remove agent from session
        del session.agents[agent_id]

        logger.info(f"Agent {agent_id} left session {session_id}, released {len(released_regions)} regions")

        return {
            "success": True,
            "agent_id": agent_id,
            "released_regions": released_regions,
            "transferred_to": handoff_to if handoff_to else None
        }
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py::TestBuildSession::test_leave -v`
Expected: PASS (may need to skip region test if claim_region not implemented yet)

**Step 5: Commit**

```bash
git add systems/pixel_compiler/a2a_router.py systems/pixel_compiler/tests/test_a2a_router.py
git commit -m "feat(a2a): add leave_session method with region release"
```

---

## Task 6: Implement session_get_state Method

**Files:**
- Modify: `systems/pixel_compiler/a2a_router.py`
- Test: `systems/pixel_compiler/tests/test_a2a_router.py`

**Step 1: Write the failing tests**

Add to `TestBuildSession`:

```python
    @pytest.mark.asyncio
    async def test_get_session_state(self, router):
        """Can get session state."""
        session = await router.create_session(session_name="Test")
        await router.join_session(
            session_id=session["session_id"],
            agent_name="Builder-A",
            role="builder"
        )

        result = await router.get_session_state(session_id=session["session_id"])

        assert result["success"] is True
        assert len(result["agents"]) == 1
        assert result["agents"][0]["name"] == "Builder-A"
        assert result["agents"][0]["role"] == "builder"

    @pytest.mark.asyncio
    async def test_get_session_state_nonexistent(self, router):
        """Getting nonexistent session returns error."""
        result = await router.get_session_state(session_id="sess_nonexistent")

        assert result["success"] is False
        assert "not_found" in result.get("error", "").lower()
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py::TestBuildSession::test_get_session_state -v`
Expected: FAIL with "'A2ARouter' object has no attribute 'get_session_state'"

**Step 3: Write minimal implementation**

Add after `leave_session`:

```python
    async def get_session_state(
        self,
        session_id: str,
        include: Optional[List[str]] = None
    ) -> Dict[str, Any]:
        """Get current session state and progress."""
        if session_id not in self.sessions:
            return {"success": False, "error": "session_not_found"}

        session = self.sessions[session_id]
        include = include or ["all"]

        state = {
            "success": True,
            "session_id": session_id,
            "session_name": session.session_name,
            "status": session.status,
            "coordination_mode": session.coordination_mode
        }

        if "all" in include or "agents" in include:
            state["agents"] = [
                {
                    "agent_id": a.agent_id,
                    "name": a.name,
                    "role": a.role,
                    "color": a.color,
                    "capabilities": a.capabilities,
                    "joined_at": a.joined_at,
                    "regions_claimed": len(a.regions_claimed),
                    "tasks_completed": a.tasks_completed
                }
                for a in session.agents.values()
            ]

        if "all" in include or "regions" in include:
            state["regions"] = [
                {
                    "claim_id": r.claim_id,
                    "agent_id": r.agent_id,
                    "bounds": r.bounds,
                    "purpose": r.purpose,
                    "claimed_at": r.claimed_at
                }
                for r in session.regions.values()
            ]

        if "all" in include or "progress" in include:
            state["progress"] = {
                "agents_count": len(session.agents),
                "regions_claimed": len(session.regions),
                "max_agents": session.max_agents
            }

        return state
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py::TestBuildSession::test_get_session -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/pixel_compiler/a2a_router.py systems/pixel_compiler/tests/test_a2a_router.py
git commit -m "feat(a2a): add get_session_state method"
```

---

## Task 7: Add Message Handlers for Session Methods

**Files:**
- Modify: `systems/pixel_compiler/a2a_router.py`

**Step 1: Add handler registrations**

In `_handle_message` handlers dict, add:

```python
            "create_session": self._handle_create_session,
            "join_session": self._handle_join_session,
            "leave_session": self._handle_leave_session,
            "get_session_state": self._handle_get_session_state,
```

**Step 2: Add handler implementations**

```python
    async def _handle_create_session(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.create_session(
            session_name=data.get("session_name"),
            max_agents=data.get("max_agents", 10),
            grid_size=data.get("grid_size", 1000),
            coordination_mode=data.get("coordination_mode", "coordinated"),
            config=data.get("config")
        )

    async def _handle_join_session(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.join_session(
            session_id=data.get("session_id"),
            agent_name=data.get("agent_name"),
            role=data.get("role", "builder"),
            capabilities=data.get("capabilities"),
            invite_token=data.get("invite_token"),
            websocket=websocket
        )

    async def _handle_leave_session(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.leave_session(
            session_id=data.get("session_id"),
            agent_id=data.get("agent_id"),
            handoff_to=data.get("handoff_to")
        )

    async def _handle_get_session_state(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.get_session_state(
            session_id=data.get("session_id"),
            include=data.get("include")
        )
```

**Step 3: Verify syntax**

Run: `python3 -c "from systems.pixel_compiler.a2a_router import A2ARouter; print('OK')"`
Expected: OK

**Step 4: Commit**

```bash
git add systems/pixel_compiler/a2a_router.py
git commit -m "feat(a2a): add WebSocket message handlers for session methods"
```

---

## Task 8: Add WebMCP Tool session_create

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Add tool registration call**

In `#register()` method after task delegation tools:

```javascript
            // Phase G tools - Session Management
            await this.#registerSessionCreate();
            await this.#registerSessionJoin();
            await this.#registerSessionLeave();
            await this.#registerSessionGetState();
```

**Step 2: Add session_create tool**

```javascript
    // ─────────────────────────────────────────────────────────────
    // Tool 18: session_create (Phase G - Session Management)
    // ─────────────────────────────────────────────────────────────

    async #registerSessionCreate() {
        const tool = {
            name: 'session_create',
            description:
                'Create a new collaborative build session for multiple AI agents. ' +
                'Returns session_id and invite_token for other agents to join.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_name: {
                        type: 'string',
                        description: 'Human-readable session name'
                    },
                    max_agents: {
                        type: 'number',
                        description: 'Maximum concurrent agents (default: 10)',
                        default: 10
                    },
                    grid_size: {
                        type: 'number',
                        description: 'Map grid size (default: 1000)',
                        default: 1000
                    },
                    coordination_mode: {
                        type: 'string',
                        enum: ['free', 'coordinated', 'sequential'],
                        description: 'Coordination mode (default: coordinated)',
                        default: 'coordinated'
                    },
                    config: {
                        type: 'object',
                        description: 'Optional session configuration'
                    }
                },
                required: ['session_name']
            },
            handler: async (params) => {
                return this.#handleSessionCreate(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleSessionCreate({ session_name, max_agents = 10, grid_size = 1000, coordination_mode = 'coordinated', config }) {
        this.#trackCall('session_create');

        if (!session_name) {
            return {
                success: false,
                error: 'session_name is required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'create_session',
                session_name,
                max_agents,
                grid_size,
                coordination_mode,
                config: config || {}
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.success !== false,
                session_id: response.session_id,
                session_name: response.session_name,
                invite_token: response.invite_token,
                state: response.state,
                error: response.error
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }
```

**Step 3: Verify syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js`
Expected: No output (success)

---

## Task 9: Add WebMCP Tool session_join

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Add session_join tool**

```javascript
    // ─────────────────────────────────────────────────────────────
    // Tool 19: session_join (Phase G - Session Management)
    // ─────────────────────────────────────────────────────────────

    async #registerSessionJoin() {
        const tool = {
            name: 'session_join',
            description:
                'Join an existing collaborative build session. ' +
                'Specify role (architect, builder, tester, observer) and capabilities.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_id: {
                        type: 'string',
                        description: 'Session ID to join'
                    },
                    agent_name: {
                        type: 'string',
                        description: 'Unique agent name in session'
                    },
                    role: {
                        type: 'string',
                        enum: ['architect', 'builder', 'tester', 'observer'],
                        description: 'Agent role (default: builder)',
                        default: 'builder'
                    },
                    capabilities: {
                        type: 'array',
                        items: { type: 'string' },
                        description: 'Agent capabilities (e.g., ["wgsl", "kernel"])'
                    },
                    invite_token: {
                        type: 'string',
                        description: 'Invite token for private sessions'
                    }
                },
                required: ['session_id', 'agent_name']
            },
            handler: async (params) => {
                return this.#handleSessionJoin(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleSessionJoin({ session_id, agent_name, role = 'builder', capabilities, invite_token }) {
        this.#trackCall('session_join');

        if (!session_id || !agent_name) {
            return {
                success: false,
                error: 'session_id and agent_name are required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'join_session',
                session_id,
                agent_name,
                role,
                capabilities: capabilities || [],
                invite_token
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.success !== false,
                agent_id: response.agent_id,
                session_id: response.session_id,
                role: response.role,
                assigned_color: response.assigned_color,
                session_state: response.session_state,
                error: response.error
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }
```

**Step 2: Verify syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js`

---

## Task 10: Add WebMCP Tool session_leave

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Add session_leave tool**

```javascript
    // ─────────────────────────────────────────────────────────────
    // Tool 20: session_leave (Phase G - Session Management)
    // ─────────────────────────────────────────────────────────────

    async #registerSessionLeave() {
        const tool = {
            name: 'session_leave',
            description:
                'Leave a collaborative build session. ' +
                'Releases all claimed regions. Optionally hand off regions to another agent.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_id: {
                        type: 'string',
                        description: 'Session ID to leave'
                    },
                    agent_id: {
                        type: 'string',
                        description: 'Your agent ID'
                    },
                    handoff_to: {
                        type: 'string',
                        description: 'Optional agent ID to transfer claimed regions to'
                    }
                },
                required: ['session_id', 'agent_id']
            },
            handler: async (params) => {
                return this.#handleSessionLeave(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleSessionLeave({ session_id, agent_id, handoff_to }) {
        this.#trackCall('session_leave');

        if (!session_id || !agent_id) {
            return {
                success: false,
                error: 'session_id and agent_id are required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'leave_session',
                session_id,
                agent_id,
                handoff_to
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: response.success !== false,
                agent_id: response.agent_id,
                released_regions: response.released_regions || [],
                transferred_to: response.transferred_to,
                error: response.error
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }
```

**Step 2: Verify syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js`

---

## Task 11: Add WebMCP Tool session_get_state

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Add session_get_state tool**

```javascript
    // ─────────────────────────────────────────────────────────────
    // Tool 21: session_get_state (Phase G - Session Management)
    // ─────────────────────────────────────────────────────────────

    async #registerSessionGetState() {
        const tool = {
            name: 'session_get_state',
            description:
                'Get the current state of a collaborative build session. ' +
                'Returns agents, claimed regions, and progress metrics.',
            inputSchema: {
                type: 'object',
                properties: {
                    session_id: {
                        type: 'string',
                        description: 'Session ID to query'
                    },
                    include: {
                        type: 'array',
                        items: { enum: ['agents', 'regions', 'tasks', 'progress', 'all'] },
                        description: 'What to include in response (default: all)'
                    }
                },
                required: ['session_id']
            },
            handler: async (params) => {
                return this.#handleSessionGetState(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleSessionGetState({ session_id, include }) {
        this.#trackCall('session_get_state');

        if (!session_id) {
            return {
                success: false,
                error: 'session_id is required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'get_session_state',
                session_id,
                include: include || ['all']
            };

            const response = await this.#sendA2ARequest(request);

            if (response.error) {
                return {
                    success: false,
                    session_id,
                    error: response.error,
                    error_code: 'SESSION_NOT_FOUND'
                };
            }

            return {
                success: true,
                session_id: response.session_id,
                session_name: response.session_name,
                status: response.status,
                agents: response.agents || [],
                regions: response.regions || [],
                progress: response.progress || {},
                coordination_mode: response.coordination_mode
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: err.message.includes('backend') ? 'BACKEND_UNAVAILABLE' : 'EXECUTION_FAILED'
            };
        }
    }
```

**Step 2: Verify syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js`

**Step 3: Commit frontend tools**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add Phase G session management tools (create, join, leave, get_state)"
```

---

## Task 12: Final Verification

**Step 1: Run all A2A router tests**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py -v`
Expected: All tests pass (including new TestBuildSession tests)

**Step 2: Verify JavaScript syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js`
Expected: No output (success)

**Step 3: Count tools**

Run: `grep -c "await navigator.modelContext.registerTool" systems/visual_shell/web/webmcp_bridge.js`
Expected: 30 (26 existing + 4 new)

**Step 4: Run complete test suite**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py -v --tb=short`

---

## Success Criteria

| # | Criteria | Verification |
|---|----------|-------------|
| 1 | BuildSession, SessionAgent, RegionClaim dataclasses | `from a2a_router import BuildSession` works |
| 2 | create_session creates session with invite token | Test passes |
| 3 | join_session adds agent with role/color | Test passes |
| 4 | leave_session releases agent regions | Test passes |
| 5 | get_session_state returns full state | Test passes |
| 6 | 4 new WebMCP tools registered | Tool count = 30 |
| 7 | All Python tests pass | pytest returns 0 |
| 8 | JS syntax valid | node --check passes |

---

## Files Modified

| File | Changes |
|------|---------|
| `systems/pixel_compiler/a2a_router.py` | +BuildSession, +SessionAgent, +RegionClaim, +sessions dict, +4 methods, +4 handlers |
| `systems/pixel_compiler/tests/test_a2a_router.py` | +TestBuildSession class with 10 tests |
| `systems/visual_shell/web/webmcp_bridge.js` | +4 session management tools (Tools 18-21) |
