---
name: pixelrts-agent-build
description: Create spatial WASM agents for the Infinite Map with proper ABI exports and Hilbert-compatible execution
category: development
---

# PixelRTS Agent Build

Build spatial WASM agents that run on the PixelRTS GPU VM with proper ABI compliance.

## When to Use

- Creating autonomous agents for the Infinite Map
- Building spatial utilities (px_alloc, px_copy, px_grep)
- Developing AI-driven map agents
- Implementing map-aware computations

## Procedure

### Step 1: Set Up Development Environment

```bash
# Install WASM toolchain
rustup target add wasm32-unknown-unknown

# Or for C/C++
apt install clang lld wasm-tools
```

### Step 2: Implement Required ABI

Every spatial agent MUST export these functions:

```c
// Required exports
void init(uint32_t map_size);     // Called once at spawn
void think(void* context);        // Called each tick
```

Or in Rust:

```rust
#[no_mangle]
pub extern "C" fn init(map_size: u32) {}

#[no_mangle]
pub extern "C" fn think(context: *mut u8) {}
```

### Step 3: Implement Agent Logic

```rust
// Example: Simple navigation agent
use px::{MapContext, Direction};

static mut MAP_SIZE: u32 = 0;
static mut POS: (u32, u32) = (0, 0);

#[no_mangle]
pub extern "C" fn init(map_size: u32) {
    unsafe {
        MAP_SIZE = map_size;
        POS = (map_size / 2, map_size / 2);  // Start at center
    }
}

#[no_mangle]
pub extern "C" fn think(context: *mut u8) {
    unsafe {
        // Read map context
        let ctx = &*(context as *const MapContext);

        // Simple: move toward highest value
        let best_dir = find_best_direction(ctx);
        POS = apply_direction(POS, best_dir, MAP_SIZE);
    }
}
```

### Step 4: Build WASM

```bash
# Rust
cargo build --target wasm32-unknown-unknown --release

# C/C++ with clang
clang --target=wasm32 \
  -O3 \
  -nostdlib \
  -Wl,--no-entry \
  -Wl,--export-all \
  -o agent.wasm \
  agent.c
```

### Step 5: Convert to PixelRTS

```bash
# Convert WASM to spatial format
python3 systems/pixel_compiler/universal_rts_converter.py agent.wasm agent.rts.png

# Verify ABI exports
wasm-objdump -x agent.wasm | grep -E "init|think"
```

### Step 6: Deploy to Map

```bash
# Place agent on map (via Visual Bridge)
curl -X POST http://localhost:8768/agent/spawn \
  -d '{"wasm": "agent.rts.png", "x": 512, "y": 512}'
```

## ABI Reference

### Required Exports

| Export | Signature | Purpose |
|--------|-----------|---------|
| `init` | `void init(uint32_t map_size)` | One-time initialization |
| `think` | `void think(void* context)` | Per-tick execution |

### Map Context Structure

```c
typedef struct {
    uint32_t map_size;      // Total map dimension
    uint32_t tick;          // Current simulation tick
    uint32_t agent_x;       // Agent X position
    uint32_t agent_y;       // Agent Y position
    uint32_t value_here;    // Value at current position
    uint32_t neighbors[8];  // Values in 8 directions (N,NE,E,SE,S,SW,W,NW)
} MapContext;
```

### Direction Constants

```c
#define DIR_N  0
#define DIR_NE 1
#define DIR_E  2
#define DIR_SE 3
#define DIR_S  4
#define DIR_SW 5
#define DIR_W  6
#define DIR_NW 7
```

## Memory Model

- **Linear memory**: 64KB default, can request more
- **No globals**: Use linear memory addresses
- **No floating point**: Integer math only (GPU optimization)
- **No syscalls**: Use provided context only

## Troubleshooting

### "Missing required export: think"

**Cause**: Function not properly exported.
**Fix**: Ensure `#[no_mangle]` and `extern "C"` in Rust, or `--export` in clang.

```rust
// Correct
#[no_mangle]
pub extern "C" fn think(context: *mut u8) {}

// Wrong - gets mangled
pub fn think(context: *mut u8) {}
```

### "WASM validation failed"

**Cause**: Using unsupported features (floats, imports).
**Fix**: Use integer-only math and no external imports.

```bash
# Validate WASM
wasm-validate agent.wasm

# Check for floats
wasm-objdump -d agent.wasm | grep -E "f32|f64"
```

### "Agent not moving"

**Cause**: Position not being read from context.
**Fix**: Parse context structure correctly.

```rust
// Correct parsing
let ctx = unsafe { &*(context as *const MapContext) };
let x = ctx.agent_x;
```

### "Memory access out of bounds"

**Cause**: Accessing beyond linear memory.
**Fix**: Check bounds before access, increase memory if needed.

```rust
// Bounds check
if index < BUFFER_SIZE {
    buffer[index] = value;
}
```

## Examples

### Simple Walker Agent

```rust
// Walks in a straight line
#[no_mangle]
pub extern "C" fn init(map_size: u32) {}

#[no_mangle]
pub extern "C" fn think(context: *mut u8) {
    unsafe {
        let ctx = &mut *(context as *mut MapContext);
        // Move east if possible
        if ctx.agent_x < ctx.map_size - 1 {
            ctx.agent_x += 1;
        }
    }
}
```

### Value-Following Agent

```rust
// Moves toward highest neighbor value
#[no_mangle]
pub extern "C" fn think(context: *mut u8) {
    unsafe {
        let ctx = &mut *(context as *mut MapContext);

        let mut best_dir = 0;
        let mut best_val = 0;

        for i in 0..8 {
            if ctx.neighbors[i] > best_val {
                best_val = ctx.neighbors[i];
                best_dir = i;
            }
        }

        apply_direction(ctx, best_dir);
    }
}
```

### Spatial Utility (px_grep)

```rust
// Searches for pattern in memory region
#[no_mangle]
pub extern "C" fn think(context: *mut u8) {
    unsafe {
        let ctx = &*(context as *const MapContext);

        // Read memory at position
        let addr = hilbert_to_linear(ctx.agent_x, ctx.agent_y);
        let value = read_memory(addr);

        // Check for pattern
        if value == SEARCH_PATTERN {
            report_match(ctx.agent_x, ctx.agent_y);
        }
    }
}
```

## Related Skills

- `pixelrts-convert` - Convert built agents to PixelRTS
- `pixelrts-analyze` - Analyze agent behavior
- `infinite-map-testing` - Test agents on map
