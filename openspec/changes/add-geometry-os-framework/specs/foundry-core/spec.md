# foundry-core Specification (DELTA)

## ADDED Requirements

### Requirement: Unified RTS Asset Loading
The framework SHALL provide a unified `RtsAsset` class that handles loading, validation, and metadata extraction for `.rts.png` files.

#### Scenario: Load RTS Asset with Metadata
- **WHEN** a developer calls `RtsAsset.load("file.rts.png")`
- **THEN** the system loads the PNG texture data
- **AND** extracts all iTXt metadata chunks
- **AND** returns an `RtsAsset` object with `dimensions`, `texture`, and `metadata` properties
- **VISUAL** The asset is ready for immediate use in rendering or processing

#### Scenario: Extract Hybrid DNA Code
- **WHEN** a developer calls `asset.extract_dna()`
- **THEN** the system retrieves the `RTS_Logic` iTXt chunk
- **AND** decodes the embedded Python code
- **AND** returns a `HybridDNA` object ready for execution
- **VISUAL** Code is extracted without manual PNG chunk parsing

#### Scenario: Invalid RTS Asset
- **WHEN** a developer attempts to load a non-RTS PNG file
- **THEN** the system raises a clear `RtsAssetError` exception
- **AND** provides an actionable error message suggesting `RtsAsset.create()` for new assets
- **VISUAL** Developer receives immediate, helpful feedback

### Requirement: Standardized Daemon Architecture
The framework SHALL provide a `BaseDaemon` class that handles queue management, lifecycle hooks, and error recovery for all daemon implementations.

#### Scenario: Create Custom Daemon
- **WHEN** a developer subclasses `BaseDaemon` and implements `on_brick()`
- **THEN** the daemon automatically manages a thread-safe brick queue
- **AND** calls lifecycle hooks (`on_start`, `on_brick`, `on_error`, `on_stop`) at appropriate times
- **AND** handles graceful shutdown on SIGTERM/SIGINT
- **VISUAL** New daemon creation takes ~20 minutes instead of ~2 hours

#### Scenario: Daemon Error Recovery
- **WHEN** a brick processing raises an exception
- **THEN** the daemon calls `on_error(exception, brick)`
- **AND** continues processing the next brick if `on_error()` returns `True`
- **AND** stops the daemon if `on_error()` returns `False`
- **VISUAL** Daemons are resilient to individual brick failures

#### Scenario: Daemon Telemetry
- **WHEN** a daemon is running
- **THEN** it logs structured JSON events (brick_processed, error_occurred, daemon_started, daemon_stopped)
- **AND** provides real-time metrics (bricks_processed, errors_count, uptime)
- **VISUAL** Operators can monitor daemon health via logs and metrics

### Requirement: Rendering Abstraction Layer
The framework SHALL provide abstractions for neural terrain and pixel window management that hide Rust FFI complexity.

#### Scenario: Load Neural Terrain from Manifest
- **WHEN** a developer calls `NeuralTerrain.from_manifest("manifest.json")`
- **THEN** the system loads all bricks defined in the manifest
- **AND** initializes shared memory for Rust compositor communication
- **AND** returns a `NeuralTerrain` object ready for updates
- **VISUAL** Terrain is immediately visible in the compositor

#### Scenario: Add Brick to Terrain
- **WHEN** a developer calls `terrain.add_brick(position=(x, y), asset=brick)`
- **THEN** the system updates the internal terrain state
- **AND** synchronizes changes to the Rust compositor via shared memory
- **AND** the brick appears at the specified position
- **VISUAL** Brick is rendered in the 3D terrain view

#### Scenario: Create Pixel Window
- **WHEN** a developer calls `PixelWindow.create_terminal(style="crt_cyan")`
- **THEN** the system creates a new window with CRT visual effects
- **AND** initializes a terminal emulator buffer
- **AND** returns a window object that can render text to texture
- **VISUAL** Window appears with retro-futuristic CRT aesthetic

### Requirement: Hybrid DNA Sandboxed Execution
The framework SHALL provide secure, sandboxed execution of Python code extracted from RTS assets with custom API injection.

#### Scenario: Execute Hybrid DNA with Custom API
- **WHEN** a developer calls `code.execute(sandbox=True, api={"spawn_brick": fn})`
- **THEN** the system creates an isolated execution environment
- **AND** injects the custom API functions into the code's namespace
- **AND** executes the code with restricted imports and filesystem access
- **AND** returns the execution result or raises a clear exception
- **VISUAL** Code executes safely without compromising system security

#### Scenario: Execution Timeout
- **WHEN** Hybrid DNA code runs longer than the configured timeout (default: 30s)
- **THEN** the system terminates the execution
- **AND** raises a `HybridDNATimeoutError` exception
- **VISUAL** Long-running code doesn't block the daemon indefinitely

### Requirement: Zero-Copy Performance
The framework SHALL minimize memory copies and overhead for performance-critical operations.

#### Scenario: RTS Loading Performance
- **WHEN** loading a 4096x4096 RTS asset
- **THEN** the framework overhead is < 5% compared to direct PNG loading
- **AND** texture data is stored as numpy arrays (zero-copy to GPU)
- **VISUAL** Large assets load quickly without memory bloat

#### Scenario: Rendering Call Performance
- **WHEN** calling rendering abstractions (terrain updates, window rendering)
- **THEN** the framework overhead is < 2% compared to direct FFI calls
- **AND** shared memory is used for large data transfers
- **VISUAL** Real-time rendering maintains target frame rates

## MODIFIED Requirements

### Requirement: Context-Aware Shader Generation
The `FoundryDaemon` SHALL utilize a vector database (LanceDB) to retrieve relevant project context when generating shaders from intents, **and SHALL inherit from `BaseDaemon` for standardized lifecycle management**.

#### Scenario: RAG Context Injection
- **WHEN** a user creates an `.intent` file
- **THEN** the daemon queries the vector database for semantically similar code
- **AND** injects the top 3 results into the LLM prompt
- **AND** processes the intent using the `BaseDaemon.on_brick()` hook
- **VISUAL** The generated shader uses helper functions present in the retrieved context.

#### Scenario: Graceful Degradation
- **WHEN** the vector database or dependencies are unavailable
- **THEN** the daemon proceeds with context-free generation
- **AND** logs a warning "RAG disabled" using `BaseDaemon` structured logging
- **VISUAL** Daemon continues operating with reduced capabilities
