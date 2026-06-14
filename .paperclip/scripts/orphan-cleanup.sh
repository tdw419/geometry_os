#!/usr/bin/env bash
# orphan-cleanup.sh -- Remove worktrees older than 24h with no active Paperclip issue
# Usage: ./orphan-cleanup.sh [--dry-run]
# --dry-run: Report what would be cleaned without removing anything
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
WORKTREE_BASE="${REPO_ROOT}/../worktrees"
COMPANY_ID="41e9e9c7-38b4-45a8-b2cc-c34206d7d86d"
API_BASE="http://127.0.0.1:3100/api"
DRY_RUN=false
CUTOFF_AGE=$((24 * 3600))  # 24 hours in seconds

if [[ "${1:-}" == "--dry-run" ]]; then
    DRY_RUN=true
fi

# Get all active issue numbers from Paperclip
ACTIVE_ISSUES="$(curl -s "${API_BASE}/companies/${COMPANY_ID}/issues?status=todo" | \
    python3 -c "import sys,json; issues=json.loads(sys.stdin.read()); print(' '.join(str(i['issueNumber']) for i in issues))" 2>/dev/null || echo "")"
ACTIVE_ISSUES+=" $(curl -s "${API_BASE}/companies/${COMPANY_ID}/issues?status=in_progress" | \
    python3 -c "import sys,json; issues=json.loads(sys.stdin.read()); print(' '.join(str(i['issueNumber']) for i in issues))" 2>/dev/null || echo "")"

echo "Active issue numbers: ${ACTIVE_ISSUES}"
echo ""

CLEANED=0
KEPT=0

# Check each worktree directory
if [[ ! -d "${WORKTREE_BASE}" ]]; then
    echo "No worktrees directory found at ${WORKTREE_BASE}"
    exit 0
fi

for worktree_dir in "${WORKTREE_BASE}"/geo-*; do
    [[ -d "${worktree_dir}" ]] || continue
    
    # Extract issue number from directory name
    dir_name="$(basename "${worktree_dir}")"
    issue_num="${dir_name#geo-}"
    
    # Check if this issue is still active
    if echo " ${ACTIVE_ISSUES} " | grep -q " ${issue_num} "; then
        echo "KEEP: ${dir_name} — issue GEO-${issue_num} is active"
        ((KEPT++)) || true
        continue
    fi
    
    # Check age of the worktree
    if [[ "$(uname)" == "Darwin" ]]; then
        dir_age=$(( $(date +%s) - $(stat -f %m "${worktree_dir}") ))
    else
        dir_age=$(( $(date +%s) - $(stat -c %Y "${worktree_dir}") ))
    fi
    
    if [[ ${dir_age} -lt ${CUTOFF_AGE} ]]; then
        hours=$(( dir_age / 3600 ))
        echo "KEEP: ${dir_name} — only ${hours}h old (under 24h threshold)"
        ((KEPT++)) || true
        continue
    fi
    
    # This worktree is orphaned
    hours=$(( dir_age / 3600 ))
    if ${DRY_RUN}; then
        echo "WOULD CLEAN: ${dir_name} — ${hours}h old, no active issue"
    else
        echo "CLEANING: ${dir_name} — ${hours}h old, no active issue"
        cd "${REPO_ROOT}"
        .paperclip/scripts/cleanup-worktree.sh "${issue_num}" || true
    fi
    ((CLEANED++)) || true
done

echo ""
echo "Summary: ${CLEANED} cleaned, ${KEPT} kept"
