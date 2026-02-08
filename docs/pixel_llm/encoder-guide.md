# Vision Encoder Selection Guide

## Overview

Pixel LLM supports multiple pre-trained vision encoder backends. This guide helps you choose the right encoder for your use case.

## Available Encoders

### CLIP (OpenAI)

**Trained on:** 400M image-text pairs (contrastive learning)

**Models:**
- `ViT-B/32`: 86M params, 512 dim, fastest
- `ViT-B/16`: 150M params, 768 dim, good balance
- `ViT-L/14`: 300M params, 768 dim, **recommended**
- `ViT-L/14@336px`: 300M params, 768 dim, higher resolution

**Best for:**
- General image understanding
- Text-image aligned features
- Faster inference

**Pros:**
- Excellent zero-shot performance
- Fast inference (especially B/32)
- Well-tested, widely adopted

**Cons:**
- May be biased toward web image-text pairs
- Lower resolution than DINOv2

**Usage:**
```python
from geometry_os.systems.pixel_llm.encoders import create_clip_encoder

encoder = create_clip_encoder("ViT-L/14", device="cuda")
features = encoder(images)  # [batch, num_patches, 768]
```

### DINOv2 (Meta)

**Trained on:** 142M images (self-supervised, no labels)

**Models:**
- `small`: 22M params, 384 dim, fastest
- `base`: 86M params, 768 dim, good balance
- `large`: 300M params, 1024 dim, **recommended**
- `giant`: 1100M params, 1536 dim, best quality

**Best for:**
- Fine-grained visual features
- Domain-specific images (medical, satellite)
- Downstream tasks requiring detailed features

**Pros:**
- Strong visual features without text bias
- Higher resolution support
- Better for fine-grained tasks

**Cons:**
- Slower inference (especially giant)
- Larger download size
- More GPU memory

**Usage:**
```python
from geometry_os.systems.pixel_llm.encoders import create_dinov2_encoder

encoder = create_dinov2_encoder("large", device="cuda")
features = encoder(images)  # [batch, 257, 1024]
```

### Default (Random)

**Trained on:** None (random initialization)

**Configuration:** 4 layers, 768 dim, ~40M params

**Best for:**
- Debugging
- Learning/education
- Baseline comparison

**Pros:**
- No download required
- Fastest inference
- Lowest memory usage

**Cons:**
- Poor feature quality
- Not suitable for production

## Selection Matrix

| Use Case | Recommended Encoder | Model | Reason |
|----------|---------------------|-------|--------|
| General captioning | CLIP | ViT-L/14 | Best text-image alignment |
| Real-time video | CLIP | ViT-B/32 | Fastest inference |
| Medical images | DINOv2 | large | Fine-grained features |
| Satellite images | DINOv2 | large | Domain-agnostic features |
| Edge deployment | CLIP | ViT-B/32 | Small model, fast |
| Highest quality | DINOv2 | giant | Best features |

## Performance Comparison

Based on benchmarks (RTX 5090, batch_size=4):

| Encoder | Latency (ms) | Throughput (img/s) | Memory (GB) | Model Size (MB) |
|---------|--------------|-------------------|-------------|-----------------|
| Default | ~10 | ~400 | ~0.5 | ~160 |
| CLIP B/32 | ~15 | ~267 | ~1.0 | ~350 |
| CLIP L/14 | ~25 | ~160 | ~2.0 | ~1200 |
| DINOv2 base | ~20 | ~200 | ~1.5 | ~700 |
| DINOv2 large | ~40 | ~100 | ~3.0 | ~1200 |

## Installation

### CLIP
```bash
pip install openai-clip
```

### DINOv2
```bash
pip install transformers
```

## Usage with HybridPixelLLM

```python
from geometry_os.systems.pixel_llm.lm_studio_integration import HybridPixelLLM

# Use CLIP encoder
model = HybridPixelLLM(
    encoder_type="clip",
    encoder_config={"model_name": "ViT-L/14"},
    lm_studio_model="qwen2.5-coder-7b-instruct",
)

# Use DINOv2 encoder
model = HybridPixelLLM(
    encoder_type="dinov2",
    encoder_config={"model_name": "large"},
    lm_studio_model="qwen2.5-coder-7b-instruct",
)

# Use default encoder
model = HybridPixelLLM(
    encoder_type="default",
    lm_studio_model="qwen2.5-coder-7b-instruct",
)
```

## Tips

1. **Start with CLIP ViT-L/14** for most use cases
2. **Use CLIP ViT-B/32** for real-time applications
3. **Use DINOv2 large** for domain-specific images
4. **Benchmark on your data** before committing to a model
5. **Consider memory constraints** - larger models need more GPU memory

## Troubleshooting

### Out of Memory
- Use smaller model (B/32 instead of L/14)
- Reduce batch size
- Use CPU as fallback

### Slow Inference
- Use CLIP ViT-B/32
- Reduce input resolution
- Use GPU instead of CPU

### Poor Quality
- Upgrade to larger model (L/14 or large)
- Try different encoder (CLIP vs DINOv2)
- Fine-tune on your domain
