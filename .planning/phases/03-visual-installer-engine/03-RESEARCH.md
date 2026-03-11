# Phase 3: Visual Installer Engine - Research

**Researched:** 2026-02-15
**Domain:** Python disk image writing, progress display, signal handling, file integrity verification
**Confidence:** HIGH

## Summary

This phase builds a Visual Installer Engine that writes OS data from `.rts.png` containers to target disks/images with visual progress feedback. The research examined the existing codebase patterns from Phase 2 (BootBridge, MountHelper, BootProgress) and established best practices for disk writing with progress, cancellation handling, and integrity verification.

The standard approach leverages the existing BootProgress class for visual feedback, follows the context manager pattern from MountHelper for RAII-style cleanup, and uses the PixelRTSDecoder for integrity verification before writing. Disk writing uses chunked `shutil.copyfileobj` with progress callbacks rather than hand-rolled dd-style byte copying.

**Primary recommendation:** Create an `InstallEngine` class that follows the BootBridge pattern, uses existing BootProgress for visual feedback, verifies container integrity with PixelRTSDecoder before writing, and handles cancellation with the signal handler pattern from MountHelper.

## Standard Stack

The established libraries/tools for this domain:

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| Rich | 13.x | Terminal progress display | Already used in BootProgress, provides Rich library support with plain text fallback |
| shutil | stdlib | File copying with chunking | Standard library, handles chunked copying efficiently via `copyfileobj` |
| hashlib | stdlib | SHA256 verification | Already used in PixelRTSMetadata.hash_data() |
| signal | stdlib | Cancellation handling | Already used in MountHelper for cleanup |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| pathlib | stdlib | Path handling | All file operations (consistent with existing code) |
| tempfile | stdlib | Temporary files | For partial writes before commit |
| contextlib | stdlib | Context managers | For RAII-style resource management |
| dataclasses | stdlib | Result objects | For InstallResult similar to BootResult |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| shutil.copyfileobj | dd subprocess | subprocess has external dependency, harder to get progress |
| BootProgress | tqdm | Rich already integrated, consistent with Phase 2 |
| Signal handlers | threading.Event | Signals work for Ctrl+C, simpler for CLI tools |
| Context manager | try/finally | Context manager more Pythonic, matches BootBridge pattern |

**Installation:**
No additional packages needed - all dependencies are in Python stdlib or already installed (Rich from Phase 2).

## Architecture Patterns

### Recommended Project Structure
```
systems/pixel_compiler/install/
├── __init__.py           # Export InstallEngine, InstallResult, InstallProgress
├── install_engine.py     # Main installer class
├── install_progress.py   # Install-specific progress stages (extends BootProgress)
└── disk_writer.py        # Chunked disk writing with verification
```

### Pattern 1: InstallEngine Context Manager
**What:** RAII-style installer that manages temporary files and cleanup automatically
**When to use:** Always - matches BootBridge pattern for consistency
**Example:**
```python
# From existing BootBridge pattern (boot_bridge.py lines 392-399)
class InstallEngine:
    def __init__(self, rts_png_path: str, target_path: str, verbose: bool = False):
        self.rts_png_path = Path(rts_png_path).resolve()
        self.target_path = Path(target_path).resolve()
        self._progress = InstallProgress(verbose=verbose)
        self._decoder: Optional[PixelRTSDecoder] = None
        self._temp_file: Optional[Path] = None
        self._cancelled = False

    def install(self) -> InstallResult:
        """Perform installation with progress feedback."""
        # Implementation

    def cancel(self) -> None:
        """Request cancellation of ongoing installation."""
        self._cancelled = True

    def _cleanup(self) -> None:
        """Clean up temporary files on cancellation or error."""
        if self._temp_file and self._temp_file.exists():
            self._temp_file.unlink()

    def __enter__(self) -> 'InstallEngine':
        return self

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        self._cleanup()
        return None
```

### Pattern 2: Chunked Copy with Progress
**What:** Copy data in chunks with progress callback for visual feedback
**When to use:** When writing large disk images (anything >1MB)
**Example:**
```python
# Chunked copy pattern with progress
import shutil

def copy_with_progress(
    src_file,
    dst_file,
    total_size: int,
    progress_callback: Callable[[float, str], None],
    chunk_size: int = 1024 * 1024  # 1MB chunks
) -> int:
    """Copy file in chunks, calling progress_callback after each chunk."""
    copied = 0
    while True:
        chunk = src_file.read(chunk_size)
        if not chunk:
            break
        dst_file.write(chunk)
        copied += len(chunk)
        progress = copied / total_size if total_size > 0 else 1.0
        progress_callback(progress, f"Wrote {copied}/{total_size} bytes")
    return copied
```

### Pattern 3: Signal Handler for Cancellation
**What:** Handle SIGINT/SIGTERM for graceful cancellation with cleanup
**When to use:** All CLI tools that may need user cancellation (Ctrl+C)
**Example:**
```python
# From existing MountHelper pattern (mount_helper.py lines 181-186)
def _register_cleanup_handlers(self):
    """Register signal handlers for graceful cancellation."""
    original_sigint = signal.getsignal(signal.SIGINT)
    original_sigterm = signal.getsignal(signal.SIGTERM)

    def handle_cancel(signum, frame):
        self._cancelled = True
        self._cleanup()
        # Re-raise for proper exit code
        if signum == signal.SIGINT:
            raise KeyboardInterrupt()

    signal.signal(signal.SIGINT, handle_cancel)
    signal.signal(signal.SIGTERM, handle_cancel)
```

### Anti-Patterns to Avoid
- **Writing directly to target without verification:** Always verify container integrity BEFORE starting write. Use PixelRTSDecoder.verify_hash().
- **No temporary file for atomic writes:** Write to temp file first, then rename on success. This enables safe cancellation without corrupting target.
- **Ignoring SIGINT during writes:** User should be able to Ctrl+C during long writes. Must clean up partial writes.
- **Assuming target is always a regular file:** Target could be a block device (/dev/sda) which requires different handling (O_DIRECT, sync).

## Don't Hand-Roll

Problems that look simple but have existing solutions:

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Progress display | Custom progress bar | BootProgress (existing) | Already handles TTY/non-TTY, Rich library with fallback |
| File integrity | Custom SHA256 check | PixelRTSDecoder.verify_hash() | Already implemented in pixelrts_v2_core.py |
| Signal handling | Custom signal logic | MountHelper pattern (lines 174-186) | Proven pattern with atexit handlers |
| Disk writing | dd subprocess | shutil.copyfileobj with chunks | Pure Python, progress callbacks, no external deps |
| Context manager | Manual try/finally | @contextmanager or __enter__/__exit__ | Matches BootBridge, guaranteed cleanup |

**Key insight:** Phase 2 established patterns that should be reused: BootProgress for visual feedback, context managers for cleanup, signal handlers for cancellation. The installer should follow these same patterns.

## Common Pitfalls

### Pitfall 1: Writing to Block Devices Without Sync
**What goes wrong:** Data appears written but isn't flushed to disk; power loss corrupts installation
**Why it happens:** OS buffers writes; need explicit sync for block devices
**How to avoid:** Call `os.fsync(fd)` after writing completes, or use `sync=True` in file operations
**Warning signs:** Installation succeeds but disk is corrupted after reboot

### Pitfall 2: Not Handling Partial Writes
**What goes wrong:** Cancellation leaves partially written garbage on target
**Why it happens:** User cancels mid-write, no cleanup of partial data
**How to avoid:** Write to temp file first, atomic rename to target on success. Delete temp on cancel.
**Warning signs:** Target file exists but is corrupted after Ctrl+C

### Pitfall 3: Progress Inaccuracy
**What goes wrong:** Progress shows 50% but actual data is different percentage
**Why it happens:** Compression, encoding overhead not accounted for in size calculations
**How to avoid:** Get actual decoded size from PixelRTSDecoder metadata (data_size field), not PNG file size
**Warning signs:** Progress jumps or stalls unexpectedly

### Pitfall 4: Blocking on Large Writes
**What goes wrong:** UI freezes during write, user thinks it's hung
**Why it happens:** Single large write without yielding to progress updates
**How to avoid:** Use chunked writes (1MB chunks) with progress callback after each chunk
**Warning signs:** Progress bar doesn't update smoothly, large pauses

### Pitfall 5: Not Verifying Before Write
**What goes wrong:** Corrupt container is written to disk, wasting time and corrupting target
**Why it happens:** Skipping verification to "save time"
**How to avoid:** Always call PixelRTSDecoder.verify_hash() BEFORE starting write operation
**Warning signs:** Installation succeeds but OS won't boot

## Code Examples

Verified patterns from existing codebase:

### Decoding with Verification (from pixelrts_v2_core.py)
```python
# Source: systems/pixel_compiler/pixelrts_v2_core.py lines 788-843
decoder = PixelRTSDecoder()

# Load with sidecar metadata
meta_path = Path(str(input_path) + '.meta.json')
if meta_path.exists():
    with open(meta_path, 'r') as f:
        metadata = json.load(f)
    decoder.set_metadata(metadata)

# Decode and verify
data = decoder.load(str(input_path), verify_hash=True)

# Or manual verification
expected_hash = metadata['data_hash']
actual_hash = PixelRTSMetadata.hash_data(data)
if actual_hash != expected_hash:
    raise ValueError(f"Hash mismatch: expected {expected_hash}, got {actual_hash}")
```

### Progress Display (from boot_progress.py)
```python
# Source: systems/pixel_compiler/boot/boot_progress.py lines 115-200
progress = BootProgress(verbose=True)

# Start a stage
progress.start(ProgressStage.LOADING_KERNEL)
progress.update(0.5, "Halfway there")
progress.complete("Kernel loaded successfully")

# Handle errors
progress.error("Failed to load kernel")
```

### Signal Handler Pattern (from mount_helper.py)
```python
# Source: systems/pixel_compiler/boot/mount_helper.py lines 174-186
def _register_cleanup_handlers(self):
    if not MountHelper._cleanup_registered:
        atexit.register(MountHelper._cleanup_all_mounts)
        MountHelper._original_sigterm_handler = signal.getsignal(signal.SIGTERM)
        MountHelper._original_sigint_handler = signal.getsignal(signal.SIGINT)
        signal.signal(signal.SIGTERM, MountHelper._signal_handler)
        signal.signal(signal.SIGINT, MountHelper._signal_handler)
        MountHelper._cleanup_registered = True
```

### Context Manager Pattern (from boot_bridge.py)
```python
# Source: systems/pixel_compiler/boot/boot_bridge.py lines 392-399
def __enter__(self) -> 'BootBridge':
    """Context manager entry."""
    return self

def __exit__(self, exc_type, exc_val, exc_tb) -> None:
    """Context manager exit - ensure cleanup."""
    self._cleanup()
    return None  # Don't suppress exceptions
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| dd for disk writes | shutil with chunks | Phase 2 established Python-first | Progress callbacks, pure Python |
| Custom progress bar | Rich library with fallback | Phase 2 (boot_progress.py) | Better UX, graceful degradation |
| Manual cleanup | Context managers + signals | Phase 2 (mount_helper.py) | No resource leaks |
| Extract-then-boot | FUSE direct mount | Phase 2 (BootBridge) | No intermediate files |

**Deprecated/outdated:**
- Subprocess dd calls: Use shutil.copyfileobj instead for progress callbacks
- Custom signal logic per command: Use shared pattern from MountHelper
- Extracting to temp files before install: Decode directly to target via temp file pattern

## Open Questions

Things that couldn't be fully resolved:

1. **Block Device Handling**
   - What we know: Target could be a file OR a block device (/dev/sda)
   - What's unclear: Whether to require root/sudo for block devices, how to handle O_DIRECT
   - Recommendation: Start with file targets only in Phase 3. Add block device support as enhancement. Use `os.path.isfile()` check to detect and warn.

2. **Resume Partial Installs**
   - What we know: Cancellation may leave partial writes
   - What's unclear: Whether to support resuming partial installs vs always restart
   - Recommendation: For Phase 3, always clean up and restart on cancel. Resume is complex and can be added later if needed.

3. **Target Size Validation**
   - What we know: Container has data_size in metadata
   - What's unclear: Whether to validate target has enough space before starting
   - Recommendation: Yes, check target filesystem has >data_size available before starting write. Use `shutil.disk_usage()`.

## Sources

### Primary (HIGH confidence)
- `systems/pixel_compiler/boot/boot_bridge.py` - BootBridge pattern for RAII-style orchestration
- `systems/pixel_compiler/boot/boot_progress.py` - Progress display with Rich/fallback
- `systems/pixel_compiler/boot/mount_helper.py` - Signal handlers, context managers, cleanup
- `systems/pixel_compiler/pixelrts_v2_core.py` - PixelRTSDecoder with verify_hash()
- `.planning/phases/02-fuse-bridge/02-VERIFICATION.md` - Phase 2 verification showing 36/36 tests pass

### Secondary (MEDIUM confidence)
- `systems/pixel_compiler/pixelrts_cli.py` - CLI patterns for argparse, cmd_boot handler
- `systems/pixel_compiler/pixelrts_v2_extractor.py` - Extraction patterns with verification
- `.planning/STATE.md` - Project decisions and Phase 2 completion status
- `.planning/PROJECT.md` - Requirements INSTALL-01 context

### Tertiary (LOW confidence)
- None - all findings verified against existing codebase

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - All based on existing Phase 2 code and Python stdlib
- Architecture: HIGH - Patterns from verified BootBridge/MountHelper implementation
- Pitfalls: HIGH - Derived from existing code review and standard disk writing issues

**Research date:** 2026-02-15
**Valid until:** 30 days - Python stdlib stable, patterns from completed Phase 2
