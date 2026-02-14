# A2A Coordination Primitives Guide

**Geometry OS - Agent-to-Agent Communication System**

## Overview

The A2A (Agent-to-Agent) coordination system provides distributed primitives for multi-agent workflows:

- **Distributed Locks** - Mutual exclusion for shared resources
- **Barriers** - Synchronization checkpoints for parallel agents

## Quick Start

```bash
# Start both servers
./scripts/start_a2a_dev.sh

# Open test page
# http://localhost:8000/test_a2a_tools.html
```

## Distributed Locks

### Purpose

Locks provide **mutual exclusion** - ensuring only one agent can access a resource at a time.

### How It Works

```
Agent 1                    Agent 2
   |                           |
   |--[ACQUIRE lock-A]------->|
   |                           |
   |<--[GRANTED, expires=30s]--|
   |                           |
   | (holds lock)              |
   |                           |--[ACQUIRE lock-A]------->|
   |                           |<--[QUEUED, position=1]---|
   |                           |
   |--[RELEASE lock-A]-------->|
   |                           |
   |                           |<--[GRANTED, expires=30s]--|
   |                           | (now holds lock)
```

### API

#### Acquire Lock

```javascript
// Via WebMCP tool
const result = await a2a_acquire_lock({
    lock_id: "region-100-200",
    timeout: 30,  // seconds
    agent_id: "agent-001"  // optional, defaults to session
});

// Response (granted)
{
    success: true,
    lock_id: "region-100-200",
    granted: true,
    expires_at: "2026-02-13T12:34:56Z",
    queue_position: 0
}

// Response (queued - lock held by another agent)
{
    success: true,
    lock_id: "region-100-200",
    granted: false,
    queue_position: 1
}
```

#### Release Lock

```javascript
const result = await a2a_release_lock({
    lock_id: "region-100-200",
    agent_id: "agent-001"  // optional
});

// Response
{
    success: true,
    lock_id: "region-100-200",
    released: true
}
```

### Lock Naming Conventions

| Pattern | Use Case | Example |
|----------|-----------|----------|
| `region-{x}-{y}` | Spatial region lock | `region-100-200` |
| `resource-{name}` | Named resource | `resource-database` |
| `file-{path}` | File access | `file-/config/settings.json` |
| `phase-{name}` | Phase gate | `phase-mutation` |

### Best Practices

1. **Always release locks** - Use try/finally to ensure cleanup
2. **Set appropriate timeouts** - Balance between safety and progress
3. **Handle queuing** - Agents may wait; implement timeout/retry logic
4. **Reentrant safe** - Same agent can re-acquire lock they hold
5. **Monitor expiration** - Locks auto-expire; implement heartbeat for long operations

### Example Workflow

```javascript
async function processRegion(regionId, agentId) {
    const lockId = `region-${regionId}`;

    // Acquire lock
    const lock = await a2a_acquire_lock({
        lock_id: lockId,
        timeout: 60,
        agent_id: agentId
    });

    if (!lock.granted) {
        console.log(`Region ${regionId} busy, position ${lock.queue_position}`);
        return { status: "queued", position: lock.queue_position };
    }

    try {
        // Critical section - exclusive access
        await scanRegion(regionId);
        await mutateRegion(regionId);
        return { status: "success", region: regionId };
    } finally {
        // Always release
        await a2a_release_lock({
            lock_id: lockId,
            agent_id: agentId
        });
    }
}
```

## Barriers

### Purpose

Barriers provide **synchronization points** - ensuring multiple agents reach the same point before continuing.

### How It Works

```
Phase 1: Enter
-----------

Agent 1     Agent 2     Agent 3
   |            |            |
   |--[ENTER]--|            |
   |            |--[ENTER]-- |
   |            |            |--[ENTER]
   |            |            |
   |<----[WAIT----|----WAIT----|
   |            |            |

Phase 2: All Arrived (expected_count = 3)
-------------------------------------------
   |            |            |
   |<---[RELEASE]--------RELEASE---|
   |            |            |
   v            v            v
(continue)  (continue)  (continue)
```

### API

#### Enter Barrier

```javascript
// Via WebMCP tool
const result = await a2a_barrier_enter({
    barrier_id: "phase-1-complete",
    expected_count: 3,  // agents needed
    agent_id: "agent-001"
});

// Response (waiting for more agents)
{
    success: true,
    barrier_id: "phase-1-complete",
    released: false,
    arrived_count: 1,
    expected_count: 3
}

// Response (all arrived, released)
{
    success: true,
    barrier_id: "phase-1-complete",
    released: true,
    arrived_count: 3,
    expected_count: 3
}
```

### Barrier Naming Conventions

| Pattern | Use Case | Example |
|----------|-----------|----------|
| `phase-{name}` | Phase completion | `phase-1-complete` |
| `checkpoint-{n}` | Checkpoint number | `checkpoint-5` |
| `round-{n}` | Iteration round | `round-100` |
| `consensus-{topic}` | Decision point | `consensus-layout` |

### Best Practices

1. **Agree on IDs** - All agents must use same barrier_id
2. **Match expected_count** - Must equal number of participating agents
3. **Handle timeouts** - Implement timeout for stuck barriers
4. **Reset after use** - Barriers auto-reset after release
5. **Idempotent entry** - Same agent can enter multiple times (counts once)

### Example Workflow

```javascript
async function multiAgentPhase(agents) {
    const barrierId = `phase-${Date.now()}`;
    const expectedCount = agents.length;

    // All agents run phase
    const results = await Promise.all(agents.map(agent =>
        runAgentPhase(agent, barrierId, expectedCount)
    ));

    return results;
}

async function runAgentPhase(agent, barrierId, expectedCount) {
    // Do phase work
    const result = await agent.execute();

    // Wait for all agents to finish
    const barrier = await a2a_barrier_enter({
        barrier_id: barrierId,
        expected_count: expectedCount,
        agent_id: agent.id
    });

    if (barrier.released) {
        console.log(`All agents finished phase`);
    }

    return result;
}
```

## Troubleshooting

### Lock Issues

**Problem:** Lock never granted

| Cause | Solution |
|-------|----------|
| Lock held by crashed agent | Wait for timeout (default 30s) |
| Lock never released | Check agent logs for crashes |
| Queue position not advancing | Verify holder agent is running |

**Problem:** Lock expires too soon

| Cause | Solution |
|-------|----------|
| Operation takes longer than timeout | Increase timeout value |
| Agent hangs during operation | Debug/hang analysis needed |

### Barrier Issues

**Problem:** Barrier never releases

| Cause | Solution |
|-------|----------|
| expected_count too high | Verify actual number of agents |
| Agent crashes before entering | Implement barrier timeout |
| Agents using different barrier_id | Standardize ID generation |

**Problem:** Barrier releases prematurely

| Cause | Solution |
|-------|----------|
| expected_count too low | Match to actual agent count |
| Same agent enters multiple times | Deduplicate agent IDs |

## Testing

### Manual Testing

1. Start servers: `./scripts/start_a2a_dev.sh`
2. Open test page: `http://localhost:8000/test_a2a_tools.html`
3. Run automated tests: Click "Run All Tests"
4. Try manual operations:
   - Acquire lock with Agent A
   - Acquire same lock with Agent B (should queue)
   - Release lock (Agent B should be granted)

### Automated Testing

```bash
# Run Python backend tests
python3 -m pytest systems/pixel_compiler/tests/test_a2a_router.py -v

# Expected: 22 tests passing
```

## Architecture

### Components

```
┌─────────────────────────────────────────────────────────┐
│                    Browser Frontend                    │
│  ┌────────────┐  ┌────────────┐  ┌────────────┐  │
│  │   Agent A  │  │   Agent B  │  │   Agent C  │  │
│  └─────┬──────┘  └─────┬──────┘  └─────┬──────┘  │
└────────┼────────────────┼────────────────┼───────────┘
         │                │                │
         └────────────────┴────────────────┘
                        │
                    WebSocket
                    ws://localhost:8766/a2a
                        │
┌───────────────────────┴───────────────────────────────┐
│              Python A2A Router Backend                 │
│  ┌──────────────┐  ┌──────────────┐  ┌───────────┐ │
│  │  Lock Manager│  │ Barrier Mgr  │  │   Agent    │ │
│  │              │  │              │  │  Registry  │ │
│  └──────────────┘  └──────────────┘  └───────────┘ │
└──────────────────────────────────────────────────────────┘
```

### Message Flow

1. **Agent registers** → Backend stores connection
2. **Agent requests lock** → Backend checks state, grants/queues
3. **Agent releases lock** → Backend notifies next in queue
4. **Agent enters barrier** → Backend counts arrivals
5. **All agents arrived** → Backend releases all

## Reference

### Lock States

| State | Description |
|-------|-------------|
| Free | No holder, available |
| Held | One agent holds, has expiration |
| Queued | Agents waiting, FIFO order |

### Barrier States

| State | Description |
|-------|-------------|
| Waiting | Less than expected_count arrived |
| Released | All arrived, agents can continue |
| Reset | After release, ready for reuse |

## Multi-Agent Demo

A complete demonstration of multi-agent collaboration is available at:
`http://localhost:8000/demo_multi_agent.html`

### Running the Demo

```bash
# Start the A2A router and web server
./scripts/start_a2a_dev.sh

# Open in browser
# http://localhost:8000/demo_multi_agent.html
```

### Demo Agents

| Agent | Role | Coordination Used |
|-------|------|-------------------|
| Scanner | Claims and scans regions | Locks, Task delegation |
| Processor | Processes scanned data | Task queue |
| Coordinator | Orchestrates workflow | Task assignment, Barriers |

### Demo Flow

1. **Phase 1**: Coordinator assigns regions to Scanner
2. Scanner acquires lock, scans, releases lock
3. Scanner delegates processing to Processor
4. Processor queues and processes data
5. **Phase 2**: All agents synchronize at barrier
6. **Phase 3**: Finalization and summary

### Key Patterns Demonstrated

- **Distributed Locking**: Preventing concurrent region access
- **Task Delegation**: Scanner → Processor work handoff
- **Barrier Synchronization**: Phase coordination
- **Progress Tracking**: Real-time metrics display

## Related Documentation

- [Multi-Agent Demo Plan](./plans/2026-02-14-multi-agent-collaboration-demo.md)
- [A2A Protocol Design](./plans/2026-02-12-webmcp-phase-d-design.md)
- [WebMCP Bridge](../systems/visual_shell/web/webmcp_bridge.js)
- [A2A Router](../systems/pixel_compiler/a2a_router.py)
- [Demo JavaScript](../systems/visual_shell/web/multi_agent_demo.js)
