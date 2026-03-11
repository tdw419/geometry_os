#!/bin/bash
#
# Geometry OS Backup System
# Creates reliable backups of code, data, and configurations
#
# Usage: ./scripts/backup_system.sh [--full | --incremental | --verify]
#

set -euo pipefail

# Configuration
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_ROOT="${BACKUP_ROOT:-/backup/geometry_os}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_FILE="${PROJECT_ROOT}/logs/backup_${TIMESTAMP}.log"
RETENTION_DAYS=${RETENTION_DAYS:-30}

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Logging function
log() {
    echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "${LOG_FILE}"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" | tee -a "${LOG_FILE}"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1" | tee -a "${LOG_FILE}"
}

warn() {
    echo -e "${YELLOW}[WARNING]${NC} $1" | tee -a "${LOG_FILE}"
}

# Ensure log directory exists
mkdir -p "${PROJECT_ROOT}/logs"

# Backup categories
backup_code() {
    log "Starting code backup..."
    local backup_dir="${BACKUP_ROOT}/code"
    mkdir -p "${backup_dir}"
    
    # Create git bundle (full repository backup)
    local bundle_file="${backup_dir}/geometry_os_${TIMESTAMP}.bundle"
    if git -C "${PROJECT_ROOT}" bundle create "${bundle_file}" --all 2>/dev/null; then
        success "Git bundle created: ${bundle_file}"
        echo "${TIMESTAMP}:code:${bundle_file}" >> "${BACKUP_ROOT}/backup_manifest.txt"
    else
        error "Failed to create git bundle"
        return 1
    fi
    
    # Also push to remote if configured
    if git -C "${PROJECT_ROOT}" remote | grep -q origin; then
        log "Pushing to remote..."
        if git -C "${PROJECT_ROOT}" push origin --all 2>/dev/null && \
           git -C "${PROJECT_ROOT}" push origin --tags 2>/dev/null; then
            success "Pushed to remote origin"
        else
            warn "Could not push to remote (may be offline or no changes)"
        fi
    fi
}

backup_data() {
    log "Starting data backup..."
    local backup_dir="${BACKUP_ROOT}/data"
    mkdir -p "${backup_dir}"
    
    # Critical data directories
    local data_dirs=("memory" "data" "openspec" "specs" "docs" "config.yaml" ".ai-pm-config.yaml")
    
    for item in "${data_dirs[@]}"; do
        local src="${PROJECT_ROOT}/${item}"
        if [[ -e "${src}" ]]; then
            local dest="${backup_dir}/${item##*/}_${TIMESTAMP}.tar.gz"
            if tar -czf "${dest}" -C "${PROJECT_ROOT}" "${item}" 2>/dev/null; then
                success "Backed up: ${item} -> ${dest}"
                echo "${TIMESTAMP}:data:${dest}" >> "${BACKUP_ROOT}/backup_manifest.txt"
            else
                error "Failed to backup: ${item}"
            fi
        fi
    done
}

backup_large_files() {
    log "Starting large files backup (RTS brain files, models)..."
    local backup_dir="${BACKUP_ROOT}/large_files"
    mkdir -p "${backup_dir}"
    
    # Find large RTS files (>10MB)
    while IFS= read -r -d '' file; do
        local filename=$(basename "${file}")
        local dest="${backup_dir}/${filename%.rts.png*}_${TIMESTAMP}$(echo "${filename}" | grep -o '\.rts\.png.*')"
        
        if [[ ! -f "${dest}" ]]; then
            if cp "${file}" "${dest}"; then
                success "Copied large file: ${filename}"
                echo "${TIMESTAMP}:large:${dest}" >> "${BACKUP_ROOT}/backup_manifest.txt"
            else
                error "Failed to copy: ${filename}"
            fi
        fi
    done < <(find "${PROJECT_ROOT}" -maxdepth 1 -name "*.rts.png*" -size +10M -print0 2>/dev/null)
}

backup_configs() {
    log "Starting configuration backup..."
    local backup_dir="${BACKUP_ROOT}/configs"
    mkdir -p "${backup_dir}"
    
    local configs=(
        "pyproject.toml"
        "requirements.txt"
        "requirements-dev.txt"
        "Makefile"
        ".env.example"
        "pytest.ini"
        "ruff.toml"
        "rustfmt.toml"
        ".pre-commit-config.yaml"
        "package.json"
    )
    
    local dest="${backup_dir}/configs_${TIMESTAMP}.tar.gz"
    local temp_dir=$(mktemp -d)
    
    for cfg in "${configs[@]}"; do
        if [[ -f "${PROJECT_ROOT}/${cfg}" ]]; then
            cp "${PROJECT_ROOT}/${cfg}" "${temp_dir}/"
        fi
    done
    
    if tar -czf "${dest}" -C "${temp_dir}" . 2>/dev/null; then
        success "Configuration backup created: ${dest}"
        echo "${TIMESTAMP}:config:${dest}" >> "${BACKUP_ROOT}/backup_manifest.txt"
    fi
    
    rm -rf "${temp_dir}"
}

backup_worktrees() {
    log "Starting worktrees backup..."
    local backup_dir="${BACKUP_ROOT}/worktrees"
    mkdir -p "${backup_dir}"
    
    local worktrees_dir="${PROJECT_ROOT}/.worktrees"
    if [[ -d "${worktrees_dir}" ]]; then
        for wt in "${worktrees_dir}"/*/; do
            if [[ -d "${wt}.git" || -f "${wt}.git" ]]; then
                local wt_name=$(basename "${wt}")
                local dest="${backup_dir}/${wt_name}_${TIMESTAMP}.bundle"
                
                # Get the actual git directory for worktree
                local git_dir=$(git -C "${wt}" rev-parse --git-common-dir 2>/dev/null || echo "")
                if [[ -n "${git_dir}" && -d "${git_dir}" ]]; then
                    if git --git-dir="${git_dir}" bundle create "${dest}" --all 2>/dev/null; then
                        success "Worktree backed up: ${wt_name}"
                        echo "${TIMESTAMP}:worktree:${dest}" >> "${BACKUP_ROOT}/backup_manifest.txt"
                    fi
                fi
            fi
        done
    fi
}

verify_backup() {
    log "Starting backup verification..."
    local manifest="${BACKUP_ROOT}/backup_manifest.txt"
    local errors=0
    
    if [[ ! -f "${manifest}" ]]; then
        error "No backup manifest found at ${manifest}"
        return 1
    fi
    
    log "Verifying backup files..."
    
    while IFS=: read -r timestamp type filepath; do
        if [[ -z "${filepath}" ]]; then
            continue
        fi
        
        if [[ ! -f "${filepath}" ]]; then
            error "Missing backup file: ${filepath}"
            ((errors++))
            continue
        fi
        
        case "${type}" in
            code|worktree)
                # Verify git bundle
                if git bundle verify "${filepath}" &>/dev/null; then
                    success "Valid bundle: ${filepath}"
                else
                    error "Invalid bundle: ${filepath}"
                    ((errors++))
                fi
                ;;
            data|config)
                # Verify tar.gz archive
                if gzip -t "${filepath}" 2>/dev/null && tar -tzf "${filepath}" &>/dev/null; then
                    success "Valid archive: ${filepath}"
                else
                    error "Invalid archive: ${filepath}"
                    ((errors++))
                fi
                ;;
            large)
                # Verify file integrity with checksum
                if [[ -f "${filepath}.sha256" ]]; then
                    if sha256sum -c "${filepath}.sha256" &>/dev/null; then
                        success "Valid checksum: ${filepath}"
                    else
                        error "Checksum mismatch: ${filepath}"
                        ((errors++))
                    fi
                else
                    warn "No checksum for: ${filepath} (creating now)"
                    sha256sum "${filepath}" > "${filepath}.sha256"
                fi
                ;;
        esac
    done < "${manifest}"
    
    if [[ ${errors} -eq 0 ]]; then
        success "All backups verified successfully!"
        return 0
    else
        error "Verification failed with ${errors} errors"
        return 1
    fi
}

test_restore() {
    log "Testing backup restore capability..."
    local test_dir=$(mktemp -d)
    local restore_errors=0
    
    # Find most recent code backup
    local latest_bundle=$(grep ":code:" "${BACKUP_ROOT}/backup_manifest.txt" 2>/dev/null | tail -1 | cut -d: -f3)
    
    if [[ -n "${latest_bundle}" && -f "${latest_bundle}" ]]; then
        log "Testing git bundle restore..."
        if git clone "${latest_bundle}" "${test_dir}/restore_test" 2>/dev/null; then
            # Verify key files exist
            local key_files=("README.md" "AGENTS.md" "pyproject.toml")
            for kf in "${key_files[@]}"; do
                if [[ -f "${test_dir}/restore_test/${kf}" ]]; then
                    success "Restored file exists: ${kf}"
                else
                    error "Restored file missing: ${kf}"
                    ((restore_errors++))
                fi
            done
            success "Git bundle restore test passed"
        else
            error "Failed to restore from git bundle"
            ((restore_errors++))
        fi
    else
        warn "No code backup found to test restore"
    fi
    
    # Test data archive restore
    local latest_data=$(grep ":data:" "${BACKUP_ROOT}/backup_manifest.txt" 2>/dev/null | grep "memory" | tail -1 | cut -d: -f3)
    
    if [[ -n "${latest_data}" && -f "${latest_data}" ]]; then
        log "Testing data archive restore..."
        mkdir -p "${test_dir}/data_test"
        if tar -xzf "${latest_data}" -C "${test_dir}/data_test" 2>/dev/null; then
            success "Data archive restore test passed"
        else
            error "Failed to restore data archive"
            ((restore_errors++))
        fi
    fi
    
    # Cleanup
    rm -rf "${test_dir}"
    
    if [[ ${restore_errors} -eq 0 ]]; then
        success "Restore test completed successfully!"
        return 0
    else
        error "Restore test failed with ${restore_errors} errors"
        return 1
    fi
}

cleanup_old_backups() {
    log "Cleaning up backups older than ${RETENTION_DAYS} days..."
    
    local cutoff_date=$(date -d "${RETENTION_DAYS} days ago" +%Y%m%d 2>/dev/null || date -v-${RETENTION_DAYS}d +%Y%m%d)
    local cleaned=0
    
    while IFS=: read -r timestamp type filepath; do
        if [[ -z "${filepath}" ]]; then
            continue
        fi
        
        local backup_date=$(echo "${timestamp}" | cut -c1-8)
        
        if [[ "${backup_date}" < "${cutoff_date}" ]]; then
            if rm -f "${filepath}" "${filepath}.sha256" 2>/dev/null; then
                log "Removed old backup: ${filepath}"
                ((cleaned++))
            fi
        fi
    done < "${BACKUP_ROOT}/backup_manifest.txt"
    
    # Clean manifest
    local temp_manifest=$(mktemp)
    while IFS=: read -r timestamp type filepath; do
        local backup_date=$(echo "${timestamp}" | cut -c1-8)
        if [[ "${backup_date}" >= "${cutoff_date}" && -f "${filepath}" ]]; then
            echo "${timestamp}:${type}:${filepath}"
        fi
    done < "${BACKUP_ROOT}/backup_manifest.txt" > "${temp_manifest}"
    mv "${temp_manifest}" "${BACKUP_ROOT}/backup_manifest.txt"
    
    success "Cleaned up ${cleaned} old backups"
}

generate_report() {
    local report_file="${PROJECT_ROOT}/logs/backup_report_${TIMESTAMP}.txt"
    
    {
        echo "=========================================="
        echo "Geometry OS Backup Report"
        echo "Generated: $(date)"
        echo "=========================================="
        echo ""
        echo "Backup Location: ${BACKUP_ROOT}"
        echo ""
        echo "BACKUP INVENTORY:"
        echo "-----------------"
        
        if [[ -f "${BACKUP_ROOT}/backup_manifest.txt" ]]; then
            echo "Code Backups: $(grep -c ':code:' "${BACKUP_ROOT}/backup_manifest.txt" 2>/dev/null || echo 0)"
            echo "Data Backups: $(grep -c ':data:' "${BACKUP_ROOT}/backup_manifest.txt" 2>/dev/null || echo 0)"
            echo "Config Backups: $(grep -c ':config:' "${BACKUP_ROOT}/backup_manifest.txt" 2>/dev/null || echo 0)"
            echo "Large File Backups: $(grep -c ':large:' "${BACKUP_ROOT}/backup_manifest.txt" 2>/dev/null || echo 0)"
            echo "Worktree Backups: $(grep -c ':worktree:' "${BACKUP_ROOT}/backup_manifest.txt" 2>/dev/null || echo 0)"
        fi
        
        echo ""
        echo "DISK USAGE:"
        echo "-----------"
        du -sh "${BACKUP_ROOT}" 2>/dev/null || echo "Unable to calculate"
        
        echo ""
        echo "MOST RECENT BACKUPS:"
        echo "--------------------"
        tail -5 "${BACKUP_ROOT}/backup_manifest.txt" 2>/dev/null || echo "No backups yet"
        
        echo ""
        echo "=========================================="
    } | tee "${report_file}"
    
    success "Report saved to: ${report_file}"
}

# Main execution
main() {
    local mode="${1:-full}"
    
    log "=========================================="
    log "Geometry OS Backup System"
    log "Mode: ${mode}"
    log "=========================================="
    
    # Ensure backup directory exists
    mkdir -p "${BACKUP_ROOT}"
    
    case "${mode}" in
        --full)
            backup_code
            backup_data
            backup_large_files
            backup_configs
            backup_worktrees
            generate_report
            ;;
        --incremental|-i)
            backup_code
            backup_configs
            generate_report
            ;;
        --verify|-v)
            verify_backup
            test_restore
            ;;
        --data)
            backup_data
            backup_large_files
            ;;
        --cleanup)
            cleanup_old_backups
            ;;
        --report)
            generate_report
            ;;
        *)
            echo "Usage: $0 [--full | --incremental | --verify | --data | --cleanup | --report]"
            echo ""
            echo "Options:"
            echo "  --full        Full backup (code, data, configs, large files)"
            echo "  --incremental Quick backup (code and configs only)"
            echo "  --verify      Verify all backups and test restore"
            echo "  --data        Backup data and large files only"
            echo "  --cleanup     Remove backups older than RETENTION_DAYS"
            echo "  --report      Generate backup report"
            exit 1
            ;;
    esac
    
    log "Backup operation completed!"
}

# Run main
main "$@"
