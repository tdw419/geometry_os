#!/usr/bin/env bash
# create-worktree.sh N -- Create an isolated git worktree for issue GEO-N
# Usage: ./create-worktree.sh 112
# Creates: ../worktrees/geo-112 on branch feat/geo-112
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

# Validate we're in a git repo
if [[ ! -d "${REPO_ROOT}/.git" ]]; then
    echo "ERROR: Not inside a git repository" >&2
    exit 1
fi

# Idempotent: if worktree already exists, just report
# Use readlink -f to resolve the path for comparison
WORKTREE_RESOLVED="$(readlink -f "${WORKTREE_DIR}" 2>/dev/null || echo "")"
if [[ -n "${WORKTREE_RESOLVED}" ]] && git worktree list --porcelain | grep -q "worktree ${WORKTREE_RESOLVED}"; then
    echo "OK: Worktree already exists at ${WORKTREE_DIR} on branch ${BRANCH}"
    exit 0
fi

# Create worktree base directory
mkdir -p "${WORKTREE_BASE}"

# Create the worktree with a new branch from current HEAD
if git worktree add -b "${BRANCH}" "${WORKTREE_DIR}" HEAD 2>/dev/null; then
    echo "OK: Created worktree at ${WORKTREE_DIR}"
    echo "    Branch: ${BRANCH}"
    echo "    Base:   $(git rev-parse --short HEAD)"
else
    # Branch might already exist (e.g., from a previous attempt)
    echo "WARN: Branch ${BRANCH} already exists, checking out existing branch"
    git worktree add "${WORKTREE_DIR}" "${BRANCH}"
    echo "OK: Reusing worktree at ${WORKTREE_DIR} on existing branch ${BRANCH}"
fi
