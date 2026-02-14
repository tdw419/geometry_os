# WebMCP Phase G: Collaborative Multi-AI Building — Design Document

**Date:** 2026-02-13
**Phase:** Phase G: Collaborative Multi-AI Building
**Status:** Design Draft
**Depends On:** Phase D (A2A Protocol), Phase F (AI-Driven Visual Builder)

---

## Overview

Phase G enables **multiple AI agents** to collaboratively build on the Infinite Map simultaneously. Agents coordinate through region ownership, task delegation, shared state, and synchronization primitives.

**Paradigm:** "Multiple AIs, one canvas, coordinated construction."

---

## Goals

1. **Parallel Construction** - Multiple agents build simultaneously in different regions
2. **Task Delegation** - Agents can assign subtasks to specialized agents
3. **Shared Visibility** - All agents see who's working where
4. **Conflict Avoidance** - Region claims prevent overlapping work
5. **Session Management** - Persistent build sessions with state tracking

---

## Architecture

### System Overview

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    Collaborative Build Session                           │
│                                                                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐│
│  │  Architect   │  │   Builder    │  │   Builder    │  │   Tester     ││
│  │   Agent      │  │   Agent A    │  │   Agent B    │  │   Agent      ││
│  │  (planner)   │  │  (executor)  │  │  (executor)  │  │ (validator)  ││
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘│
│         │                 │                 │                 │         │
│         └─────────────────┴─────────────────┴─────────────────┘         │
│                                    │                                     │
│                    ┌───────────────┴───────────────┐                    │
│                    │     Session Coordinator       │                    │
│                    │  ┌─────────────────────────┐  │                    │
│                    │  │ • Agent Registry        │  │                    │
│                    │  │ • Region Claim Manager  │  │                    │
│                    │  │ • Task Queue            │  │                    │
│                    │  │ • Progress Tracker      │  │                    │
│                    │  │ • Event Broadcaster     │  │                    │
│                    │  └─────────────────────────┘  │                    │
│                    └───────────────┬───────────────┘                    │
│                                    │                                     │
│  ┌─────────────────────────────────┴─────────────────────────────────┐  │
│  │                      Infinite Map Canvas                          │  │
│  │  ┌────────────────┐ ┌────────────────┐ ┌────────────────┐        │  │
│  │  │   Region A     │ │   Region B     │ │   Region C     │        │  │
│  │  │  (Agent A)     │ │  (Agent B)     │ │   (Free)       │        │  │
│  │  │ ┌──┬──┬──┬──┐ │ │ ┌──┬──┬──┬──┐ │ │ ┌──┬──┬──┬──┐ │        │  │
│  │  │ │Sy│Co│Da│  │ │ │ │Sy│Co│Da│  │ │ │ │  │  │  │  │ │        │  │
│  │  │ └──┴──┴──┴──┘ │ │ └──┴──┴──┴──┘ │ │ └──┴──┴──┴──┘ │        │  │
│  │  └────────────────┘ └────────────────┘ └────────────────┘        │  │
│  └──────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────┘
```

### Component Responsibilities

| Component | Responsibility |
|-----------|---------------|
| **Session Coordinator** | Central state management, event broadcasting |
| **Agent Registry** | Track connected agents, roles, capabilities |
| **Region Claim Manager** | Manage region ownership, detect conflicts |
| **Task Queue** | Prioritized task list, assignment tracking |
| **Progress Tracker** | Build metrics, completion percentage |
| **Event Broadcaster** | Real-time notifications to all agents |

---

## Agent Roles

### Role Definitions

| Role | Permissions | Typical Tasks |
|------|-------------|---------------|
| **Architect** | Full access, can delegate tasks | Plan layout, assign regions, approve builds |
| **Builder** | Write access to claimed regions | Place tiles, load shaders, assemble cartridges |
| **Tester** | Read access, write test results | Run tests, verify builds, report issues |
| **Observer** | Read-only access | Monitor progress, no modifications |

### Role Permissions Matrix

| Action | Architect | Builder | Tester | Observer |
|--------|-----------|---------|--------|----------|
| session_get_state | ✅ | ✅ | ✅ | ✅ |
| region_claim | ✅ | ✅ | ❌ | ❌ |
| region_release | ✅ | ✅ | ❌ | ❌ |
| builder_place_tile | ✅ | ✅ | ❌ | ❌ |
| builder_load_shader | ✅ | ✅ | ❌ | ❌ |
| task_delegate | ✅ | ❌ | ❌ | ❌ |
| task_accept | ✅ | ✅ | ✅ | ❌ |
| task_report | ✅ | ✅ | ✅ | ❌ |
| build_test | ❌ | ❌ | ✅ | ❌ |
| build_checkpoint | ✅ | ❌ | ❌ | ❌ |

---

## New WebMCP Tools

### Session Management Tools

#### Tool G.1: `session_create`

Create a new collaborative build session.

**Input Schema:**
```json
{
  "session_name": {
    "type": "string",
    "description": "Human-readable session name"
  },
  "max_agents": {
    "type": "number",
    "default": 10,
    "description": "Maximum concurrent agents"
  },
  "grid_size": {
    "type": "number",
    "default": 1000,
    "description": "Map grid size (grid_size x grid_size)"
  },
  "coordination_mode": {
    "type": "string",
    "enum": ["free", "coordinated", "sequential"],
    "default": "coordinated",
    "description": "Coordination strictness level"
  },
  "config": {
    "type": "object",
    "properties": {
      "auto_assign_regions": { "type": "boolean", "default": false },
      "require_approval": { "type": "boolean", "default": false },
      "checkpoint_interval": { "type": "number", "default": 60 }
    }
  }
}
```

**Returns:**
```json
{
  "success": true,
  "session_id": "session_abc123",
  "session_name": "Linux Kernel Build",
  "created_at": "2026-02-13T14:30:00Z",
  "invite_token": "join-token-xyz789",
  "state": {
    "agents_count": 0,
    "regions_claimed": 0,
    "tasks_pending": 0,
    "progress_percent": 0
  }
}
```

---

#### Tool G.2: `session_join`

Join an existing session as an agent.

**Input Schema:**
```json
{
  "session_id": {
    "type": "string",
    "description": "Session to join"
  },
  "agent_name": {
    "type": "string",
    "description": "Unique agent name in session"
  },
  "role": {
    "type": "string",
    "enum": ["architect", "builder", "tester", "observer"],
    "default": "builder"
  },
  "capabilities": {
    "type": "array",
    "items": { "type": "string" },
    "description": "Agent capabilities (e.g., ['wgsl', 'kernel', 'testing'])",
    "default": []
  },
  "invite_token": {
    "type": "string",
    "description": "Optional invite token for private sessions"
  }
}
```

**Returns:**
```json
{
  "success": true,
  "agent_id": "agent_def456",
  "session_id": "session_abc123",
  "role": "builder",
  "assigned_color": "#4CAF50",
  "session_state": {
    "agents": [
      {"agent_id": "agent_001", "name": "Architect-1", "role": "architect"}
    ],
    "claimed_regions": [
      {"region_id": "reg_001", "agent_id": "agent_001", "bounds": {"x":0,"y":0,"w":100,"h":100}}
    ],
    "pending_tasks": []
  }
}
```

---

#### Tool G.3: `session_leave`

Leave a session and release all claimed regions.

**Input Schema:**
```json
{
  "session_id": { "type": "string" },
  "agent_id": { "type": "string" },
  "handoff_to": {
    "type": "string",
    "description": "Optional agent to hand off claimed regions to"
  }
}
```

**Returns:**
```json
{
  "success": true,
  "released_regions": ["reg_001", "reg_002"],
  "transferred_to": "agent_007" // if handoff_to specified
}
```

---

#### Tool G.4: `session_get_state`

Get current session state and progress.

**Input Schema:**
```json
{
  "session_id": { "type": "string" },
  "include": {
    "type": "array",
    "items": { "enum": ["agents", "regions", "tasks", "progress", "events", "all"] },
    "default": ["all"]
  }
}
```

**Returns:**
```json
{
  "success": true,
  "session_id": "session_abc123",
  "state": {
    "agents": [
      {
        "agent_id": "agent_001",
        "name": "Builder-A",
        "role": "builder",
        "color": "#4CAF50",
        "joined_at": "2026-02-13T14:31:00Z",
        "regions_claimed": 2,
        "tasks_completed": 5
      }
    ],
    "regions": [
      {
        "region_id": "reg_001",
        "agent_id": "agent_001",
        "bounds": {"x": 0, "y": 0, "width": 100, "height": 100},
        "purpose": "kernel region",
        "claimed_at": "2026-02-13T14:32:00Z"
      }
    ],
    "tasks": {
      "pending": 3,
      "in_progress": 2,
      "completed": 15
    },
    "progress": {
      "tiles_placed": 450,
      "shaders_loaded": 12,
      "cartridges_assembled": 2,
      "completion_percent": 35
    }
  }
}
```

---

### Region Management Tools

#### Tool G.5: `region_claim`

Claim exclusive ownership of a map region.

**Input Schema:**
```json
{
  "session_id": { "type": "string" },
  "region": {
    "type": "object",
    "properties": {
      "x": { "type": "number" },
      "y": { "type": "number" },
      "width": { "type": "number" },
      "height": { "type": "number" }
    },
    "required": ["x", "y", "width", "height"]
  },
  "purpose": {
    "type": "string",
    "description": "Why this region is being claimed"
  },
  "exclusive": {
    "type": "boolean",
    "default": true,
    "description": "If true, no other agent can claim overlapping region"
  },
  "timeout": {
    "type": "number",
    "default": 300,
    "description": "Claim expiration in seconds"
  }
}
```

**Returns (Success):**
```json
{
  "success": true,
  "claim_id": "claim_xyz789",
  "region": {"x": 100, "y": 200, "width": 50, "height": 50},
  "exclusive": true,
  "expires_at": "2026-02-13T14:40:00Z",
  "conflicts": []
}
```

**Returns (Conflict):**
```json
{
  "success": false,
  "error": "region_conflict",
  "conflicting_agents": [
    {
      "agent_id": "agent_002",
      "agent_name": "Builder-B",
      "overlapping_region": {"x": 90, "y": 190, "width": 60, "height": 60}
    }
  ],
  "suggestion": "Claim region starting at (160, 200) to avoid conflict"
}
```

---

#### Tool G.6: `region_release`

Release a previously claimed region.

**Input Schema:**
```json
{
  "session_id": { "type": "string" },
  "claim_id": { "type": "string" },
  "transfer_to": {
    "type": "string",
    "description": "Optional agent to transfer claim to"
  }
}
```

**Returns:**
```json
{
  "success": true,
  "claim_id": "claim_xyz789",
  "released": true,
  "transferred_to": null
}
```

---

#### Tool G.7: `region_query`

Query region ownership and status.

**Input Schema:**
```json
{
  "session_id": { "type": "string" },
  "region": {
    "type": "object",
    "properties": {
      "x": { "type": "number" },
      "y": { "type": "number" },
      "width": { "type": "number" },
      "height": { "type": "number" }
    }
  }
}
```

**Returns:**
```json
{
  "success": true,
  "claims": [
    {
      "claim_id": "claim_001",
      "agent_id": "agent_002",
      "agent_name": "Builder-B",
      "bounds": {"x": 100, "y": 200, "width": 50, "height": 50},
      "purpose": "kernel module"
    }
  ],
  "is_free": false,
  "free_subregions": [
    {"x": 150, "y": 200, "width": 50, "height": 50}
  ]
}
```

---

### Task Delegation Tools

#### Tool G.8: `task_delegate`

Assign a task to another agent.

**Input Schema:**
```json
{
  "session_id": { "type": "string" },
  "target_agent_id": {
    "type": "string",
    "description": "Agent to delegate to, or 'any' for next available"
  },
  "task_type": {
    "type": "string",
    "enum": ["build", "test", "review", "evolve", "assemble", "migrate"]
  },
  "region": {
    "type": "object",
    "properties": {
      "x": { "type": "number" },
      "y": { "type": "number" },
      "width": { "type": "number" },
      "height": { "type": "number" }
    }
  },
  "description": {
    "type": "string",
    "description": "Detailed task description"
  },
  "priority": {
    "type": "string",
    "enum": ["low", "medium", "high", "critical"],
    "default": "medium"
  },
  "dependencies": {
    "type": "array",
    "items": { "type": "string" },
    "description": "Task IDs that must complete first",
    "default": []
  },
  "deadline": {
    "type": "string",
    "format": "date-time",
    "description": "Optional deadline"
  }
}
```

**Returns:**
```json
{
  "success": true,
  "task_id": "task_abc123",
  "assigned_to": "agent_002",
  "status": "pending",
  "position_in_queue": 1
}
```

---

#### Tool G.9: `task_accept`

Accept a delegated task.

**Input Schema:**
```json
{
  "session_id": { "type": "string" },
  "task_id": { "type": "string" },
  "agent_id": { "type": "string" }
}
```

**Returns:**
```json
{
  "success": true,
  "task_id": "task_abc123",
  "status": "in_progress",
  "claimed_region": "claim_xyz789"
}
```

---

#### Tool G.10: `task_report`

Report task completion or status update.

**Input Schema:**
```json
{
  "session_id": { "type": "string" },
  "task_id": { "type": "string" },
  "status": {
    "type": "string",
    "enum": ["completed", "failed", "blocked", "cancelled"]
  },
  "result": {
    "type": "object",
    "description": "Task result data"
  },
  "artifacts": {
    "type": "array",
    "items": {
      "type": "object",
      "properties": {
        "type": { "enum": ["tile", "shader", "cartridge", "screenshot"] },
        "id": { "type": "string" }
      }
    }
  },
  "message": {
    "type": "string",
    "description": "Optional status message"
  }
}
```

**Returns:**
```json
{
  "success": true,
  "task_id": "task_abc123",
  "status": "completed",
  "notified_agents": ["agent_001"],
  "unblocked_tasks": ["task_def456"]
}
```

---

#### Tool G.11: `task_get_queue`

View pending and in-progress tasks.

**Input Schema:**
```json
{
  "session_id": { "type": "string" },
  "filter": {
    "type": "object",
    "properties": {
      "assigned_to": { "type": "string" },
      "status": { "enum": ["pending", "in_progress", "all"] },
      "priority": { "type": "string" }
    }
  }
}
```

**Returns:**
```json
{
  "success": true,
  "tasks": [
    {
      "task_id": "task_001",
      "type": "build",
      "description": "Build kernel module",
      "assigned_to": "agent_002",
      "status": "in_progress",
      "priority": "high",
      "created_at": "2026-02-13T14:35:00Z"
    }
  ],
  "summary": {
    "pending": 5,
    "in_progress": 2,
    "completed_today": 12
  }
}
```

---

### Checkpoint Tools

#### Tool G.12: `build_checkpoint`

Create a save point for rollback.

**Input Schema:**
```json
{
  "session_id": { "type": "string" },
  "checkpoint_name": { "type": "string" },
  "description": { "type": "string" },
  "include": {
    "type": "array",
    "items": { "enum": ["tiles", "shaders", "cartridges", "session_state"] },
    "default": ["tiles", "shaders", "cartridges", "session_state"]
  }
}
```

**Returns:**
```json
{
  "success": true,
  "checkpoint_id": "ckpt_001",
  "checkpoint_name": "pre-migration",
  "created_at": "2026-02-13T15:00:00Z",
  "size_kb": 1250,
  "contents": {
    "tiles": 450,
    "shaders": 12,
    "cartridges": 2
  }
}
```

---

#### Tool G.13: `build_rollback`

Rollback to a previous checkpoint.

**Input Schema:**
```json
{
  "session_id": { "type": "string" },
  "checkpoint_id": { "type": "string" },
  "notify_agents": { "type": "boolean", "default": true }
}
```

**Returns:**
```json
{
  "success": true,
  "rolled_back_to": "ckpt_001",
  "rolled_back_at": "2026-02-13T15:30:00Z",
  "restored": {
    "tiles": 420,
    "shaders": 10,
    "cartridges": 1
  },
  "lost": {
    "tiles": 30,
    "shaders": 2,
    "cartridges": 1
  }
}
```

---

## Coordination Flows

### Flow 1: Parallel Region Building

Three agents building in parallel with coordinated handoff.

```
Timeline →

Agent A (Builder)    │ claim(0,0,100,100)
                    │────●
                    │    │
                    │    ├─ build tiles ───●
                    │    │                 │
                    │    │                 ├─ release ───●
                    │    │                 │             │
                    │    │                 │             │
────────────────────┼────┴─────────────────┴─────────────┴────

Agent B (Builder)   │         claim(100,0,100,100)
                    │────────────●
                    │            │
                    │            ├─ build tiles ───●
                    │            │                 │
                    │            │                 ├─ release ───●
                    │            │                 │             │
────────────────────┼────────────┴─────────────────┴─────────────┴

Agent C (Builder)   │              claim(200,0,100,100)
                    │───────────────────●
                    │                   │
                    │                   ├─ build tiles ───●
                    │                   │                 │
                    │                   │                 ├─ release ───●
                    │                   │                 │             │
────────────────────┼───────────────────┴─────────────────┴─────────────┴

Barrier             │                                       barrier_enter
(sync all)          │────────────────────────────────────────────●
                    │                                            │
                    │◄─────────── ALL RELEASED ─────────────────┤
                    │
────────────────────┼──────────────────────────────────────────────────────
```

### Flow 2: Task Delegation Chain

Architect delegates to Builder, Builder completes, Tester verifies.

```
Architect           Builder             Tester
    │                   │                   │
    │ task_delegate     │                   │
    │──────────────────>│                   │
    │ "build kernel"    │                   │
    │                   │                   │
    │                   │ task_accept       │
    │                   │──●                │
    │                   │  │                │
    │                   │  ├─ build ────●   │
    │                   │  │            │   │
    │                   │  │            │   │
    │                   │ task_report   │   │
    │<──────────────────│ "completed"   │   │
    │                   │               │   │
    │ task_delegate     │               │   │
    │───────────────────────────────────>│
    │ "test kernel"     │               │   │
    │                   │               │   │
    │                   │               │ task_accept
    │                   │               │──●
    │                   │               │  │
    │                   │               │  ├─ test ────●
    │                   │               │  │           │
    │                   │               │  │           │
    │                   │               │ task_report │
    │<──────────────────────────────────│ "passed"    │
    │                   │               │             │
    ▼                   ▼               ▼             ▼
```

### Flow 3: Conflict Resolution

Two agents attempt to claim overlapping regions.

```
Agent A                    Agent B                    Coordinator
    │                          │                          │
    │ claim(0,0,100,100)       │                          │
    │─────────────────────────────────────────────────────>│
    │                          │                          │
    │<───── "granted" ─────────│─────────────────────────│
    │                          │                          │
    │                          │ claim(50,50,100,100)     │
    │                          │─────────────────────────>│
    │                          │                          │
    │                          │<──── "conflict" ─────────│
    │                          │  with Agent A            │
    │                          │  suggestion: (100,100)   │
    │                          │                          │
    │                          │ claim(100,100,100,100)   │
    │                          │─────────────────────────>│
    │                          │                          │
    │                          │<──── "granted" ──────────│
    │                          │                          │
    ▼                          ▼                          ▼
```

---

## Event System

### Event Types

| Event | Trigger | Payload |
|-------|---------|---------|
| `agent_joined` | Agent joins session | `{agent_id, name, role}` |
| `agent_left` | Agent leaves session | `{agent_id, reason}` |
| `region_claimed` | Region claimed | `{agent_id, region, claim_id}` |
| `region_released` | Region released | `{agent_id, claim_id}` |
| `task_created` | New task delegated | `{task_id, type, assigned_to}` |
| `task_completed` | Task finished | `{task_id, result}` |
| `checkpoint_created` | Checkpoint saved | `{checkpoint_id, name}` |
| `rollback` | Session rolled back | `{checkpoint_id, lost_items}` |
| `conflict_detected` | Region conflict | `{agents, overlapping_region}` |

### Subscription

Agents subscribe to events via A2A:

```javascript
// Subscribe to all session events
await a2a_subscribe({
    topic: `session:${session_id}:events`,
    agent_id: myAgentId
});

// Subscribe to specific event types
await a2a_subscribe({
    topic: `session:${session_id}:events:task_created`,
    agent_id: myAgentId
});
```

---

## Files to Create/Modify

| File | Action | Est. Lines | Description |
|------|--------|------------|-------------|
| `webmcp_bridge.js` | Modify | +450 | Add 13 new Phase G tools |
| `CollaborationManager.js` | Create | ~350 | Session & coordination logic |
| `SessionCoordinator.js` | Create | ~250 | State management, events |
| `collab_test.html` | Create | ~250 | Interactive test page |
| `phase-g-design.md` | Create | ~400 | This document |

---

## Success Criteria

| # | Criteria | Verification |
|---|----------|-------------|
| 1 | Multiple agents can join a session | `session_join` returns success for 3+ agents |
| 2 | Region claims prevent conflicts | Overlapping claims rejected with suggestion |
| 3 | Task delegation works end-to-end | Delegate → Accept → Complete → Notify |
| 4 | Session state visible to all | `session_get_state` shows all agents |
| 5 | Barriers coordinate phase transitions | `a2a_barrier_enter` works with session agents |
| 6 | Checkpoints enable rollback | Create → Modify → Rollback → Verify |
| 7 | Events broadcast to subscribers | A2A subscription receives events |
| 8 | Role permissions enforced | Builders can't delegate, observers can't write |

---

## Example Multi-Agent Session

```javascript
// === AGENT 1: Architect ===

// Create session
const session = await session_create({
    session_name: "Linux Kernel Build",
    coordination_mode: "coordinated"
});
// Returns: {session_id: "sess_001", invite_token: "tok_abc"}

// Join as architect
await session_join({
    session_id: "sess_001",
    agent_name: "Architect-1",
    role: "architect"
});

// Claim planning region
await region_claim({
    session_id: "sess_001",
    region: {x: 0, y: 0, width: 200, height: 200},
    purpose: "master planning"
});

// Delegate build task to any builder
await task_delegate({
    session_id: "sess_001",
    target_agent_id: "any",
    task_type: "build",
    region: {x: 0, y: 0, width: 100, height: 100},
    description: "Build kernel entry point",
    priority: "high"
});


// === AGENT 2: Builder ===

// Join session
await session_join({
    session_id: "sess_001",
    agent_name: "Builder-A",
    role: "builder",
    invite_token: "tok_abc"
});

// Get assigned tasks
const tasks = await task_get_queue({
    session_id: "sess_001",
    filter: {assigned_to: "any"}
});

// Accept task
await task_accept({
    session_id: "sess_001",
    task_id: tasks.tasks[0].task_id
});

// Claim region for task
await region_claim({
    session_id: "sess_001",
    region: {x: 0, y: 0, width: 100, height: 100},
    purpose: "building kernel entry"
});

// Build tiles
await builder_place_tile({tile_type: "system", x: 10, y: 10});
await builder_place_tile({tile_type: "code", x: 20, y: 10});

// Report completion
await task_report({
    session_id: "sess_001",
    task_id: tasks.tasks[0].task_id,
    status: "completed",
    artifacts: [{type: "tile", id: "tile_001"}]
});


// === AGENT 3: Tester ===

// Join as tester
await session_join({
    session_id: "sess_001",
    agent_name: "Tester-1",
    role: "tester"
});

// Get build tasks to test
const completed = await task_get_queue({
    session_id: "sess_001",
    filter: {status: "completed"}
});

// Run tests (using existing test infrastructure)
const results = await runTests(completed.tasks);

// Report test results
await task_report({
    session_id: "sess_001",
    task_id: testTask.task_id,
    status: results.passed ? "completed" : "failed",
    result: results
});


// === SYNCHRONIZATION ===

// All agents wait at barrier
await a2a_barrier_enter({
    barrier_id: "phase-1-complete",
    expected_count: 3
});

// When all 3 arrive, continue to next phase
console.log("Phase 1 complete, proceeding to Phase 2");
```

---

## Implementation Phases

### Phase G.1: Session Foundation (2 days)
- `session_create`, `session_join`, `session_leave`, `session_get_state`
- SessionCoordinator.js
- Agent registry

### Phase G.2: Region Management (2 days)
- `region_claim`, `region_release`, `region_query`
- Conflict detection
- Integration with A2A locks

### Phase G.3: Task Delegation (2 days)
- `task_delegate`, `task_accept`, `task_report`, `task_get_queue`
- Priority queue
- Dependency tracking

### Phase G.4: Checkpoints & Events (1 day)
- `build_checkpoint`, `build_rollback`
- Event broadcasting via A2A
- Test page

---

## References

- Phase D Design: `docs/plans/2026-02-13-webmcp-phase-d-design.md`
- Phase F Design: `docs/plans/2026-02-13-webmcp-phase-f-design.md`
- A2A Coordination Guide: `docs/a2a_coordination_guide.md`
- WebMCP Roadmap: `ai_project_management/roadmaps/webmcp-improvement-roadmap.md`
