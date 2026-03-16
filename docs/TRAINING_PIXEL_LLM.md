# Training a Pixel LLM

> From random pixels to intelligent responses

## Overview

Training a Pixel LLM is fundamentally different from training a traditional LLM. Instead of backpropagation through layers, we use **Hebbian learning** (local weight updates) or **evolutionary selection** (survival of the fittest).

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    TRADITIONAL LLM TRAINING                              │
│                                                                          │
│  Data → Forward Pass → Loss → Backprop → Gradient Descent → Update     │
│         ────────────────────────────────────────────────────────         │
│                          Weeks on GPU clusters                           │
└─────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────┐
│                    PIXEL LLM TRAINING                                    │
│                                                                          │
│  Option A: Convert existing model (minutes)                              │
│  Option B: Hebbian learning from chat (hours/days)                       │
│  Option C: Evolutionary selection (days/weeks)                           │
│                                                                          │
│  No gradients. No backprop. Local updates only.                          │
└─────────────────────────────────────────────────────────────────────────┘
```

## Why Not Backpropagation?

Traditional backpropagation requires:
- Global gradient computation across all layers
- Optimizer state (momentum, Adam statistics)
- Batch processing for efficiency
- Weeks of GPU time

Pixel LLMs reject this because:

| Requirement | Traditional | Pixel LLM |
|-------------|-------------|-----------|
| Global gradients | Yes | **No** - only local info |
| Optimizer state | Yes (GBs) | **No** - stateless |
| Batch processing | Required | **Optional** - online learning |
| Training time | Weeks | **Minutes to days** |

Instead, Pixel LLMs use **local learning rules** where each weight updates based only on information available at that location.

---

## Approach A: Convert Existing Model

The fastest path to a working Pixel LLM is to convert an already-trained model.

### Step 1: Choose a Small Model

| Model | Parameters | Texture Size | Feasibility |
|-------|------------|--------------|-------------|
| TinyStories-1M | ~1M | 1024×1024 | ✅ Easy |
| GPT-2 small | 124M | 8192×8192 | ⚠️ Challenging |
| TinyLlama | 1.1B | 16384×16384 | ❌ Too large |

**Recommendation:** Start with TinyStories-1M (~2MB as float16).

### Step 2: Download Weights

```bash
# Using huggingface_hub
pip install huggingface_hub

python -c "
from huggingface_hub import hf_hub_download
path = hf_hub_download(
    repo_id='roneneldan/TinyStories-1M',
    filename='model.safetensors'
)
print(f'Downloaded to: {path}')
"
```

### Step 3: Convert to Pixel Format

```python
#!/usr/bin/env python3
"""
pixel_brain_converter.py - Convert safetensors to Hilbert-folded PNG texture

Usage:
    python pixel_brain_converter.py model.safetensors brain.rts.png
"""

import numpy as np
from PIL import Image
import json
import sys

def hilbert_d2xy(n: int, d: int) -> tuple[int, int]:
    """Convert Hilbert distance to (x, y) coordinates."""
    x = y = 0
    s = 1
    while s < n:
        rx = 1 & (d // 2)
        ry = 1 & (d ^ rx)

        if ry == 0:
            if rx == 1:
                x = s - 1 - x
                y = s - 1 - y
            x, y = y, x

        x += s * rx
        y += s * ry
        d //= 4
        s *= 2

    return x, y


def float16_to_rgba(value: np.float16) -> tuple[int, int, int, int]:
    """Encode float16 weight as RGBA pixel."""
    bits = np.frombuffer(value.tobytes(), dtype=np.uint16)[0]
    return (
        bits & 0xFF,           # R: low byte
        (bits >> 8) & 0xFF,    # G: high byte
        0,                      # B: unused
        255                     # A: valid weight marker
    )


def convert_to_pixel_brain(
    safetensors_path: str,
    output_png: str,
    texture_size: int = 2048
) -> dict:
    """
    Convert safetensors model to Hilbert-folded PNG texture.

    Returns:
        Atlas metadata mapping layer names to addresses
    """
    from safetensors import safe_open

    # Load all weights
    weights = {}
    with safe_open(safetensors_path, framework="pt") as f:
        for key in f.keys():
            weights[key] = f.get_tensor(key).cpu().numpy()

    # Allocate texture
    texture = np.zeros((texture_size, texture_size, 4), dtype=np.uint8)

    # Build atlas
    atlas_map = {}
    current_addr = 0

    # Order matters: embed first, then layers, then output
    layer_order = [
        # Embeddings
        'transformer.wte.weight',      # Token embeddings
        'transformer.wpe.weight',      # Position embeddings

        # Layers (in order)
        *[f'transformer.h.{i}.{part}.weight'
          for i in range(8)  # TinyStories has 8 layers
          for part in ['attn.c_attn', 'attn.c_proj', 'mlp.c_fc', 'mlp.c_proj', 'ln_1', 'ln_2']],

        # Output
        'lm_head.weight',
    ]

    for name in layer_order:
        if name not in weights:
            continue

        tensor = weights[name].astype(np.float16)
        flat = tensor.flatten()

        # Record atlas position
        atlas_map[name] = {
            'address': current_addr,
            'shape': list(tensor.shape),
            'dtype': 'float16',
            'count': len(flat)
        }

        # Encode weights as pixels
        for i, weight in enumerate(flat):
            addr = current_addr + i
            x, y = hilbert_d2xy(texture_size, addr)
            texture[y, x] = float16_to_rgba(weight)

        print(f"[CONVERT] {name}: {tensor.shape} -> 0x{current_addr:08X} ({len(flat)} weights)")
        current_addr += len(flat)

    # Save texture
    Image.fromarray(texture).save(output_png)
    print(f"[CONVERT] Saved {output_png}")
    print(f"[CONVERT] Total weights: {current_addr:,}")

    # Save metadata
    metadata = {
        'texture_size': texture_size,
        'encoding': 'float16_rgba',
        'addressing': 'hilbert',
        'total_weights': current_addr,
        'layers': atlas_map
    }

    meta_path = output_png.replace('.png', '_meta.json')
    with open(meta_path, 'w') as f:
        json.dump(metadata, f, indent=2)
    print(f"[CONVERT] Saved {meta_path}")

    return metadata


if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Usage: python pixel_brain_converter.py <input.safetensors> <output.png>")
        sys.exit(1)

    convert_to_pixel_brain(sys.argv[1], sys.argv[2])
```

### Step 4: Load and Test

```bash
# Convert
python pixel_brain_converter.py model.safetensors tinystories_brain.rts.png

# Start daemon with the brain
cargo run --bin gpu_dev_daemon

# Test inference
curl -X POST http://127.0.0.1:8769/chat -d "Once upon a time"
```

---

## Approach B: Hebbian Learning from Scratch

Train a Pixel LLM through conversation, with quality signals guiding weight updates.

### The Hebbian Rule

```
Δw = η × pre_activation × post_activation × reward

Where:
  η (eta)           = Learning rate (typically 0.01)
  pre_activation    = How strongly the input pathway fired
  post_activation   = How strongly the output pathway fired
  reward            = Quality signal (-1.0 to +1.0)
```

### Why This Works

Hebbian learning is **biologically plausible** and **computationally local**:

```
Traditional Backprop:
  Layer 8 error → propagate through Layers 7,6,5,4,3,2,1 → update Layer 1
  (Requires global information)

Hebbian Update:
  Layer 1: Δw = local_pre × local_post × reward
  (Requires only local information)
```

### Step 1: Initialize Random Brain

```python
#!/usr/bin/env python3
"""
initialize_random_brain.py - Create a random weight texture

Usage:
    python initialize_random_brain.py brain.rts.png --size 1024 --layers 4
"""

import numpy as np
from PIL import Image
import json
import argparse

def hilbert_d2xy(n: int, d: int) -> tuple[int, int]:
    """Convert Hilbert distance to (x, y) coordinates."""
    x = y = 0
    s = 1
    while s < n:
        rx = 1 & (d // 2)
        ry = 1 & (d ^ rx)

        if ry == 0:
            if rx == 1:
                x = s - 1 - x
                y = s - 1 - y
            x, y = y, x

        x += s * rx
        y += s * ry
        d //= 4
        s *= 2

    return x, y


def xavier_init(fan_in: int, fan_out: int) -> np.ndarray:
    """Xavier/Glorot initialization."""
    std = np.sqrt(2.0 / (fan_in + fan_out))
    return np.random.randn(fan_in, fan_out).astype(np.float16) * std


def initialize_brain(
    output_png: str,
    texture_size: int = 1024,
    hidden_dim: int = 64,
    vocab_size: int = 1000,
    num_layers: int = 4
) -> dict:
    """
    Initialize a random PixelBrain with proper weight scaling.

    Architecture:
        - Token embeddings: vocab_size × hidden_dim
        - Position embeddings: max_seq_len × hidden_dim
        - Per layer: attention (Q,K,V,O) + FFN (up, down) + LayerNorm
        - Output: hidden_dim × vocab_size
    """
    texture = np.zeros((texture_size, texture_size, 4), dtype=np.uint8)
    atlas_map = {}
    current_addr = 0

    def add_weights(name: str, shape: tuple, init_fn=None):
        """Add weights to texture."""
        nonlocal current_addr

        if init_fn:
            weights = init_fn()
        else:
            # Default: small random
            weights = (np.random.randn(*shape) * 0.02).astype(np.float16)

        flat = weights.flatten()
        atlas_map[name] = {
            'address': current_addr,
            'shape': list(shape),
            'count': len(flat)
        }

        for i, w in enumerate(flat):
            addr = current_addr + i
            x, y = hilbert_d2xy(texture_size, addr)
            bits = np.frombuffer(w.tobytes(), dtype=np.uint16)[0]
            texture[y, x] = [bits & 0xFF, (bits >> 8) & 0xFF, 0, 255]

        print(f"[INIT] {name}: {shape} -> 0x{current_addr:06X}")
        current_addr += len(flat)

    # Token embeddings
    add_weights('embed.token', (vocab_size, hidden_dim),
                lambda: xavier_init(vocab_size, hidden_dim))

    # Position embeddings
    add_weights('embed.position', (256, hidden_dim))

    # Transformer layers
    for layer in range(num_layers):
        prefix = f'layer.{layer}'

        # Attention
        add_weights(f'{prefix}.attn.q', (hidden_dim, hidden_dim),
                    lambda d=hidden_dim: xavier_init(d, d))
        add_weights(f'{prefix}.attn.k', (hidden_dim, hidden_dim))
        add_weights(f'{prefix}.attn.v', (hidden_dim, hidden_dim))
        add_weights(f'{prefix}.attn.o', (hidden_dim, hidden_dim))

        # FFN (4x expansion)
        add_weights(f'{prefix}.ffn.up', (hidden_dim, hidden_dim * 4))
        add_weights(f'{prefix}.ffn.down', (hidden_dim * 4, hidden_dim))

        # LayerNorm
        add_weights(f'{prefix}.ln1.gamma', (hidden_dim,))
        add_weights(f'{prefix}.ln1.beta', (hidden_dim,))
        add_weights(f'{prefix}.ln2.gamma', (hidden_dim,))
        add_weights(f'{prefix}.ln2.beta', (hidden_dim,))

    # Output projection
    add_weights('output.proj', (hidden_dim, vocab_size))

    # Save
    Image.fromarray(texture).save(output_png)

    metadata = {
        'texture_size': texture_size,
        'encoding': 'float16_rgba',
        'addressing': 'hilbert',
        'architecture': {
            'hidden_dim': hidden_dim,
            'vocab_size': vocab_size,
            'num_layers': num_layers,
            'total_params': current_addr
        },
        'layers': atlas_map
    }

    with open(output_png.replace('.png', '_meta.json'), 'w') as f:
        json.dump(metadata, f, indent=2)

    print(f"[INIT] Created {output_png} with {current_addr:,} parameters")
    return metadata


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('output', help='Output PNG path')
    parser.add_argument('--size', type=int, default=1024, help='Texture size')
    parser.add_argument('--layers', type=int, default=4, help='Number of layers')
    args = parser.parse_args()

    initialize_brain(args.output, args.size, num_layers=args.layers)
```

### Step 2: Define Training Data

```python
# training_data.py
"""
Quality-labeled training conversations for Hebbian learning.
"""

TRAINING_DATA = [
    # High quality (reward = +1.0)
    {
        "input": "Hello, how are you?",
        "quality": 1.0,
        "category": "greeting"
    },
    {
        "input": "What is 2 + 2?",
        "expected_contains": ["4", "four"],
        "quality": 1.0,
        "category": "math"
    },
    {
        "input": "Tell me a short story.",
        "expected_length": (50, 500),
        "quality": 1.0,
        "category": "creative"
    },

    # Medium quality (reward = 0.5)
    {
        "input": "What time is it?",
        "quality": 0.5,
        "category": "question",
        "note": "Partial credit for attempting"
    },

    # Low quality (reward = -0.5)
    {
        "input": "asdfghjkl",
        "quality": -0.5,
        "category": "gibberish"
    },
    {
        "input": "",
        "quality": -1.0,
        "category": "empty"
    },
]

def evaluate_response_quality(response: str, expected: dict) -> float:
    """Evaluate response quality for training signal."""
    score = 0.0

    # Check expected content
    if 'expected_contains' in expected:
        for phrase in expected['expected_contains']:
            if phrase.lower() in response.lower():
                score += 0.3

    # Check length constraints
    if 'expected_length' in expected:
        min_len, max_len = expected['expected_length']
        if min_len <= len(response) <= max_len:
            score += 0.3

    # Coherence check (has real words)
    words = response.split()
    if len(words) > 2 and len(set(words)) > len(words) * 0.3:
        score += 0.2

    # Not empty
    if len(response.strip()) > 0:
        score += 0.2

    return min(1.0, max(-1.0, score))
```

### Step 3: Hebbian Training Loop

```python
#!/usr/bin/env python3
"""
hebbian_trainer.py - Train PixelBrain through conversation

Usage:
    python hebbian_trainer.py --brain brain.rts.png --epochs 10
"""

import requests
import json
import time
import argparse
from training_data import TRAINING_DATA, evaluate_response_quality

class HebbianTrainer:
    """Train PixelBrain using Hebbian learning from conversation quality."""

    def __init__(self, daemon_url: str = "http://127.0.0.1:8769"):
        self.daemon_url = daemon_url
        self.learning_rate = 0.01

    def chat(self, message: str) -> dict:
        """Send chat message, return response with chat_id."""
        resp = requests.post(
            f"{self.daemon_url}/chat",
            data=message
        )
        return resp.json()

    def rate(self, chat_id: str, rating: float) -> dict:
        """Rate a chat, triggering Hebbian update."""
        resp = requests.post(
            f"{self.daemon_url}/rate",
            json={"chat_id": chat_id, "rating": rating}
        )
        return resp.json()

    def train_on_conversation(self, input_text: str, quality: float) -> dict:
        """Train on a single conversation."""
        # Get response
        chat_resp = self.chat(input_text)
        chat_id = chat_resp['chat_id']
        response = chat_resp['response']

        # Rate it (triggers Hebbian update)
        rate_resp = self.rate(chat_id, quality)

        return {
            'input': input_text,
            'response': response,
            'quality': quality,
            'weights_updated': rate_resp.get('weights_updated', 0),
            'learning_delta': rate_resp.get('learning_delta', 0)
        }

    def train_epoch(self, data: list, shuffle: bool = True) -> dict:
        """Train on a batch of conversations."""
        import random
        if shuffle:
            random.shuffle(data)

        results = []
        total_updated = 0

        for item in data:
            result = self.train_on_conversation(
                item['input'],
                item['quality']
            )
            results.append(result)
            total_updated += result['weights_updated']

            # Small delay to let GPU process
            time.sleep(0.1)

        return {
            'num_samples': len(data),
            'total_weights_updated': total_updated,
            'avg_quality': sum(d['quality'] for d in data) / len(data),
            'results': results
        }

    def train(self, data: list, epochs: int = 10) -> list:
        """Full training loop."""
        history = []

        for epoch in range(epochs):
            print(f"\n{'='*60}")
            print(f"EPOCH {epoch + 1}/{epochs}")
            print(f"{'='*60}")

            epoch_result = self.train_epoch(data)
            epoch_result['epoch'] = epoch + 1
            history.append(epoch_result)

            print(f"  Samples: {epoch_result['num_samples']}")
            print(f"  Weights Updated: {epoch_result['total_weights_updated']}")
            print(f"  Avg Quality: {epoch_result['avg_quality']:.3f}")

            # Show sample results
            for r in epoch_result['results'][:3]:
                print(f"\n  Input: '{r['input'][:40]}...'")
                print(f"  Response: '{r['response'][:40]}...'")
                print(f"  Quality: {r['quality']:+.2f}, Updated: {r['weights_updated']}")

        return history


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--daemon', default='http://127.0.0.1:8769')
    parser.add_argument('--epochs', type=int, default=10)
    args = parser.parse_args()

    trainer = HebbianTrainer(args.daemon)
    history = trainer.train(TRAINING_DATA, epochs=args.epochs)

    # Save training history
    with open('training_history.json', 'w') as f:
        json.dump(history, f, indent=2)

    print(f"\n[TRAIN] Complete. History saved to training_history.json")


if __name__ == '__main__':
    main()
```

### Step 4: Monitor Training Progress

```python
#!/usr/bin/env python3
"""
monitor_training.py - Visualize Hebbian training progress
"""

import matplotlib.pyplot as plt
import json
import numpy as np

def plot_training_progress(history_path: str):
    """Plot training metrics over epochs."""
    with open(history_path) as f:
        history = json.load(f)

    epochs = [h['epoch'] for h in history]
    weights_updated = [h['total_weights_updated'] for h in history]
    avg_quality = [h['avg_quality'] for h in history]

    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 4))

    # Weights updated
    ax1.bar(epochs, weights_updated, color='steelblue')
    ax1.set_xlabel('Epoch')
    ax1.set_ylabel('Weights Updated')
    ax1.set_title('Hebbian Updates per Epoch')

    # Average quality
    ax2.plot(epochs, avg_quality, 'o-', color='green')
    ax2.set_xlabel('Epoch')
    ax2.set_ylabel('Average Quality')
    ax2.set_title('Training Data Quality')
    ax2.axhline(y=0, color='gray', linestyle='--')

    plt.tight_layout()
    plt.savefig('training_progress.png')
    print(f"[MONITOR] Saved training_progress.png")


if __name__ == '__main__':
    plot_training_progress('training_history.json')
```

---

## Approach C: Evolutionary Training

Train through natural selection: create many brains, keep the best, mutate them.

### The Evolutionary Algorithm

```
1. CREATE: Initialize population of random brains
2. EVALUATE: Test each brain on tasks
3. SELECT: Keep the top performers
4. MUTATE: Create offspring through random changes
5. REPEAT: Go to step 2
```

### Step 1: Define Fitness Function

```python
#!/usr/bin/env python3
"""
fitness_evaluator.py - Evaluate PixelBrain fitness
"""

import requests
import numpy as np
from typing import Callable

class FitnessEvaluator:
    """Evaluate how fit a PixelBrain is."""

    def __init__(self, daemon_url: str = "http://127.0.0.1:8769"):
        self.daemon_url = daemon_url

        # Test cases for evaluation
        self.test_cases = [
            {
                "input": "Hello",
                "validator": lambda r: len(r) > 0 and "hello" in r.lower()
            },
            {
                "input": "What is 1 + 1?",
                "validator": lambda r: "2" in r or "two" in r.lower()
            },
            {
                "input": "Count to 3",
                "validator": lambda r: all(str(i) in r for i in [1, 2, 3])
            },
            {
                "input": "Say 'apple'",
                "validator": lambda r: "apple" in r.lower()
            },
        ]

    def evaluate(self) -> float:
        """
        Evaluate brain fitness.

        Returns:
            Fitness score from 0.0 to 1.0
        """
        score = 0.0

        for test in self.test_cases:
            try:
                resp = requests.post(
                    f"{self.daemon_url}/chat",
                    data=test["input"],
                    timeout=5
                )
                response = resp.json().get("response", "")

                if test["validator"](response):
                    score += 1.0

            except Exception as e:
                print(f"[FITNESS] Error on '{test['input']}': {e}")

        return score / len(self.test_cases)

    def evaluate_with_detail(self) -> dict:
        """Evaluate with detailed results."""
        results = []

        for test in self.test_cases:
            try:
                resp = requests.post(
                    f"{self.daemon_url}/chat",
                    data=test["input"],
                    timeout=5
                )
                response = resp.json().get("response", "")
                passed = test["validator"](response)

                results.append({
                    "input": test["input"],
                    "response": response[:100],
                    "passed": passed
                })

            except Exception as e:
                results.append({
                    "input": test["input"],
                    "response": f"ERROR: {e}",
                    "passed": False
                })

        fitness = sum(1 for r in results if r["passed"]) / len(results)

        return {
            "fitness": fitness,
            "results": results
        }
```

### Step 2: Population Manager

```python
#!/usr/bin/env python3
"""
evolution_engine.py - Genetic algorithm for PixelBrain evolution
"""

import numpy as np
from PIL import Image
import shutil
import json
from pathlib import Path
from fitness_evaluator import FitnessEvaluator

class EvolutionEngine:
    """Evolve PixelBrains through genetic algorithm."""

    def __init__(
        self,
        population_size: int = 10,
        mutation_rate: float = 0.01,
        mutation_strength: float = 0.1,
        texture_size: int = 1024
    ):
        self.population_size = population_size
        self.mutation_rate = mutation_rate
        self.mutation_strength = mutation_strength
        self.texture_size = texture_size
        self.population_dir = Path("evolution_population")
        self.population_dir.mkdir(exist_ok=True)

        self.evaluator = FitnessEvaluator()
        self.generation = 0
        self.history = []

    def initialize_population(self):
        """Create initial random population."""
        print(f"[EVOLVE] Initializing population of {self.population_size} brains...")

        for i in range(self.population_size):
            # Create random texture
            texture = np.random.randint(
                0, 256,
                (self.texture_size, self.texture_size, 4),
                dtype=np.uint8
            )

            # Most pixels are near zero (small weights)
            texture[:, :, :2] = (texture[:, :, :2].astype(np.float32) * 0.1).astype(np.uint8)
            texture[:, :, 3] = 255  # Valid marker

            # Save
            brain_path = self.population_dir / f"brain_{i:03d}.png"
            Image.fromarray(texture).save(brain_path)

        print(f"[EVOLVE] Created {self.population_size} random brains")

    def evaluate_population(self) -> list:
        """Evaluate fitness of all brains."""
        fitness_scores = []

        for i in range(self.population_size):
            brain_path = self.population_dir / f"brain_{i:03d}.png"

            # Load brain into daemon (implementation-specific)
            # This would involve copying to the daemon's load path
            # For now, assume daemon loads from a specific path

            # Evaluate
            result = self.evaluator.evaluate_with_detail()
            fitness = result["fitness"]

            fitness_scores.append({
                "index": i,
                "fitness": fitness,
                "results": result["results"]
            })

            print(f"[EVOLVE] Brain {i:03d}: fitness={fitness:.3f}")

        # Sort by fitness (descending)
        fitness_scores.sort(key=lambda x: x["fitness"], reverse=True)
        return fitness_scores

    def select_survivors(self, fitness_scores: list, survival_rate: float = 0.5) -> list:
        """Select top performers to survive."""
        num_survivors = max(2, int(self.population_size * survival_rate))
        survivors = fitness_scores[:num_survivors]
        print(f"[EVOLVE] Selected {num_survivors} survivors")
        return [s["index"] for s in survivors]

    def mutate(self, parent_idx: int, child_idx: int):
        """Create mutated offspring from parent."""
        parent_path = self.population_dir / f"brain_{parent_idx:03d}.png"
        child_path = self.population_dir / f"brain_{child_idx:03d}.png"

        # Load parent
        parent = np.array(Image.open(parent_path))

        # Create mutations
        child = parent.copy()
        mutation_mask = np.random.random((self.texture_size, self.texture_size)) < self.mutation_rate

        # Apply Gaussian noise to selected pixels
        noise = np.random.randn(*child.shape[:2], 2) * self.mutation_strength * 255
        noise = noise.astype(np.int16)

        for c in range(2):  # Only mutate R and G channels (weight data)
            child[:, :, c] = np.clip(
                child[:, :, c].astype(np.int16) + noise[:, :, c] * mutation_mask,
                0, 255
            ).astype(np.uint8)

        # Save child
        Image.fromarray(child).save(child_path)

    def crossover(self, parent1_idx: int, parent2_idx: int, child_idx: int):
        """Create child through crossover of two parents."""
        p1_path = self.population_dir / f"brain_{parent1_idx:03d}.png"
        p2_path = self.population_dir / f"brain_{parent2_idx:03d}.png"
        child_path = self.population_dir / f"brain_{child_idx:03d}.png"

        p1 = np.array(Image.open(p1_path))
        p2 = np.array(Image.open(p2_path))

        # Uniform crossover
        mask = np.random.random((self.texture_size, self.texture_size)) > 0.5
        child = np.where(mask[:, :, None], p1, p2)

        Image.fromarray(child).save(child_path)

    def evolve_generation(self) -> dict:
        """Run one generation of evolution."""
        self.generation += 1
        print(f"\n{'='*60}")
        print(f"GENERATION {self.generation}")
        print(f"{'='*60}")

        # Evaluate
        fitness_scores = self.evaluate_population()

        # Select survivors
        survivor_indices = self.select_survivors(fitness_scores)

        # Create new population
        new_idx = 0
        child_count = self.population_size - len(survivor_indices)

        # Keep survivors
        for i, survivor_idx in enumerate(survivor_indices):
            src = self.population_dir / f"brain_{survivor_idx:03d}.png"
            dst = self.population_dir / f"brain_{new_idx:03d}.png"
            if src != dst:
                shutil.copy(src, dst)
            new_idx += 1

        # Create offspring through mutation and crossover
        while new_idx < self.population_size:
            # Pick random survivor as parent
            parent_idx = survivor_indices[np.random.randint(len(survivor_indices))]

            # Sometimes crossover, sometimes just mutate
            if np.random.random() < 0.3 and len(survivor_indices) > 1:
                parent2_idx = survivor_indices[np.random.randint(len(survivor_indices))]
                while parent2_idx == parent_idx:
                    parent2_idx = survivor_indices[np.random.randint(len(survivor_indices))]
                self.crossover(parent_idx, parent2_idx, new_idx)
            else:
                self.mutate(parent_idx, new_idx)

            new_idx += 1

        # Record history
        generation_record = {
            "generation": self.generation,
            "best_fitness": fitness_scores[0]["fitness"],
            "avg_fitness": np.mean([f["fitness"] for f in fitness_scores]),
            "worst_fitness": fitness_scores[-1]["fitness"],
            "best_results": fitness_scores[0]["results"]
        }
        self.history.append(generation_record)

        return generation_record

    def run(self, max_generations: int = 100, target_fitness: float = 0.9):
        """Run evolution until target fitness or max generations."""
        self.initialize_population()

        for gen in range(max_generations):
            record = self.evolve_generation()

            print(f"\n[EVOLVE] Best: {record['best_fitness']:.3f}")
            print(f"[EVOLVE] Avg:  {record['avg_fitness']:.3f}")
            print(f"[EVOLVE] Worst: {record['worst_fitness']:.3f}")

            if record['best_fitness'] >= target_fitness:
                print(f"\n[EVOLVE] Target fitness {target_fitness} reached!")
                break

        # Save best brain
        best_path = self.population_dir / "brain_000.png"
        shutil.copy(best_path, "best_evolved_brain.png")
        print(f"\n[EVOLVE] Best brain saved to best_evolved_brain.png")

        # Save history
        with open("evolution_history.json", "w") as f:
            json.dump(self.history, f, indent=2)

        return self.history


if __name__ == '__main__':
    engine = EvolutionEngine(
        population_size=10,
        mutation_rate=0.01,
        mutation_strength=0.1
    )
    engine.run(max_generations=50, target_fitness=0.8)
```

---

## Comparison of Training Approaches

| Aspect | Convert (A) | Hebbian (B) | Evolution (C) |
|--------|-------------|-------------|---------------|
| **Time** | Minutes | Hours-Days | Days-Weeks |
| **Quality** | High (proven) | Medium | Variable |
| **Data Needed** | None | Quality-labeled chats | Fitness function |
| **Compute** | Minimal | Moderate | High (population) |
| **Control** | Limited | High (per chat) | Low (random) |
| **Best For** | Quick start | Fine-tuning | Novel architectures |

## Recommended Training Pipeline

```
┌─────────────────────────────────────────────────────────────────────────┐
│  PHASE 1: CONVERT (Day 1)                                                │
│  Load TinyStories-1M → PixelBrain                                        │
│  Result: Working model immediately                                       │
└───────────────────────────────────────┬─────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────┐
│  PHASE 2: HEBBIAN FINE-TUNE (Days 2-7)                                   │
│  Chat with users → Rate responses → Strengthen good pathways            │
│  Result: Model specialized to your use case                              │
└───────────────────────────────────────┬─────────────────────────────────┘
                                        │
                                        ▼
┌─────────────────────────────────────────────────────────────────────────┐
│  PHASE 3: EVOLUTIONARY OPTIMIZE (Ongoing)                                │
│  Create population → Select best → Mutate → Repeat                       │
│  Result: Continuous improvement without manual labeling                  │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## Training Parameters Reference

### Hebbian Learning

| Parameter | Typical Value | Effect |
|-----------|---------------|--------|
| `learning_rate` (η) | 0.01 | Higher = faster learning, more instability |
| `reward_scale` | 1.0 | Amplify/reduce user feedback signal |
| `activation_threshold` | 0.1 | Minimum activation to trigger update |
| `batch_size` | 1-10 | Chats per update cycle |

### Evolution

| Parameter | Typical Value | Effect |
|-----------|---------------|--------|
| `population_size` | 10-100 | Larger = more diversity, slower |
| `mutation_rate` | 0.001-0.01 | Higher = more exploration |
| `mutation_strength` | 0.05-0.2 | Higher = larger weight changes |
| `survival_rate` | 0.3-0.5 | Fraction kept each generation |
| `crossover_rate` | 0.2-0.4 | How often to combine parents |

---

## Troubleshooting

### Model Produces Gibberish

**Cause:** Weights not properly initialized or corrupted.

**Solution:**
```python
# Check weight distribution
import numpy as np
from PIL import Image

texture = np.array(Image.open("brain.rts.png"))
r = texture[:, :, 0].flatten()
g = texture[:, :, 1].flatten()

# Decode to float16
weights = []
for i in range(len(r)):
    bits = r[i] | (g[i] << 8)
    w = np.frombuffer(np.array([bits], dtype=np.uint16).tobytes(), dtype=np.float16)[0]
    weights.append(w)

weights = np.array(weights)
print(f"Mean: {weights.mean():.4f}")
print(f"Std:  {weights.std():.4f}")
print(f"Min:  {weights.min():.4f}")
print(f"Max:  {weights.max():.4f}")

# Should be approximately: mean≈0, std≈0.02
```

### Learning Not Improving

**Cause:** Learning rate too low or reward signal too weak.

**Solution:**
1. Increase `learning_rate` to 0.05
2. Amplify reward signal: `reward *= 2.0`
3. Check that activations are non-zero

### Evolution Stuck at Low Fitness

**Cause:** Insufficient genetic diversity.

**Solution:**
1. Increase `mutation_rate` to 0.02
2. Increase `population_size` to 20+
3. Add immigration (random new brains each generation)

---

## See Also

- [Pixel LLM](PIXEL_LLM.md) - Architecture overview
- [Chat Learning Loop](CHAT_LEARNING_LOOP.md) - Hebbian learning from chat
- [GPU Daemon API](GPU_DAEMON_API.md) - Inference endpoints

---

*No gradients. No backprop. Just local learning and natural selection.*
