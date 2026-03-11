#!/usr/bin/env bash
#
# Geometry OS Backup System
# =========================
# A reliable backup solution for critical data and code repositories
#
# Usage:
#   ./backup.sh [OPTIONS] [COMMAND]
#
# Commands:
#   full        Perform a full backup (default)
#   incremental Perform an incremental backup
#   verify      Verify the last backup
#   test        Test restore to temporary location
#   status      Show backup status and statistics
#   clean       Clean old backups based on retention policy
#   list        List available backups
#
# Options:
#   -c, --config FILE   Use alternate config file
#   -v, --verbose       Enable verbose output
#   -q, --quiet         Suppress non-error output
#   -d, --dry-run       Show what would be done without doing it
#   -h, --help          Show this help message
#
# Examples:
#   ./backup.sh full                    # Full backup with default config
#   ./backup.sh -v incremental          # Verbose incremental backup
#   ./backup.sh verify                  # Verify last backup
#   ./backup.sh test                    # Test restore

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="${SCRIPT_DIR}/backup_config.yaml"
VERBOSE=false
QUIET=false
DRY_RUN=false
COMMAND="full"

# Logging functions
log() {
    local level="$1"
    shift
    local message="$*"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    if [[ "$QUIET" == "true" && "$level" != "ERROR" ]]; then
        return
    fi
    
    case "$level" in
        ERROR)   echo -e "${RED}[ERROR]${NC} $message" ;;
        WARN)    echo -e "${YELLOW}[WARN]${NC} $message" ;;
        SUCCESS) echo -e "${GREEN}[OK]${NC} $message" ;;
        INFO)    echo -e "${BLUE}[INFO]${NC} $message" ;;
        DEBUG)   [[ "$VERBOSE" == "true" ]] && echo -e "[DEBUG] $message" ;;
    esac
    
    # Also log to file
    local log_dir="$HOME/.local/share/geometry-backup/logs"
    mkdir -p "$log_dir"
    echo "[$timestamp] [$level] $message" >> "$log_dir/backup.log"
}

# Parse command line arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -c|--config)
                CONFIG_FILE="$2"
                shift 2
                ;;
            -v|--verbose)
                VERBOSE=true
                shift
                ;;
            -q|--quiet)
                QUIET=true
                shift
                ;;
            -d|--dry-run)
                DRY_RUN=true
                shift
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            full|incremental|verify|test|status|clean|list)
                COMMAND="$1"
                shift
                ;;
            *)
                log ERROR "Unknown option: $1"
                show_help
                exit 1
                ;;
        esac
    done
}

show_help() {
    cat << EOF
Geometry OS Backup System
=========================

Usage: $(basename "$0") [OPTIONS] [COMMAND]

Commands:
  full        Perform a full backup (default)
  incremental Perform an incremental backup
  verify      Verify the last backup
  test        Test restore to temporary location
  status      Show backup status and statistics
  clean       Clean old backups based on retention policy
  list        List available backups

Options:
  -c, --config FILE   Use alternate config file
  -v, --verbose       Enable verbose output
  -q, --quiet         Suppress non-error output
  -d, --dry-run       Show what would be done without doing it
  -h, --help          Show this help message

Examples:
  $(basename "$0") full                    # Full backup
  $(basename "$0") -v incremental          # Verbose incremental
  $(basename "$0") verify                  # Verify last backup
  $(basename "$0") status                  # Show status
EOF
}

# Check dependencies
check_dependencies() {
    local missing=()
    
    # Required tools
    for tool in rsync tar gzip; do
        if ! command -v "$tool" &> /dev/null; then
            missing+=("$tool")
        fi
    done
    
    # Check for optional tools
    if command -v zstd &> /dev/null; then
        COMPRESS_CMD="zstd"
        COMPRESS_EXT=".zst"
    elif command -v pigz &> /dev/null; then
        COMPRESS_CMD="pigz"
        COMPRESS_EXT=".gz"
    else
        COMPRESS_CMD="gzip"
        COMPRESS_EXT=".gz"
    fi
    
    # Check for yq (YAML parser) - optional but recommended
    if command -v yq &> /dev/null; then
        HAS_YQ=true
    else
        HAS_YQ=false
        log WARN "yq not found - using simplified config parsing"
    fi
    
    if [[ ${#missing[@]} -gt 0 ]]; then
        log ERROR "Missing required tools: ${missing[*]}"
        log ERROR "Install with: sudo apt install ${missing[*]}"
        exit 1
    fi
    
    log DEBUG "Using compression: $COMPRESS_CMD"
}

# Simple YAML parser (fallback if yq not available)
parse_yaml_config() {
    local config_file="$1"
    
    if [[ "$HAS_YQ" == "true" ]]; then
        # Use yq for proper YAML parsing
        DEST_LOCAL=$(yq -r '.destination.local // ""' "$config_file" | sed "s|~|$HOME|g")
        DEST_REMOTE=$(yq -r '.destination.remote // ""' "$config_file")
        RETENTION_DAILY=$(yq -r '.retention.daily // 7' "$config_file")
        RETENTION_WEEKLY=$(yq -r '.retention.weekly // 4' "$config_file")
        RETENTION_MONTHLY=$(yq -r '.retention.monthly // 6' "$config_file")
    else
        # Simple grep-based parsing
        DEST_LOCAL=$(grep -E '^  local:' "$config_file" 2>/dev/null | head -1 | awk '{print $2}' | sed "s|~|$HOME|g")
        DEST_REMOTE=$(grep -E '^  remote:' "$config_file" 2>/dev/null | head -1 | awk '{print $2}')
        RETENTION_DAILY=$(grep -E '^  daily:' "$config_file" 2>/dev/null | head -1 | awk '{print $2}')
        RETENTION_WEEKLY=$(grep -E '^  weekly:' "$config_file" 2>/dev/null | head -1 | awk '{print $2}')
        RETENTION_MONTHLY=$(grep -E '^  monthly:' "$config_file" 2>/dev/null | head -1 | awk '{print $2}')
        
        # Set defaults
        DEST_LOCAL="${DEST_LOCAL:-$HOME/.local/share/geometry-backup/archives}"
        RETENTION_DAILY="${RETENTION_DAILY:-7}"
        RETENTION_WEEKLY="${RETENTION_WEEKLY:-4}"
        RETENTION_MONTHLY="${RETENTION_MONTHLY:-6}"
    fi
    
    log DEBUG "Config parsed: DEST_LOCAL=$DEST_LOCAL"
}

# Run pre-backup hooks
run_pre_hooks() {
    log INFO "Running pre-backup hooks..."
    
    # Always fetch git info for accurate backup
    if [[ -d ".git" ]]; then
        log DEBUG "Fetching git remote info..."
        git fetch --all 2>/dev/null || true
    fi
}

# Run post-backup hooks
run_post_hooks() {
    log INFO "Running post-backup hooks..."
    # Post hooks would go here
}

# Create exclude file from config
create_exclude_file() {
    local exclude_file=$(mktemp)
    
    # Add common excludes
    cat >> "$exclude_file" << EOF
*.pyc
__pycache__
.venv
node_modules
.git/objects/pack/*.idx
.git/objects/pack/*.pack
htmlcov
.coverage
coverage.json
*.log
*.tmp
*.swp
.DS_Store
EOF
    
    echo "$exclude_file"
}

# Perform full backup
do_full_backup() {
    local timestamp=$(date '+%Y%m%d_%H%M%S')
    local backup_name="geometry_os_full_${timestamp}"
    local archive_path="${DEST_LOCAL}/${backup_name}.tar${COMPRESS_EXT}"
    
    log INFO "Starting full backup: $backup_name"
    
    # Create destination directory
    mkdir -p "$DEST_LOCAL"
    
    # Create exclude file
    local exclude_file=$(create_exclude_file)
    
    # Run pre-hooks
    run_pre_hooks
    
    # Calculate size estimate
    log INFO "Calculating backup size..."
    local size_estimate=$(du -sb --exclude-from="$exclude_file" . 2>/dev/null | cut -f1)
    local size_human=$(numfmt --to=iec-i --suffix=B "$size_estimate" 2>/dev/null || echo "${size_estimate} bytes")
    log INFO "Estimated backup size: $size_human"
    
    if [[ "$DRY_RUN" == "true" ]]; then
        log INFO "[DRY RUN] Would create archive: $archive_path"
        rm -f "$exclude_file"
        return 0
    fi
    
    # Create the archive
    log INFO "Creating archive..."
    local start_time=$(date +%s)
    
    if tar --exclude-from="$exclude_file" -cf - . | $COMPRESS_CMD -6 > "$archive_path"; then
        local end_time=$(date +%s)
        local duration=$((end_time - start_time))
        local archive_size=$(stat -c%s "$archive_path" 2>/dev/null || echo "0")
        local archive_size_human=$(numfmt --to=iec-i --suffix=B "$archive_size" 2>/dev/null || echo "${archive_size} bytes")
        
        log SUCCESS "Archive created: $archive_path"
        log INFO "Archive size: $archive_size_human"
        log INFO "Compression ratio: $(echo "scale=1; $archive_size * 100 / $size_estimate" | bc)%"
        log INFO "Duration: ${duration}s"
        
        # Create manifest
        create_manifest "$archive_path" "$backup_name" "full" "$archive_size" "$duration"
        
        # Run post-hooks
        run_post_hooks
        
        # Verify if enabled
        if should_verify; then
            verify_backup "$archive_path"
        fi
    else
        log ERROR "Failed to create archive"
        rm -f "$archive_path"
        rm -f "$exclude_file"
        return 1
    fi
    
    rm -f "$exclude_file"
    return 0
}

# Perform incremental backup
do_incremental_backup() {
    local timestamp=$(date '+%Y%m%d_%H%M%S')
    local backup_name="geometry_os_incr_${timestamp}"
    local archive_path="${DEST_LOCAL}/${backup_name}.tar${COMPRESS_EXT}"
    
    # Find last backup for reference
    local last_backup=$(find "$DEST_LOCAL" -name "geometry_os_*.tar*" -type f -printf '%T@ %p\n' 2>/dev/null | sort -n | tail -1 | cut -d' ' -f2-)
    
    if [[ -z "$last_backup" ]]; then
        log WARN "No previous backup found, performing full backup instead"
        do_full_backup
        return $?
    fi
    
    log INFO "Starting incremental backup: $backup_name"
    log INFO "Reference backup: $last_backup"
    
    mkdir -p "$DEST_LOCAL"
    local exclude_file=$(create_exclude_file)
    run_pre_hooks
    
    # Find files changed since last backup
    local last_backup_time=$(stat -c%Y "$last_backup" 2>/dev/null || echo "0")
    
    if [[ "$DRY_RUN" == "true" ]]; then
        log INFO "[DRY RUN] Would create incremental archive: $archive_path"
        local changed_files=$(find . -type f -newer "@$last_backup_time" ! -path './.git/*' ! -path './node_modules/*' ! -path './.venv/*' 2>/dev/null | wc -l)
        log INFO "[DRY RUN] Files to backup: $changed_files"
        rm -f "$exclude_file"
        return 0
    fi
    
    # Create incremental archive
    log INFO "Finding changed files..."
    local start_time=$(date +%s)
    
    # Use find to get changed files and tar them
    if find . -type f -newer "@$last_backup_time" \
        ! -path './.git/*' \
        ! -path './node_modules/*' \
        ! -path './.venv/*' \
        ! -path './__pycache__/*' \
        ! -name '*.pyc' \
        ! -name '*.log' \
        -print0 | tar --null -T - -cf - | $COMPRESS_CMD -6 > "$archive_path" 2>/dev/null; then
        
        local end_time=$(date +%s)
        local duration=$((end_time - start_time))
        local archive_size=$(stat -c%s "$archive_path" 2>/dev/null || echo "0")
        
        if [[ "$archive_size" -gt 0 ]]; then
            log SUCCESS "Incremental archive created: $archive_path"
            log INFO "Archive size: $(numfmt --to=iec-i --suffix=B "$archive_size" 2>/dev/null || echo "${archive_size} bytes")"
            log INFO "Duration: ${duration}s"
            
            create_manifest "$archive_path" "$backup_name" "incremental" "$archive_size" "$duration"
            run_post_hooks
        else
            log INFO "No changes since last backup"
            rm -f "$archive_path"
        fi
    else
        log ERROR "Failed to create incremental archive"
        rm -f "$archive_path"
        rm -f "$exclude_file"
        return 1
    fi
    
    rm -f "$exclude_file"
    return 0
}

# Create backup manifest
create_manifest() {
    local archive_path="$1"
    local backup_name="$2"
    local backup_type="$3"
    local size="$4"
    local duration="$5"
    
    local manifest_path="${archive_path}.manifest.json"
    
    cat > "$manifest_path" << EOF
{
    "name": "$backup_name",
    "type": "$backup_type",
    "created": "$(date -Iseconds)",
    "size": $size,
    "duration_seconds": $duration,
    "archive": "$(basename "$archive_path")",
    "source": "$(pwd)",
    "git_commit": "$(git rev-parse HEAD 2>/dev/null || echo 'unknown')",
    "git_branch": "$(git branch --show-current 2>/dev/null || echo 'unknown')",
    "git_remote": "$(git remote get-url origin 2>/dev/null || echo 'unknown')",
    "hostname": "$(hostname)",
    "version": "1.0"
}
EOF
    
    log DEBUG "Manifest created: $manifest_path"
}

# Verify backup
verify_backup() {
    local archive_path="$1"
    
    if [[ ! -f "$archive_path" ]]; then
        log ERROR "Archive not found: $archive_path"
        return 1
    fi
    
    log INFO "Verifying backup integrity..."
    
    # Test archive integrity
    if [[ "$archive_path" == *.zst ]]; then
        if zstd -t "$archive_path" 2>/dev/null; then
            log SUCCESS "Archive integrity verified"
        else
            log ERROR "Archive is corrupted"
            return 1
        fi
    elif [[ "$archive_path" == *.gz ]]; then
        if gzip -t "$archive_path" 2>/dev/null; then
            log SUCCESS "Archive integrity verified"
        else
            log ERROR "Archive is corrupted"
            return 1
        fi
    fi
    
    # Verify we can list contents
    if tar -tf "$archive_path" &>/dev/null | head -5 > /dev/null; then
        local file_count=$(tar -tf "$archive_path" 2>/dev/null | wc -l)
        log SUCCESS "Archive contains $file_count files"
    else
        log ERROR "Cannot read archive contents"
        return 1
    fi
    
    return 0
}

# Test restore
test_restore() {
    local last_backup=$(find "$DEST_LOCAL" -name "geometry_os_*.tar*" -type f -printf '%T@ %p\n' 2>/dev/null | sort -n | tail -1 | cut -d' ' -f2-)
    
    if [[ -z "$last_backup" ]]; then
        log ERROR "No backup found to test"
        return 1
    fi
    
    log INFO "Testing restore from: $last_backup"
    
    local test_dir=$(mktemp -d)
    log INFO "Test restore directory: $test_dir"
    
    # Extract a few files to test
    if tar -xf "$last_backup" -C "$test_dir" --strip-components=0 2>/dev/null; then
        local extracted_count=$(find "$test_dir" -type f | wc -l)
        log SUCCESS "Successfully extracted $extracted_count files"
        
        # Verify some critical files exist
        local critical_ok=true
        for pattern in "README.md" "AGENTS.md" "memory"; do
            if compgen -G "$test_dir/$pattern" > /dev/null; then
                log DEBUG "Found: $pattern"
            else
                log WARN "Missing critical: $pattern"
                critical_ok=false
            fi
        done
        
        # Cleanup
        rm -rf "$test_dir"
        
        if [[ "$critical_ok" == "true" ]]; then
            log SUCCESS "Test restore completed successfully"
            return 0
        else
            log WARN "Test restore completed with warnings"
            return 0
        fi
    else
        log ERROR "Test restore failed"
        rm -rf "$test_dir"
        return 1
    fi
}

# Show backup status
show_status() {
    echo ""
    echo "========================================="
    echo "   Geometry OS Backup Status"
    echo "========================================="
    echo ""
    
    # Check destination
    echo "Backup Destination: $DEST_LOCAL"
    if [[ -d "$DEST_LOCAL" ]]; then
        local dest_size=$(du -sh "$DEST_LOCAL" 2>/dev/null | cut -f1)
        local backup_count=$(find "$DEST_LOCAL" -name "geometry_os_*.tar*" -type f 2>/dev/null | wc -l)
        echo "  Exists: Yes"
        echo "  Size: $dest_size"
        echo "  Backups: $backup_count"
    else
        echo "  Exists: No (will be created)"
    fi
    echo ""
    
    # List recent backups
    echo "Recent Backups:"
    echo "---------------"
    find "$DEST_LOCAL" -name "geometry_os_*.tar*" -type f -printf '%T@ %p\n' 2>/dev/null | \
        sort -rn | head -5 | while read timestamp path; do
            local size=$(stat -c%s "$path" 2>/dev/null || echo "0")
            local size_human=$(numfmt --to=iec-i --suffix=B "$size" 2>/dev/null || echo "${size} bytes")
            local date_str=$(date -d "@${timestamp%.*}" '+%Y-%m-%d %H:%M:%S' 2>/dev/null || echo "unknown")
            local manifest="${path}.manifest.json"
            local backup_type="unknown"
            
            if [[ -f "$manifest" ]]; then
                backup_type=$(grep -o '"type": "[^"]*"' "$manifest" 2>/dev/null | cut -d'"' -f4 || echo "unknown")
            fi
            
            printf "  %s  [%s]  %s  %s\n" "$date_str" "$(printf '%-12s' "$backup_type")" "$size_human" "$(basename "$path")"
        done
    echo ""
    
    # Check verification status
    local last_backup=$(find "$DEST_LOCAL" -name "geometry_os_*.tar*" -type f -printf '%T@ %p\n' 2>/dev/null | sort -n | tail -1 | cut -d' ' -f2-)
    
    if [[ -n "$last_backup" ]]; then
        local last_backup_time=$(stat -c%Y "$last_backup" 2>/dev/null)
        local current_time=$(date +%s)
        local age_hours=$(( (current_time - last_backup_time) / 3600 ))
        
        echo "Backup Health:"
        echo "--------------"
        echo "  Last backup: ${age_hours}h ago"
        
        if [[ $age_hours -gt 24 ]]; then
            echo -e "  Status: ${YELLOW}WARNING${NC} - Backup is older than 24 hours"
        else
            echo -e "  Status: ${GREEN}OK${NC}"
        fi
        
        # Check git status
        if [[ -d ".git" ]]; then
            local uncommitted=$(git status --porcelain 2>/dev/null | wc -l)
            if [[ $uncommitted -gt 0 ]]; then
                echo -e "  Uncommitted changes: ${YELLOW}$uncommitted files${NC}"
            else
                echo -e "  Git status: ${GREEN}Clean${NC}"
            fi
        fi
    else
        echo "No backups found"
    fi
    echo ""
}

# List all backups
list_backups() {
    echo ""
    echo "All Backups:"
    echo "============"
    
    find "$DEST_LOCAL" -name "geometry_os_*.tar*" -type f -printf '%T@ %p\n' 2>/dev/null | \
        sort -rn | while read timestamp path; do
            local size=$(stat -c%s "$path" 2>/dev/null || echo "0")
            local size_human=$(numfmt --to=iec-i --suffix=B "$size" 2>/dev/null || echo "${size} bytes")
            local date_str=$(date -d "@${timestamp%.*}" '+%Y-%m-%d %H:%M' 2>/dev/null || echo "unknown")
            
            printf "  %s  %s  %s\n" "$date_str" "$(printf '%10s' "$size_human")" "$(basename "$path")"
        done
    echo ""
}

# Clean old backups
clean_old_backups() {
    log INFO "Cleaning old backups..."
    log INFO "Retention: Daily=$RETENTION_DAILY, Weekly=$RETENTION_WEEKLY, Monthly=$RETENTION_MONTHLY"
    
    local removed=0
    local kept=0
    
    # This is a simplified cleanup - in production you'd want more sophisticated logic
    local all_backups=$(find "$DEST_LOCAL" -name "geometry_os_*.tar*" -type f -printf '%T@ %p\n' 2>/dev/null | sort -rn)
    local total=$(echo "$all_backups" | grep -c .)
    
    if [[ $total -le $RETENTION_DAILY ]]; then
        log INFO "No backups to clean (have $total, keeping $RETENTION_DAILY)"
        return 0
    fi
    
    # Keep only the most recent N backups
    local count=0
    while IFS= read -r line; do
        count=$((count + 1))
        local path=$(echo "$line" | cut -d' ' -f2-)
        
        if [[ $count -gt $RETENTION_DAILY ]]; then
            if [[ "$DRY_RUN" == "true" ]]; then
                log INFO "[DRY RUN] Would remove: $path"
            else
                rm -f "$path" "${path}.manifest.json"
                log INFO "Removed: $path"
            fi
            removed=$((removed + 1))
        else
            kept=$((kept + 1))
        fi
    done <<< "$all_backups"
    
    log SUCCESS "Cleanup complete: kept $kept, removed $removed"
}

# Check if verification should be performed
should_verify() {
    # For now, always verify. Could read from config.
    return 0
}

# Main function
main() {
    parse_args "$@"
    
    log INFO "Geometry OS Backup System v1.0"
    log DEBUG "Command: $COMMAND"
    log DEBUG "Config: $CONFIG_FILE"
    
    # Check dependencies
    check_dependencies
    
    # Load configuration
    if [[ -f "$CONFIG_FILE" ]]; then
        parse_yaml_config "$CONFIG_FILE"
    else
        log WARN "Config file not found, using defaults"
        DEST_LOCAL="$HOME/.local/share/geometry-backup/archives"
    fi
    
    # Execute command
    case "$COMMAND" in
        full)
            do_full_backup
            ;;
        incremental)
            do_incremental_backup
            ;;
        verify)
            local last_backup=$(find "$DEST_LOCAL" -name "geometry_os_*.tar*" -type f -printf '%T@ %p\n' 2>/dev/null | sort -n | tail -1 | cut -d' ' -f2-)
            if [[ -n "$last_backup" ]]; then
                verify_backup "$last_backup"
            else
                log ERROR "No backup found to verify"
                exit 1
            fi
            ;;
        test)
            test_restore
            ;;
        status)
            show_status
            ;;
        list)
            list_backups
            ;;
        clean)
            clean_old_backups
            ;;
        *)
            log ERROR "Unknown command: $COMMAND"
            show_help
            exit 1
            ;;
    esac
}

# Run main
main "$@"
