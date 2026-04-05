# Paperclip API Guide for AI Agents

> How to use Paperclip's REST API (localhost:3100) to manage companies, agents,
> issues, projects, goals, and labels. No auth needed in local_trusted mode.

## Quick Reference

| Action | Method | Endpoint |
|--------|--------|----------|
| Health check | GET | `/api/health` |
| List companies | GET | `/api/companies` |
| Company dashboard | GET | `/api/companies/:cid/dashboard` |
| List agents | GET | `/api/companies/:cid/agents` |
| Get agent | GET | `/api/agents/:aid` |
| Wake agent | POST | `/api/agents/:aid/wakeup` |
| Update agent | PATCH | `/api/agents/:aid` |
| List issues | GET | `/api/companies/:cid/issues` |
| Get issue | GET | `/api/issues/:iid` |
| Create issue | POST | `/api/companies/:cid/issues` |
| Update issue | PATCH | `/api/issues/:iid` |
| Checkout issue | POST | `/api/issues/:iid/checkout` |
| List comments | GET | `/api/issues/:iid/comments` |
| Create comment | POST | `/api/issues/:iid/comments` |
| List projects | GET | `/api/companies/:cid/projects` |
| Get project | GET | `/api/projects/:pid` |
| Update project | PATCH | `/api/projects/:pid` |
| List goals | GET | `/api/companies/:cid/goals` |
| Create goal | POST | `/api/companies/:cid/goals` |
| List labels | GET | `/api/companies/:cid/labels` |
| Create label | POST | `/api/companies/:cid/labels` |

## Authentication

Paperclip runs in `local_trusted` mode. All requests to localhost:3100 need no
auth headers, tokens, or API keys. Just use curl directly.

## Response Format

All endpoints return JSON. Errors look like:

```json
{"error": "Validation error", "details": [{"code": "invalid_type", ...}]}
```

Status codes: 200 = success, 202 = accepted (wakeup), 4xx = validation, 5xx = server error.

---

## Endpoints in Detail

### Health Check

```bash
curl -s http://localhost:3100/api/health
```

```json
{
  "status": "ok",
  "version": "0.3.1",
  "deploymentMode": "local_trusted",
  "authReady": true,
  "bootstrapStatus": "ready"
}
```

Use this to confirm Paperclip is running before doing anything else.

---

### Companies

Companies are the top-level container. Everything belongs to a company.

#### List All Companies

```bash
curl -s http://localhost:3100/api/companies | python3 -m json.tool
```

Returns an array. Key fields:

| Field | Type | Notes |
|-------|------|-------|
| id | UUID | Use as `:cid` in all other calls |
| name | string | Human-readable name |
| issuePrefix | string | Auto-generated issue IDs like "TDW-14", "GEO-7" |
| status | string | "active" |
| budgetMonthlyCents | number | Monthly budget in cents |
| spentMonthlyCents | number | Amount spent this month in cents |

#### Company Dashboard (Aggregated Stats)

```bash
curl -s http://localhost:3100/api/companies/:cid/dashboard | python3 -m json.tool
```

```json
{
  "companyId": "...",
  "agents": { "active": 0, "running": 4, "paused": 1, "error": 0 },
  "tasks": { "open": 0, "inProgress": 0, "blocked": 0, "done": 19 },
  "costs": { "monthSpendCents": 200, "monthBudgetCents": 0, "monthUtilizationPercent": 0 },
  "pendingApprovals": 0
}
```

Use this for a quick status overview without fetching all agents/issues individually.

---

### Agents

Agents are AI workers with heartbeats. Each agent runs a Hermes instance via an
adapter.

#### List Agents

```bash
curl -s http://localhost:3100/api/companies/:cid/agents | python3 -m json.tool
```

Key fields per agent:

| Field | Type | Notes |
|-------|------|-------|
| id | UUID | Agent ID |
| name | string | e.g. "CEO", "GL Engineer" |
| role | string | "ceo", "engineer", etc. |
| status | string | "running", "idle", "paused", "error" |
| adapterType | string | "hermes_local" |
| adapterConfig | object | Model, hermes command, timeout, etc. |
| adapterConfig.cwd | string | Working directory for the agent |
| adapterConfig.model | string | LLM model the agent uses |
| runtimeConfig | object | Heartbeat interval, cooldown, etc. |
| reportsTo | UUID | Agent ID of manager (null for CEO) |
| permissions | object | `{ "canCreateAgents": bool }` |
| lastHeartbeatAt | ISO timestamp | When the agent last checked in |

Quick one-liner to see agent status:

```bash
curl -s http://localhost:3100/api/companies/:cid/agents | \
  python3 -c "import sys,json
for a in json.load(sys.stdin):
  print(f'{a[\"name\"]:20s} {a[\"status\"]:10s} {a[\"role\"]:10s} {a[\"adapterConfig\"][\"model\"]}')"
```

#### Get Single Agent

```bash
curl -s http://localhost:3100/api/agents/:aid | python3 -m json.tool
```

#### Wake an Agent

Triggers the agent's heartbeat, causing it to wake up and process its inbox.

```bash
curl -s -X POST http://localhost:3100/api/agents/:aid/wakeup \
  -H 'Content-Type: application/json' -d '{}'
```

Returns 202 on success. The agent will start a run within seconds.

Useful for:
- Nudging the CEO to triage issues
- Waking an engineer after assigning them a task
- Kicking off work after creating new issues

#### Update an Agent

```bash
curl -s -X PATCH http://localhost:3100/api/agents/:aid \
  -H 'Content-Type: application/json' \
  -d '{"status": "paused"}'
```

Patchable fields: status, name, title, adapterConfig, runtimeConfig, budgetMonthlyCents.

Common operations:

```bash
# Pause an agent
curl -s -X PATCH http://localhost:3100/api/agents/:aid \
  -H 'Content-Type: application/json' -d '{"status":"paused"}'

# Resume a paused agent
curl -s -X PATCH http://localhost:3100/api/agents/:aid \
  -H 'Content-Type: application/json' -d '{"status":"running"}'
```

#### Create an Agent

```bash
curl -s -X POST http://localhost:3100/api/companies/:cid/agents \
  -H 'Content-Type: application/json' -d '{
    "name": "GPU Engineer",
    "role": "engineer",
    "adapterType": "hermes_local",
    "adapterConfig": {
      "model": "glm-5.1",
      "timeoutSec": 600,
      "hermesCommand": "/path/to/script.sh",
      "persistSession": true
    }
  }'
```

Required: name, role. The adapterConfig depends on adapterType.

---

### Issues

Issues are tasks. They go through: todo -> in_progress -> done (or cancelled).

#### List Issues

```bash
# All issues
curl -s http://localhost:3100/api/companies/:cid/issues | python3 -m json.tool

# Filter by status
curl -s 'http://localhost:3100/api/companies/:cid/issues?status=todo'

# Filter by project
curl -s 'http://localhost:3100/api/companies/:cid/issues?projectId=UUID'

# Limit results
curl -s 'http://localhost:3100/api/companies/:cid/issues?limit=5'
```

Query params: status, projectId, limit (no search endpoint exists).

Key fields per issue:

| Field | Type | Notes |
|-------|------|-------|
| id | UUID | Issue ID |
| identifier | string | Human ID like "TDW-14", "GEO-7" |
| title | string | Short description |
| description | string | Full task body (often includes workdir, steps, success criteria) |
| status | string | "todo", "in_progress", "done", "cancelled" |
| priority | string | "critical", "high", "medium", "low" |
| assigneeAgentId | UUID or null | Agent assigned to this issue |
| projectId | UUID or null | Project this issue belongs to |
| parentId | UUID or null | Parent issue (for subtasks) |
| originKind | string | "manual" = created by human |
| issueNumber | number | Sequential number within company |

Quick one-liner to see open issues:

```bash
curl -s http://localhost:3100/api/companies/:cid/issues | \
  python3 -c "import sys,json
for i in json.load(sys.stdin):
  if i['status'] not in ('done','cancelled'):
    print(f'{i[\"identifier\"]:8s} {i[\"priority\"]:8s} {i[\"status\"]:12s} {i[\"title\"]}')"
```

#### Get Single Issue

```bash
curl -s http://localhost:3100/api/issues/:iid | python3 -m json.tool
```

#### Create an Issue

```bash
curl -s -X POST http://localhost:3100/api/companies/:cid/issues \
  -H 'Content-Type: application/json' -d '{
    "title": "Implement GPU shader pipeline",
    "description": "Workdir: ~/zion/projects/geometry_os\n\nWire up compute shader dispatch loop...",
    "priority": "high",
    "projectId": "UUID"
  }'
```

Required: title. Optional: description, priority (default: "medium"), projectId.

#### Update an Issue

```bash
# Mark as done
curl -s -X PATCH http://localhost:3100/api/issues/:iid \
  -H 'Content-Type: application/json' -d '{"status":"done"}'

# Mark as in_progress
curl -s -X PATCH http://localhost:3100/api/issues/:iid \
  -H 'Content-Type: application/json' -d '{"status":"in_progress"}'

# Change priority
curl -s -X PATCH http://localhost:3100/api/issues/:iid \
  -H 'Content-Type: application/json' -d '{"priority":"critical"}'

# Reassign to different agent
curl -s -X PATCH http://localhost:3100/api/issues/:iid \
  -H 'Content-Type: application/json' -d '{"assigneeAgentId":"NEW_AGENT_UUID"}'
```

Patchable: status, priority, title, description, assigneeAgentId, projectId, labels.

#### Checkout an Issue (Assign to Agent)

Checks out an issue to an agent for work. Validates the agent exists and the
issue is in an expected status.

```bash
curl -s -X POST http://localhost:3100/api/issues/:iid/checkout \
  -H 'Content-Type: application/json' -d '{
    "agentId": "AGENT_UUID",
    "expectedStatuses": ["todo"]
  }'
```

Required: agentId, expectedStatuses (array of valid statuses, typically ["todo"]).

The checkout will fail if the issue is not in one of the expectedStatuses.

---

### Comments

Comments are threaded on issues. Used by agents to report progress and by
humans to give feedback.

#### List Comments

```bash
curl -s http://localhost:3100/api/issues/:iid/comments | python3 -m json.tool
```

Key fields:

| Field | Type | Notes |
|-------|------|-------|
| id | UUID | Comment ID |
| body | string | Comment content (often markdown) |
| authorAgentId | UUID or null | Agent that wrote it (null if human) |
| authorUserId | string or null | User that wrote it (e.g. "local-board") |

#### Create a Comment

```bash
curl -s -X POST http://localhost:3100/api/issues/:iid/comments \
  -H 'Content-Type: application/json' -d '{
    "body": "DONE: Implemented GPU dispatch loop. 54 tests passing."
  }'
```

Required: body.

Agents typically post a completion comment when they finish an issue, then
PATCH the issue status to "done".

---

### Projects

Projects group issues and have optional codebase configuration.

#### List Projects

```bash
curl -s http://localhost:3100/api/companies/:cid/projects | python3 -m json.tool
```

Key fields:

| Field | Type | Notes |
|-------|------|-------|
| id | UUID | Project ID |
| name | string | e.g. "GlyphLang", "AIPM v5" |
| status | string | "in_progress", "completed", "archived" |
| color | string | Hex color for UI |
| urlKey | string | Slug for URLs |
| codebase.effectiveLocalFolder | string | Actual filesystem path |
| codebase.localFolder | string or null | User-configured override path |

#### Get Project

```bash
curl -s http://localhost:3100/api/projects/:pid | python3 -m json.tool
```

#### Create Project

```bash
curl -s -X POST http://localhost:3100/api/companies/:cid/projects \
  -H 'Content-Type: application/json' -d '{
    "name": "New Project",
    "description": "Project description"
  }'
```

Required: name.

#### Update Project

```bash
curl -s -X PATCH http://localhost:3100/api/projects/:pid \
  -H 'Content-Type: application/json' -d '{"status":"completed"}'
```

Patchable: name, description, status, color, leadAgentId, targetDate.

---

### Goals

Goals are milestones within a company. Currently returns empty arrays in
existing companies but the endpoint is live.

#### List Goals

```bash
curl -s http://localhost:3100/api/companies/:cid/goals
```

#### Create Goal

```bash
curl -s -X POST http://localhost:3100/api/companies/:cid/goals \
  -H 'Content-Type: application/json' -d '{
    "title": "Ship Phase 1"
  }'
```

Required: title.

---

### Labels

Labels for organizing issues.

#### List Labels

```bash
curl -s http://localhost:3100/api/companies/:cid/labels
```

Returns empty array `[]` if none created.

#### Create Label

```bash
curl -s -X POST http://localhost:3100/api/companies/:cid/labels \
  -H 'Content-Type: application/json' -d '{
    "name": "gpu",
    "color": "#ff0000"
  }'
```

Required: name, color (hex string).

---

## Common Workflows

### Workflow 1: Check What's Happening

```bash
# 1. Is Paperclip running?
curl -s http://localhost:3100/api/health

# 2. What companies exist?
curl -s http://localhost:3100/api/companies | \
  python3 -c "import sys,json
for c in json.load(sys.stdin):
  print(f'{c[\"id\"]}  {c[\"name\"]}  prefix:{c[\"issuePrefix\"]}')"

# 3. Quick dashboard for a company
CID="87d9f916-3c58-4c75-a2aa-04e16ef6fe2e"
curl -s http://localhost:3100/api/companies/$CID/dashboard | python3 -m json.tool

# 4. What are agents doing?
curl -s http://localhost:3100/api/companies/$CID/agents | \
  python3 -c "import sys,json
for a in json.load(sys.stdin):
  print(f'{a[\"name\"]:20s} {a[\"status\"]:10s} last:{a[\"lastHeartbeatAt\"]}')"

# 5. Open issues?
curl -s http://localhost:3100/api/companies/$CID/issues | \
  python3 -c "import sys,json
for i in json.load(sys.stdin):
  if i['status'] not in ('done','cancelled'):
    print(f'{i[\"identifier\"]:8s} {i[\"priority\"]:8s} {i[\"status\"]:12s} {i[\"title\"]}')"
```

### Workflow 2: Create and Assign a Task

```bash
CID="87d9f916-3c58-4c75-a2aa-04e16ef6fe2e"
ENGINEER_ID="47bf27e6-b37c-4da1-85bb-2cd1603dfedf"

# 1. Create the issue
ISSUE=$(curl -s -X POST http://localhost:3100/api/companies/$CID/issues \
  -H 'Content-Type: application/json' -d '{
    "title": "Fix GPU memory leak in shader compiler",
    "description": "Workdir: ~/zion/projects/glyphlang\n\nThe shader compiler leaks ~2MB per compilation cycle.\nRepro: go test ./pkg/compiler/ -run TestMemoryLeak\n\nSuccess: Test passes with <1MB growth over 1000 cycles.",
    "priority": "high",
    "projectId": "PROJECT_UUID"
  }')
ISSUE_ID=$(echo $ISSUE | python3 -c "import sys,json; print(json.load(sys.stdin)['id'])")

# 2. Check it out to an agent
curl -s -X POST http://localhost:3100/api/issues/$ISSUE_ID/checkout \
  -H 'Content-Type: application/json' -d "{
    \"agentId\": \"$ENGINEER_ID\",
    \"expectedStatuses\": [\"todo\"]
  }"

# 3. Wake the agent so it picks up the new task
curl -s -X POST http://localhost:3100/api/agents/$ENGINEER_ID/wakeup \
  -H 'Content-Type: application/json' -d '{}'
```

### Workflow 3: Monitor and Complete a Task

```bash
# 1. Check issue status
curl -s http://localhost:3100/api/issues/$ISSUE_ID | \
  python3 -c "import sys,json; i=json.load(sys.stdin); print(f'{i[\"identifier\"]} {i[\"status\"]} {i[\"title\"]}')"

# 2. Read latest comment (agent progress reports)
curl -s http://localhost:3100/api/issues/$ISSUE_ID/comments | \
  python3 -c "import sys,json
comments = json.load(sys.stdin)
if comments:
  latest = comments[-1]
  author = latest.get('authorAgentId') or latest.get('authorUserId') or '?'
  print(f'[{author}] {latest[\"body\"][:200]}')"

# 3. Mark issue done (if you're the one completing it)
curl -s -X PATCH http://localhost:3100/api/issues/$ISSUE_ID \
  -H 'Content-Type: application/json' -d '{"status":"done"}'

# 4. Post completion comment
curl -s -X POST http://localhost:3100/api/issues/$ISSUE_ID/comments \
  -H 'Content-Type: application/json' -d '{
    "body": "DONE: Fixed the memory leak. Root cause was unclosed buffer in shader cache. All tests passing."
  }'
```

### Workflow 4: Pause and Resume Work

```bash
# Pause all agents in a company (emergency stop)
CID="87d9f916-3c58-4c75-a2aa-04e16ef6fe2e"
AGENTS=$(curl -s http://localhost:3100/api/companies/$CID/agents)
echo $AGENTS | python3 -c "
import sys,json,subprocess
for a in json.load(sys.stdin):
  if a['status'] == 'running':
    subprocess.run(['curl','-s','-X','PATCH',
      f'http://localhost:3100/api/agents/{a[\"id\"]}',
      '-H','Content-Type: application/json',
      '-d','{\"status\":\"paused\"}'])
    print(f'Paused {a[\"name\"]}')
"

# Resume specific agent
curl -s -X PATCH http://localhost:3100/api/agents/$AGENT_ID \
  -H 'Content-Type: application/json' -d '{"status":"running"}'
curl -s -X POST http://localhost:3100/api/agents/$AGENT_ID/wakeup \
  -H 'Content-Type: application/json' -d '{}'
```

### Workflow 5: Cross-Company Overview

Paperclip can manage multiple companies. To work across them:

```bash
# List all companies with their open issue counts
curl -s http://localhost:3100/api/companies | \
  python3 -c "
import sys,json,urllib.request
companies = json.load(sys.stdin)
for c in companies:
  dash = json.loads(urllib.request.urlopen(f'http://localhost:3100/api/companies/{c[\"id\"]}/dashboard').read())
  tasks = dash.get('tasks',{})
  print(f'{c[\"name\"]:20s}  open:{tasks.get(\"open\",0):3d}  in_progress:{tasks.get(\"inProgress\",0):3d}  done:{tasks.get(\"done\",0):3d}')
"
```

---

## Data Models Quick Reference

### Agent Statuses

| Status | Meaning |
|--------|---------|
| running | Agent is actively processing (heartbeat alive) |
| idle | Agent is waiting for work |
| paused | Agent has been manually paused |
| error | Agent encountered an error |

### Issue Statuses

| Status | Meaning |
|--------|---------|
| todo | Created, not yet assigned or started |
| in_progress | Checked out to an agent, being worked on |
| done | Completed successfully |
| cancelled | Cancelled without completing |

### Issue Priorities

| Priority | Direction |
|----------|-----------|
| critical | Highest, blocking |
| high | Important, should be done soon |
| medium | Default |
| low | Nice to have |

### Agent Roles

| Role | Purpose |
|------|---------|
| ceo | Manages company, triages issues, assigns work |
| engineer | Executes tasks, writes code |

---

## Pitfalls

1. **No search endpoint.** You can filter issues by status and projectId but
   there's no full-text search. Use `python3 -c` to filter client-side.

2. **identifier can be null.** Issue.identifier is `string | null`, not
   `string`. Newly created issues may not have an identifier immediately.
   Use issueNumber or the UUID id instead.

3. **checkout requires expectedStatuses.** The checkout endpoint won't work
   without passing an `expectedStatuses` array. Use `["todo"]` for new issues.

4. **PATCH with empty body returns current state.** Sending an empty PATCH
   ( `{}` ) is a no-op and returns the current object. It won't error but
   won't change anything either.

5. **No /api/runs or /api/me.** These endpoints don't exist. Agent run
   history isn't queryable via REST.

6. **Company deletion needs companyDeletionEnabled.** The health endpoint
   shows `features.companyDeletionEnabled: true`, but DELETE on companies
   returns 500. Avoid it.

7. **wakeup returns 202, not 200.** It's "accepted" -- the agent will run
   asynchronously. Don't expect immediate status change in the response.

8. **comments are flat, not threaded.** No reply-to or parent comment ID.
   All comments on an issue are a flat list in chronological order.

9. **Issue description is the task body.** When agents create issues, the
   description typically contains: change directory, step ID, workdir, context,
   and success criteria. This is the "prompt" for the assigned agent.

10. **Local trusted mode = no auth.** If Paperclip is switched to authenticated
    mode, all these curl calls will need auth headers. Check
    `deploymentMode` in `/api/health` to verify.

---

## Plugin: Geometry OS Dashboard

The `paperclip.geometry-os` plugin (v0.2.0) provides a live dashboard for the
Geometry OS project. It has two UI surfaces (a compact dashboard widget and a
full page at route `geometryos`) plus server-side actions you can invoke via
REST API.

### Plugin Identity

| Field | Value |
|-------|-------|
| Plugin key | `paperclip.geometry-os` |
| Company | Geometry OS (`41e9e9c7-38b4-45a8-b2cc-c34206d7d86d`) |
| Project | Geometry OS (`f7054708-de6a-4a60-81b9-d22a474ced19`) |
| Rust Engineer agent | `059452a1-92fa-44fe-b591-b83f3d375c77` |
| Source | `~/zion/apps/linux/paperclip/paperclip/packages/plugins/examples/plugin-geometry-os/` |
| GeoOS project dir | `~/zion/projects/geometry_os/geometry_os/` |
| Route path | `geometryos` |

### Plugin REST API

#### Check Plugin Health

```bash
curl -s http://localhost:3100/api/plugins/paperclip.geometry-os/health
```

```json
{
  "status": "ready",
  "healthy": true,
  "checks": [
    { "name": "registry", "passed": true },
    { "name": "manifest", "passed": true },
    { "name": "status", "passed": true, "message": "Current status: ready" }
  ]
}
```

#### List All Installed Plugins

```bash
curl -s http://localhost:3100/api/plugins | \
  python3 -c "import sys,json
for p in json.load(sys.stdin):
  print(f'{p[\"pluginKey\"]:40s} v{p[\"version\"]:6s} status:{p[\"status\"]}')"
```

Output:
```
paperclip.ascii-world                    v0.1.0  status:ready
paperclip.llm-improvement-trio           v1.0.0  status:ready
paperclip.opensrc                        v0.1.0  status:ready
paperclip.glyphlang-runtime              v0.2.0  status:ready
paperclip.geometry-os                    v0.2.0  status:ready
```

#### Invoke Plugin Actions

All actions are invoked via `POST /api/plugins/paperclip.geometry-os/actions/:actionName`.

##### Run Build

```bash
curl -s -X POST \
  http://localhost:3100/api/plugins/paperclip.geometry-os/actions/run-build \
  -H 'Content-Type: application/json' -d '{}'
```

Response:
```json
{
  "data": {
    "success": true,
    "output": "Finished `dev` profile...",
    "timestamp": 1775323551976,
    "durationMs": 79
  }
}
```

##### Run Tests

```bash
curl -s -X POST \
  http://localhost:3100/api/plugins/paperclip.geometry-os/actions/run-tests \
  -H 'Content-Type: application/json' -d '{}'
```

Response:
```json
{
  "data": {
    "total": 119,
    "passed": 118,
    "failed": 1,
    "durationMs": 3200,
    "tests": [
      { "name": "test_self_replicator", "status": "ok", "durationMs": 0 },
      { "name": "test_ldi", "status": "ok", "durationMs": 0 }
    ]
  }
}
```

##### Run Full CI (Build + Test)

```bash
curl -s -X POST \
  http://localhost:3100/api/plugins/paperclip.geometry-os/actions/run-ci \
  -H 'Content-Type: application/json' -d '{}'
```

Returns `{ build: BuildResult, tests: TestResult | null }`. Tests only run if
the build succeeds.

##### Generate and Run Programs (PixelGPT)

```bash
# Generate 1 program and evaluate it
curl -s -X POST \
  http://localhost:3100/api/plugins/paperclip.geometry-os/actions/generate-and-run \
  -H 'Content-Type: application/json' -d '{"n":1}'

# Batch of 10
curl -s -X POST \
  http://localhost:3100/api/plugins/paperclip.geometry-os/actions/generate-and-run \
  -H 'Content-Type: application/json' -d '{"n":10,"temperature":0.8,"topK":40}'
```

Params: `n` (number of programs), `temperature` (0.0-2.0), `topK` (1-100).

If PixelGPT checkpoint exists at `pixel-llm/checkpoints/final.pt`, it generates
programs via the model. Otherwise falls back to synthetic template programs.

If `pmp-eval` binary exists, each program is assembled and run on the GPU
substrate for fitness scoring. Otherwise fitness is null.

Response:
```json
{
  "data": {
    "success": true,
    "programs": [
      {
        "index": 0,
        "program": "LDI r0 0\nLDI r1 100\n...",
        "pixels": 18,
        "hex": "0x00000001 0x00000000 ...",
        "valid": true,
        "source": "synthetic",
        "fitness": {
          "score": 0.742,
          "halted": true,
          "cycles": 48,
          "nonzeroRegs": 5,
          "uniqueWrites": 12
        }
      }
    ],
    "source": "synthetic",
    "evaluated": true,
    "averageFitness": 0.742
  }
}
```

#### Fitness History Data

```bash
curl -s -X POST \
  http://localhost:3100/api/plugins/paperclip.geometry-os/data/fitness-history \
  -H 'Content-Type: application/json' \
  -d '{"companyId":"41e9e9c7-38b4-45a8-b2cc-c34206d7d86d"}'
```

Returns:
```json
{
  "data": {
    "runs": [
      {
        "timestamp": 1775323551000,
        "avgFitness": 0.742,
        "programCount": 10,
        "haltRate": 0.8,
        "avgCycles": 48,
        "source": "synthetic",
        "programs": [
          { "index": 0, "fitness": 0.8, "halted": true, "cycles": 42 }
        ]
      }
    ]
  }
}
```

Last 50 runs are kept. History is stored in plugin state scoped to the company.

#### Scheduled Job: Fitness Regression Guard

```bash
# Check job status
curl -s http://localhost:3100/api/plugins/paperclip.geometry-os/jobs
```

```json
[
  {
    "jobKey": "fitness-regression",
    "schedule": "0 */6 * * *",
    "status": "active",
    "nextRunAt": "2026-04-04T18:00:00.000Z"
  }
]
```

Runs every 6 hours. Each run:
1. Generates N programs (PixelGPT or synthetic)
2. Evaluates each on GPU substrate
3. Stores fitness history (avg fitness, halt rate, avg cycles)
4. Compares with previous run
5. If regression detected (>15% fitness drop), auto-creates a high-priority
   issue in the Geometry OS project

### Plugin Automation

The plugin has event-driven automation wired into the Geometry OS company:

**On `issue.updated` (Geometry OS company only):**

| Trigger | Auto-Action |
|---------|-------------|
| Issue moves to `in_progress` with no agent assigned | Auto-invokes Rust Engineer agent with issue as prompt |
| Issue moves to `done` | Runs `cargo build` + `cargo test`. If tests fail, posts a warning comment on the issue |

### What the Dashboard Shows

The dashboard widget (compact, on main Paperclip dashboard) shows:
- Current phase and progress bar
- Build/test status
- VM capacity (8 VMs x 128 registers)
- Phase 1 issue list with status indicators

The full page (at `/geometryos` route) shows:
- Fitness Regression Guard: sparkline charts for fitness and halt rate over time,
  recent runs table, current stats
- Mission & Seven Laws ethical framework
- Phase progress bars with issue lists for each phase
- Build/Test/CI control buttons
- 5-phase roadmap (Phase 0: complete, Phase 1: current, Phases 2-4: planned)
- GPU Substrate status (texture size, VM grid visualization)
- PixelGPT program generator (generate + eval buttons for 1/10/50 programs)

### Geometry OS Company IDs Quick Reference

```bash
CID="41e9e9c7-38b4-45a8-b2cc-c34206d7d86d"  # Geometry OS company
PID="f7054708-de6a-4a60-81b9-d22a474ced19"    # Geometry OS project
ENGINEER="059452a1-92fa-44fe-b591-b83f3d375c77"  # Rust Engineer agent
CEO="4d484dfa-ffe0-4b8c-870c-c9b23eadaf5a"       # CEO agent

# Quick status
curl -s http://localhost:3100/api/companies/$CID/dashboard | python3 -m json.tool

# Open issues
curl -s http://localhost:3100/api/companies/$CID/issues | \
  python3 -c "import sys,json
for i in json.load(sys.stdin):
  if i['status'] not in ('done','cancelled'):
    print(f'{i[\"identifier\"]:8s} {i[\"priority\"]:8s} {i[\"status\"]:12s} {i[\"title\"]}')"

# Run CI via plugin
curl -s -X POST http://localhost:3100/api/plugins/paperclip.geometry-os/actions/run-ci \
  -H 'Content-Type: application/json' -d '{}'
```

### Plugin Pitfalls

1. **Data provider `dashboard-state` has a companyId bug.** The `POST /data/dashboard-state`
   endpoint currently fails with `"invalid input syntax for type uuid: \"undefined\"\"`
   regardless of what you pass. The UI component works because it gets companyId
   from its own widget context. Use the `/actions/run-*` endpoints instead for
   programmatic access -- they work fine.

2. **`generate-and-run` may 500.** If neither PixelGPT checkpoint nor `pmp-eval`
   binary exist, or if the Python environment is broken, the action returns an
   internal server error instead of a clean fallback.

3. **Job trigger endpoint doesn't exist.** You can list jobs (`GET /jobs`) but
   there's no `POST /jobs/:key/run` endpoint. The fitness-regression job only
   runs on its cron schedule. Use the `generate-and-run` action as a manual
   alternative.

4. **Plugin state is scoped to company.** Fitness history is stored under
   `scopeKind: "company"`, `scopeId: COMPANY_ID`, `stateKey: "fitness-history"`.
   It's not directly accessible via REST. Use the `fitness-history` data
   provider instead.

5. **Auto-dispatch only for Geometry OS company.** The `issue.updated` event
   handler filters on `companyId === COMPANY_ID`. Issues in other companies
   won't trigger auto-CI or auto-dispatch.

---

## Company: ASCII World

ASCII World (pxOS) -- a pixel-based operating system where AI agents produce data
and humans consume pixels. Cell Store -> Formula Engine -> Pixel Buffer -> PNG.

### Company Identity

| Field | Value |
|-------|-------|
| Company ID | `523529a2-a20e-4cdd-86f3-9407155422c2` |
| Name | ASCII World |
| Issue prefix | `ASC` |
| Status | active |
| Source repo | `/home/jericho/zion/projects/ascii_world/ascii_world/` |
| API Base | `http://localhost:3100/api` |

### Agents

| Name | ID | Role | Model | Status |
|------|----|------|-------|--------|
| CEO | `202eac1d-c89b-4838-bda2-49b15eabcbfc` | ceo | glm-5.1 | idle |
| Engineer | `b9719119-eee2-4cb3-9985-173043d98d64` | engineer | glm-5.1 | idle |

Both agents use `hermes_local` adapter with 300s (CEO) / 600s (Engineer) timeout.
Hermes command at `/home/jericho/zion/projects/aipm/bin/aipm_hermes_generic.sh`.

### Projects

| Project | ID | Status |
|---------|----|--------|
| pxOS Core | `9bcb7806-66fa-419f-84a8-cd0b6ce51b6a` | completed |
| Paperclip Integration | `8d252a33-0df6-4da9-b5d2-7b81cda01229` | completed |
| Visual Intelligence | `50f5adb8-c9e0-41f2-b220-7e57b341458e` | in_progress |
| Agent Dashboard | `98646af5-abc8-4494-8619-efb16d02f8bc` | in_progress |
| Compositions | `16047730-7cb3-4bbd-be96-b59cbf67704b` | backlog |
| GPU Integration | `7425183c-5494-44ed-b222-8ccbff0488eb` | backlog |
| Plugin Enhancement | `5a97f8d5-e8ab-4fd7-9a63-06c394dd670d` | backlog |

### Open Issues

| ID | Priority | Title | Project |
|----|----------|-------|---------|
| ASC-11 | critical | RGB animation mode: time-based shader parameters | Visual Intelligence |
| ASC-12 | high | Achieve baseline visual scores (>25/40) for all shaders | Visual Intelligence |
| ASC-14 | high | Formula composition for issue burndown chart | Compositions |
| ASC-15 | high | WGSL shader bridge: pixel buffer to Geometry OS texture | GPU Integration |
| ASC-16 | high | Plugin data provider: live cell-store state | Plugin Enhancement |
| ASC-17 | medium | Plugin action: trigger composition run | Plugin Enhancement |
| ASC-18 | medium | AGENT_HISTORY formula: time-series data hardening | Agent Dashboard |

### Architecture

```
AI Agent --POST--> Cell Store --formula--> Pixel Buffer --render--> PNG
                   (key=value)   =BAR(cpu,40)  (480x240 RGBA)
```

Key modules:
- `sync/cell-store.js` -- Reactive key-value store (7 tests)
- `sync/pixel-formula-engine.js` -- Evaluates =BAR, =TEXT, =STATUS, =SPARKLINE etc (28 tests)
- `sync/pixel-buffer.js` -- RGBA drawing primitives (16 tests)
- `sync/server.js` -- HTTP + WebSocket server (7 tests)
- `compositions/agent-dashboard.js` -- Paperclip polling composition (14 tests)

Total: 2028 tests, 0 failures.

### Plugin: paperclip.ascii-world

The `paperclip.ascii-world` plugin (v0.1.0) provides a terminal-style TUI dashboard
embedded in Paperclip. Source at
`~/zion/apps/linux/paperclip/paperclip/packages/plugins/examples/plugin-ascii-world/`.

Has two UI slots: dashboardWidget (`ascii-world-dashboard`) and full page
(route: `asciiworld`). Capabilities include companies/agents/issues read,
issues create/update, plugin state read/write.

### Quick Reference

```bash
CID="523529a2-a20e-4cdd-86f3-9407155422c2"
CEO="202eac1d-c89b-4838-bda2-49b15eabcbfc"
ENG="b9719119-eee2-4cb3-9985-173043d98d64"

# Dashboard
curl -s http://localhost:3100/api/companies/$CID/dashboard | python3 -m json.tool

# Open issues
curl -s http://localhost:3100/api/companies/$CID/issues | \
  python3 -c "import sys,json
for i in json.load(sys.stdin):
  if i['status'] not in ('done','cancelled'):
    print(f'{i[\"identifier\"]:8s} {i[\"priority\"]:8s} {i[\"status\"]:12s} {i[\"title\"]}')"

# Run tests
cd ~/zion/projects/ascii_world/ascii_world && npm test

# Wake CEO
curl -s -X POST http://localhost:3100/api/agents/$CEO/wakeup \
  -H 'Content-Type: application/json' -d '{}'
```

---

## Company: AIPM

Autonomous AI Project Management company. Mission: extract the best ideas from
AIPM v5 (`/home/jericho/zion/projects/aipm-v5`) and build them into Paperclip
as plugins, skills, and agent capabilities. The goal is not maintaining AIPM as
a standalone tool -- it's making Paperclip better at automation.

### Company Identity

| Field | Value |
|-------|-------|
| Company ID | `2b005468-996b-4b71-88eb-41970af8d63a` |
| Name | AIPM |
| Issue prefix | `AIP` |
| Status | active |
| Source repo | `/home/jericho/zion/projects/aipm-v5/` |
| API Base | `http://localhost:3100/api` |

### Agents

| Name | ID | Role | Model | Status |
|------|----|------|-------|--------|
| CEO | `5b8a3714-4cdd-4190-9204-eedb4a46f2f0` | ceo | glm-5.1 | running |
| Engineer | `f556ba06-a961-4a46-9af8-66cf53f96cee` | engineer | glm-5.1 | running |

Both agents use `hermes_local` adapter with 300s (CEO) / 600s (Engineer) timeout
and persistent sessions. Hermes command at
`/home/jericho/zion/projects/aipm/bin/aipm_hermes_generic.sh`.

### Projects

| Project | ID | Focus |
|---------|----|-------|
| AIPM Core | `2cef6984-d537-41e1-9346-61e4316c4dca` | Self-driving loop engine |
| Paperclip Integration | `3d458021-8165-4cc5-b2be-4fff4cb4dc60` | Bridge AIPM into Paperclip plugins |
| Automation Skills | `818ba713-eace-4803-892e-fb963ee0ef46` | Reusable Hermes agent skills |

### Issues

| ID | Priority | Title | Project |
|----|----------|-------|---------|
| AIP-1 | high | Audit AIPM v5 capabilities vs Paperclip primitives | Paperclip Integration |
| AIP-2 | medium | Outcome feedback loop as Paperclip plugin action | Paperclip Integration |
| AIP-3 | high | Keep-or-revert as a Paperclip agent skill | Automation Skills |
| AIP-4 | medium | Self-repair canary: agent detects and fixes own failures | Automation Skills |
| AIP-5 | medium | Codebase auditor: LOC counts, test ratios, untested modules | Automation Skills |
| AIP-6 | high | Strategist: LLM-driven task generation from audit data | AIPM Core |

### Audit Results (AIP-1, completed by CEO)

Full audit at `/home/jericho/zion/projects/aipm-v5/docs/aipm-v5-vs-paperclip-audit.md`.

Key findings:
- **6 of 10** AIPM features can be fully replicated as a Paperclip plugin using
  native primitives (state, issues, agents, events, scheduled jobs)
- **3 features** need custom plugin logic: OutcomeDetector tool, Strategist job,
  keep-or-revert action
- **1 feature** needs a Paperclip core enhancement: per-invocation agent timeout

Feature mapping:

| AIPM Feature | Paperclip Equivalent | Gap? |
|--------------|---------------------|------|
| Keep-or-revert | None native | Plugin action needed |
| OutcomeDetector | None native | Plugin tool needed |
| Self-feeding loop | Issues + scheduled job | Strategist job needed |
| Outcome history | ctx.state + issue comments | Schema needed |
| Learnings accumulation | ctx.state or issue documents | Storage logic needed |
| Implementation planner | Agent prompt template | Template needed |
| Retry with modified approach | Agent re-invocation | Retry logic needed |
| Sandbox mode | Workspace isolation | Workspace CWD config |
| Step-level state tracking | Issue status + ctx.state | Mapping needed |
| Per-step timeout | None native | Core enhancement needed |

Recommended architecture: single `@paperclipai/aipm` plugin with:
1. Scheduled job (strategist-cycle) replacing the self-feeding loop
2. Scheduled job (health-check) replacing heartbeat monitoring
3. Agent tool (verify-outcome) for test pass/fail detection
4. Plugin action (keep-or-revert) for git rollback semantics
5. Event handler (issue.updated) for outcome tracking

### Codebase Auditor (AIP-5, completed by Engineer)

Delivered `codebase_audit.py` + `SKILL.md`. Scans any repo for:
- LOC per language (tokei for Rust, pygount for Python)
- Runtime vs test file classification
- Test ratio, module-level stats, untested modules
- Output as text (human) or JSON (strategist consumption)

Tested on:
- **geometry_os** (Rust): 6,708 LOC, 27.6% test ratio, 2 untested modules
- **ascii_world** (Python/JS): 52,800+ LOC

### Quick Reference

```bash
CID="2b005468-996b-4b71-88eb-41970af8d63a"
CEO="5b8a3714-4cdd-4190-9204-eedb4a46f2f0"
ENG="f556ba06-a961-4a46-9af8-66cf53f96cee"

# Dashboard
curl -s http://localhost:3100/api/companies/$CID/dashboard | python3 -m json.tool

# Open issues
curl -s http://localhost:3100/api/companies/$CID/issues | \
  python3 -c "import sys,json
for i in json.load(sys.stdin):
  if i['status'] not in ('done','cancelled'):
    print(f'{i[\"identifier\"]:8s} {i[\"priority\"]:8s} {i[\"status\"]:12s} {i[\"title\"]}')"

# Agent status
curl -s http://localhost:3100/api/companies/$CID/agents | \
  python3 -c "import sys,json
for a in json.load(sys.stdin):
  print(f'{a[\"name\"]:20s} {a[\"role\"]:10s} {a[\"status\"]}')"

# Invoke CEO
curl -s -X POST http://localhost:3100/api/agents/$CEO/invoke \
  -H 'Content-Type: application/json' \
  -d '{"prompt":"Check on your open issues and report status"}'

# Create a new automation issue
curl -s -X POST http://localhost:3100/api/companies/$CID/issues \
  -H 'Content-Type: application/json' \
  -d '{"title":"New automation feature","description":"...","priority":"medium","projectId":"818ba713-eace-4803-892e-fb963ee0ef46"}'
```
