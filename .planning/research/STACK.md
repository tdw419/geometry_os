# Stack Research

**Domain:** Vision-based OS Boot and Installation
**Researched:** 2026-02-11
**Confidence:** HIGH

## Recommended Stack

### Core Technologies

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| Python | 3.12+ | Primary implementation language | Already used in codebase; async/await support; excellent library ecosystem |
| PyFuse3 | 3.4.0+ | FUSE filesystem bindings | Modern async API for libfuse3; actively maintained; official docs at pyfuse3.readthedocs.io |
| Pillow | 12.1.0+ | PNG/image processing | Already used in PixelRTS v2; latest version (2026-01-02); mature and stable |
| OpenCV | 4.14+ | Computer vision operations | Industry standard for image processing; extensive algorithm library; includes DNN module |

### Vision Model Integration

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| anthropic | 0.40+ | Claude Vision API | Already in codebase; excellent visual understanding; supports image analysis |
| openai | 1.10+ | GPT-4 Vision API | Alternative VLM with strong image analysis; good for cross-validation |
| numpy | 1.24+ | Numerical operations for image data | Already in codebase; foundation for most image processing; highly optimized |

### Supporting Libraries

| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| rich | 13.7+ | Terminal UI for progress feedback | When building visual installer with CLI progress bars |
| pydantic | 2.5+ | Data validation for metadata | Already in codebase; validate vision model responses |
| httpx | 0.24+ | Async HTTP for vision APIs | Already in codebase dependency via anthropic; async support |
| aiofiles | 23.2+ | Async file operations | Use when building async FUSE filesystem or installer |

### Development Tools

| Tool | Purpose | Notes |
|------|---------|-------|
| pytest | 7.4+ | Testing framework | Already in codebase; use for FUSE and vision tests |
| pytest-asyncio | 0.21+ | Async test support | Required for pyfuse3 testing |
| mypy | 1.5+ | Type checking | Already in codebase; essential for FUSE type safety |

## Installation

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

## Alternatives Considered

| Recommended | Alternative | When to Use Alternative |
|-------------|-------------|-------------------------|
| pyfuse3 | llfuse | Only if you need Python 2.7 support (deprecated) or legacy libfuse2 |
| pyfuse3 | fusepy | Only if you need pure Python implementation without libfuse3 dependency |
| anthropic | openai | When you need GPT-4o specifically or cross-validation between models |
| Claude Vision | GPT-4 Vision | When cost is a concern (GPT-4o is cheaper but less capable visually) |
| rich | tqdm | When you only need simple progress bars (rich provides full TUI) |
| OpenCV | scikit-image | When you need scientific image processing algorithms vs computer vision |

## What NOT to Use

| Avoid | Why | Use Instead |
|-------|-----|-------------|
| python-fuse (libfuse2 bindings) | Deprecated; libfuse2 is EOL; no async support | pyfuse3 (libfuse3) |
| PIL (original) | Abandoned in 2009; no Python 3 support | Pillow (active fork) |
| OpenCV 2.x or 3.x | End-of-life; missing modern features; security issues | OpenCV 4.14+ |
| synchronous vision APIs | Blocks event loop; poor UX for installer operations | Use async anthropic/openai clients |
| raw subprocess calls to QEMU | Fragile; poor error handling; hard to test | Use existing QEMU wrapper patterns from codebase |

## Stack Patterns by Variant

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

## Version Compatibility

| Package A | Compatible With | Notes |
|-----------|-----------------|-------|
| pyfuse3 3.4.0+ | Python 3.8+, libfuse3 3.2+ | Requires fuse3 kernel module (Linux 4.20+) |
| Pillow 12.1.0 | Python 3.9+, numpy 1.24+ | Released 2026-01-02, latest stable |
| OpenCV 4.14+ | Python 3.8+, numpy 1.24+ | Pre-built wheels available for most platforms |
| anthropic 0.40+ | Python 3.9+, httpx 0.24+ | Async client requires Python 3.9+ |
| rich 13.7+ | Python 3.8+ | Optional dependency for installer UI |

## Sources

- **pyfuse3** — Official documentation at https://pyfuse3.readthedocs.io/ (HIGH confidence)
- **Pillow** — Official docs at https://pillow.readthedocs.io/en/stable/ (HIGH confidence)
- **OpenCV** — Official docs at https://docs.opencv.org/4.x/ (HIGH confidence)
- **anthropic-sdk-python** — GitHub repository at https://github.com/anthropics/anthropic-sdk-python (HIGH confidence)
- **FUSE in Python guide (2024)** — Gunnar Wolf's guide: https://gwolf.org/2024/10/started-a-guide-to-writing-fuse-filesystems-in-python.html (MEDIUM confidence)
- **Deep learning binary analysis (2026)** — arXiv paper: https://arxiv.org/html/2601.09157v1 (MEDIUM confidence - vision approaches for binary analysis)
- **WebSearch 2026 results** — Computer vision for boot screen/logo detection, FUSE best practices (LOW confidence - verify with implementation)

---
*Stack research for: Vision-based OS Boot and Installation*
*Researched: 2026-02-11*
