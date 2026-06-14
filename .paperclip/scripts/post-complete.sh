#!/usr/bin/env bash
# post-complete.sh N -- Post-completion merge and cleanup for issue GEO-N
# Usage: ./post-complete.sh 112
# 1. Merges feat/geo-N into master (with cargo test)
# 2. On success: cleans up worktree and branch
# 3. On conflict/failure: creates a Paperclip alert issue for the CEO
set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "ERROR: Usage: $0 <issue-number>" >&2
    exit 1
fi

ISSUE_NUM="$1"
REPO_ROOT="$(git rev-parse --show-toplevel)"
SCRIPTS_DIR="${REPO_ROOT}/.paperclip/scripts"
COMPANY_ID="41e9e9c7-38b4-45a8-b2cc-c34206d7d86d"
API_BASE="http://127.0.0.1:3100/api"

# Step 1: Merge
echo "=== Post-completion workflow for GEO-${ISSUE_NUM} ==="

if "${SCRIPTS_DIR}/merge-worktree.sh" "${ISSUE_NUM}"; then
    # Step 2: Success — cleanup and reset
    echo ""
    echo "Merge succeeded. Cleaning up worktree..."
    "${SCRIPTS_DIR}/cleanup-worktree.sh" "${ISSUE_NUM}"
    
    # Ensure we're back on master
    cd "${REPO_ROOT}"
    git checkout master 2>/dev/null || true
    
    echo ""
    echo "=== GEO-${ISSUE_NUM} post-completion done ==="
else
    MERGE_EXIT=$?
    echo ""
    echo "FAIL: Merge failed for GEO-${ISSUE_NUM}. Keeping worktree for manual review." >&2
    
    # Step 3: Create alert issue for CEO
    ALERT_TITLE="MERGE CONFLICT: GEO-${ISSUE_NUM} requires manual merge"
    ALERT_BODY="Automatic merge of feat/geo-${ISSUE_NUM} into master failed.%0A%0AThe worktree has been preserved at worktrees/geo-${ISSUE_NUM}.%0A%0ARun manually from ${REPO_ROOT}:%0A  git checkout master%0A  git merge --no-ff feat/geo-${ISSUE_NUM}%0A  # Resolve conflicts, then:%0A  cargo test%0A  .paperclip/scripts/cleanup-worktree.sh ${ISSUE_NUM}"
    
    curl -s -X POST "${API_BASE}/companies/${COMPANY_ID}/issues" \
        -H "Content-Type: application/json" \
        -d "{\"title\":\"${ALERT_TITLE}\",\"description\":\"${ALERT_BODY}\",\"priority\":\"high\",\"labels\":[\"merge-conflict\"]}" \
        >/dev/null 2>&1
    
    echo "Alert issue created for CEO review."
    exit "${MERGE_EXIT}"
fi
