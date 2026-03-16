# ECC Integration for Geometry OS

Everything Claude Code (ECC) integration exposes 60+ commands, 65+ skills, 47 agents, and 34 rules as MCP tools for AI assistants.

## Overview

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                     GEOMETRY OS + ECC INTEGRATION                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│   AI Assistant ──▶ MCP Bridge ──▶ ECC Tools ──▶ Geometry OS Substrate       │
│                                                                              │
│   Available ECC MCP Tools:                                                   │
│   ┌──────────────────────┬──────────────────────────────────────────────┐   │
│   │ Tool                 │ Purpose                                     │   │
│   ├──────────────────────┼──────────────────────────────────────────────┤   │
│   │ ecc_status           │ Get ECC integration status                  │   │
│   │ ecc_plan             │ Create implementation plan                  │   │
│   │ ecc_tdd              │ Execute TDD workflow                        │   │
│   │ ecc_review           │ Run code review                             │   │
│   │ ecc_verify           │ Run verification loop (build, test, lint)   │   │
│   │ ecc_learn            │ Extract reusable patterns                   │   │
│   │ ecc_instincts        │ View learned instincts                      │   │
│   │ ecc_skill_create     │ Generate new skill from patterns            │   │
│   │ ecc_brainstorm       │ Run brainstorming session                   │   │
│   │ ecc_debug            │ Run systematic debugging                    │   │
│   │ ecc_architect        │ Get architectural guidance                  │   │
│   │ ecc_canvas           │ Render ECC state as visual canvas (PNG/JSON)│   │
│   ├──────────────────────┼──────────────────────────────────────────────┤   │
│   │ ecc_guild_status     │ Get ECC Agent Guild status                  │   │
│   │ ecc_guild_list_agents│ List available ECC agents as guild members │   │
│   │ ecc_guild_spawn      │ Spawn an ECC agent as guild member          │   │
│   │ ecc_guild_despawn    │ Remove an agent instance                    │   │
│   │ ecc_guild_dispatch   │ Dispatch task to an ECC agent instance      │   │
│   │ ecc_guild_spatial    │ Get spatial state for Infinite Map          │   │
│   │ ecc_guild_discover   │ Discover all ECC agents                     │   │
│   ├──────────────────────┼──────────────────────────────────────────────┤   │
│   │ ecc_skills_status    │ Get ECC Skills Bridge status                │   │
│   │ ecc_skills_list      │ List available ECC skills                   │   │
│   │ ecc_skills_execute   │ Execute an ECC skill (CPU or GPU mode)      │   │
│   │ ecc_skills_find      │ Find skill by trigger phrase                │   │
│   │ ecc_skills_spatial   │ Get spatial state for Infinite Map          │   │
│   │ ecc_skills_discover  │ Discover all ECC skills                     │   │
│   └──────────────────────┴──────────────────────────────────────────────┘   │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Quick Start

### Check ECC Status

```bash
# Via MCP
geos ecc_status

# Response:
{
  "status": "success",
  "commands_available": 117,
  "skills_available": 66,
  "agents_available": 46,
  "rules_available": 53,
  "memory_entries": 0,
  "instincts_count": 0
}
```

### Create Implementation Plan

```bash
geos ecc_plan --task "Implement quadtree allocator for spatial memory" --scope "systems/glyph_allocator"
```

### Run TDD Workflow

```bash
geos ecc_tdd --feature "Quadtree spatial allocation" --coverage_target 0.8
```

### Verify Build

```bash
geos ecc_verify --run_tests true --run_lint true --auto_fix false
```

### Extract Patterns

```bash
geos ecc_learn --session_only true
```

## MCP Tool Reference

### ecc_status

Get current ECC integration status.

**Input Schema:**
```json
{}
```

**Response:**
```json
{
  "status": "success",
  "commands_available": 117,
  "skills_available": 66,
  "agents_available": 46,
  "rules_available": 53,
  "memory_entries": 0,
  "instincts_count": 0
}
```

### ecc_plan

Create implementation plan using ECC planner agent.

**Input Schema:**
```json
{
  "task": "string (required)",
  "scope": "string (optional)"
}
```

**Response:**
```json
{
  "status": "success",
  "task": "...",
  "scope": "...",
  "plan": "...",
  "error": null
}
```

### ecc_tdd

Execute TDD workflow using ECC TDD skill.

**Input Schema:**
```json
{
  "feature": "string (required)",
  "test_first": "boolean (default: true)",
  "coverage_target": "number (default: 0.8)"
}
```

### ecc_review

Run code review using ECC code-reviewer agent.

**Input Schema:**
```json
{
  "files": ["string"] | null,
  "scope": "string | null",
  "strictness": "lenient | standard | strict"
}
```

### ecc_verify

Run verification loop using ECC verify skill.

**Input Schema:**
```json
{
  "run_tests": "boolean (default: true)",
  "run_lint": "boolean (default: true)",
  "run_build": "boolean (default: true)",
  "auto_fix": "boolean (default: false)"
}
```

### ecc_learn

Extract reusable patterns from session.

**Input Schema:**
```json
{
  "session_only": "boolean (default: true)"
}
```

### ecc_instincts

View learned instincts from ECC memory.

**Input Schema:**
```json
{}
```

### ecc_skill_create

Generate a new skill from patterns.

**Input Schema:**
```json
{
  "pattern_source": "string (required) - file path, 'git', or 'session'",
  "skill_name": "string (optional)"
}
```

### ecc_brainstorm

Run brainstorming session.

**Input Schema:**
```json
{
  "topic": "string (required)",
  "techniques": ["string"] | null
}
```

### ecc_debug

Run systematic debugging.

**Input Schema:**
```json
{
  "issue": "string (required)",
  "context": "string (optional)"
}
```

### ecc_architect

Get architectural guidance.

**Input Schema:**
```json
{
  "decision": "string (required)",
  "constraints": ["string"] | null
}
```

### ecc_canvas

Render ECC learning state as visual canvas (PNG/JSON) for Infinite Map visualization.

**Input Schema:**
```json
{
  "output_dir": "string (optional) - Output directory (default: cwd)",
  "format": "png | json | both (default: both)"
}
```

**Response:**
```json
{
  "status": "success",
  "files": {
    "png": "/tmp/ecc_canvas.png",
    "json": "/tmp/ecc_canvas.json"
  },
  "health": 60.0,
  "state": {
    "commands_count": 117,
    "skills_count": 66,
    "agents_count": 46,
    "rules_count": 53
  }
}
```

## ECC Agent Guild Tools

### ecc_guild_status

Get ECC Agent Guild status and organization.

**Input Schema:**
```json
{}
```

**Response:**
```json
{
  "status": "active",
  "total_agents": 25,
  "active_instances": 1,
  "guilds": {
    "engineering": {"member_count": 4, "sector_range": [8000000, 8400000]},
    "review": {"member_count": 6, "sector_range": [9000000, 9900000]},
    ...
  }
}
```

### ecc_guild_list_agents

List ECC agents available as guild members.

**Input Schema:**
```json
{
  "guild": "engineering | review | testing | analysis | bmad (optional)"
}
```

### ecc_guild_spawn

Spawn an ECC agent as a guild member.

**Input Schema:**
```json
{
  "agent_name": "string (required)",
  "hilbert_position": "integer (optional)"
}
```

### ecc_guild_despawn

Remove an agent instance from the guild.

**Input Schema:**
```json
{
  "instance_id": "string (required)"
}
```

### ecc_guild_dispatch

Dispatch a task to an ECC agent instance.

**Input Schema:**
```json
{
  "instance_id": "string (required)",
  "task": "string (required)",
  "context": "object (optional)"
}
```

### ecc_guild_spatial_state

Get spatial state for Infinite Map visualization.

**Input Schema:**
```json
{}
```

**Response:**
```json
{
  "timestamp": 1234567890.123,
  "guild_sectors": {
    "engineering": {"start": 8000000, "end": 8400000},
    ...
  },
  "active_instances": [
    {
      "instance_id": "planner_abc123",
      "agent_name": "planner",
      "guild": "engineering",
      "hilbert_position": 8000000,
      "status": "idle",
      "color_hex": 5164484
    }
  ]
}
```

### ecc_guild_discover

Discover all ECC agents and register them.

**Input Schema:**
```json
{}
```

## Architecture

```
apps/mcp2cli/src/
├── geos_mcp_server.py   # Main MCP server with ECC tools
├── ecc_bridge.py        # ECC command execution bridge
├── ecc_agent_guild.py   # ECC Agent Guild - spatial agent management
├── ecc_skills_bridge.py # ECC Skills Bridge - spatial skill management
└── ...

The ECC bridge:
1. Discovers ECC components (commands, skills, agents, rules)
2. Wraps ECC CLI commands as async functions
3. Provides structured input/output for MCP tools
4. Handles errors and timeouts gracefully

The ECC Agent Guild:
1. Maps ECC agents to Geometry OS spatial sectors (Hilbert coordinates)
2. Organizes agents into guilds (Engineering, Review, Testing, Analysis, BMAD)
3. Provides spawn/despawn lifecycle management
4. Exposes spatial state for Infinite Map visualization

The ECC Skills Bridge:
1. Maps ECC skills to Geometry OS spatial sectors (Hilbert coordinates)
2. Organizes skills by category (Testing, Patterns, Review, Planning, Domain, BMAD)
3. Compiles skills to glyph programs for GPU execution
4. Supports dual execution modes (CPU fallback, GPU target)
```

## Integration Phases

| Phase | Integration | Status |
|-------|-------------|--------|
| **1** | MCP Bridge → ECC Commands | ✅ Complete |
| **2** | Visual Shell → ECC Canvas | ✅ Complete |
| **3** | Swarm Guilds → ECC Agents | ✅ Complete |
| **4** | Glyph Programs → ECC Skills | ✅ Complete |
| **5** | GPU Daemon → ECC HTTP API | Planned |

### Phase 2: Visual Shell → ECC Canvas

The `ecc_canvas` tool renders ECC learning state as a 1024x1024 RGBA PNG for visualization on the Infinite Map:

- **Header Region** (64px): ECC branding and timestamp
- **Instincts Region** (192px): Learned patterns with confidence bars
- **Skills Region** (192px): Available skills with usage indicators
- **Agents Region** (192px): Active agents with status colors
- **Memory Region** (192px): Session memories and associations
- **Summary Region** (192px): Health score and metrics

Output: `/tmp/ecc_canvas.png` (20KB) + `/tmp/ecc_canvas.json` (16KB)

### Phase 3: Swarm Guilds → ECC Agents

The ECC Agent Guild system wraps ECC's 46 agents as Geometry OS spatial agents:

**Guild Divisions (Hilbert Sectors):**
- Engineering (8M-9M): planner, architect, tdd-guide, refactor-cleaner
- Review (9M-10M): code-reviewer, security-reviewer, database-reviewer, python-reviewer, go-reviewer, kotlin-reviewer
- Testing (10M-11M): e2e-runner, build-error-resolver, go-build-resolver, kotlin-build-resolver
- Analysis (11M-12M): Explore, doc-updater
- BMAD (12M-13M): bmad-master, bmad-*-router agents

**Usage:**
```bash
# Check guild status
geos ecc_guild_status

# Spawn a planner agent at position 8,050,000
geos ecc_guild_spawn --agent_name planner --hilbert_position 8050000

# Dispatch a task to an agent
geos ecc_guild_dispatch --instance_id planner_abc123 --task "Plan GPU allocator"

# Get spatial state for Infinite Map
geos ecc_guild_spatial_state
```

### Phase 4: Glyph Programs → ECC Skills

The ECC Skills Bridge wraps ECC's 40+ skills as spatially-addressed glyph programs:

**Skill Sectors (Hilbert Space):**
- Testing (20M-21M): tdd-workflow, python-testing, golang-testing, e2e
- Patterns (21M-22M): python-patterns, golang-patterns, frontend-patterns
- Review (22M-23M): verification-loop, build-fix, go-build, kotlin-build
- Planning (23M-24M): brainstorming, plan, systematic-debugging
- Domain (24M-25M): claude-api, glyph-programming, frontend-design
- Superpowers (25M-26M): superpowers:tdd, superpowers:brainstorming
- BMAD (26M-27M): bmad-brainstorming, bmad-bmm-create-prd

**Execution Modes:**
- **CPU Mode**: Direct invocation via subprocess/Agent tool
- **GPU Mode**: Compiled to glyph program and executed on substrate

**Usage:**
```bash
# Check skills bridge status
geos ecc_skills_status

# List available skills
geos ecc_skills_list --category testing

# Find skill by trigger phrase
geos ecc_skills_find --text "write tests first"

# Execute a skill
geos ecc_skills_execute --skill_name tdd-workflow --context '{"feature": "allocator"}' --mode cpu

# Get spatial state for Infinite Map
geos ecc_skills_spatial
```

**Glyph Generation:**

Each skill can be compiled to a `.glyph` program for GPU execution:
```bash
# Skills are compiled on-demand when executed in GPU mode
# Generated glyphs are stored in systems/glyph_stratum/programs/skill_*.glyph
```

## Testing

```bash
# Run all ECC tests
cd apps/mcp2cli
pytest tests/test_ecc*.py -v

# Run ECC bridge tests
pytest tests/test_ecc_bridge.py -v

# Run ECC Agent Guild tests
pytest tests/test_ecc_agent_guild.py -v

# Run ECC Skills Bridge tests
pytest tests/test_ecc_skills_bridge.py -v

# Test ECC status directly
python src/ecc_bridge.py
```

## Troubleshooting

### "Claude CLI not found"

Ensure `claude` is in your PATH:
```bash
which claude
# Should output: /usr/local/bin/claude or similar
```

### "ECC Bridge not available"

Ensure `ecc_bridge.py` is in the same directory as `geos_mcp_server.py`.

### Commands timeout

Some ECC commands (plan, verify) may take longer. The default timeout is 120-300 seconds. Adjust in `ecc_bridge.py` if needed.

## See Also

- [MCP2CLI Guide](./MCP2CLI_GUIDE.md)
- [GPU Daemon API](./plans/2026-03-15-gpu-daemon-mcp-api-design.md)
- [Self-Hosting](./SELF_HOSTING.md)
