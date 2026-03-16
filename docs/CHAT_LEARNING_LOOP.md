# Chat Learning Loop

> Making the PixelBrain smarter through conversation

## Overview

The Chat Learning Loop enables Geometry OS's PixelBrain to learn from every chat interaction. When users rate responses as helpful or unhelpful, the system applies Hebbian weight updates that strengthen or weaken neural pathways in the GPU substrate.

```
┌─────────────────────────────────────────────────────────────────────────┐
│  USER CHAT: "What's at memory address 0x1000?"                          │
└───────────────────────────────────────┬─────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────┐
│  PIXELBRAIN INFERENCE                                                   │
│  1. Tokenize input                                                      │
│  2. Generate response                                                   │
│  3. Extract activations from RESPONSE tokens                            │
│  4. Store activations with chat_id                                      │
└───────────────────────────────────────┬─────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────┐
│  USER FEEDBACK                                                          │
│  👍 helpful → reward = +1                                               │
│  😐 neutral → reward = 0                                                │
│  👎 unhelpful → reward = -1                                             │
└───────────────────────────────────────┬─────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────┐
│  HEBBIAN LEARNING                                                       │
│  Δw = η × activation × reward                                           │
│                                                                         │
│  • Positive reward strengthens pathways                                 │
│  • Negative reward weakens pathways                                     │
│  • Learning rate (η) controls update magnitude                          │
└─────────────────────────────────────────────────────────────────────────┘
```

## Why Response-Based Activations

The system uses **response tokens** (what the brain outputs) rather than input tokens (what it hears) to generate activations. This is crucial for meaningful learning:

| Approach | Problem |
|----------|---------|
| Input-based activations | Rewards input patterns, not output quality |
| **Response-based activations** | Rewards the brain's actual "thoughts" |

When you rate a response as helpful, you're strengthening the neural pathways that *produced* that good output. This is true Hebbian learning: "neurons that fire together, wire together."

## Architecture

### Memory Layout

```
0x0000-0x0FFF: Chat History Buffer
0x1000-0x1FFF: Activation Storage
0x2000-0x2FFF: Learning State
  0x2000: learning_rate (f32)
  0x2004: total_updates (u32)
  0x2008: fitness_score (f32)
0x3000-0xFFFF: Substrate Address Space
```

### Components

| Component | Location | Purpose |
|-----------|----------|---------|
| `/chat` endpoint | `gpu_dev_daemon.rs` | Handles natural language queries |
| `/rate` endpoint | `gpu_dev_daemon.rs` | Applies Hebbian updates |
| `ChatActivation` | `gpu_dev_daemon.rs` | Stores addresses and strengths |
| `ChatCache` | `gpu_dev_daemon.rs` | Maps chat_id → activations |

### Data Structures

```rust
/// Stores neural activations for a chat interaction
struct ChatActivation {
    /// Substrate addresses that were activated
    addresses: Vec<u32>,
    /// Activation strength for each address (0.0-1.0)
    strengths: Vec<f32>,
}

/// Global cache mapping chat_id to activations
static CHAT_CACHE: OnceLock<Mutex<HashMap<String, ChatActivation>>> = OnceLock::new();
```

## Hebbian Learning

### The Formula

```
Δw = η × activation × reward
```

Where:
- **Δw** = Weight change
- **η** (eta) = Learning rate (default: 0.01)
- **activation** = How strongly the pathway fired (0.0-1.0)
- **reward** = User feedback (-1, 0, or +1)

### Implementation

```rust
// In /rate endpoint
let learning_rate = 0.01;
let reward = rating as f32;  // -1.0, 0.0, or 1.0

for i in 0..activations.len() {
    let addr = activations.addresses[i];
    let strength = activations.strengths[i];

    // Hebbian update
    let delta_w = learning_rate * strength * reward;

    // Apply to substrate (via OP_GLYPH_MUTATE)
    apply_weight_update(addr, delta_w);
}
```

### Effect of Ratings

| Rating | Reward | Effect |
|--------|--------|--------|
| 👍 Helpful | +1.0 | Strengthens activated pathways |
| 😐 Neutral | 0.0 | No change |
| 👎 Unhelpful | -1.0 | Weakens activated pathways |

## Activation Generation

Activations are generated from response tokens using a deterministic hash function:

```rust
for (i, c) in response.chars().enumerate() {
    // Calculate substrate address
    let addr = (i as u32 * 31 + c as u32) % 0x10000;  // 64K address space

    // Calculate activation strength
    let char_val = c as u32;
    let strength = 0.3
        + ((char_val % 17) as f32 / 20.0)  // Base strength from character
        + (0.2 * (i as f32 / response.len() as f32));  // Position bonus

    activations.push(addr);
    strengths.push(strength.min(1.0));
}
```

### Why This Works

1. **Same response → same activations** - Deterministic hashing ensures consistency
2. **Spread across substrate** - Different tokens activate different regions
3. **Variable strength** - Position and character value create natural variation
4. **Bounded output** - Strength clamped to [0.0, 1.0] range

## API Reference

### POST /chat

Send a natural language query to the brain.

**Request:**
```bash
curl -X POST http://127.0.0.1:8769/chat -d "hello"
```

**Response:**
```json
{
  "chat_id": "550e8400-e29b-41d4-a716-446655440000",
  "response": "Unknown command: hello. Try 'help' for available commands."
}
```

### POST /rate

Rate a chat response to trigger learning.

**Request:**
```bash
curl -X POST http://127.0.0.1:8769/rate \
  -H "Content-Type: application/json" \
  -d '{"chat_id": "550e8400-e29b-41d4-a716-446655440000", "rating": 1}'
```

**Response:**
```json
{
  "status": "learned",
  "reward": 1.0,
  "weights_updated": 42,
  "learning_delta": 0.01
}
```

**Rating Values:**
- `1` = Helpful (strengthen pathways)
- `0` = Neutral (no change)
- `-1` = Unhelpful (weaken pathways)

## Usage Examples

### Basic Chat and Rate

```bash
# Start the daemon
cargo run --bin gpu_dev_daemon

# Chat with the brain
RESPONSE=$(curl -s -X POST http://127.0.0.1:8769/chat -d "status")
CHAT_ID=$(echo $RESPONSE | jq -r '.chat_id')
echo "Brain said: $(echo $RESPONSE | jq -r '.response')"

# Rate it helpful
curl -s -X POST http://127.0.0.1:8769/rate \
  -H "Content-Type: application/json" \
  -d "{\"chat_id\": \"$CHAT_ID\", \"rating\": 1}"
```

### Training Loop

```bash
# Train the brain with multiple interactions
for query in "help" "status" "peek 0x1000"; do
  RESPONSE=$(curl -s -X POST http://127.0.0.1:8769/chat -d "$query")
  CHAT_ID=$(echo $RESPONSE | jq -r '.chat_id')

  # Rate all as helpful (in real use, rate based on quality)
  curl -s -X POST http://127.0.0.1:8769/rate \
    -H "Content-Type: application/json" \
    -d "{\"chat_id\": \"$CHAT_ID\", \"rating\": 1}"
done
```

## Integration with Other Systems

### Neural Event Bus

Chat interactions can emit events for other systems to consume:

```rust
// Future: Emit NEURAL_LEARN event
neb.publish(Event {
    event_type: "NEURAL_LEARN",
    payload: json!({
        "chat_id": chat_id,
        "reward": reward,
        "pathways_updated": weights_updated
    })
});
```

### Evolution Daemon

The evolution daemon can use learning statistics for fitness evaluation:

```rust
// Future: Query learning stats for evolution
let fitness = query_learning_fitness();
evolution_daemon.evaluate(fitness);
```

### Visual Shell

THOUGHT_PULSE emissions can visualize learning in real-time:

```rust
// Future: Broadcast thought pulse for visualization
broadcast_thought_pulse(ThoughtPulse {
    chat_id,
    reward,
    activations: activations.addresses,
    weight_deltas: calculated_deltas
});
```

## Future Enhancements

### 1. Real PixelBrain Activations

Currently using simulated activations. Future: extract real activations from the TinyStories-1M transformer inference pipeline.

### 2. Conversation Memory

Track context across multiple chats for more intelligent learning:

```rust
struct ConversationMemory {
    history: Vec<ChatExchange>,
    context_window: usize,
    importance_threshold: f32
}
```

### 3. Implicit Learning

Learn from user behavior without explicit ratings:

```rust
// User continues chatting → implicit positive signal
// User abandons conversation → implicit negative signal
fn infer_implicit_reward(behavior: UserBehavior) -> f32
```

### 4. Multi-User Learning

Aggregate learning across multiple users with reputation weighting:

```rust
struct AggregatedLearning {
    user_weights: HashMap<UserId, f32>,
    global_activations: ChatActivation
}
```

## Troubleshooting

### Chat Not Found Error

```json
{"error": "chat not found or already rated"}
```

**Cause:** The chat_id doesn't exist or has already been rated.

**Solution:** Use the chat_id from a recent `/chat` response, and only rate each chat once.

### Empty Response

```json
{"chat_id": "...", "response": ""}
```

**Cause:** The daemon may not be fully initialized.

**Solution:** Wait a few seconds after starting the daemon before sending requests.

### Connection Refused

```
curl: (7) Failed to connect to 127.0.0.1 port 8769
```

**Cause:** The daemon is not running.

**Solution:** Start the daemon with `cargo run --bin gpu_dev_daemon`.

## Design Philosophy

### Why Hebbian Learning?

Hebbian learning is biologically plausible and computationally simple:

1. **Local** - Each weight update only needs local information
2. **Unsupervised** - Can learn from any signal, not just labeled data
3. **Incremental** - Updates happen continuously, not in batches
4. **Interpretable** - Easy to understand why weights change

### Why Chat-Based?

Chat provides a natural interface for learning:

1. **Low friction** - Users already chat with AI assistants
2. **Implicit signal** - Conversation patterns reveal preferences
3. **Explicit feedback** - Thumbs up/down is intuitive
4. **Continuous** - Learning never stops

### Why Response-Based?

Activations from responses (not inputs) ensure meaningful learning:

1. **Rewards output quality** - Strengthen pathways that produce good responses
2. **Ignores input variation** - Same response always produces same activations
3. **Aligns with intent** - We want the brain to generate better outputs

---

## Files

| File | Purpose |
|------|---------|
| `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs` | Main daemon with `/chat` and `/rate` endpoints |
| `docs/CHAT_LEARNING_LOOP.md` | This documentation |
| `memory/chat-learning-loop.md` | Memory index entry |

---

*The brain gets smarter with every conversation.*
