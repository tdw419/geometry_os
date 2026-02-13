# External Integrations

**Analysis Date:** 2026-02-11

## APIs & External Services

**LLM/Vision APIs:**
- **Anthropic Claude** - Vision model analysis for PixelRTS artifacts
  - SDK/Client: `anthropic>=0.40.0` (Python)
  - Auth: `ANTHROPIC_API_KEY` env var
  - Usage: `/systems/pixel_compiler/vision_model_client.py`
  - Models: claude-3-opus-20240229, claude-3.5-sonnet, etc.

- **OpenAI GPT-4 Vision** - Alternative vision model provider
  - SDK/Client: `openai>=1.10.0` (Python)
  - Auth: `OPENAI_API_KEY` env var
  - Usage: `/systems/pixel_compiler/vision_model_client.py`
  - Models: gpt-4-vision-preview

- **LM Studio** - Local vision model inference
  - Client: Custom HTTP client (`requests`)
  - Endpoint: `http://localhost:1234/v1` (default)
  - Usage: `/systems/pixel_compiler/vision_model_client.py`
  - No API key required for local mode

**AI Project Management:**
- **Claude Agent SDK** - AI agent orchestration
  - Usage: `/automaker/` (monorepo)
  - Supports model alias resolution (haiku, sonnet, opus)

## Data Storage

**Databases:**
- **SQLite** - Primary local database
  - Location: Multiple `.db` files throughout project
  - Usage: `/data/vectoros.db`, `/access_audit.db`, `/.ai-pm-questions.db`
  - Client: Python `sqlite3` stdlib, `sqlalchemy` 2.0+ (ORM)

- **LanceDB** - Vector database for RAG/knowledge
  - Connection: Local filesystem at `/data/vector_db`
  - Client: `lancedb` Python package
  - Usage: `/systems/research/knowledge_daemon.py`, `/systems/rag/ingest.py`

- **FAISS** - Vector similarity search (dependency of sentence-transformers)
  - Usage: Embedding-based semantic search in RAG module
  - Access: Via sentence-transformers package

**File Storage:**
- Local filesystem with project-organized directories:
  - `/data/` - Genomes, roadmaps, synthetic data
  - `/.automaker/` - Per-project AI agent data
  - `/data/vector_db/` - LanceDB persistence
  - PixelRTS cartridges as PNG files (`.rts.png`)

**Caching:**
- `.pixelrts_cache/` - PixelRTS compilation cache
- `__pycache__/` - Python bytecode cache
- `target/` - Rust build artifacts

## Authentication & Identity

**Auth Provider:**
- **Custom API Key Management** - Built-in authentication system
  - Implementation: `/systems/pixel_compiler/auth/api_keys.py`
  - Features:
    - SHA256 key hashing
    - Prefix: `prts_` + 32 random bytes
    - Rate limiting per key
    - Permission-based access control
  - Storage: JSON file or database (configurable)

**Rate Limiting:**
- **Sliding Window Rate Limiter** - Built-in rate limiting
  - Implementation: `/systems/pixel_compiler/auth/rate_limiter.py`
  - Per-client request tracking
  - Configurable limits and windows

## Monitoring & Observability

**Error Tracking:**
- Structured logging via `structlog>=23.1.0`
- JSON output format for log aggregation

**Logs:**
- Structured logging with context
- Separate log files for different components
- Health check endpoints: `/.github/workflows/health-check.yml`

**Performance Monitoring:**
- `prometheus-client>=0.17.0` - Metrics collection
- `psutil>=5.9.0` - System resource monitoring
- `memory-profiler>=0.61.0` - Memory profiling

## CI/CD & Deployment

**Hosting:**
- GitHub Actions for CI/CD
- Docker containers for build/test environments
- Ubuntu 22.04 base images

**CI Pipeline:**
- GitHub Actions workflows in `/.github/workflows/`:
  - `ci.yml` - Main CI pipeline
  - `integration-tests.yml` - Integration tests
  - `performance-benchmarks.yml` - Performance benchmarking
  - `security.yml` - Security scanning
  - `multi-platform.yml` - Cross-platform testing
  - `nightly.yml` - Nightly builds
  - `release.yml` - Release automation

**Local Development:**
- Docker Compose for multi-service orchestration
  - Services: build, test, benchmark, docs, dev, ci
  - X11 forwarding for GUI applications
  - Network: vectoros-network

## Environment Configuration

**Required env vars:**
- `ANTHROPIC_API_KEY` - Anthropic Claude API access
- `OPENAI_API_KEY` - OpenAI API access (optional, for alternative provider)
- `LM_STUDIO_API_KEY` - LM Studio (optional, typically empty for local)
- `DISPLAY` - X11 display for GUI apps (Docker)
- `XAUTHORITY` - X11 authentication (Docker)

**Secrets location:**
- `.env` files (not committed, template: `.env.local.example.template`)
- `data/credentials.json` (AI project management global data)
- `./data/settings.json` - Global settings including API keys

## Webhooks & Callbacks

**Incoming:**
- FastAPI endpoints in `/systems/pixel_compiler/api/`:
  - `POST /api/v1/analyze` - Single image analysis
  - `POST /api/v1/batch` - Batch processing
  - `GET /health` - Health check
  - `GET /api/v1/models` - Available models

**Outgoing:**
- HTTP requests to LLM APIs (Anthropic, OpenAI, LM Studio)
- No webhook callbacks currently implemented

## Graphics & GPU

**WebGPU Integration:**
- **wgpu-native** - Native WebGPU implementation
  - Python: `wgpu` package
  - Rust: `wgpu` crate 0.17-0.19
  - Fallback: Mock mode for testing without GPU

**Shader Languages:**
- **WGSL (WebGPU Shading Language)** - Primary shader language
  - Location: `/systems/pixel_compiler/*.wgsl`, `/pixelrts_v2/shaders/*.wgsl`
  - Key shader: `/pixelrts_v2/shaders/wasm_vm.wgsl` (WASM VM on GPU)

**Graphics Libraries:**
- `naga` - Shader compiler/translator (Rust)
- `smithay` - Wayland compositor framework (vectorland)
- `pixi.js` - Web graphics rendering (pixel_text_editor)

## System Integration

**QEMU Integration:**
- QEMU for virtualization testing
  - Location: `/systems/virtualization/pixel_qemu_v2.py`
  - GPU passthrough support: `gpu_qemu.py`

**Linux Kernel Integration:**
- RISC-V toolchain for cross-compilation
  - Location: `/riscv-gnu-toolchain/`
  - Makefile-based build system

**FUSE Integration:**
- FUSE filesystems for RTS mount
  - Location: `/systems/rts_fuse/`

## MCP (Model Context Protocol)

**MCP Integration:**
- MCP client support in ai_project_management
  - Optional dependency: `mcp>=0.9.0`
  - Usage: External tool integration

---
*Integration audit: 2026-02-11*
