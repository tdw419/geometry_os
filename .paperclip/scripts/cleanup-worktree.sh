#!/usr/bin/env bash
# cleanup-worktree.sh N -- Remove worktree and branch for issue GEO-N
# Usage: ./cleanup-worktree.sh 112
set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "ERROR: Usage: $0 <issue-number>" >&2
    exit 1
fi

ISSUE_NUM="$1"
REPO_ROOT="$(git rev-parse --show-toplevel)"
WORKTREE_BASE="${REPO_ROOT}/../worktrees"
WORKTREE_DIR="${WORKTREE_BASE}/geo-${ISSUE_NUM}"
BRANCH="feat/geo-${ISSUE_NUM}"

# Resolve path for comparison
WORKTREE_RESOLVED="$(readlink -f "${WORKTREE_DIR}" 2>/dev/null || echo "")"

# Ensure we're not inside the worktree being removed
if [[ -n "${WORKTREE_RESOLVED}" ]] && [[ "$(pwd)" == "${WORKTREE_RESOLVED}"* ]]; then
    echo "ERROR: Cannot cleanup from inside the worktree. cd to ${REPO_ROOT} first." >&2
    exit 1
fi

# Remove worktree (idempotent)
if [[ -n "${WORKTREE_RESOLVED}" ]] && git worktree list --porcelain | grep -q "worktree ${WORKTREE_RESOLVED}"; then
    git worktree remove "${WORKTREE_DIR}" --force
    echo "OK: Removed worktree at ${WORKTREE_DIR}"
else
    echo "OK: No worktree at ${WORKTREE_DIR} (already removed)"
fi

# Clean up any leftover worktree metadata
git worktree prune

# Delete branch (idempotent)
if git rev-parse --verify "${BRANCH}" >/dev/null 2>&1; then
    git branch -D "${BRANCH}"
    echo "OK: Deleted branch ${BRANCH}"
else
    echo "OK: Branch ${BRANCH} does not exist (already deleted)"
fi

echo "Cleanup complete for GEO-${ISSUE_NUM}"
