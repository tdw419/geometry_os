# ASCII-First Architecture

## Overview

The Session Analyzer uses an **ASCII-First Architecture** where ASCII text is the primary interface for the application. This design enables:

- **AI Agent Control**: LLMs can "see" and "interact" with the app via simple HTTP endpoints
- **Headless Operation**: The app works without any GUI
- **Universal Access**: Any tool that can make HTTP requests can control the app
- **Template-Driven Rendering**: All screens are defined as `.ascii` template files

## Core Concept

```
┌─────────────────────────────────────────────────────────────┐
│                    ASCII-First Architecture                  │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  ┌──────────────┐     ┌──────────────┐     ┌─────────────┐ │
│  │   AI Agent   │────▶│  HTTP API    │────▶│ State Store │ │
│  │  (LLM/MCP)   │     │  /view       │     │ (Singleton) │ │
│  └──────────────┘     │  /control    │     └─────────────┘ │
│         │             └──────────────┘            │         │
│         │                    │                    │         │
│         ▼                    ▼                    ▼         │
│  ┌──────────────┐     ┌──────────────┐     ┌─────────────┐ │
│  │  MCP Bridge  │     │  Templates   │     │   Core      │ │
│  │  (Optional)  │     │  .ascii files│     │  Business   │ │
│  └──────────────┘     └──────────────┘     │   Logic     │ │
│                                            └─────────────┘ │
│                    ┌──────────────┐                         │
│                    │  GUI (Optional)│                       │
│                    │  Mirrors State │                       │
│                    └──────────────┘                         │
└─────────────────────────────────────────────────────────────┘
```

## How It Works

### 1. State Store (Single Source of Truth)

The `AsciiStateStore` is the central state manager:

```typescript
// src/ascii/state/store.ts
export class AsciiStateStore {
  private _state: AsciiState = 'DASHBOARD'
  private _data: Partial<AsciiStateData> = {}
  private _listeners: Set<() => void> = new Set()

  // Transition to new state via label
  transition(label: string): boolean

  // Subscribe to state changes
  subscribe(listener: () => void): () => void

  // Get current state/data
  getState(): AsciiState
  getData(): Partial<AsciiStateData>
}
```

**Available States:**
- `DASHBOARD` - Main overview
- `SOURCES` - Analysis sources configuration
- `CONFIG` - Application settings
- `HISTORY` - Past analysis runs
- `PROVIDERS` - LLM provider configuration

### 2. Label-Based Navigation

All navigation uses single-character labels:

| Label | Action | Target State |
|-------|--------|--------------|
| `A` | Go to Dashboard | `DASHBOARD` |
| `B` | Go to Sources | `SOURCES` |
| `C` | Go to Config | `CONFIG` |
| `D` | Go to History | `HISTORY` |
| `E` | Go to Providers | `PROVIDERS` |
| `F` | Run Analysis | (action) |
| `G` | Export Report | (action) |
| `X` | Quit | (action) |

### 3. Template-Driven Rendering

Each state has an ASCII template file:

```
src/ascii/states/
├── dashboard.ascii
├── sources.ascii
├── config.ascii
├── history.ascii
└── providers.ascii
```

Templates use Mustache-style syntax:

```
# State: DASHBOARD
# Generated: {{timestamp}}

+==========================================+
| SESSION ANALYZER v{{app_version}}          |
+==========================================+
| [A]Dashboard  [B]Sources  [C]Config       |
|              [D]History  [E]Providers     |
+==========================================+
| PROJECT                                   |
+------------------------------------------+
| Path:      {{project_path}}               |
| Last Run:  {{last_run}}                   |
| Runs Today: {{runs_today}}                |
+------------------------------------------+
```

### 4. HTTP API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/view` | GET | Returns rendered ASCII for current state |
| `/control` | POST | Execute action via `{ "label": "X" }` |
| `/state` | GET | Returns current state as JSON |
| `/bindings` | GET | Returns label-to-action mappings |
| `/metrics` | GET | Returns API performance metrics |
| `/health` | GET | Health check endpoint |

## Using the Interface

### For Humans (curl)

```bash
# See current screen
curl http://localhost:3421/view

# Navigate to Providers
curl -X POST http://localhost:3421/control \
  -H "Content-Type: application/json" \
  -d '{"label":"E"}'

# Navigate to Config
curl -X POST http://localhost:3421/control \
  -H "Content-Type: application/json" \
  -d '{"label":"C"}'

# Check performance
curl http://localhost:3421/metrics
```

### For AI Agents (via HTTP)

```typescript
// AI agent workflow
async function exploreApp() {
  // 1. Get current view
  const view = await fetch('http://localhost:3421/view').then(r => r.text())

  // 2. Parse available labels (look for [A], [B], etc.)
  const labels = view.match(/\[([A-Z])\]/g)

  // 3. Navigate to Providers
  await fetch('http://localhost:3421/control', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ label: 'E' })
  })

  // 4. Read the new view
  const providersView = await fetch('http://localhost:3421/view').then(r => r.text())
  console.log(providersView)
}
```

### For MCP Tools (via MCP Bridge)

```bash
# Via mcp2cli
mcp2cli --mcp-stdio "uv run mcp_ascii_bridge" ascii-view
mcp2cli --mcp-stdio "uv run mcp_ascii_bridge" ascii-navigate --target PROVIDERS
mcp2cli --mcp-stdio "uv run mcp_ascii_bridge" ascii-control --label E
```

## MCP Bridge

The MCP (Model Context Protocol) bridge exposes the ASCII interface to AI tools:

```python
# mcp_ascii_bridge/src/mcp_ascii_bridge/server.py

@app.list_tools()
async def list_tools():
    return [
        Tool(name="ascii_view", ...),      # Get current ASCII view
        Tool(name="ascii_control", ...),   # Execute label action
        Tool(name="ascii_navigate", ...),  # Navigate to state
        Tool(name="ascii_metrics", ...),   # Get performance data
        Tool(name="ascii_bindings", ...),  # Get label mappings
    ]
```

### Using with Claude Code

```bash
# In Claude Code, use the MCP tools:
# "Use the ascii_view tool to see the current state"
# "Navigate to the Providers tab using ascii_navigate"
# "What providers are available?"
```

## Architecture Layers

```
┌─────────────────────────────────────────────────────────────┐
│                      Presentation Layer                      │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │  GUI View   │  │  ASCII View │  │  MCP Bridge (MCP)   │  │
│  │ (Electron)  │  │  (HTTP API) │  │  (Python/stdio)     │  │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
├─────────────────────────────────────────────────────────────┤
│                       State Layer                            │
│  ┌─────────────────────────────────────────────────────┐    │
│  │              AsciiStateStore (Singleton)             │    │
│  │  - State: DASHBOARD | SOURCES | CONFIG | HISTORY    │    │
│  │  - Data: project info, runs, providers, etc.        │    │
│  │  - Subscribers: GUI, API, Templates                 │    │
│  └─────────────────────────────────────────────────────┘    │
├─────────────────────────────────────────────────────────────┤
│                      Template Layer                          │
│  ┌─────────────────────────────────────────────────────┐    │
│  │              AsciiGenerator (Renderer)               │    │
│  │  - Loads .ascii templates                            │    │
│  │  - Substitutes {{variables}}                         │    │
│  │  - Renders {{#each}} loops                           │    │
│  └─────────────────────────────────────────────────────┘    │
├─────────────────────────────────────────────────────────────┤
│                       Core Layer                             │
│  ┌────────────┐ ┌────────────┐ ┌────────────┐ ┌──────────┐  │
│  │ Providers  │ │  Scanner   │ │ Scheduler  │ │   LLM    │  │
│  │  Registry  │ │  (Sources) │ │  (Engine)  │ │  Client  │  │
│  └────────────┘ └────────────┘ └────────────┘ └──────────┘  │
└─────────────────────────────────────────────────────────────┘
```

## File Structure

```
session-analyzer-app/
├── src/
│   ├── core/                    # Business logic (presentation-agnostic)
│   │   ├── providers/           # LLM provider adapters
│   │   │   ├── registry.ts      # Provider registry singleton
│   │   │   ├── types.ts         # LLMProviderAdapter, ModelDefinition
│   │   │   └── *.ts             # Provider implementations
│   │   ├── scanner/             # Source scanning
│   │   ├── scheduler/           # Auto-scheduling engine
│   │   ├── config/              # Configuration management
│   │   ├── llm/                 # LLM client & prompts
│   │   └── index.ts             # Unified exports
│   │
│   ├── ascii/                   # ASCII interface (primary)
│   │   ├── state/
│   │   │   ├── store.ts         # AsciiStateStore (singleton)
│   │   │   └── types.ts         # AsciiState, AsciiStateData
│   │   ├── states/              # Template files
│   │   │   ├── dashboard.ascii
│   │   │   ├── sources.ascii
│   │   │   ├── config.ascii
│   │   │   ├── history.ascii
│   │   │   └── providers.ascii
│   │   └── bindings.json        # Label-to-action mappings
│   │
│   ├── bun/                     # Bun server
│   │   ├── index.ts             # Bootstrap & GUI setup
│   │   ├── api.ts               # HTTP API server
│   │   ├── ascii-generator.ts   # Template renderer
│   │   └── ascii-state-manager.ts # StateManager wrapper
│   │
│   └── mainview/                # GUI (optional mirror)
│       ├── index.html
│       ├── index.css
│       └── index.ts
│
├── mcp_ascii_bridge/            # MCP bridge (Python)
│   └── src/mcp_ascii_bridge/
│       └── server.py
│
└── tests/
    ├── ascii/state/             # Unit tests for state store
    ├── api/                     # Integration tests for HTTP API
    └── e2e/                     # E2E tests for MCP & LLM agents
```

## Data Flow

### User Action Flow

```
User clicks [E] Providers in GUI
         │
         ▼
POST /control {"label":"E"}
         │
         ▼
StateManager.handleAction("E")
         │
         ▼
AsciiStateStore.transition("E")
         │
         ├──► State changes: DASHBOARD → PROVIDERS
         │
         └──► Notify all subscribers
              │
              ├──► GUI updates tab highlight
              │
              └──► Next /view returns PROVIDERS template
```

### AI Agent Flow

```
AI Agent wants to explore providers
         │
         ▼
GET /view (sees [E] Providers label)
         │
         ▼
POST /control {"label":"E"}
         │
         ▼
GET /view (sees PROVIDERS state)
         │
         ▼
Parses available providers from ASCII
```

## Testing

### Unit Tests (State Machine)

```bash
bun test tests/ascii/state/store.test.ts
```

Tests:
- Initial state is DASHBOARD
- Transitions work for all labels
- Subscribers are notified
- Unsubscribe works
- State data persists

### Integration Tests (HTTP API)

```bash
bun test tests/api/integration.test.ts
```

Tests:
- `/view` returns valid ASCII
- `/control` transitions state
- `/metrics` returns performance data
- All 5 states are reachable

### E2E Tests (MCP Bridge)

```bash
# Start app first
bun run dev

# Run E2E tests
bun test tests/e2e/mcp-bridge.test.ts
```

Tests:
- MCP tools can get ASCII view
- MCP tools can navigate to all states
- Full agent workflow works
- Performance is acceptable (<100ms)

### LLM Agent Tests

```bash
# Start app first
bun run dev

# Run simulated agent tests
bun test tests/e2e/llm-agent.test.ts

# Run real Claude test (requires API key)
ANTHROPIC_API_KEY=sk-... bun test tests/e2e/llm-agent.test.ts
```

Tests:
- Agent can parse labels from ASCII
- Agent can detect current state
- Agent can navigate to target state
- Agent can complete multi-step tasks

## Performance

The ASCII interface is designed for sub-10ms latency:

| Endpoint | Typical Latency | Max Target |
|----------|-----------------|------------|
| `/view` | < 5ms | 10ms |
| `/control` | < 3ms | 10ms |
| `/metrics` | < 1ms | 5ms |
| `/health` | < 1ms | 5ms |

## Extending the Architecture

### Adding a New State

1. **Create template file:**
   ```
   src/ascii/states/newstate.ascii
   ```

2. **Add to state type:**
   ```typescript
   // src/ascii/state/types.ts
   export type AsciiState = 'DASHBOARD' | '...' | 'NEWSTATE'
   ```

3. **Add to bindings:**
   ```json
   // src/ascii/bindings.json
   {
     "stateTransitions": {
       "NEWSTATE": { "A": "DASHBOARD", ... }
     }
   }
   ```

4. **Add to AsciiGenerator:**
   ```typescript
   // src/bun/ascii-generator.ts
   const states = ['dashboard', ..., 'newstate']
   ```

### Adding a New Action

1. **Add to bindings:**
   ```json
   {
     "actions": {
       "Z": "myNewAction"
     }
   }
   ```

2. **Register handler:**
   ```typescript
   stateManager.registerActionHandler('myNewAction', async () => {
     // Do something
   })
   ```

## Design Principles

1. **ASCII is Source of Truth**: The ASCII view represents the complete state
2. **Labels are Universal**: Same labels work in GUI, API, and MCP
3. **Templates are Data-Driven**: All screens defined as templates with variables
4. **State is Centralized**: Single `AsciiStateStore` manages all state
5. **Core is Presentation-Agnostic**: Business logic doesn't know about ASCII or GUI
6. **Performance is Critical**: Sub-10ms response times for agent usability

## Troubleshooting

### App not responding to /view

```bash
# Check if app is running
curl http://localhost:3421/health

# Check if API server started
# Look for: "API Server started at http://localhost:3421"
```

### MCP bridge can't connect

```bash
# Verify app is running
curl http://localhost:3421/health

# Check MCP bridge path
export ASCII_API_URL=http://localhost:3421
```

### State not transitioning

```bash
# Check current state
curl http://localhost:3421/state

# Try direct label
curl -X POST http://localhost:3421/control \
  -H "Content-Type: application/json" \
  -d '{"label":"A"}'
```

## References

- [ASCII Template Syntax](./ascii-templates.md)
- [MCP Bridge Documentation](../mcp_ascii_bridge/README.md)
- [HTTP API Reference](./api.md)
- [Provider Configuration](./providers.md)
