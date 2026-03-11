# Geometry OS Backup System

A reliable, flexible backup solution for critical data and code repositories.

## Features

- **Full and Incremental Backups**: Efficient backup strategies for different needs
- **Multiple Compression Options**: zstd (fastest), gzip, pigz (parallel gzip)
- **Backup Verification**: Integrity checks and test restore capabilities
- **Retention Policies**: Configurable retention for daily, weekly, monthly backups
- **Git Integration**: Automatic tracking of commit, branch, and remote info
- **Pre/Post Hooks**: Custom scripts to run before/after backups
- **Notifications**: Desktop or custom notifications on backup completion
- **Systemd Integration**: Optional automatic daily backups via systemd timer
- **Detailed Logging**: Comprehensive logs with rotation

## Quick Start

```bash
# Run a full backup
./scripts/backup/backup.sh full

# Or use the Python version for more features
python scripts/backup/backup.py full

# Check backup status
./scripts/backup/backup.sh status

# Verify last backup
./scripts/backup/backup.sh verify

# Test restore capability
./scripts/backup/backup.sh test
```

## Usage

### Bash Script (backup.sh)

```bash
./backup.sh [OPTIONS] COMMAND

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
```

### Python Script (backup.py)

```bash
python backup.py [OPTIONS] COMMAND

Commands:
  full         Perform a full backup
  incremental  Perform an incremental backup
  verify       Verify the last backup
  test         Test restore to temporary location
  status       Show backup status and statistics
  clean        Clean old backups based on retention policy
  list         List all backups
  schedule     Create systemd timer for automatic backups

Options:
  -c, --config PATH   Configuration file path
  -v, --verbose       Verbose output
  -q, --quiet         Suppress output
  -d, --dry-run       Dry run
```

## Configuration

The backup system is configured via `backup_config.yaml`. Key settings:

### Destination

```yaml
destination:
  local: ~/.local/share/geometry-backup/archives
  # Optional remote backup via rsync
  # remote: user@backup-server:/backups/geometry_os
  # Optional external drive
  # external: /media/backup-drive/geometry_os
```

### Retention Policy

```yaml
retention:
  daily: 7    # Keep 7 daily backups
  weekly: 4   # Keep 4 weekly backups
  monthly: 6  # Keep 6 monthly backups
```

### Compression

```yaml
compression:
  algorithm: zstd  # zstd, gzip, xz
  level: 6         # Compression level (1-19 for zstd)
```

### Exclusions

Default exclusions include:
- `*.pyc`, `__pycache__`
- `.venv`, `node_modules`
- `*.rts.png.f16` (large binary files)
- `htmlcov`, `.coverage`, `coverage.json`
- `*.log`, `*.tmp`, `*.swp`

### Pre/Post Hooks

```yaml
hooks:
  pre_backup:
    - "git fetch --all"
  post_backup:
    - "echo 'Backup complete'"
```

## Backup Strategy

### Full Backup

Creates a complete archive of all source files (excluding patterns). Recommended:
- Before major changes
- Weekly for active projects
- When setting up the backup system

### Incremental Backup

Only backs up files changed since the last backup. Recommended:
- Daily or more frequent
- For active development periods

## Automatic Backups

### Using Systemd (Linux)

```bash
# Create and enable the timer
python backup.py schedule --enable

# Check timer status
systemctl --user list-timers geometry-backup.timer

# View logs
journalctl --user -u geometry-backup.service
```

### Using Cron

Add to crontab (`crontab -e`):

```cron
# Daily backup at 2 AM
0 2 * * * cd /path/to/geometry_os && ./scripts/backup/backup.sh full >> ~/.local/share/geometry-backup/logs/cron.log 2>&1
```

## Verification

The backup system includes multiple verification methods:

### Integrity Check

```bash
./backup.sh verify
```

Tests:
- Archive can be decompressed
- Archive contents can be listed
- Checksum matches manifest

### Test Restore

```bash
./backup.sh test
```

Performs:
- Extracts to temporary directory
- Verifies critical files exist
- Reports extraction statistics

## Restoring from Backup

### Full Restore

```bash
# List contents first
tar -tf ~/.local/share/geometry-backup/archives/geometry_os_full_*.tar.zst | less

# Extract to current directory
tar -xf ~/.local/share/geometry-backup/archives/geometry_os_full_*.tar.zst

# Or extract to specific directory
tar -xf ~/.local/share/geometry-backup/archives/geometry_os_full_*.tar.zst -C /path/to/restore
```

### Incremental Restore

Incremental backups contain only changed files. To restore:

1. First restore the last full backup
2. Then restore each incremental backup in order

```bash
# Restore full backup
tar -xf geometry_os_full_20260310_020000.tar.zst

# Apply incremental backups in order
for incr in geometry_os_incr_*.tar.zst; do
    tar -xf "$incr"
done
```

## Monitoring

### Status Command

```bash
./backup.sh status
```

Shows:
- Backup destination info
- Recent backups with sizes and types
- Backup health status
- Git repository status

### Log Files

Logs are stored in `~/.local/share/geometry-backup/logs/`:
- `backup.log` - All backup operations
- `cron.log` - Cron job output (if using cron)

## Best Practices

1. **Regular Backups**: Set up automatic daily backups
2. **Verify Regularly**: Run verification weekly
3. **Test Restores**: Perform test restore monthly
4. **Off-site Copies**: Copy archives to remote storage periodically
5. **Monitor Logs**: Check logs for warnings or errors
6. **Retention Tuning**: Adjust retention based on storage and needs

## Troubleshooting

### "No space left on device"

- Run `./backup.sh clean` to remove old backups
- Reduce retention periods in config
- Consider excluding more large files

### "Permission denied"

- Ensure you have write access to backup destination
- Check file permissions on source files

### "Archive is corrupted"

- Delete the corrupted backup
- Run verification after each backup
- Check disk health

### Slow Backups

- Use zstd compression (faster than gzip)
- Exclude large generated files
- Use incremental backups more frequently

## Files

```
scripts/backup/
├── backup_config.yaml  # Configuration file
├── backup.sh           # Bash backup script
├── backup.py           # Python backup script (more features)
└── README.md           # This file

~/.local/share/geometry-backup/
├── archives/           # Backup archives
│   ├── geometry_os_full_*.tar.zst
│   ├── geometry_os_full_*.tar.zst.manifest.json
│   └── ...
└── logs/              # Log files
    └── backup.log
```

## Requirements

### Bash Script
- bash 4.0+
- rsync
- tar
- gzip or zstd

### Python Script
- Python 3.8+
- PyYAML (optional, for full config parsing)
- zstandard (optional, for zstd compression)

Install optional dependencies:
```bash
pip install pyyaml zstandard
```
