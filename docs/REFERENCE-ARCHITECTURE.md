# Session Analyzer App - Reference Architecture

> This document serves as a reference for building ASCII-First applications with autonomous agent control.

## Overview

The session-analyzer-app implements an **ASCII-First Architecture** where the primary interface is a terminal-style ASCII grid (80x24) that can be rendered by any client (GUI, CLI, AI via MCP). This enables AI agents to control the application through simple label-based commands without understanding complex GUI semantics.

---

## File Structure

```
apps/session-analyzer-app/
├── src/
│   ├── core/                      # Business logic (presentation-agnostic)
│   │   ├── index.ts               # Core exports
│   │   ├── config/
│   │   │   ├── ConfigManager.ts   # Config persistence, profiles
│   │   │   ├── defaults.ts        # DEFAULT_CONFIG
│   │   │   ├── providers.ts       # BUILTIN_PROVIDERS
│   │   │   ├── types.ts           # AppConfig, ModelConfig, etc.
│   │   │   └── validator.ts       # validateConfig()
│   │   ├── providers/
│   │   │   ├── registry.ts        # providerRegistry singleton
│   │   │   ├── types.ts           # LLMProviderAdapter interface
│   │   │   └── *.ts               # Provider adapters (openai, anthropic, etc.)
│   │   ├── scanner/
│   │   │   └── SourceScanner.ts   # Scan sources for TODOs/FIXMEs
│   │   ├── scheduler/
│   │   │   └── SchedulerEngine.ts # Periodic analysis runner
│   │   └── llm/
│   │       ├── LLMClient.ts       # Complete/stream calls
│   │       └── PromptGenerator.ts # Build analysis prompts
│   │
│   ├── ascii/                     # ASCII-First state machine
│   │   ├── state/
│   │   │   ├── store.ts           # AsciiStateStore (singleton)
│   │   │   └── types.ts           # AsciiState, BindingConfig
│   │   ├── states/
│   │   │   └── *.ascii            # Template files per state
│   │   └── bindings.json          # Label-to-action mappings
│   │
│   ├── bun/                       # Presentation layer
│   │   ├── index.ts               # Main entry, RPC handlers
│   │   ├── api.ts                 # HTTP API server (port 3421)
│   │   ├── ascii-generator.ts     # Template rendering engine
│   │   ├── ascii-state-manager.ts # Wrapper around AsciiStateStore
│   │   └── *.ts                   # Other utilities
│   │
│   └── mainview/                  # GUI frontend (optional)
│
├── mcp_ascii_bridge/              # Python MCP server
│   └── src/mcp_ascii_bridge/
│       └── server.py              # MCP tools: ascii_view, ascii_control
│
└── tests/
    ├── ascii/state/               # State machine unit tests
    ├── api/                       # HTTP API integration tests
    └── e2e/                       # End-to-end agent tests
```

---

## Key Interfaces

### AppConfig (`src/core/config/types.ts`)

```typescript
export interface AppConfig {
  version: string;
  activeProfile: string;
  project: ProjectConfig;
  schedule: ScheduleConfig;
  model: ModelConfig;
  prompts: PromptConfig;
  analysisSources: AnalysisSource[];
  notifications: NotificationsConfig;
  theme: "dark" | "light" | "system";
}
```

### LLMProviderAdapter (`src/core/providers/types.ts`)

```typescript
export interface LLMProviderAdapter {
  id: string;
  name: string;
  type: "direct" | "agent" | "gateway";
  baseUrl: string;
  models: ModelDefinition[];

  headers(apiKey: string): Record<string, string>;
  transformRequest(prompt: string, config: ModelConfig): any;
  transformResponse(data: any): { content: string; usage: StreamChunk["usage"] };
  parseStreamChunk?(line: string): StreamChunk | null;
  healthCheck?(baseUrl: string): Promise<boolean>;
}
```

### AsciiStateStore (`src/ascii/state/store.ts`)

```typescript
export class AsciiStateStore {
  getState(): AsciiState
  getData(): Partial<AsciiStateData>
  setData(data: Partial<AsciiStateData>): void
  transition(label: string): boolean
  getAction(label: string): string | undefined
  subscribe(listener: () => void): () => void
  setState(state: AsciiState): void
}
```

---

## Key Patterns

### 1. Provider Registry Pattern

```typescript
// Singleton with auto-registration
class ProviderRegistry {
  register(type: LLMProviderType, entry: ProviderRegistryEntry): void
  getAdapter(type: LLMProviderType): LLMProviderAdapter | undefined
  listAll(): Array<{ type: LLMProviderType; entry: ProviderRegistryEntry }>
}

export const providerRegistry = new ProviderRegistry();
providerRegistry.register("openai", { adapter: openaiAdapter, apiKeyEnv: "OPENAI_API_KEY" });
```

### 2. State Store Pattern (Observer/Pub-Sub)

```typescript
const unsubscribe = store.subscribe(() => {
  // React to state changes
  updateView();
});

store.transition("B"); // Navigate to SOURCES
unsubscribe(); // Clean up
```

### 3. Template-Driven Rendering

```
Template (.ascii):
+============================+
| [A]Dashboard  [B]Sources   |
+============================+
| Project: {{project_path}}  |
| Runs Today: {{runs_today}} |
+============================+

Rendered Output:
+============================+
| [A]Dashboard  [B]Sources   |
+============================+
| Project: /home/user/app    |
| Runs Today: 5              |
+============================+
```

Template syntax:
- `{{variable}}` - Variable substitution
- `{{#each items}}...{{/each}}` - Loop with auto-labels
- `{{#if condition}}...{{/if}}` - Conditional blocks

---

## Data Flow

### ASCII-First Control Flow

```
External AI (MCP)
       │
       │ POST /control {"label": "B"}
       ▼
   HTTP API (:3421)
       │
       │ transition("B")
       ▼
  AsciiStateStore ──── notify ────▶ Subscribers
       │
       │ GET /view
       ▼
  AsciiGenerator.render(data)
       │
       ▼
   ASCII Output (80x24 grid)
```

### Label Bindings (`src/ascii/bindings.json`)

```json
{
  "stateTransitions": {
    "DASHBOARD": { "A": "DASHBOARD", "B": "SOURCES", "C": "CONFIG", "D": "HISTORY", "E": "PROVIDERS" },
    "SOURCES": { "A": "DASHBOARD", "B": "SOURCES", "C": "CONFIG", "D": "HISTORY", "E": "PROVIDERS" },
    ...
  },
  "actions": {
    "F": "runAnalysis",
    "G": "exportReport",
    "X": "quit"
  }
}
```

---

## HTTP API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/view` | GET | Returns rendered ASCII for current state |
| `/control` | POST | Execute action by label: `{"label": "X"}` |
| `/state` | GET | Returns current state as JSON |
| `/bindings` | GET | Returns label-to-action mappings |
| `/metrics` | GET | Returns API performance metrics |
| `/health` | GET | Health check |

---

## MCP Bridge Tools

| Tool | Description |
|------|-------------|
| `ascii_view` | Get current ASCII screen |
| `ascii_control` | Send label command |
| `ascii_navigate` | Navigate to state by name |
| `ascii_metrics` | Get performance data |
| `ascii_bindings` | Get label reference |

---

## Test Structure

| Test Level | Location | Purpose |
|------------|----------|---------|
| Unit | `tests/ascii/state/` | State machine logic |
| Integration | `tests/api/` | HTTP API correctness |
| E2E | `tests/e2e/` | Full agent workflows |

---

## Checklist for New ASCII-First Apps

- [ ] Create `src/core/` for business logic
- [ ] Create `src/ascii/state/store.ts` for state management
- [ ] Create `src/ascii/state/types.ts` for state types
- [ ] Create `src/ascii/bindings.json` for label mappings
- [ ] Create `src/ascii/states/*.ascii` templates
- [ ] Create `src/bun/api.ts` for HTTP endpoints
- [ ] Create `src/bun/ascii-generator.ts` for rendering
- [ ] Create MCP bridge (optional)
- [ ] Add tests at all levels
