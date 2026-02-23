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

---

## Patterns

The primitives define what; patterns define how. These five patterns solve common problems in ASCII Exposed systems.

### Pattern: Scene Graph Aggregation

**Problem:** Individual fragments are atomic, but humans need summary views. How do you expose aggregate state without maintaining separate "dashboard" endpoints?

**Solution:** Generate aggregated fragments by concatenating and summarizing atomic fragments. The aggregation is itself a fragment, not a special API.

**Example:**
```python
# Atomic fragments (input)
# agents/engineer_001/status.ascii
status: working
task: T-00042

# agents/reviewer_001/status.ascii
status: idle
task: null

# Aggregated fragment (output)
# system/agent_summary.ascii
# schema: agent-summary/v1
# Generated: 2026-02-23T14:45:00Z
#
# This file is auto-generated. Do not edit.
# Source: agents/*/status.ascii

total_agents: 2
working: 1
idle: 1
by_role:
  engineer: 1
  reviewer: 1
active_tasks:
  - T-00042 (engineer_001)
```

**Implementation:**
```python
# From Geometry OS ascii_scene/scene_graph.py
class SceneGraphAggregator:
    """Aggregates atomic fragments into summary views."""

    def generate_summary(self, namespace: str, output_path: str):
        fragments = self._collect_fragments(namespace)
        summary = self._aggregate(fragments)
        self._write_fragment(output_path, summary)
        self.hooks.notify(output_path, "AGGREGATED", diff=summary)
```

**When to use:** Any time humans need a "dashboard" view. The aggregated fragment is both human-readable and AI-parseable, and can itself be queried.

---

### Pattern: Atomic File Writes

**Problem:** Partial writes corrupt state. How do you ensure readers never see torn writes?

**Solution:** Write to a temporary file, then atomically rename. Readers either see old state or new state—never intermediate state.

**Example:**
```python
# Bad: Direct write
with open("fragments/status.ascii", "w") as f:
    f.write("status: ")      # CRASH HERE -> corrupted!
    f.write("running\n")

# Good: Atomic write
import os
import tempfile

def atomic_write(path: str, content: str):
    """Write atomically via temp file + rename."""
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(path))
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(content)
        os.rename(tmp_path, path)  # Atomic on POSIX
    except:
        os.unlink(tmp_path)
        raise

# Usage
atomic_write("fragments/status.ascii", "status: running\n")
```

**Why it works:** `rename(2)` is atomic on POSIX systems. The old file is replaced instantly with the new file. Any reader opening the file at any moment gets a consistent view.

**Implementation in Geometry OS:**
```python
# From systems/visual_shell/ascii_scene/atomic_io.py
import os
from pathlib import Path
from tempfile import NamedTemporaryFile

def atomic_write(path: str | Path, content: str, sync: bool = True):
    """Atomic write with optional fsync for durability."""
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)

    with NamedTemporaryFile(
        mode='w',
        dir=path.parent,
        prefix=f".{path.name}.",
        delete=False
    ) as tmp:
        tmp.write(content)
        if sync:
            tmp.flush()
            os.fsync(tmp.fileno())

    os.replace(tmp.name, path)  # Atomic on both Linux and macOS
```

**When to use:** Every time you write a fragment. This is not optional in ASCII Exposed systems.

---

### Pattern: Change Streams

**Problem:** Polling is inefficient. How do AIs know when state changes without constant reads?

**Solution:** Maintain an append-only log of changes. Each line is a diff, timestamped and namespaced. AIs can tail the log or query specific time ranges.

**Example:**
```python
# hooks/changes.log
# schema: change-stream/v1
# Format: TIMESTAMP | NAMESPACE | OPERATION | DIFF

2026-02-23T14:30:00Z | agents/engineer_001 | UPDATE |
  -status: idle
  +status: working
  +task: T-00042

2026-02-23T14:45:22Z | agents/engineer_001 | UPDATE |
  -status: working
  +status: idle
  -task: T-00042

2026-02-23T14:45:23Z | tasks/T-00042 | UPDATE |
  -status: pending
  +status: completed
```

**Querying the stream:**
```bash
# Find all changes in the last hour
grep "2026-02-23T14:" hooks/changes.log

# Find all task completions
grep "+status: completed" hooks/changes.log

# Find changes to a specific agent
grep "agents/engineer_001" hooks/changes.log
```

**Implementation:**
```python
# From Geometry OS ascii_scene/change_stream.py
from datetime import datetime
from pathlib import Path

class ChangeStream:
    """Append-only log of fragment changes."""

    def __init__(self, log_path: str):
        self.log_path = Path(log_path)

    def append(self, namespace: str, operation: str, diff: str):
        timestamp = datetime.utcnow().isoformat() + "Z"
        entry = f"{timestamp} | {namespace} | {operation} |\n"
        for line in diff.strip().split("\n"):
            entry += f"  {line}\n"

        # Atomic append
        with open(self.log_path, "a") as f:
            f.write(entry)
            f.flush()
```

**When to use:** Any system with reactive components. Change streams are the backbone of AI-driven automation.

---

### Pattern: Dual-Format Fragments

**Problem:** Some data is inherently structured (nested objects, arrays). How do you maintain human readability while preserving structure?

**Solution:** Use a dual format: human-readable by default, with a parallel `.json` variant for complex structures. Both are fragments; both are exposed.

**Example:**
```python
# fragments/tasks/T-00042.ascii (human-primary)
# schema: task-dual/v1
# Human-readable summary

task_id: T-00042
type: code
status: pending
priority: 2
summary: Implement authentication endpoint
assignee: engineer_001
created: 2026-02-23T14:00:00Z

# For full payload, see: fragments/tasks/T-00042.json

---
# fragments/tasks/T-00042.json (machine-primary)
{
  "schema": "task-dual/v1",
  "task_id": "T-00042",
  "type": "code",
  "status": "pending",
  "priority": 2,
  "summary": "Implement authentication endpoint",
  "assignee": "engineer_001",
  "created": "2026-02-23T14:00:00Z",
  "payload": {
    "spec": "Create POST /auth/login endpoint with JWT tokens",
    "files": ["src/auth/login.py", "tests/test_auth.py"],
    "requirements": [
      "Validate email format",
      "Rate limit: 5 attempts per minute",
      "Return 401 on failure, 200 + token on success"
    ],
    "acceptance_criteria": [
      "All tests pass",
      "Code review approved",
      "No security vulnerabilities"
    ]
  }
}
```

**Rules for dual-format:**
1. `.ascii` is always present and always human-readable
2. `.json` is optional, present only when structure exceeds ASCII capacity
3. `.ascii` references `.json` for "full details"
4. Both files are fragments with the same ID but different schemas
5. Updates must maintain consistency (use atomic writes for both)

**When to use:** Tasks with complex payloads, configuration with nested objects, any state where the summary is simple but details are structured.

---

### Pattern: Fragment Inheritance

**Problem:** Fragments share common fields. Duplicating them violates DRY and risks inconsistency.

**Solution:** Define base fragments that derived fragments extend. The base is a template; the derived adds specifics.

**Example:**
```python
# fragments/_base/agent.ascii (template)
# schema: agent-base/v1
# DO NOT USE DIRECTLY - this is a template
#
# Required fields for all agents:
agent_id: null      # Override in derived
role: null          # Override in derived
status: offline     # Default value
created: null       # Set at creation

# fragments/agents/engineer_001/status.ascii (derived)
# schema: agent-engineer/v1
# extends: agent-base/v1

agent_id: engineer_001
role: engineer
status: working
created: 2026-02-20T10:00:00Z

# Derived additions:
current_task: T-00042
capabilities:
  - code_generation
  - test_writing
  - refactoring
```

**Implementation:**
```python
# Fragment resolution logic
def resolve_fragment(path: str) -> dict:
    """Resolve a fragment with inheritance."""
    fragment = parse_fragment(path)

    if "extends" in fragment:
        base_path = find_schema(fragment["extends"])
        base = parse_fragment(base_path)
        # Merge: base provides defaults, derived overrides
        return {**base, **fragment}

    return fragment
```

**Inheritance rules:**
1. Only single inheritance (one `extends` per fragment)
2. Derived fields override base fields with same key
3. List/dict fields merge (union for lists, update for dicts)
4. The `extends` field references schema version, not file path
5. Base fragments live in `_base/` or `templates/` namespace

**When to use:** Standardizing agent types, task templates, configuration hierarchies.

---

**Pattern composition:** Real systems use multiple patterns together. A task fragment uses Dual-Format (ascii + json), is written Atomically, and changes are logged to a Change Stream. The aggregate view uses Scene Graph Aggregation. Common fields come from Fragment Inheritance.

---

## Anti-Patterns

Knowing what to do is half the battle. Knowing what NOT to do is the other half. These six anti-patterns represent common mistakes that undermine ASCII Exposed systems.

### Anti-Pattern: Binary in ASCII Clothing

**The Trap:** Encoding binary data as base64 or hex inside ASCII fragments, thinking you've satisfied the text requirement.

**Bad:**
```
# schema: model-weights/v1
weights: AAAAABAAAAACAAAAAwAAAAQAAAAFAAAABgAAAAcAAAAIAAAACQAAAAoAAAA...
encoding: base64
size_bytes: 1048576
```

**Good:**
```
# schema: model-weights/v1
# Model weights are binary - store them elsewhere
weights_path: models/v1/weights.bin
checksum: sha256:a1b2c3d4...
size_bytes: 1048576
format: numpy-float32

# For human/AI consumption, expose metadata only
layer_count: 12
parameter_count: 1048576
last_updated: 2026-02-23T14:00:00Z
```

**Why it fails:** Base64 is technically ASCII, but it's not *meaningful* ASCII. An AI cannot reason about `AAAAABAAA...` any more than it can reason about raw bytes. The point of text exposure is semantic accessibility, not character set compliance.

**Rule:** If the content cannot be understood by reading it, it doesn't belong in an ASCII fragment. Store a reference instead.

---

### Anti-Pattern: Infinite Fragments

**The Trap:** Letting fragments grow unboundedly, accumulating state until they become performance hazards.

**Bad:**
```
# schema: task-history/v1
# This fragment has accumulated 50,000 lines over 6 months
# File size: 2.3 MB

task_00001: completed at 2025-08-15T10:00:00Z
task_00002: completed at 2025-08-15T11:23:00Z
task_00003: completed at 2025-08-15T14:45:00Z
... (49,997 more lines)
```

**Good:**
```
# schema: task-history-index/v1
# Index fragment - always small, points to archives
current_month: 2026-02
archive_count: 6
archives:
  - 2026-02.archive.ascii (847 tasks)
  - 2026-01.archive.ascii (912 tasks)
  - 2025-12.archive.ascii (1023 tasks)
  - 2025-11.archive.ascii (891 tasks)
  - 2025-10.archive.ascii (756 tasks)
  - 2025-09.archive.ascii (634 tasks)

# Current month kept in separate fragment
# See: fragments/tasks/history/2026-02.ascii
```

**Why it fails:** Unbounded fragments violate the "zero-cost perception" promise. Reading a 2 MB file is not free. Grep takes noticeable time. Diff becomes unusable. The fragment becomes a liability, not an asset.

**Rule:** Every fragment should have a documented size bound. When exceeded, archive or split.

---

### Anti-Pattern: Timestamps Without Meaning

**The Trap:** Recording timestamps as opaque numbers without timezone, format, or semantic context.

**Bad:**
```
# schema: event-log/v1
created: 1708617600
updated: 1708704000
last_seen: 1740326400
```

**Good:**
```
# schema: event-log/v1
# All timestamps are UTC, ISO 8601 format
created: 2024-02-22T16:00:00Z
updated: 2024-02-23T16:00:00Z
last_seen: 2025-02-23T14:00:00Z

# Human-readable context
created_ago: 1 year ago
last_seen_ago: just now
```

**Why it fails:** Unix timestamps are unreadable by humans and require conversion to be meaningful. An AI can parse them, but loses semantic context. "1708617600" doesn't tell you if it's recent, old, or future. It doesn't tell you the timezone. It doesn't tell you the precision.

**Rule:** Always use ISO 8601 with timezone (Z for UTC). Add human-readable context where helpful.

---

### Anti-Pattern: Fragment Coupling

**The Trap:** Creating fragments that cannot be understood in isolation, requiring readers to fetch multiple files to make sense of one.

**Bad:**
```
# fragments/agents/engineer_001/task.ascii
# schema: agent-task-assignment/v1
ref: T-00042  # What task? Must look up fragments/tasks/T-00042.ascii
state: ref.state  # What state? Must parse referenced task
```

**Good:**
```
# fragments/agents/engineer_001/task.ascii
# schema: agent-task-assignment/v1
# Self-contained: includes task summary

task_id: T-00042
task_type: code
task_summary: Implement authentication endpoint
task_status: in_progress
assigned_at: 2026-02-23T14:00:00Z

# For full task details, see: fragments/tasks/T-00042.ascii
```

**Why it fails:** Fragment coupling violates the "independently readable" rule. If reading one fragment requires reading another, you've created implicit dependencies that are fragile and expensive. An AI agent working with coupled fragments must make multiple reads, defeating the zero-cost perception goal.

**Rule:** Each fragment must be fully comprehensible alone. References are for "more details," not "basic understanding."

---

### Anti-Pattern: Inconsistent Delimiters

**The Trap:** Using different delimiter characters (`:`, `=`, `->`, `|`) within the same system, or even the same fragment.

**Bad:**
```
# schema: mixed-delimiters/v1
agent_id = engineer_001
role: engineer
status -> working
task | T-00042
```

**Good:**
```
# schema: consistent-delimiters/v1
# Standard: KEY: VALUE for all fields

agent_id: engineer_001
role: engineer
status: working
task: T-00042

# Nested values use indentation
capabilities:
  - code_generation
  - test_writing
```

**Why it fails:** Inconsistent delimiters force parsers to guess. Humans get confused. AI parsing becomes brittle. The simplest parser—a regex—breaks. You're back to "need a custom parser," which defeats the entire philosophy.

**Rule:** Pick ONE delimiter style for the entire system. Document it. Enforce it. Common choices:
- `KEY: VALUE` (YAML-like, human-friendly)
- `KEY=VALUE` (shell-like, grep-friendly)
- `KEY VALUE` (space-delimited, awk-friendly)

---

### Anti-Pattern: Mutable History

**The Trap:** Editing or deleting past entries in append-only logs, breaking the ability to reconstruct system state at any point in time.

**Bad:**
```
# hooks/changes.log
# Someone edited this file to "fix" an error...

2026-02-23T14:30:00Z | agents/engineer_001 | UPDATE |
  -status: idle
  +status: working

# DELETED: The "mistake" entry that was here
# 2026-02-23T14:31:00Z | agents/engineer_001 | UPDATE |
#   -status: working
#   +status: error

2026-02-23T14:32:00Z | agents/engineer_001 | UPDATE |
  -status: working
  +status: idle
```

**Good:**
```
# hooks/changes.log
# Never delete - append corrections instead

2026-02-23T14:30:00Z | agents/engineer_001 | UPDATE |
  -status: idle
  +status: working

2026-02-23T14:31:00Z | agents/engineer_001 | UPDATE |
  -status: working
  +status: error

# Correction entry
2026-02-23T14:31:30Z | agents/engineer_001 | CORRECTION |
  correction_for: 2026-02-23T14:31:00Z
  reason: "False positive from health check"
  -status: error
  +status: working

2026-02-23T14:32:00Z | agents/engineer_001 | UPDATE |
  -status: working
  +status: idle
```

**Why it fails:** Mutable history destroys the audit trail. When you can't trust that past entries are accurate, you can't debug historical issues. Time-travel debugging becomes impossible. Compliance requirements (audit logs) are violated.

**Rule:** Logs are append-only. Mistakes get correction entries, never deletion. This applies to all change streams, event logs, and history fragments.

---

## Implementation Guidelines

Theory without practice is empty. This section provides concrete checklists for adopting ASCII Exposed Computing in real systems.

### Starting a New System

When building from scratch, bake these principles in from day one:

1. **Define your namespaces first.** Before writing code, sketch the directory structure. What concerns exist? Agents? Tasks? System? Hooks? Each gets a namespace.

2. **Choose your delimiter convention.** Pick `KEY: VALUE` or `KEY=VALUE` and stick to it. Document this choice in a `.ascii-convention` file at the root.

3. **Implement atomic writes immediately.** Don't defer this. Create a utility function (`atomic_write()`) and use it for every fragment write from the first commit.

4. **Start with schemas.** Even a one-line `# schema: my-fragment/v1` at the top of each file pays dividends. Version from day one.

5. **Build the change stream early.** Hook broadcasting should be part of the core architecture, not a retrofit. Every state change should write to the change log.

6. **Test with grep.** Before declaring a feature done, verify you can query its state with `grep`, `awk`, and `diff`. If you can't, the exposure is incomplete.

### Adding to Existing Systems

Retrofitting ASCII exposure into an existing codebase requires strategy:

1. **Identify high-value state first.** What do operators query most often? What do debugging sessions spend time finding? Start there.

2. **Create parallel fragments.** Don't replace existing state storage—augment it. Write fragments alongside existing persistence. Verify consistency before depending on them.

3. **Use the Dual-Format pattern.** If your existing system has complex JSON structures, create `.ascii` summaries that reference the JSON. Gradual migration.

4. **Add hooks incrementally.** Identify the most reactive state changes first. Expose those via change streams. Expand coverage over time.

5. **Document the migration.** Keep a `MIGRATION.md` that tracks which state is exposed, which is pending, and conventions for contributors.

### Directory Structure Template

A canonical structure for ASCII Exposed systems:

```
project/
├── .ascii-convention          # Delimiter choice, schema registry
├── fragments/
│   ├── _base/                 # Template fragments for inheritance
│   │   └── agent.ascii
│   ├── agents/                # Per-agent state
│   │   ├── engineer_001/
│   │   │   ├── status.ascii
│   │   │   ├── capabilities.ascii
│   │   │   └── metrics.ascii
│   │   └── reviewer_001/
│   │       └── ...
│   ├── tasks/                 # Task queue and history
│   │   ├── pending/
│   │   │   └── T-00042.ascii
│   │   ├── active/
│   │   │   └── T-00041.ascii
│   │   └── completed/
│   │       └── T-00040.ascii
│   ├── system/                # System-wide state
│   │   ├── health.ascii
│   │   ├── config.ascii
│   │   └── metrics.ascii
│   └── aggregates/            # Summary views (auto-generated)
│       ├── agent_summary.ascii
│       └── task_summary.ascii
├── hooks/                     # Change streams
│   ├── agents.log
│   ├── tasks.log
│   └── system.log
└── archives/                  # Historical fragments
    └── tasks/
        └── 2026-02.archive.ascii
```

### Performance Considerations

ASCII Exposed Computing trades some performance for observability. Know the costs:

| Concern | Impact | Mitigation |
|---------|--------|------------|
| **Fragment size** | Large files slow grep/diff | Enforce 10KB limit; archive old entries |
| **Fragment count** | Many files slow directory listing | Use namespaces; aggregate summaries |
| **Write overhead** | Atomic writes cost extra I/O | Acceptable for state (not high-throughput logs) |
| **Hook volume** | High-frequency changes flood logs | Debounce; batch by time window |
| **Parsing cost** | Text parsing slower than binary | Acceptable for AI (already text-based); cache parsed results |
| **Concurrent reads** | Multiple readers = multiple opens | Fragments are small; OS caching helps |

**Performance philosophy:** If performance is critical, expose metadata via ASCII and store bulk data in binary formats with references. The goal is observability, not replacing all storage with text.

### When NOT to Use

ASCII Exposed Computing is not universal. Avoid it when:

- **High-frequency data.** Sensor data at 1000Hz, video frames, audio streams—these should be binary with metadata exposed as ASCII.

- **Encrypted state.** If the data must remain opaque even to privileged users, ASCII exposure defeats the purpose.

- **Legacy constraints.** Retrofitting into systems with strict binary protocols may cost more than the benefits justify.

- **Strict memory budgets.** Text representation is larger than binary. Embedded systems with kilobytes of RAM may not tolerate the overhead.

- **Compliance restrictions.** Some regulated environments prohibit "human-readable" state for security reasons. (Consider whether this is security theater.)

The rule of thumb: If the state is meaningful to an operator or AI agent, expose it. If it's raw data that humans will never read directly, store it efficiently and expose metadata instead.
