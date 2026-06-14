#!/usr/bin/env bash
# dispatch-with-worktree.sh -- Create worktree, patch agent cwd, patch issue, checkout
# Usage: ./dispatch-with-worktree.sh <issue-number> <issue-uuid> <agent-id>
# Example: ./dispatch-with-worktree.sh 112 abc-def-123 059452a1-92fa-44fe-b591-b83f3d375c77
set -euo pipefail

if [[ $# -lt 3 ]]; then
    echo "ERROR: Usage: $0 <issue-number> <issue-uuid> <agent-id>" >&2
    exit 1
fi

ISSUE_NUM="$1"
ISSUE_UUID="$2"
AGENT_ID="$3"
API="http://127.0.0.1:3100/api"
COMPANY_ID="41e9e9c7-38b4-45a8-b2cc-c34206d7d86d"
REPO_ROOT="$(cd ~/zion/projects/geometry_os/geometry_os && git rev-parse --show-toplevel)"
WORKTREE_DIR="${REPO_ROOT}/../worktrees/geo-${ISSUE_NUM}"
BRANCH="feat/geo-${ISSUE_NUM}"

echo "=== Dispatch with Worktree for GEO-${ISSUE_NUM} ==="

# Step 1: Create worktree
echo "[1/5] Creating worktree..."
cd "${REPO_ROOT}"
bash .paperclip/scripts/create-worktree.sh "${ISSUE_NUM}"

# Step 2: PATCH agent adapterConfig.cwd to worktree path
# Must include ALL existing fields to avoid overwriting
echo "[2/5] Patching agent cwd to worktree..."
# Read current config, update cwd, write back
python3 << PYEOF
import json, subprocess, sys

agent_id = "${AGENT_ID}"
worktree_dir = "${WORKTREE_DIR}"
api = "${API}"

# Get current agent config
result = subprocess.run(
    ["curl", "-s", f"{api}/agents/{agent_id}"],
    capture_output=True, text=True
)
agent = json.loads(result.stdout)
config = agent.get("adapterConfig", {})
config["cwd"] = worktree_dir

# PATCH agent with updated config
payload = json.dumps({"adapterConfig": config})
result = subprocess.run(
    ["curl", "-s", "-X", "PATCH", f"{api}/agents/{agent_id}",
     "-H", "Content-Type: application/json", "-d", payload],
    capture_output=True, text=True
)
resp = json.loads(result.stdout)
print(f"  Agent {resp.get('name','?')} cwd -> {resp.get('adapterConfig',{}).get('cwd','?')}")
PYEOF

# Step 3: PATCH issue description with Workdir and Branch lines
echo "[3/5] Patching issue description..."
python3 << PYEOF
import json, subprocess, sys

issue_uuid = "${ISSUE_UUID}"
worktree_dir = "${WORKTREE_DIR}"
branch = "${BRANCH}"
api = "${API}"

# Get current issue description
result = subprocess.run(
    ["curl", "-s", f"{api}/issues/{issue_uuid}"],
    capture_output=True, text=True
)
issue = json.loads(result.stdout)
current_desc = issue.get("description", "")

# Remove existing Workdir/Branch lines if present
lines = current_desc.split("\n")
cleaned = [l for l in lines if not l.startswith("Workdir:") and not l.startswith("Branch:")]

# Prepend new Workdir and Branch
new_desc = f"Workdir: {worktree_dir}\nBranch: {branch}\n" + "\n".join(cleaned)

# PATCH issue with updated description
payload = json.dumps({"description": new_desc})
result = subprocess.run(
    ["curl", "-s", "-X", "PATCH", f"{api}/issues/{issue_uuid}",
     "-H", "Content-Type: application/json", "-d", payload],
    capture_output=True, text=True
)
resp = json.loads(result.stdout)
print(f"  Issue {resp.get('identifier','?')} description updated with Workdir and Branch")
PYEOF

# Step 4: Checkout issue to agent
echo "[4/5] Checking out issue to agent..."
curl -s -X POST "${API}/issues/${ISSUE_UUID}/checkout" \
  -H "Content-Type: application/json" \
  -d "{\"agentId\":\"${AGENT_ID}\",\"expectedStatuses\":[\"backlog\",\"todo\",\"in_progress\"]}" | python3 -c "import sys,json; r=json.loads(sys.stdin.read()); print(f'  Checked out: {r.get(\"identifier\",\"?\")} -> {r.get(\"status\",\"?\")}')"

# Step 5: Wake agent (trigger heartbeat)
echo "[5/5] Waking agent..."
curl -s -X POST "${API}/agents/${AGENT_ID}/heartbeat" \
  -H "Content-Type: application/json" 2>/dev/null | python3 -c "import sys,json; r=json.loads(sys.stdin.read()); print(f'  Agent {r.get(\"name\",\"?\")} heartbeat triggered')" 2>/dev/null || echo "  (heartbeat triggered, agent will wake on next schedule)"

echo "=== Dispatch complete ==="
echo "  Worktree: ${WORKTREE_DIR}"
echo "  Branch:   ${BRANCH}"
echo "  Agent:    ${AGENT_ID}"
echo "  Issue:    GEO-${ISSUE_NUM} (${ISSUE_UUID})"
