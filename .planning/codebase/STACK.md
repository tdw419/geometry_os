# Technology Stack

**Analysis Date:** 2026-02-11

## Languages

**Primary:**
- Python 3.8+ (Primary systems language, target: 3.11+) - Core systems, daemons, AI/ML, transpilation
- Rust 2021 Edition - Performance-critical components, GPU bridges, WASM runtime

**Secondary:**
- TypeScript 5.9 - Frontend UI, automaker web application
- JavaScript (ES2022+) - Node.js services, web interfaces
- WGSL (WebGPU Shading Language) - GPU compute shaders
- C/C++ - Low-level system components, QEMU integration
- WebAssembly (WASM) - Portable binary execution format

## Runtime

**Environment:**
- Linux (Ubuntu 22.04 base, supports various distributions)
- WebGPU/WGSL for GPU compute (via wgpu-py, wgpu-rs)
- Docker containers for CI/CD and development

**Package Manager:**
- Python: pip with pyproject.toml/requirements.txt
- Rust: cargo with workspace workspaces
- Node.js: npm with workspaces (automaker monorepo)
- Lockfiles: present (poetry.lock for some Python, package-lock.json for npm)

## Frameworks

**Core:**
- wgpu-py (Python WebGPU bindings) - GPU compute execution
- wgpu-rs 0.17-0.19 (Rust WebGPU bindings) - GPU compute
- Pydantic 2.5+ - Data validation and settings management
- FastAPI 0.103+ - REST API services

**Testing:**
- pytest 7.4+ with pytest-asyncio, pytest-cov, pytest-mock, pytest-benchmark
- Vitest 4.0+ (JavaScript/TypeScript testing)
- Playwright (E2E testing for automaker)

**Build/Dev:**
- setuptools with pyproject.toml (Python packaging)
- cargo with workspace (Rust packaging)
- Vite 7.2+ (JavaScript/TypeScript bundler)
- CMake (C/C++ build system)
- Make (unified build orchestration)

## Key Dependencies

**Critical:**
- wgpu (Python/Rust) - WebGPU bindings for GPU compute execution
- wasmtime 28.0 (Rust) - WASM runtime
- numpy 1.24+ - Numerical computations
- Pillow 10.0+ - Image processing (PNG encoding/decoding for PixelRTS)
- requests 2.31+ - HTTP client for LLM APIs

**Infrastructure:**
- fast-hilbert 1.0 - Hilbert curve spatial mapping (Rust)
- structlog 23.1+ - Structured logging
- pyyaml 6.0+ - YAML configuration
- aiohttp 3.8+ - Async HTTP operations
- jinja2 3.1+ - Template rendering
- sqlalchemy 2.0+ - Database ORM (planned/future)

**AI/ML Integration:**
- anthropic 0.40+ - Anthropic Claude API client
- openai 1.10+ - OpenAI API client
- lancedb - Vector database for RAG/knowledge storage
- sentence-transformers - Embeddings (in RAG module)

**Graphics:**
- image 0.24/0.25 (Rust) - Image loading/processing
- naga 0.13 - Shader compiler/translator
- pixi.js 7.3.2 - Web graphics rendering (pixel_text_editor)
- framer-motion 12.24+ - React animations (visualizer)

**Developer Tools:**
- black 23.7+ - Python code formatting
- flake8 6.0+ - Python linting
- mypy 1.5+ - Python type checking
- ruff 0.1+ - Fast Python linter
- bandit - Security scanning
- safety - Dependency vulnerability checking

## Configuration

**Environment:**
- YAML-based configuration (config.yaml)
- Environment variables (.env files)
- TOML for Python project configuration (pyproject.toml)

**Build:**
- Makefile at root for unified build orchestration
- Individual component Makefiles (riscv-gnu-toolchain, llama.cpp)
- CMakeLists.txt for C++ components
- Dockerfile and docker-compose.yml for containerized builds

**CI/CD:**
- GitHub Actions workflows in `.github/workflows/`:
  - ci.yml - Main CI pipeline
  - integration-tests.yml - Integration test suite
  - performance-benchmarks.yml - Performance benchmarking
  - security.yml - Security scanning
  - health-check.yml - System health monitoring

## Platform Requirements

**Development:**
- Python 3.8+ (3.11+ recommended for ai_project_management)
- Node.js 22.0+ (automaker)
- Rust stable toolchain (2021 edition)
- C/C++ compiler (clang, gcc)
- CMake 3.x+
- Git

**Production:**
- Linux-based OS (Ubuntu 22.04 reference)
- GPU with WebGPU support (for GPU compute features)
- Docker (for containerized deployment)
- Minimum 4GB RAM (8GB+ recommended for development)

## Specialized Subsystems

**PixelRTS v2:**
- PNG-based cartridge format with tEXt chunk metadata
- Hilbert curve spatial mapping
- RGBA dense packing for binary data storage

**WASM GPU Bridge:**
- WebGPU compute shader-based WASM VM
- WGSL shader: `/pixelrts_v2/shaders/wasm_vm.wgsl`
- Bridge modules: `systems/pixel_compiler/wasm_gpu_bridge.py`

**AI Project Management:**
- MCP (Model Context Protocol) integration
- OpenSpec daemon integration
- Git worktree isolation for feature execution

**Transpilation:**
- x86 to VASM (visual assembly) transpiler
- WASM binary extraction and analysis
- GPU execution bridge for WASM

---
*Stack analysis: 2026-02-11*
