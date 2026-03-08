# Stack Research

**Domain:** Vision-based OS Boot and Installation + Network Boot
**Researched:** 2026-02-11 (v1.0/v1.1), 2026-03-08 (v1.2 Network Boot)
**Confidence:** HIGH

---

## Part 1: Existing Validated Stack (v1.0/v1.1)

*Already implemented and shipped. Do not re-research.*

### Core Technologies

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| Python | 3.12+ | Primary implementation language | Already used in codebase; async/await support; excellent library ecosystem |
| PyFuse3 | 3.4.0+ | FUSE filesystem bindings | Modern async API for libfuse3; actively maintained; official docs at pyfuse3.readthedocs.io |
| Pillow | 12.1.0+ | PNG/image processing | Already used in PixelRTS v2; latest version (2026-01-02); mature and stable |
| OpenCV | 4.14+ | Computer vision operations | Industry standard for image processing; extensive algorithm library; includes DNN module |
| FastAPI | 0.109+ | Catalog server | Already in codebase; async support; excellent for REST endpoints |

### Vision Model Integration

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| anthropic | 0.40+ | Claude Vision API | Already in codebase; excellent visual understanding; supports image analysis |
| openai | 1.10+ | GPT-4 Vision API | Alternative VLM with strong image analysis; good for cross-validation |
| numpy | 1.24+ | Numerical operations for image data | Already in codebase; foundation for most image processing; highly optimized |
| scipy | 1.12+ | Scientific computing (ndimage.label) | Used for diff region detection in v1.1 |

### Supporting Libraries

| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| rich | 13.7+ | Terminal UI for progress feedback | When building visual installer with CLI progress bars |
| pydantic | 2.5+ | Data validation for metadata | Already in codebase; validate vision model responses |
| httpx | 0.24+ | Async HTTP for vision APIs | Already in codebase dependency via anthropic; async support |
| aiofiles | 23.2+ | Async file operations | Use when building async FUSE filesystem or installer |
| reedsolo | 1.7.0+ | Reed-Solomon error correction | PixelRTS v2 encoding/decoding |

### Development Tools

| Tool | Purpose | Notes |
|------|---------|-------|
| pytest | 7.4+ | Testing framework | Already in codebase; use for FUSE and vision tests |
| pytest-asyncio | 0.21+ | Async test support | Required for pyfuse3 testing |
| pytest-benchmark | 4.0+ | Performance benchmarking | Already in requirements.txt |
| mypy | 1.5+ | Type checking | Already in codebase; essential for FUSE type safety |

---

## Part 2: NEW Stack for v1.2 Network Boot (NETWORK-01, NETWORK-02)

*Research date: 2026-03-08*

### Core Technologies for Network Boot

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| tftpy | 0.8.6 | TFTP server for PXE boot | Pure Python, RFC 1350/2347/2348/2349 compliant, MIT license, active maintenance. Provides TftpServer class with configurable timeout and retry handling. |
| nbdkit | 1.40+ | NBD server with Python plugins | Industry-standard NBD server (Red Hat maintained), Python plugin API (API_VERSION=2), supports streaming and on-demand data serving from .rts.png containers. |
| pyrsync2 | 0.2.6 | Delta-based binary diff | Pure Python rsync algorithm implementation, MIT license. Provides blockchecksums(), rsyncdelta(), patchstream() for bandwidth-efficient updates. |
| bsdiff | 4.3 (C lib) | Binary diff/patch (alternative) | BSD 2-clause license, single .c file embeddable. Smaller deltas than rsync for large binary changes. Requires ctypes/cffi bindings. |

### Supporting Libraries for Network Boot

| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| dnspython | 2.6+ | DNS/DHCP integration helpers | For parsing DHCP options, DNS lookups for boot server discovery. Not a DHCP server itself. |
| construct | 2.10+ | Binary protocol parsing | For NBD protocol frame parsing if implementing custom NBD client features. |
| pyroute2 | 0.7+ | Network configuration | For dynamic network interface setup during PXE boot server initialization. |

### Development Tools for Network Boot

| Tool | Purpose | Notes |
|------|---------|-------|
| nbdkit-python-plugin | NBD Python binding | Part of nbdkit package, enables Python-based block device serving |
| qemu-nbd | NBD testing | QEMU tool for testing NBD exports, validating server implementation |

---

## Installation

### Core (v1.0/v1.1)

```bash
# Core FUSE and vision libraries
pip install pyfuse3>=3.4.0 opencv-python>=4.14.0 anthropic>=0.40.0

# Already in codebase - verify versions
pip install "pillow>=12.1.0" "numpy>=1.24.0" "pydantic>=2.5.0" "httpx>=0.24.0"

# For installer UI
pip install "rich>=13.7.0"

# For async file operations
pip install "aiofiles>=23.2.0"

# Testing
pip install "pytest>=7.4.0" "pytest-asyncio>=0.21.0"
```

**System dependencies for FUSE:**
```bash
# Ubuntu/Debian
sudo apt-get install libfuse3-dev fuse3

# Alpine Linux
sudo apk add fuse3-dev fuse3
```

### Network Boot (v1.2 NEW)

```bash
# Core
pip install tftpy==0.8.6
pip install pyrsync2==0.2.6
pip install dnspython>=2.6.0

# NBD server (system package)
# Ubuntu/Debian:
sudo apt install nbdkit nbdkit-python-plugin

# Fedora/RHEL:
sudo dnf install nbdkit nbdkit-python-plugin

# Optional: bsdiff (if choosing C-based delta)
pip install bsdiff4  # Pre-built bindings
# OR compile from source for embed
```

---

## Alternatives Considered

### v1.0/v1.1 Alternatives

| Recommended | Alternative | When to Use Alternative |
|-------------|-------------|-------------------------|
| pyfuse3 | llfuse | Only if you need Python 2.7 support (deprecated) or legacy libfuse2 |
| pyfuse3 | fusepy | Only if you need pure Python implementation without libfuse3 dependency |
| anthropic | openai | When you need GPT-4o specifically or cross-validation between models |
| Claude Vision | GPT-4 Vision | When cost is a concern (GPT-4o is cheaper but less capable visually) |
| rich | tqdm | When you only need simple progress bars (rich provides full TUI) |
| OpenCV | scikit-image | When you need scientific image processing algorithms vs computer vision |

### v1.2 Network Boot Alternatives

| Recommended | Alternative | When to Use Alternative |
|-------------|-------------|-------------------------|
| tftpy | pyftpdlib TFTP | pyftpdlib is heavier (FTP-focused). Use only if already using pyftpdlib for FTP. |
| tftpy | dnsmasq (external) | Use dnsmasq for production deployments with complex DHCP/TFTP integration. tftpy for embedded/self-contained. |
| nbdkit | qemu-nbd | qemu-nbd is client-only. Use nbdkit for server implementation. |
| pyrsync2 | bsdiff4 | Use bsdiff4 when deltas are larger (full OS image updates). pyrsync2 for incremental block-level changes. |
| pyrsync2 | xdelta3 | xdelta3 has better compression for similar binary data. Use if delta size is critical. |

---

## What NOT to Use

### v1.0/v1.1

| Avoid | Why | Use Instead |
|-------|-----|-------------|
| python-fuse (libfuse2 bindings) | Deprecated; libfuse2 is EOL; no async support | pyfuse3 (libfuse3) |
| PIL (original) | Abandoned in 2009; no Python 3 support | Pillow (active fork) |
| OpenCV 2.x or 3.x | End-of-life; missing modern features; security issues | OpenCV 4.14+ |
| synchronous vision APIs | Blocks event loop; poor UX for installer operations | Use async anthropic/openai clients |
| raw subprocess calls to QEMU | Fragile; poor error handling; hard to test | Use existing QEMU wrapper patterns from codebase |

### v1.2 Network Boot (NEW)

| Avoid | Why | Use Instead |
|-------|-----|-------------|
| rsync (full package) | Requires subprocess, heavy dependencies, overkill for byte-level delta | pyrsync2 (pure Python algorithm) |
| dnsmasq Python wrappers | Unstable APIs, subprocess management complexity | tftpy + separate dnsmasq OR embedded DHCP via scapy |
| pure-Python NBD servers (nbd.py, etc.) | Immature, unmaintained, performance issues | nbdkit with Python plugin (industry standard) |
| PIL/Pillow for binary diff | Not designed for binary comparison, memory-inefficient | pyrsync2 or bsdiff4 |
| HTTP-based boot (HTTPBoot) | Requires UEFI 2.5+, more complex than PXE | PXE/TFTP for broad compatibility |
| NFS root filesystem | Adds complexity, not needed for kernel/initrd boot | NBD for block device, TFTP for kernel/initrd |

---

## Stack Patterns by Variant

### v1.0/v1.1 Patterns

**If building FUSE filesystem for direct PNG boot:**
- Use pyfuse3 with async/await
- Implement lazy loading (decode on read, not on mount)
- Cache decoded chunks to avoid repeated PNG decoding
- Because PNG decoding is CPU-intensive and FUSE operations should be fast

**If building vision-based OS detection:**
- Use Claude Vision API (anthropic) with structured prompts
- Extract metadata from PNG tEXt chunks first (fallback to vision)
- Use OpenCV for pre-processing (resize, entropy analysis)
- Because vision models have size limits and token costs

**If building visual installer:**
- Use rich for terminal UI with progress bars and live status
- Implement checkpoint/resume capability (install state persistence)
- Use async I/O for disk operations
- Because OS installation can take minutes and users need visibility

**If building thumbnail gallery:**
- Use Pillow thumbnail() method (efficient, preserves aspect ratio)
- Cache thumbnails in ~/.cache/pixelrts/
- Use rich for TUI or FastAPI for web interface
- Because generating thumbnails on-demand is slow

### v1.2 Network Boot Patterns (NEW)

**If embedding boot server in .rts.png container:**
- Use tftpy (pure Python, no system dependencies)
- Use pyrsync2 (pure Python delta)
- Bootstrap from initramfs

**If production deployment with existing infrastructure:**
- Use dnsmasq (system package) for TFTP+DHCP
- Use nbdkit for NBD serving
- Integrate via FastAPI catalog server

**If delta size is critical (slow networks):**
- Use bsdiff4 instead of pyrsync2
- Trade-off: slower delta generation, smaller deltas
- Pre-compute deltas on catalog server

---

## Version Compatibility

### v1.0/v1.1

| Package A | Compatible With | Notes |
|-----------|-----------------|-------|
| pyfuse3 3.4.0+ | Python 3.8+, libfuse3 3.2+ | Requires fuse3 kernel module (Linux 4.20+) |
| Pillow 12.1.0 | Python 3.9+, numpy 1.24+ | Released 2026-01-02, latest stable |
| OpenCV 4.14+ | Python 3.8+, numpy 1.24+ | Pre-built wheels available for most platforms |
| anthropic 0.40+ | Python 3.9+, httpx 0.24+ | Async client requires Python 3.9+ |
| rich 13.7+ | Python 3.8+ | Optional dependency for installer UI |
| scipy 1.12+ | Python 3.9+, numpy 1.24+ | Required for v1.1 diff region detection |

### v1.2 Network Boot (NEW)

| Package A | Compatible With | Notes |
|-----------|-----------------|-------|
| tftpy 0.8.6 | Python 3.8+ | Pure Python, no native deps |
| nbdkit 1.40+ | Python 3.6+ (via python plugin) | Requires nbdkit-python-plugin package |
| pyrsync2 0.2.6 | Python 3.6+ | Pure Python |
| dnspython 2.6+ | Python 3.8+ | No compatibility issues known |

---

## Integration with Existing Stack (v1.2)

### FastAPI Catalog Server
```
/catalog/{id}/boot     -> Start TFTP server, serve kernel/initrd
/catalog/{id}/nbd      -> Start nbdkit with Python plugin
/catalog/{id}/delta/{old_id} -> Generate pyrsync2 delta
```

### FUSE Filesystem (MountHelper)
```
MountHelper mounts .rts.png
nbdkit Python plugin reads from mount point
NBD clients see block device
```

### QEMU Integration
```bash
# Boot from network (PXE)
qemu-system-x86_64 -boot n -netdev user,id=net0,tftp=/boot,bootfile=pxelinux.0

# Boot from NBD
qemu-system-x86_64 -drive file=nbd://localhost:10809/rtspng,format=raw
```

### Architecture Notes

#### TFTP Server Flow
```
1. FastAPI endpoint receives boot request
2. tftpy.TftpServer starts on port 69
3. MountHelper exposes kernel/initrd from .rts.png
4. TFTP serves files from mount point
5. Client PXE boots
```

#### NBD Server Flow
```
1. nbdkit loads Python plugin
2. Plugin's pread() reads from MountHelper-exposed .rts.png
3. NBD protocol serves block device
4. QEMU or Linux nbd client connects
5. Block device appears as /dev/nbd0
```

#### Delta Update Flow
```
1. Client has old.rts.png, wants new.rts.png
2. Client computes pyrsync2 blockchecksums(old)
3. Server computes rsyncdelta(checksums, new)
4. Server sends delta (only changed blocks)
5. Client patches: patchstream(old, delta) -> new
```

---

## Sources

### v1.0/v1.1 Sources

- **pyfuse3** — Official documentation at https://pyfuse3.readthedocs.io/ (HIGH confidence)
- **Pillow** — Official docs at https://pillow.readthedocs.io/en/stable/ (HIGH confidence)
- **OpenCV** — Official docs at https://docs.opencv.org/4.x/ (HIGH confidence)
- **anthropic-sdk-python** — GitHub repository at https://github.com/anthropics/anthropic-sdk-python (HIGH confidence)
- **FUSE in Python guide (2024)** — Gunnar Wolf's guide: https://gwolf.org/2024/10/started-a-guide-to-writing-fuse-filesystems-in-python.html (MEDIUM confidence)
- **Deep learning binary analysis (2026)** — arXiv paper: https://arxiv.org/html/2601.09157v1 (MEDIUM confidence - vision approaches for binary analysis)
- **WebSearch 2026 results** — Computer vision for boot screen/logo detection, FUSE best practices (LOW confidence - verify with implementation)

### v1.2 Network Boot Sources (NEW)

- **tftpy PyPI** (https://pypi.org/project/tftpy/) — HIGH confidence, official source
- **pyrsync2 PyPI** (https://pypi.org/project/pyrsync2/) — HIGH confidence, official source
- **nbdkit Python Plugin Docs** (https://libguestfs.org/nbdkit-python-plugin.3.html) — HIGH confidence, official docs
- **bsdiff GitHub** (https://github.com/mendsley/bsdiff) — HIGH confidence, upstream source
- **dnspython PyPI** — HIGH confidence, official source

---
*Stack research for: PixelRTS v1.0/v1.1 (Vision Boot) + v1.2 (Network Boot)*
*Original research: 2026-02-11*
*Network boot research: 2026-03-08*
