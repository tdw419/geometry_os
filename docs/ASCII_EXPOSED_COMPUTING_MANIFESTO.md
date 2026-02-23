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
