# Phase 2: FUSE Bridge for Direct Boot - Research

**Researched:** 2026-02-14
**Domain:** FUSE filesystem integration, QEMU boot automation, CLI design
**Confidence:** HIGH

## Summary

This phase builds a unified boot pipeline connecting the existing FUSE filesystem infrastructure to QEMU boot automation. The goal is enabling users to boot `.rts.png` files with a single command (`pixelrts boot <file.png>`) without manual extraction steps.

The codebase already contains substantial infrastructure:
- **FUSE filesystem** (`systems/rts_fuse/filesystem.py`, `systems/pixel_compiler/infinite_map_fuse.py`) - Full read/write VAT-based filesystem with Hilbert curve mapping
- **QEMU integration** (`systems/pixel_compiler/integration/qemu_boot.py`) - Comprehensive QEMU boot with direct kernel, UEFI, serial console, VNC
- **PixelRTS CLI** (`systems/pixel_compiler/pixelrts_cli.py`) - Existing unified CLI with convert, analyze, execute, vision commands
- **Boot configuration** (`systems/pixel_compiler/tests/test_pixelrts_boot.py`) - BootFile, BootConfig, BootManager classes already exist

**Primary recommendation:** Implement a `BootBridge` class that orchestrates FUSE mount + QEMU boot, with a `pixelrts boot` CLI subcommand that exposes this functionality.

## Standard Stack

The established libraries/tools for this domain:

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| fusepy | 3.0.1+ | FUSE Python bindings | Only maintained Python FUSE library |
| QEMU | 7.0+ | x86_64/aarch64 virtualization | Industry standard for VM boot |
| click | 8.0+ | CLI framework | Already used in codebase for colored output |
| Pillow | 9.0+ | PNG metadata extraction | Existing PixelRTS dependency |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| hilbertcurve | 2.0.5 | Hilbert curve LUT generation | Already in FUSE requirements |
| numpy | 1.21+ | Array operations for pixel data | Core dependency |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| fusepy | llfuse | llfuse is more complex, fusepy is simpler and proven |
| QEMU direct kernel | libvirt | libvirt adds unnecessary abstraction layer |
| Custom mount helper | udisks2 | udisks2 requires D-Bus, adds complexity |

**Installation:**
```bash
pip install fusepy>=3.0.1 click>=8.0 hilbertcurve>=2.0.5
apt install qemu-system-x86  # For x86_64 boot
```

## Architecture Patterns

### Recommended Project Structure
```
systems/pixel_compiler/
  boot/
    __init__.py
    boot_bridge.py       # Orchestrates FUSE + QEMU
    mount_helper.py      # FUSE mount lifecycle management
    boot_progress.py     # UX-01: Progress display for operations >1s
  integration/
    qemu_boot.py         # EXISTING: QEMU boot automation
  pixelrts_cli.py        # EXTEND: Add 'boot' subcommand
```

### Pattern 1: FUSE-to-QEMU Bridge Pattern
**What:** A `BootBridge` class that mounts FUSE filesystem temporarily, extracts kernel/initrd paths, and passes them to QEMU.
**When to use:** This is the core pattern for Phase 2.
**Example:**
```python
# Source: Based on existing systems/pixel_compiler/integration/qemu_boot.py pattern
from systems.rts_fuse.filesystem import RTSFilesystem
from systems.pixel_compiler.integration.qemu_boot import QemuBoot

class BootBridge:
    """
    Orchestrates direct boot from .rts.png files.

    Flow:
    1. Parse .rts.png metadata to identify kernel/initrd segments
    2. Mount FUSE filesystem at temporary mountpoint
    3. Pass kernel/initrd paths to QEMU for direct boot
    4. Monitor boot process, cleanup on exit
    """

    def __init__(self, rts_png_path: str):
        self.rts_path = Path(rts_png_path)
        self.mountpoint: Optional[Path] = None
        self._fuse_process: Optional[subprocess.Popen] = None
        self._qemu: Optional[QemuBoot] = None

    def boot(self, memory: str = "2G", cpus: int = 2) -> subprocess.Popen:
        """Boot the .rts.png with single call."""
        # 1. Mount FUSE (exposes /kernel, /initrd)
        self._mount_fuse()

        # 2. Create QEMU boot with direct kernel
        kernel_path = self.mountpoint / "kernel"
        initrd_path = self.mountpoint / "initrd"

        self._qemu = QemuBoot(
            image_path=str(self.rts_path),
            memory=memory,
            cpus=cpus
        )

        # 3. Boot with direct kernel
        return self._qemu.boot(
            kernel=kernel_path if kernel_path.exists() else None,
            initrd=initrd_path if initrd_path.exists() else None,
            cmdline="console=ttyS0 quiet"
        )

    def _mount_fuse(self):
        """Mount FUSE filesystem at temporary location."""
        self.mountpoint = Path(tempfile.mkdtemp(prefix="pixelrts_boot_"))
        # Use existing InfiniteMapFilesystem or RTSFilesystem
        from systems.pixel_compiler.infinite_map_fuse import mount_infinite_map
        # ... FUSE mount logic

    def cleanup(self):
        """DIRECT-04: Proper cleanup - no resource leaks."""
        if self._qemu:
            self._qemu.stop()
        if self.mountpoint:
            # Unmount FUSE
            subprocess.run(["fusermount", "-u", str(self.mountpoint)])
            self.mountpoint.rmdir()
```

### Pattern 2: Progress Display for Long Operations
**What:** UX-01 requires visual progress for operations >1 second.
**When to use:** During FUSE mount, kernel extraction, QEMU startup.
**Example:**
```python
# Source: Based on existing pixelrts_progress.py pattern
import sys
import time

class BootProgress:
    """Visual boot progress display."""

    def __init__(self):
        self.stages = [
            ("Parsing PNG metadata", 0.5),
            ("Mounting FUSE filesystem", 1.0),
            ("Loading kernel", 2.0),
            ("Loading initrd", 3.0),
            ("Starting QEMU", 1.0),
        ]
        self.current_stage = 0

    def show_progress(self, message: str, progress: float):
        """Display progress bar for operations >1s."""
        bar_width = 40
        filled = int(bar_width * progress)
        bar = "=" * filled + "-" * (bar_width - filled)
        sys.stderr.write(f"\r[{bar}] {message}")
        sys.stderr.flush()

    def complete_stage(self, message: str):
        """Mark stage complete and move to next."""
        sys.stderr.write(f"\r{' ' * 60}\r")
        print(f"[OK] {message}")
        self.current_stage += 1
```

### Anti-Patterns to Avoid
- **Synchronous blocking without progress:** Operations >1s must show progress (UX-01)
- **Not cleaning up FUSE mounts on error:** Use try/finally or context managers (DIRECT-04)
- **Hardcoded kernel/initrd paths:** Use metadata to discover files dynamically
- **Running FUSE in foreground:** QEMU needs to run; FUSE should be background or threaded

## Don't Hand-Roll

Problems that look simple but have existing solutions:

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| FUSE filesystem mounting | Custom mount scripts | `systems/rts_fuse/filesystem.py` mount_rtsfs() | Already handles Hilbert LUT, VAT, caching |
| QEMU command generation | Manual subprocess | `systems/pixel_compiler/integration/qemu_boot.py` QemuBoot | Handles KVM, VNC, serial, architectures |
| PNG metadata extraction | Custom PNG parsing | `systems/pixel_compiler/pixelrts_v2_core.py` PixelRTSDecoder | Handles tEXt chunks, sidecar JSON |
| Boot configuration | Custom config class | Existing BootConfig, BootManager from pixelrts_boot | Already defined in codebase |
| CLI framework | New argparse | Extend existing pixelrts_cli.py | Consistency with convert, analyze, execute |

**Key insight:** The codebase already has 90% of the pieces. This phase is primarily integration work, not new component development.

## Common Pitfalls

### Pitfall 1: FUSE Mount Point Cleanup
**What goes wrong:** FUSE mounts persist after crash/error, blocking subsequent operations.
**Why it happens:** Exception before cleanup code, or process killed without cleanup.
**How to avoid:** Use context manager pattern; register atexit handler; use lazy unmount.
**Warning signs:** "Transport endpoint is not connected" errors; empty mountpoints.

```python
import atexit
import signal

class BootBridge:
    def __init__(self):
        atexit.register(self._force_cleanup)
        signal.signal(signal.SIGTERM, self._signal_handler)
        signal.signal(signal.SIGINT, self._signal_handler)

    def _force_cleanup(self):
        """Called on exit - force unmount if needed."""
        if self.mountpoint and self.mountpoint.exists():
            subprocess.run(["fusermount", "-uz", str(self.mountpoint)],
                          stderr=subprocess.DEVNULL)
            try:
                self.mountpoint.rmdir()
            except:
                pass
```

### Pitfall 2: Kernel/Initrd Path Discovery
**What goes wrong:** Assuming fixed paths like `/kernel` and `/initrd` when VAT uses different names.
**Why it happens:** Different .rts.png files may name segments differently.
**How to avoid:** Parse metadata first, look for common patterns (kernel, vmlinuz, initrd, initramfs).
**Warning signs:** "kernel not found" errors, QEMU fails to boot.

```python
def discover_boot_files(self) -> Tuple[Optional[str], Optional[str]]:
    """Discover kernel/initrd from metadata, not hardcoded paths."""
    metadata = self._parse_metadata()

    kernel_names = ['kernel', 'vmlinuz', 'vmlinux', 'bzImage']
    initrd_names = ['initrd', 'initramfs', 'initrd.img']

    kernel = None
    initrd = None

    for name, info in metadata.get('segments', {}).items():
        name_lower = name.lower()
        if any(k in name_lower for k in kernel_names):
            kernel = name
        elif any(i in name_lower for i in initrd_names):
            initrd = name

    return kernel, initrd
```

### Pitfall 3: Boot Performance Overhead
**What goes wrong:** FUSE extraction adds >10% overhead vs direct ISO boot (violates DIRECT-03).
**Why it happens:** Reading through FUSE + Hilbert decode adds latency; no caching.
**How to avoid:** Use existing LRU cache in InfiniteMapFilesystem; enable prefetching; stream directly to QEMU.
**Warning signs:** Boot time >2x traditional method.

### Pitfall 4: Progress Display on Non-TTY
**What goes wrong:** Progress bar output corrupts logs or fails silently.
**Why it happens:** stderr.write to non-terminal; no isatty check.
**How to avoid:** Check `sys.stderr.isatty()` before progress display; use logging otherwise.
**Warning signs:** CI logs with corrupted progress bars.

## Code Examples

Verified patterns from existing codebase:

### QEMU Direct Boot (from qemu_boot.py)
```python
# Source: systems/pixel_compiler/integration/qemu_boot.py lines 503-559
def boot(
    self,
    kernel: Optional[Path] = None,
    initrd: Optional[Path] = None,
    cmdline: Optional[str] = None,
    cloud_init: Optional[CloudInitConfig] = None,
    blocking: bool = False,
) -> subprocess.Popen:
    """
    Start QEMU process with direct kernel boot.
    """
    if kernel and self.config.boot_mode == BootMode.DIRECT_KERNEL:
        cmd.extend(["-kernel", str(kernel)])
        if initrd:
            cmd.extend(["-initrd", str(initrd)])
        default_cmdline = "console=ttyS0 quiet"
        if cmdline:
            default_cmdline = f"{default_cmdline} {cmdline}"
        cmd.extend(["-append", default_cmdline])
```

### FUSE Mount (from infinite_map_fuse.py)
```python
# Source: systems/pixel_compiler/infinite_map_fuse.py lines 1956-1989
def mount_infinite_map(
    container_path: str,
    mountpoint: str,
    foreground: bool = True,
    read_only: bool = True,
    max_workers: int = 4
):
    """Mount the Infinite Map with VAT support."""
    if not os.path.exists(mountpoint):
        os.makedirs(mountpoint)

    fs = InfiniteMapFilesystem(container_path, max_workers=max_workers)

    FUSE(
        fs,
        mountpoint,
        foreground=foreground,
        ro=read_only,
        allow_other=True
    )
```

### CLI Extension Pattern (from pixelrts_cli.py)
```python
# Source: systems/pixel_compiler/pixelrts_cli.py - extend this pattern
def cmd_boot(args):
    """Handle boot command - boot .rts.png with single command."""
    from systems.pixel_compiler.boot.boot_bridge import BootBridge

    input_path = Path(args.input)

    if not input_path.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        return 1

    if args.verbose:
        print(f"[*] Booting: {args.input}")

    try:
        bridge = BootBridge(str(input_path))

        # Boot with progress display
        process = bridge.boot(
            memory=args.memory,
            cpus=args.cpus
        )

        if args.verbose:
            print(f"[*] QEMU started with PID {process.pid}")
            print(f"[*] VNC: localhost:{5900 + args.vnc}")

        if not args.background:
            process.wait()

        return 0

    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1

# Add to subparsers in main():
boot_parser = subparsers.add_parser('boot', help='Boot .rts.png with QEMU')
boot_parser.add_argument('input', help='Input .rts.png file path')
boot_parser.add_argument('--memory', '-m', default='2G', help='Memory allocation')
boot_parser.add_argument('--cpus', '-c', type=int, default=2, help='CPU cores')
boot_parser.add_argument('--vnc', type=int, default=0, help='VNC display number')
boot_parser.add_argument('--background', '-b', action='store_true', help='Run in background')
boot_parser.add_argument('-v', '--verbose', action='store_true')
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| Manual ISO extraction | FUSE mount + direct boot | This phase | Eliminates extraction step |
| Separate mount/boot commands | Unified `pixelrts boot` | This phase | Single command UX |
| No progress feedback | Visual progress for >1s ops | This phase | Better UX (UX-01) |

**Deprecated/outdated:**
- `boot_rts.sh` shell scripts: Replace with Python CLI for cross-platform support
- Manual `mount.fuse` calls: Use BootBridge context manager

## Open Questions

Things that couldn't be fully resolved:

1. **VAT segment naming conventions**
   - What we know: VAT uses segment names from metadata
   - What's unclear: Is there a standard naming convention for kernel/initrd?
   - Recommendation: Support common patterns (kernel, vmlinuz, initrd, initramfs) with fallback

2. **FUSE thread model with QEMU**
   - What we know: FUSE runs in foreground thread by default
   - What's unclear: Best approach for running FUSE + QEMU concurrently
   - Recommendation: Use `foreground=False` for FUSE, or run FUSE in daemon thread

3. **Kernel cmdline from metadata**
   - What we know: QemuBoot supports cmdline parameter
   - What's unclear: Should cmdline be stored in .rts.png metadata?
   - Recommendation: Support both metadata cmdline and CLI override

## Sources

### Primary (HIGH confidence)
- `systems/rts_fuse/filesystem.py` - FUSE filesystem implementation
- `systems/pixel_compiler/infinite_map_fuse.py` - VAT-based FUSE with caching
- `systems/pixel_compiler/integration/qemu_boot.py` - QEMU boot automation
- `systems/pixel_compiler/pixelrts_cli.py` - CLI structure and patterns
- `.planning/REQUIREMENTS.md` - Requirements DIRECT-01 through DIRECT-04, UX-01, UX-03

### Secondary (MEDIUM confidence)
- `systems/rts_fuse/requirements.txt` - Dependency versions
- `systems/pixel_compiler/tests/test_pixelrts_boot.py` - Boot class patterns
- `systems/pixel_compiler/pixelrts_v2_core.py` - Metadata handling

### Tertiary (LOW confidence)
- WebSearch for fusepy best practices failed (API error)

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - Based on existing codebase dependencies
- Architecture: HIGH - Based on existing FUSE and QEMU code
- Pitfalls: MEDIUM - Some based on general FUSE knowledge, needs validation

**Research date:** 2026-02-14
**Valid until:** 2026-03-15 (stable technologies, 30 days appropriate)
