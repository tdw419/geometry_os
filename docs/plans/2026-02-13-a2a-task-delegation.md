# A2A Task Delegation Pattern Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add 3 WebMCP tools for task delegation: `a2a_assign_task`, `a2a_report_progress`, `a2a_get_result` with backend task tracking.

**Architecture:** Extend the A2A Router backend with a TaskRegistry to track assigned tasks, their status, and results. Add 3 WebMCP tools that use the existing WebSocket connection to assign tasks, report progress, and retrieve results.

**Tech Stack:** JavaScript (WebMCP Bridge), Python (A2A Router), WebSocket, JSON messaging

---

## Prerequisites

- ✅ A2A Router backend: `systems/pixel_compiler/a2a_router.py`
- ✅ WebMCP Bridge with A2A tools: `systems/visual_shell/web/webmcp_bridge.js`
- ✅ Coordination primitives (locks, barriers) already implemented

---

## Task 1: Add TaskRegistry to A2A Router Backend

**Files:**
- Modify: `systems/pixel_compiler/a2a_router.py`

**Step 1: Add Task dataclass and registry**

After the `Barrier` dataclass (around line 163), add:

```python
@dataclass
class Task:
    """Task delegation state"""
    task_id: str
    from_agent: str
    to_agent: str
    task_type: str
    params: Dict[str, Any]
    status: str  # assigned, in_progress, completed, failed
    progress: float  # 0.0 to 1.0
    result: Optional[Dict[str, Any]]
    error: Optional[str]
    created_at: float
    updated_at: float
    expires_at: Optional[float]
```

**Step 2: Add task registry to A2ARouter.__init__**

In `__init__` method (around line 189), add:

```python
        # Task delegation registry
        self.tasks: Dict[str, Task] = {}
```

**Step 3: Add task management methods**

Add these methods after the coordination primitives section (around line 880):

```python
    # === Task Delegation ===

    async def assign_task(
        self,
        from_agent: str,
        to_agent: str,
        task_type: str,
        params: Dict[str, Any],
        timeout: float = 300.0
    ) -> Dict[str, Any]:
        """
        Assign a task to another agent.

        Args:
            from_agent: Agent assigning the task
            to_agent: Agent to receive the task
            task_type: Type of task (e.g., "scan_region", "analyze_data")
            params: Task parameters
            timeout: Task timeout in seconds

        Returns:
            Task assignment result
        """
        task_id = str(uuid.uuid4())
        now = time.time()

        task = Task(
            task_id=task_id,
            from_agent=from_agent,
            to_agent=to_agent,
            task_type=task_type,
            params=params,
            status="assigned",
            progress=0.0,
            result=None,
            error=None,
            created_at=now,
            updated_at=now,
            expires_at=now + timeout
        )

        self.tasks[task_id] = task

        # Notify target agent
        if to_agent in self.connections:
            try:
                await self.connections[to_agent].send(json.dumps({
                    "type": "task_assigned",
                    "task_id": task_id,
                    "from_agent": from_agent,
                    "task_type": task_type,
                    "params": params,
                    "expires_at": task.expires_at
                }))
            except Exception as e:
                logger.error(f"Failed to notify agent {to_agent}: {e}")
                task.status = "failed"
                task.error = f"Failed to deliver: {e}"

        logger.info(f"Task {task_id} assigned from {from_agent} to {to_agent}")

        return {
            "task_id": task_id,
            "status": task.status,
            "assigned_to": to_agent
        }

    async def report_progress(
        self,
        task_id: str,
        agent_id: str,
        progress: float,
        status: Optional[str] = None,
        message: Optional[str] = None
    ) -> Dict[str, Any]:
        """
        Report progress on a task.

        Args:
            task_id: Task identifier
            agent_id: Agent reporting progress
            progress: Progress value (0.0 to 1.0)
            status: Optional status update
            message: Optional progress message

        Returns:
            Progress update result
        """
        if task_id not in self.tasks:
            return {"error": "task_not_found", "task_id": task_id}

        task = self.tasks[task_id]

        if task.to_agent != agent_id:
            return {"error": "not_task_assignee", "task_id": task_id}

        task.progress = max(0.0, min(1.0, progress))
        task.updated_at = time.time()

        if status:
            task.status = status

        # Notify task owner of progress
        if task.from_agent in self.connections:
            try:
                await self.connections[task.from_agent].send(json.dumps({
                    "type": "task_progress",
                    "task_id": task_id,
                    "progress": task.progress,
                    "status": task.status,
                    "message": message
                }))
            except Exception:
                pass

        return {
            "task_id": task_id,
            "progress": task.progress,
            "status": task.status
        }

    async def complete_task(
        self,
        task_id: str,
        agent_id: str,
        result: Dict[str, Any],
        success: bool = True
    ) -> Dict[str, Any]:
        """
        Mark a task as completed with result.

        Args:
            task_id: Task identifier
            agent_id: Agent completing the task
            result: Task result
            success: Whether task succeeded

        Returns:
            Completion result
        """
        if task_id not in self.tasks:
            return {"error": "task_not_found", "task_id": task_id}

        task = self.tasks[task_id]

        if task.to_agent != agent_id:
            return {"error": "not_task_assignee", "task_id": task_id}

        task.status = "completed" if success else "failed"
        task.result = result
        task.progress = 1.0
        task.updated_at = time.time()
        task.error = None if success else result.get("error")

        # Notify task owner of completion
        if task.from_agent in self.connections:
            try:
                await self.connections[task.from_agent].send(json.dumps({
                    "type": "task_completed",
                    "task_id": task_id,
                    "success": success,
                    "result": result
                }))
            except Exception:
                pass

        logger.info(f"Task {task_id} completed by {agent_id}: {task.status}")

        return {
            "task_id": task_id,
            "status": task.status,
            "success": success
        }

    async def get_task(self, task_id: str) -> Optional[Dict[str, Any]]:
        """Get task status and result."""
        if task_id not in self.tasks:
            return None

        task = self.tasks[task_id]
        return {
            "task_id": task.task_id,
            "from_agent": task.from_agent,
            "to_agent": task.to_agent,
            "task_type": task.task_type,
            "status": task.status,
            "progress": task.progress,
            "result": task.result,
            "error": task.error,
            "created_at": task.created_at,
            "updated_at": task.updated_at
        }

    async def list_tasks(
        self,
        agent_id: Optional[str] = None,
        status: Optional[str] = None
    ) -> List[Dict[str, Any]]:
        """List tasks, optionally filtered."""
        results = []
        for task in self.tasks.values():
            if agent_id and task.to_agent != agent_id and task.from_agent != agent_id:
                continue
            if status and task.status != status:
                continue
            results.append({
                "task_id": task.task_id,
                "from_agent": task.from_agent,
                "to_agent": task.to_agent,
                "task_type": task.task_type,
                "status": task.status,
                "progress": task.progress
            })
        return results
```

**Step 4: Add message handlers**

In `_handle_message` handlers dict (around line 505), add:

```python
            "assign_task": self._handle_assign_task,
            "report_progress": self._handle_report_progress,
            "complete_task": self._handle_complete_task,
            "get_task": self._handle_get_task,
            "list_tasks": self._handle_list_tasks,
```

**Step 5: Add handler implementations**

```python
    async def _handle_assign_task(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        """Handle task assignment request."""
        return await self.assign_task(
            from_agent=data.get("from_agent"),
            to_agent=data.get("to_agent"),
            task_type=data.get("task_type"),
            params=data.get("params", {}),
            timeout=data.get("timeout", 300)
        )

    async def _handle_report_progress(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        """Handle progress report."""
        return await self.report_progress(
            task_id=data.get("task_id"),
            agent_id=data.get("agent_id"),
            progress=data.get("progress", 0),
            status=data.get("status"),
            message=data.get("message")
        )

    async def _handle_complete_task(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        """Handle task completion."""
        return await self.complete_task(
            task_id=data.get("task_id"),
            agent_id=data.get("agent_id"),
            result=data.get("result", {}),
            success=data.get("success", True)
        )

    async def _handle_get_task(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        """Handle get task request."""
        task = await self.get_task(data.get("task_id"))
        return task or {"error": "task_not_found"}

    async def _handle_list_tasks(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        """Handle list tasks request."""
        tasks = await self.list_tasks(
            agent_id=data.get("agent_id"),
            status=data.get("status")
        )
        return {"tasks": tasks, "count": len(tasks)}
```

**Step 6: Verify syntax**

Run: `python3 -c "from systems.pixel_compiler.a2a_router import A2ARouter; print('OK')"`

**Step 7: Commit**

```bash
git add systems/pixel_compiler/a2a_router.py
git commit -m "feat(a2a): add TaskRegistry for task delegation pattern"
```

---

## Task 2: Add a2a_assign_task WebMCP Tool

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Add tool registration call**

In `#register()` method after coordination primitives:

```javascript
            // Phase D tools - Task Delegation
            await this.#registerA2AAssignTask();
            await this.#registerA2AReportProgress();
            await this.#registerA2AGetTaskResult();
```

**Step 2: Implement #registerA2AAssignTask**

```javascript
    // ─────────────────────────────────────────────────────────────
    // Tool 15: a2a_assign_task (Phase D - Task Delegation)
    // ─────────────────────────────────────────────────────────────

    async #registerA2AAssignTask() {
        const tool = {
            name: 'a2a_assign_task',
            description:
                'Assign a task to another agent for asynchronous execution. ' +
                'The target agent receives a task_assigned event and can report progress. ' +
                'Use a2a_get_task_result to retrieve the final result.',
            inputSchema: {
                type: 'object',
                properties: {
                    to_agent: {
                        type: 'string',
                        description: 'Agent ID to assign the task to'
                    },
                    task_type: {
                        type: 'string',
                        description: 'Type of task (e.g., "scan_region", "analyze_data")'
                    },
                    params: {
                        type: 'object',
                        description: 'Task parameters specific to task_type'
                    },
                    timeout: {
                        type: 'number',
                        description: 'Task timeout in seconds (default: 300)',
                        default: 300
                    }
                },
                required: ['to_agent', 'task_type', 'params']
            },
            handler: async (params) => {
                return this.#handleA2AAssignTask(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2AAssignTask({ to_agent, task_type, params, timeout = 300 }) {
        this.#trackCall('a2a_assign_task');

        if (!to_agent || !task_type) {
            return {
                success: false,
                error: 'to_agent and task_type are required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'assign_task',
                from_agent: this.#sessionId || 'default-agent',
                to_agent,
                task_type,
                params: params || {},
                timeout
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: !response.error,
                task_id: response.task_id,
                status: response.status,
                assigned_to: response.assigned_to,
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

**Step 4: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add a2a_assign_task tool for task delegation"
```

---

## Task 3: Add a2a_report_progress WebMCP Tool

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Implement #registerA2AReportProgress**

```javascript
    // ─────────────────────────────────────────────────────────────
    // Tool 16: a2a_report_progress (Phase D - Task Delegation)
    // ─────────────────────────────────────────────────────────────

    async #registerA2AReportProgress() {
        const tool = {
            name: 'a2a_report_progress',
            description:
                'Report progress on an assigned task. ' +
                'The task owner receives progress updates via task_progress events.',
            inputSchema: {
                type: 'object',
                properties: {
                    task_id: {
                        type: 'string',
                        description: 'Task ID to report progress on'
                    },
                    progress: {
                        type: 'number',
                        description: 'Progress value from 0.0 to 1.0',
                        minimum: 0,
                        maximum: 1
                    },
                    status: {
                        type: 'string',
                        description: 'Optional status update (in_progress, waiting, etc.)'
                    },
                    message: {
                        type: 'string',
                        description: 'Optional progress message'
                    }
                },
                required: ['task_id', 'progress']
            },
            handler: async (params) => {
                return this.#handleA2AReportProgress(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2AReportProgress({ task_id, progress, status, message }) {
        this.#trackCall('a2a_report_progress');

        if (!task_id) {
            return {
                success: false,
                error: 'task_id is required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'report_progress',
                task_id,
                agent_id: this.#sessionId || 'default-agent',
                progress: Math.max(0, Math.min(1, progress)),
                status,
                message
            };

            const response = await this.#sendA2ARequest(request);

            return {
                success: !response.error,
                task_id: response.task_id,
                progress: response.progress,
                status: response.status,
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

**Step 3: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add a2a_report_progress tool"
```

---

## Task 4: Add a2a_get_task_result WebMCP Tool

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Implement #registerA2AGetTaskResult**

```javascript
    // ─────────────────────────────────────────────────────────────
    // Tool 17: a2a_get_task_result (Phase D - Task Delegation)
    // ─────────────────────────────────────────────────────────────

    async #registerA2AGetTaskResult() {
        const tool = {
            name: 'a2a_get_task_result',
            description:
                'Get the status and result of an assigned task. ' +
                'Poll this to check if a task has completed and retrieve the result.',
            inputSchema: {
                type: 'object',
                properties: {
                    task_id: {
                        type: 'string',
                        description: 'Task ID to query'
                    }
                },
                required: ['task_id']
            },
            handler: async (params) => {
                return this.#handleA2AGetTaskResult(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleA2AGetTaskResult({ task_id }) {
        this.#trackCall('a2a_get_task_result');

        if (!task_id) {
            return {
                success: false,
                error: 'task_id is required',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            const request = {
                type: 'get_task',
                task_id
            };

            const response = await this.#sendA2ARequest(request);

            if (response.error) {
                return {
                    success: false,
                    task_id,
                    error: response.error,
                    error_code: 'TASK_NOT_FOUND'
                };
            }

            return {
                success: true,
                task_id: response.task_id,
                status: response.status,
                progress: response.progress,
                result: response.result,
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

**Step 3: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add a2a_get_task_result tool"
```

---

## Task 5: Add Python Task Delegation Tests

**Files:**
- Modify: `systems/pixel_compiler/tests/test_a2a_router.py`

**Step 1: Add task delegation tests class**

```python


class TestA2ATaskDelegation:
    """Tests for task delegation pattern."""

    @pytest.fixture
    def router(self):
        """Create a fresh A2A router for each test."""
        return A2ARouter()

    @pytest.mark.asyncio
    async def test_assign_task(self, router):
        """Can assign a task to another agent."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router.register_agent("coordinator", mock_conn1, {"agent_type": "coordinator"})
        await router.register_agent("worker", mock_conn2, {"agent_type": "executor"})

        result = await router.assign_task(
            from_agent="coordinator",
            to_agent="worker",
            task_type="scan_region",
            params={"x": 0, "y": 0, "width": 100, "height": 100}
        )

        assert result["status"] == "assigned"
        assert "task_id" in result
        # Worker should receive notification
        mock_conn2.send.assert_called_once()

    @pytest.mark.asyncio
    async def test_report_progress(self, router):
        """Agent can report task progress."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router.register_agent("coordinator", mock_conn1, {"agent_type": "coordinator"})
        await router.register_agent("worker", mock_conn2, {"agent_type": "executor"})

        # Assign task
        task = await router.assign_task(
            from_agent="coordinator",
            to_agent="worker",
            task_type="scan_region",
            params={}
        )
        task_id = task["task_id"]

        # Report progress
        result = await router.report_progress(
            task_id=task_id,
            agent_id="worker",
            progress=0.5,
            status="in_progress"
        )

        assert result["progress"] == 0.5
        assert result["status"] == "in_progress"

    @pytest.mark.asyncio
    async def test_complete_task(self, router):
        """Agent can complete a task with result."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router.register_agent("coordinator", mock_conn1, {"agent_type": "coordinator"})
        await router.register_agent("worker", mock_conn2, {"agent_type": "executor"})

        # Assign and complete
        task = await router.assign_task(
            from_agent="coordinator",
            to_agent="worker",
            task_type="scan_region",
            params={}
        )
        task_id = task["task_id"]

        result = await router.complete_task(
            task_id=task_id,
            agent_id="worker",
            result={"pixels_scanned": 10000, "anomalies": 3},
            success=True
        )

        assert result["status"] == "completed"
        assert result["success"] is True

    @pytest.mark.asyncio
    async def test_get_task_status(self, router):
        """Can query task status."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router.register_agent("coordinator", mock_conn1, {"agent_type": "coordinator"})
        await router.register_agent("worker", mock_conn2, {"agent_type": "executor"})

        task = await router.assign_task(
            from_agent="coordinator",
            to_agent="worker",
            task_type="scan_region",
            params={}
        )
        task_id = task["task_id"]

        # Get task status
        status = await router.get_task(task_id)

        assert status is not None
        assert status["status"] == "assigned"
        assert status["progress"] == 0.0

    @pytest.mark.asyncio
    async def test_task_failed(self, router):
        """Task can be marked as failed."""
        mock_conn1 = AsyncMock()
        mock_conn2 = AsyncMock()

        await router.register_agent("coordinator", mock_conn1, {"agent_type": "coordinator"})
        await router.register_agent("worker", mock_conn2, {"agent_type": "executor"})

        task = await router.assign_task(
            from_agent="coordinator",
            to_agent="worker",
            task_type="scan_region",
            params={}
        )
        task_id = task["task_id"]

        result = await router.complete_task(
            task_id=task_id,
            agent_id="worker",
            result={"error": "Region locked by another agent"},
            success=False
        )

        assert result["status"] == "failed"

    @pytest.mark.asyncio
    async def test_list_tasks(self, router):
        """Can list tasks with filters."""
        mock_conn = AsyncMock()
        await router.register_agent("coordinator", mock_conn, {"agent_type": "coordinator"})
        await router.register_agent("worker", mock_conn, {"agent_type": "executor"})

        # Create multiple tasks
        await router.assign_task("coordinator", "worker", "task1", {})
        await router.assign_task("coordinator", "worker", "task2", {})

        tasks = await router.list_tasks(agent_id="worker")

        assert len(tasks) == 2
```

**Step 2: Run tests**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py -v`

Expected: All tests pass (28+ total)

**Step 3: Commit**

```bash
git add systems/pixel_compiler/tests/test_a2a_router.py
git commit -m "test(a2a): add task delegation pattern tests"
```

---

## Task 6: Final Verification

**Step 1: Run all Python tests**

Run: `python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py -v`

Expected: 28+ tests pass

**Step 2: Verify JavaScript syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js`

Expected: No syntax errors

**Step 3: Check tool count**

Run: `grep -c "async #register" systems/visual_shell/web/webmcp_bridge.js`

Expected: 27+ registered tools

**Step 4: Final summary**

```bash
git log --oneline -10
```

---

## Success Criteria

1. ✅ Task dataclass and registry in A2A Router
2. ✅ `a2a_assign_task` tool registered
3. ✅ `a2a_report_progress` tool registered
4. ✅ `a2a_get_task_result` tool registered
5. ✅ 6 new Python tests for task delegation
6. ✅ All tests pass
7. ✅ JavaScript syntax valid

---

## References

- A2A Router: `systems/pixel_compiler/a2a_router.py`
- Phase D Design: `docs/plans/2026-02-13-webmcp-phase-d-design.md`
- Coordination Tools Plan: `docs/plans/2026-02-13-a2a-coordination-tools.md`
