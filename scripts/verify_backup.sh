#!/bin/bash
#
# Quick backup verification script
# Tests the backup system without creating actual backups
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_SCRIPT="${SCRIPT_DIR}/backup_system.sh"

echo "=========================================="
echo "Geometry OS Backup System Verification"
echo "=========================================="
echo ""

# Check 1: Script exists and is executable
echo "[1/6] Checking backup script..."
if [[ -x "${BACKUP_SCRIPT}" ]]; then
    echo "    ✓ Backup script is executable"
else
    echo "    ✗ Backup script not executable"
    exit 1
fi

# Check 2: Required tools
echo "[2/6] Checking required tools..."
required_tools=("git" "tar" "gzip" "sha256sum" "date")
missing_tools=()
for tool in "${required_tools[@]}"; do
    if command -v "${tool}" &>/dev/null; then
        echo "    ✓ ${tool} available"
    else
        echo "    ✗ ${tool} missing"
        missing_tools+=("${tool}")
    fi
done

if [[ ${#missing_tools[@]} -gt 0 ]]; then
    echo "    Missing tools: ${missing_tools[*]}"
    exit 1
fi

# Check 3: Git repository integrity
echo "[3/6] Checking git repository..."
if git -C "${SCRIPT_DIR}/.." rev-parse --git-dir &>/dev/null; then
    echo "    ✓ Valid git repository"
    
    # Check for uncommitted changes
    if git -C "${SCRIPT_DIR}/.." diff --quiet 2>/dev/null; then
        echo "    ✓ No uncommitted changes"
    else
        echo "    ⚠ There are uncommitted changes"
    fi
    
    # Check remote
    if git -C "${SCRIPT_DIR}/.." remote | grep -q origin; then
        remote=$(git -C "${SCRIPT_DIR}/.." remote get-url origin)
        echo "    ✓ Remote configured: ${remote}"
    else
        echo "    ⚠ No remote configured"
    fi
else
    echo "    ✗ Not a git repository"
    exit 1
fi

# Check 4: Critical directories exist
echo "[4/6] Checking critical directories..."
critical_dirs=("memory" "data" "docs" "openspec" "specs")
for dir in "${critical_dirs[@]}"; do
    path="${SCRIPT_DIR}/../${dir}"
    if [[ -d "${path}" ]]; then
        files=$(find "${path}" -type f | wc -l)
        echo "    ✓ ${dir}/ (${files} files)"
    else
        echo "    ⚠ ${dir}/ not found"
    fi
done

# Check 5: Backup directory (create if needed)
echo "[5/6] Checking backup destination..."
BACKUP_ROOT="${BACKUP_ROOT:-/backup/geometry_os}"
if [[ -d "${BACKUP_ROOT}" ]]; then
    size=$(du -sh "${BACKUP_ROOT}" 2>/dev/null | cut -f1)
    echo "    ✓ Backup directory exists: ${BACKUP_ROOT} (${size})"
else
    echo "    ℹ Backup directory will be created: ${BACKUP_ROOT}"
    echo "    ℹ Run: sudo mkdir -p ${BACKUP_ROOT} && sudo chown ${USER}:${USER} ${BACKUP_ROOT}"
fi

# Check 6: Available disk space
echo "[6/6] Checking disk space..."
project_size=$(du -sb "${SCRIPT_DIR}/.." 2>/dev/null | cut -f1)
available_space=$(df -B1 --output=avail "${SCRIPT_DIR}/.." | tail -1)

# Calculate space needed (roughly 2x project size for full backup)
space_needed=$((project_size * 2))
space_needed_gb=$((space_needed / 1024 / 1024 / 1024))
available_gb=$((available_space / 1024 / 1024 / 1024))
project_gb=$((project_size / 1024 / 1024 / 1024))

echo "    Project size: ${project_gb}GB"
echo "    Available space: ${available_gb}GB"
echo "    Recommended space: ${space_needed_gb}GB"

if [[ ${available_space} -gt ${space_needed} ]]; then
    echo "    ✓ Sufficient disk space"
else
    echo "    ⚠ May need more disk space for full backup"
fi

echo ""
echo "=========================================="
echo "Verification Complete"
echo "=========================================="
echo ""
echo "To run a backup:"
echo "  ${BACKUP_SCRIPT} --full         # Full backup"
echo "  ${BACKUP_SCRIPT} --incremental  # Quick backup"
echo "  ${BACKUP_SCRIPT} --verify       # Verify backups"
echo ""
echo "To enable automated daily backups:"
echo "  sudo cp systemd/geometry-os-backup.{service,timer} /etc/systemd/system/"
echo "  sudo systemctl enable --now geometry-os-backup.timer"
