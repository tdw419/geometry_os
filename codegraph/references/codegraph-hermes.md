# CodeGraph for Hermes Agent

CodeGraph pre-indexes codebases into a SQLite knowledge graph using tree-sitter parsing. Exposes MCP tools for instant code understanding — no grep/read loops needed.

## Key Metrics

**v0.9.6** (as of May 2026), installed via `npm i -g @colbymchenry/codegraph`

| Metric | Value |
|--------|-------|
| Index speed | ~976 files / 5.9s (Geometry OS: 799 Rust + 122 Python + 55 C) |
| DB size | ~32 MB for 14K nodes / 48K edges |
| Runtime | Bundled Node.js, no native compile, ~self-contained binary |
| Platforms | Linux x64/arm64, macOS x64/arm64, Windows x64/arm64 |
| License | MIT |

## Supported Languages

| Language | Extension | Status |
|----------|-----------|--------|
| TypeScript | .ts, .tsx | Full |
| JavaScript | .js, .jsx, .mjs | Full |
| Python | .py | Full |
| Go | .go | Full |
| Rust | .rs | Full |
| Java | .java | Full |
| C# | .cs | Full |
| PHP | .php | Full |
| Ruby | .rb | Full |
| C | .c, .h | Full |
| C++ | .cpp, .hpp, .cc | Full |
| Objective-C | .m, .mm, .h | Partial |
| Swift | .swift | Full |
| Kotlin | .kt, .kts | Full |
| Scala | .scala, .sc | Full |
| Dart | .dart | Full |
| Svelte | .svelte | Full |
| Vue | .vue | Full |
| Lua/Luau | .lua, .luau | Full |
| Pascal/Delphi | .pas, .dpr, .dpk, .lpr | Full |

## Benchmarks (Claude Opus 4.7, headless, median of 4 runs)

| Codebase | Lang | Cost | Tokens | Time | Tool calls |
|----------|------|------|--------|------|------------|
| VS Code (10K files) | TS | 26% cheaper | 78% fewer | 52% faster | 85% fewer |
| Excalidraw (640) | TS | 52% cheaper | 90% fewer | 73% faster | 96% fewer |
| Django (3K) | Python | 12% cheaper | 36% fewer | 19% faster | 53% fewer |
| Tokio (790) | Rust | 82% cheaper | 86% fewer | 71% faster | 92% fewer |
| OkHttp (645) | Java | 2% cheaper | 13% fewer | 31% faster | 45% fewer |
| Gin (110) | Go | 21% cheaper | 34% fewer | 27% faster | 40% fewer |
| Alamofire (110) | Swift | 47% cheaper | 64% fewer | 48% faster | 83% fewer |

**Average: 35% cheaper, 57% fewer tokens, 46% faster, 71% fewer tool calls**

Gains scale with codebase size. On small repos (<200 files) native search is already cheap so margin narrows.

## MCP Tools

| Tool | Purpose |
|------|---------|
| codegraph_search | Find symbols by name |
| codegraph_context | Build relevant context for a task (entry points + related symbols + source) |
| codegraph_trace | Trace call path between two symbols (follows dynamic dispatch) |
| codegraph_callers | Find what calls a function |
| codegraph_callees | Find what a function calls |
| codegraph_impact | Analyze what's affected by changing a symbol |
| codegraph_node | Get a single symbol's source/signature |
| codegraph_explore | Multiple related symbols + relationship map in one call |
| codegraph_files | Indexed file structure (faster than filesystem scan) |
| codegraph_status | Index health and statistics |

## Key Features

- **Auto-sync**: Native inotify/FSEvents file watcher, debounced (default 2s), incremental re-index
- **Per-file staleness**: During debounce, MCP responses prepend banners for pending files
- **Connect-time catch-up**: Full (size, mtime, content-hash) reconciliation on MCP reconnection
- **Default exclusions**: node_modules, vendor, dist, build, target, .venv, Pods, .next, .gitignore, files >1MB
- **Framework-aware routes**: Django path(), Flask/FastAPI decorators, Express/NestJS routers, Gin/chi handlers, Spring annotations, ASP.NET, Laravel, Rails, Axum/actix/Rocket, Vapor, React Router, SvelteKit
- **Cross-language bridges**: Swift-ObjC, React Native legacy bridge + TurboModules, native→JS events, Expo Modules, Fabric/Paper views

## CLI Commands

```bash
codegraph                           # Interactive installer
codegraph install                   # Run installer explicitly
codegraph install --print-config hermes  # Show Hermes config block
codegraph uninstall                 # Remove from configured agents
codegraph init [path]               # Init project (--index to also index)
codegraph uninit [path]             # Remove from project
codegraph index [path]              # Full index (--force to re-index)
codegraph sync [path]               # Incremental update
codegraph status [path]             # Show statistics
codegraph query <search>            # Search symbols (--kind, --limit, --json)
codegraph context <task>            # Build context for AI
codegraph callers <symbol>          # Find callers
codegraph callees <symbol>          # Find callees
codegraph impact <symbol>           # Impact analysis
codegraph affected [files...]       # Find affected test files
codegraph serve --mcp               # Start MCP server
```

## Installation Notes (Geometry OS, Linux x64)

- Node.js v24.13.0 (via nvm) present — npm global install worked
- `pip install mcp` not needed (codegraph bundles its own runtime)
- Index ran in 5.9s for 976 files — fast
- MCP daemon creates `.codegraph/daemon.sock` for shared process attachment
- Default timeout (120s) adequate; connect_timeout=60s
- Journal mode: WAL (node:sqlite built-in)

## Hermes MCP Config

```yaml
mcp_servers:
  codegraph:
    command: codegraph
    args:
      - serve
      - --mcp
    timeout: 120
    connect_timeout: 60
    enabled: true

platform_toolsets:
  cli:
    - hermes-cli
    - mcp-codegraph
```
