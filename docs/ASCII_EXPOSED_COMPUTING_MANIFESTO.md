# ASCII Exposed Computing Manifesto

**Version 1.0** | **February 2026**

---

## Preamble

For forty years, software systems have hidden their state behind binary walls, graphical interfaces, and proprietary serialization formats. This opacity served human users well—but the era of AI co-working demands a new paradigm.

AI agents perceive the world through tokens, not photons. They cannot click buttons or read pixel-rendered text. Every time an AI must invoke a specialized tool to read system state, we pay a cost in latency, complexity, and brittleness. What if perception were free?

**ASCII Exposed Computing** is a design framework where every meaningful system state is exposed as readable ASCII text by default. Not as an afterthought. Not as a debug endpoint. As the primary interface.

**Key concept: Zero-cost perception.**
When state is ASCII, reading becomes a single token stream. No parsing libraries. No API clients. No schema negotiation. Just `cat`, `grep`, and `diff`—tools that have worked for fifty years and will work for fifty more.

This manifesto defines the principles, patterns, and contracts for building systems that speak fluently to both human and AI audiences simultaneously. It is not a library or framework, but a philosophy—one that traces its lineage through Plan 9's "everything is a file," UNIX's `/proc` filesystem, and the Twelve-Factor App methodology.

The goal: Systems where understanding is a `cat` away, debugging is a `diff` away, and automation is a `grep` away.

---

## Core Principles

### Principle 1: State as Text

Every meaningful system state MUST be representable as human-readable text.

**Good:**
```
status/agent_count: 5
status/agent_count: 5.active=3.idle=2
```

**Bad:**
```json
{"agent_count": 5, "active": 3, "idle": 2, "_bin": "AXgAAA=="}
```

Text is the universal medium. When state is text, any tool can read it. When state requires parsing, only tools with the parser can read it.

---

### Principle 2: Transition as Edit

State changes MUST be expressible as text edits (inserts, deletes, replacements).

**Good:**
```
# Before
status/queue: task_a,task_b,task_c

# After (task_b completed)
status/queue: task_a,task_c
```

**Bad:**
```
# State mutation via binary protocol
MUTATE offset=0x3F length=4 value=0x00000000
```

When transitions are edits, `diff` becomes a debugging tool. When transitions are opaque operations, debugging requires specialized instrumentation.

---

### Principle 3: Dual-Audience

Every exposed fragment MUST be simultaneously comprehensible to humans AND parseable by AI.

**Good:**
```
# Human reads: "3 tasks pending, 2 running"
# AI parses: {"pending": 3, "running": 2}
tasks/status: pending=3 running=2
```

**Bad:**
```
# Human-readable only
tasks/status: There are currently three tasks waiting and two executing.

# Machine-readable only
tasks/status.json: {"p":3,"r":2}
```

Dual-audience design forces clarity. When a human can read it, an AI can reason about it. When only a machine can read it, maintainability suffers.

---

### Principle 4: Grep-ability

Any state query MUST be answerable with standard text tools (grep, awk, sed).

**Good:**
```
# Find all error states
$ grep "status=error" fragments/
fragments/agent_001: status=error code=timeout
fragments/agent_003: status=error code=connection_refused

# Count running tasks
$ grep -c "state=running" tasks/
tasks/main: 3
tasks/worker: 7
```

**Bad:**
```
# Requires custom query tool
$ query-fragments --json 'SELECT * FROM fragments WHERE status = "error"'

# Requires API client
$ curl -H "Accept: application/msgpack" /api/v1/tasks?state=running | msgpack-decode
```

Grep-ability is the litmus test. If you need a custom tool to find information, the system is not truly exposed.

---

### Principle 5: Diff-ability

Temporal comparison MUST be possible with standard diff tools.

**Good:**
```
$ diff status/ old/2024-02-20/
< agent_count: 7
---
> agent_count: 5
< queue_depth: 12
---
> queue_depth: 3
```

**Bad:**
```
# Requires snapshot comparison tool
$ compare-snapshots --binary snapshot_001.bin snapshot_002.bin
Changes detected in 3 regions.

# Requires structured logging analysis
$ jq -f compare.jq logs/2024-02-20.jsonl logs/2024-02-21.jsonl
```

When history is diff-able, debugging becomes archaeology. Without diff-ability, understanding change requires reconstructing the past from logs.

---

## The Dual-Audience Contract

ASCII Exposed Computing serves two masters: humans who need to quickly scan and understand state, and AI agents who need to reliably parse and reason about it. Each audience has distinct needs. This contract defines the obligations to both.

### Contract for Humans

| Requirement | Why It Matters | Example |
|-------------|----------------|---------|
| **Alignment** | Columns are easier to scan | `status: running` not `status:running` |
| **Comments** | Context aids understanding | `# Max retries before backoff` |
| **Visual Hierarchy** | Important data stands out | Group related fields, use separators |
| **Units** | Numbers need meaning | `timeout: 30s` not `timeout: 30` |
| **Truncation** | Long values need limits | `log: [first 500 chars]...` |

Humans read for comprehension. They need white space, visual cues, and semantic context. A human should be able to open any fragment and understand its purpose within 30 seconds.

### Contract for AIs

| Requirement | Why It Matters | Example |
|-------------|----------------|---------|
| **Consistent Delimiters** | Predictable parsing | Always use `:` or `=` consistently |
| **Type Hints** | Schema inference | `count: int=5` or `name: str=agent_001` |
| **Schema Markers** | Version detection | `# schema: task-status/v2` |
| **Semantic Labels** | Meaning is explicit | `error_code: ETIMEDOUT` not `e: 110` |
| **Idempotent Reads** | Same result, same parse | Reading twice yields identical tokens |

AIs read for extraction. They need predictable syntax, explicit types, and stable schemas. An AI should be able to parse any fragment without external documentation.

### Resolving the Tension

The dual-audience requirement creates inherent tension. Some compromises:

**Tension 1: Verbose vs. Compact**
- Human need: Descriptive labels, comments, examples
- AI need: Minimal tokens, consistent structure
- Resolution: Use descriptive labels that serve both. `connection_timeout_seconds` is readable by humans and unambiguous for AIs.

**Tension 2: Formatting vs. Parsability**
- Human need: Alignment, indentation, blank lines
- AI need: Regular syntax, no "decorative" elements
- Resolution: Format for humans, but use comments for decorative elements. AIs can skip `#` lines.

**Tension 3: Flexibility vs. Consistency**
- Human need: Context-dependent formats
- AI need: Same schema everywhere
- Resolution: Define schema variants explicitly. `schema: tasks/v1-simple` vs `schema: tasks/v1-detailed`.

**Tension 4: Aggregation vs. Atomicity**
- Human need: Summary views, rolled-up metrics
- AI need: Individual fragments for precise queries
- Resolution: Provide both via the Aggregation pattern (Section 5). Raw fragments feed aggregated views.

The contract succeeds when both audiences can work with the same file, neither feeling like a second-class citizen.

---

## Design Primitives

ASCII Exposed Computing rests on four atomic building blocks. These primitives provide the vocabulary for designing exposed systems.

### Fragments

A **Fragment** is the atomic unit of exposed state. It represents one concept, is independently readable, and costs nothing to perceive.

**Rules:**
- One concept per fragment
- Independently readable (no context required)
- Bounded size (typically <10KB)
- Self-describing (schema marker at top)

**Example:**
```python
# schema: agent-status/v1
# Agent runtime state fragment
# Location: agents/engineer_001/status.ascii

agent_id: engineer_001
role: engineer
status: idle
current_task: null
last_heartbeat: 2026-02-23T14:32:00Z
tasks_completed: 47
```

**Why fragments, not files?** A file is a storage mechanism. A fragment is a semantic unit. One file may contain many fragments; one fragment may span multiple files. The key is independence—each fragment must make sense alone.

---

### Schemas

A **Schema** is an explicit type contract for a fragment. It defines what fields exist, their types, and their meaning.

**Rules:**
- Schema declaration at fragment top
- Use simple, parseable types (int, str, bool, list, dict)
- Version bumps for breaking changes
- Comments explain semantics, not syntax

**Example:**
```python
# schema: task-definition/v2
# Defines a unit of work for swarm agents
#
# Fields:
#   task_id: str - unique identifier (format: T-XXXXX)
#   task_type: str - category (code, review, test, deploy)
#   priority: int - urgency (1=critical, 5=low)
#   payload: dict - task-specific data
#   created_at: str - ISO 8601 timestamp

task_id: T-00042
task_type: code
priority: 2
payload:
  spec: "Implement authentication endpoint"
  files:
    - src/auth/login.py
    - tests/test_auth.py
created_at: 2026-02-23T14:00:00Z
```

**Schema evolution:** When a schema changes, bump the version. Old fragments retain their version marker. Consumers handle version negotiation via simple string matching.

```python
# Fragment using old schema
# schema: task-definition/v1
task_id: T-00041
type: code  # Renamed to task_type in v2
```

---

### Hooks

A **Hook** is a change notification mechanism. When state changes, hooks broadcast the delta to subscribers.

**Rules:**
- Minimal data in notifications (just diffs)
- Enable reactive architectures
- Decouple producers from consumers
- Support filtering by namespace/pattern

**Example:**
```python
# Hook broadcast when agent status changes
# Location: hooks/agents/status.log

2026-02-23T14:32:01Z | agent.engineer_001.status | IDLE -> WORKING | task=T-00042
2026-02-23T14:45:22Z | agent.engineer_001.status | WORKING -> IDLE | task=T-00042
2026-02-23T14:45:23Z | agent.reviewer_001.status | IDLE -> WORKING | task=T-00042
```

**Hook implementation pattern:**
```python
# From Geometry OS ascii_scene/hooks.py
class HookBroadcaster:
    """Broadcasts fragment changes to subscribers."""

    def notify(self, fragment_path: str, change_type: str, diff: str):
        event = f"{datetime.utcnow().isoformat()}Z | {fragment_path} | {change_type}\n{diff}"
        self._append_to_log(event)
        self._notify_subscribers(fragment_path, change_type)
```

Hooks enable reactivity without polling. An AI agent can subscribe to `hooks/tasks/*.log` and react instantly when new work appears.

---

### Namespaces

A **Namespace** is an organizational boundary for fragments. It groups related state and enables hierarchical queries.

**Rules:**
- Directory structure = namespace hierarchy
- Cross-cutting concerns get separate namespace
- Namespaces can be nested arbitrarily
- Grep patterns respect namespace boundaries

**Example directory structure:**
```
fragments/
├── agents/
│   ├── engineer_001/
│   │   ├── status.ascii
│   │   └── capabilities.ascii
│   └── reviewer_001/
│       ├── status.ascii
│       └── capabilities.ascii
├── tasks/
│   ├── pending/
│   │   ├── T-00042.ascii
│   │   └── T-00043.ascii
│   └── completed/
│       └── T-00041.ascii
├── system/
│   ├── health.ascii
│   └── config.ascii
└── hooks/
    ├── agents.log
    └── tasks.log
```

**Namespace queries:**
```bash
# Find all agent statuses
grep "status=working" fragments/agents/*/status.ascii

# Find pending tasks
cat fragments/tasks/pending/*.ascii

# System health check
cat fragments/system/health.ascii
```

Namespaces provide the "grep boundary" — queries naturally scope to directories, preventing false positives from unrelated fragments.

---

**Primitive composition:** Real systems combine all four primitives. A fragment has a schema, lives in a namespace, and triggers hooks on change. Together, they form the atomic vocabulary of ASCII Exposed Computing.
