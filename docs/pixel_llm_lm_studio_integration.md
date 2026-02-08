# Pixel LLM - LM Studio Integration Guide

This guide covers the integration between Pixel LLM's vision encoder and LM Studio, enabling hybrid image captioning that combines specialized visual feature extraction with powerful language model generation.

## Overview

The LM Studio integration provides a hybrid approach to image captioning:

1. **Vision Feature Extraction**: A trained VisionEncoder processes images and extracts rich visual feature representations
2. **Feature Summarization**: Visual features are compressed into a compact text representation
3. **Language Generation**: LM Studio's API generates fluent natural language descriptions from the visual features

This architecture allows you to:
- Use a lightweight, specialized vision encoder trained on your specific domain
- Leverage powerful language models from LM Studio for high-quality text generation
- Update language models without retraining the vision encoder
- Mix and match different vision encoders and language models

## Architecture

```
Input Image
    |
    v
[Pixel LLM Vision Encoder]
    |
    v
Visual Features [num_patches, embed_dim]
    |
    +--> Feature Summarization
         |
         v
    Text Summary (JSON-like)
    |
    v
[LM Studio API]
    |
    v
Generated Caption
```

### Data Flow

1. **Image Input**: RGB image tensor `[batch, 3, height, width]`
2. **Vision Encoding**: VisionEncoder processes image into patch features
3. **Feature Aggregation**: Mean pooling and strategic patch sampling
4. **Prompt Construction**: Features formatted as structured text prompt
5. **API Request**: POST to LM Studio `/chat/completions` endpoint
6. **Caption Generation**: Language model produces natural language description

## Installation

### Requirements

```bash
# Core dependencies
pip install torch torchvision pillow

# LM Studio integration
pip install requests

# Optional: for development
pip install pytest matplotlib
```

### LM Studio Setup

1. Install [LM Studio](https://lmstudio.ai/)
2. Load a model (e.g., `qwen2.5-coder-7b-instruct`)
3. Enable the API server:
   - Open LM Studio
   - Go to the "Server" tab
   - Click "Start Server"
   - Note the port (default: `1234`)

## Usage

### Basic Usage

The simplest way to use the integration is via the `HybridPixelLLM` class:

```python
import torch
from geometry_os.systems.pixel_llm.lm_studio_integration import HybridPixelLLM

# Initialize the hybrid model
model = HybridPixelLLM(
    checkpoint_path="checkpoints/vision_encoder.pt",
    lm_studio_model="qwen2.5-coder-7b-instruct",
    lm_studio_url="http://localhost:1234/v1",
)

# Load an image
from PIL import Image
image = Image.open("path/to/image.jpg")
image_tensor = torch.from_numpy(image).permute(2, 0, 1).float() / 255.0

# Generate a caption
caption = model.generate(image_tensor)
print(caption)
# Output: "A blue geometric shape overlapping with a red circle"
```

### Batch Processing

Process multiple images efficiently with batch generation:

```python
from geometry_os.systems.pixel_llm.lm_studio_integration import HybridPixelLLM

model = HybridPixelLLM(
    checkpoint_path="checkpoints/vision_encoder.pt",
)

# Prepare a list of image tensors
images = [image_tensor1, image_tensor2, image_tensor3]

# Generate captions for all images
captions = model.generate_batch(images, max_tokens=128)

for i, caption in enumerate(captions):
    print(f"Image {i}: {caption}")
```

### Using Different LM Studio Models

You can easily switch between different language models:

```python
# Use a different model for more creative captions
creative_model = HybridPixelLLM(
    checkpoint_path="checkpoints/vision_encoder.pt",
    lm_studio_model="llama-3-70b-instruct",
    temperature=0.9,  # Higher temperature for more creativity
    max_tokens=256,
)

# Use a more focused model for technical descriptions
technical_model = HybridPixelLLM(
    checkpoint_path="checkpoints/vision_encoder.pt",
    lm_studio_model="qwen2.5-coder-7b-instruct",
    temperature=0.3,  # Lower temperature for focused output
    max_tokens=128,
)
```

### Vision Feature Extraction Only

Extract visual features without generating captions:

```python
from geometry_os.systems.pixel_llm.lm_studio_integration import VisionFeatureExtractor

# Load the feature extractor
extractor = VisionFeatureExtractor(
    checkpoint_path="checkpoints/vision_encoder.pt",
    device="cuda",  # or "cpu" or "auto"
)

# Extract features
features = extractor.extract_features(image_tensor)
print(features.shape)  # torch.Size([1, 196, 768])

# Extract features for multiple images
features_batch = extractor.extract_features_batch(
    [image_tensor1, image_tensor2, image_tensor3],
    batch_size=8,
)
```

### Custom Prompt Templates

Customize the prompt sent to LM Studio for specialized use cases:

```python
custom_prompt = """
You are analyzing geometric patterns for a CAD system.

Visual Analysis:
- Patches analyzed: {num_patches}
- Feature statistics: {feature_mean}
- Representative patches: {sample_features}

Provide a technical description focusing on:
1. Geometric shapes present
2. Spatial relationships
3. Dimensions and proportions

Output format: JSON with keys "shapes", "relationships", "dimensions"
"""

model = HybridPixelLLM(
    checkpoint_path="checkpoints/vision_encoder.pt",
    prompt_template=custom_prompt,
)

caption = model.generate(image_tensor)
```

## API Reference

### HybridPixelLLM

Main class for hybrid image captioning combining vision encoder and LM Studio.

**Constructor:**

```python
HybridPixelLLM(
    checkpoint_path: Union[str, Path],
    lm_studio_model: str = "qwen2.5-coder-7b-instruct",
    lm_studio_url: str = "http://localhost:1234/v1",
    device: str = "auto",
    max_tokens: int = 256,
    temperature: float = 0.7,
    prompt_template: Optional[str] = None,
)
```

**Parameters:**
- `checkpoint_path`: Path to vision encoder checkpoint file
- `lm_studio_model`: Model name loaded in LM Studio
- `lm_studio_url`: Base URL for LM Studio API
- `device`: Device for vision encoder (`"cuda"`, `"cpu"`, or `"auto"`)
- `max_tokens`: Maximum tokens in generated captions
- `temperature`: Sampling temperature (0.0-2.0, higher = more creative)
- `prompt_template`: Custom prompt template for LM Studio

**Methods:**

##### `generate(images, max_tokens=None, temperature=None)`

Generate a caption for one or more images.

**Parameters:**
- `images`: Input image tensor `[3, H, W]` or `[batch, 3, H, W]`
- `max_tokens`: Override default max tokens
- `temperature`: Override default temperature

**Returns:** Generated caption string or `None` if generation failed

##### `generate_batch(images, max_tokens=None, temperature=None)`

Generate captions for a list of images.

**Parameters:**
- `images`: List of image tensors
- `max_tokens`: Override default max tokens
- `temperature`: Override default temperature

**Returns:** List of caption strings (None for failed generations)

##### `check_lm_studio_available()`

Check if LM Studio API is reachable.

**Returns:** Boolean indicating API availability

### VisionFeatureExtractor

Extracts visual features from images using a trained vision encoder.

**Constructor:**

```python
VisionFeatureExtractor(
    checkpoint_path: Union[str, Path],
    device: str = "auto",
    config: Optional[PixelLLMConfig] = None,
)
```

**Parameters:**
- `checkpoint_path`: Path to checkpoint file
- `device`: Device for inference (`"cuda"`, `"cpu"`, or `"auto"`)
- `config`: Optional model configuration

**Methods:**

##### `extract_features(images, normalize=True)`

Extract visual features from images.

**Parameters:**
- `images`: Input images `[batch, 3, H, W]`
- `normalize`: Whether to L2-normalize features

**Returns:** Feature tensor `[batch, num_patches, embed_dim]`

##### `extract_features_batch(images, batch_size=8, normalize=True)`

Extract features from a list of images with batching.

**Parameters:**
- `images`: List of image tensors
- `batch_size`: Batch size for processing
- `normalize`: Whether to L2-normalize features

**Returns:** List of feature tensors

##### `save_pretrained(save_directory)`

Save the vision encoder to a directory.

**Parameters:**
- `save_directory`: Directory path to save model

### LMStudioConfig

Configuration dataclass for LM Studio connection.

```python
@dataclass
class LMStudioConfig:
    base_url: str = "http://localhost:1234/v1"
    model: str = "qwen2.5-coder-7b-instruct"
    timeout: int = 30
    max_retries: int = 3
    retry_delay: float = 0.5
```

### generate_caption_with_lm_studio()

Standalone function to generate captions from visual features.

```python
generate_caption_with_lm_studio(
    visual_features: torch.Tensor,
    lm_studio_url: str = "http://localhost:1234/v1",
    model: str = "qwen2.5-coder-7b-instruct",
    max_tokens: int = 256,
    temperature: float = 0.7,
    prompt_template: str = None,
) -> Optional[str]
```

**Parameters:**
- `visual_features`: Feature tensor from vision encoder
- `lm_studio_url`: Base URL for LM Studio API
- `model`: Model name to use
- `max_tokens`: Maximum tokens to generate
- `temperature`: Sampling temperature
- `prompt_template`: Custom prompt template

**Returns:** Generated caption or None if failed

## Examples

### Demo Script

See `demo_hybrid_pixel_llm.py` for a complete working example:

```bash
cd geometry_os/systems/pixel_llm
python demo_hybrid_pixel_llm.py
```

The demo script demonstrates:
- Loading a trained vision encoder
- Initializing the hybrid model
- Generating captions for sample images
- Batch processing
- Custom prompt templates
- Error handling and logging

### Example: Technical Image Analysis

```python
from geometry_os.systems.pixel_llm.lm_studio_integration import HybridPixelLLM

# Configure for technical analysis
technical_prompt = """
Analyze this image for technical documentation.

Visual Features: {visual_summary}

Provide:
1. Object identification
2. Spatial relationships
3. Measurements (if applicable)
4. Technical description

Format as structured text.
"""

model = HybridPixelLLM(
    checkpoint_path="checkpoints/vision_encoder_tech.pt",
    lm_studio_model="qwen2.5-coder-7b-instruct",
    prompt_template=technical_prompt,
    temperature=0.3,
    max_tokens=512,
)

caption = model.generate(technical_image)
```

### Example: Creative Image Description

```python
# Configure for creative descriptions
creative_model = HybridPixelLLM(
    checkpoint_path="checkpoints/vision_encoder.pt",
    lm_studio_model="llama-3-70b-instruct",
    temperature=0.9,
    max_tokens=256,
)

caption = creative_model.generate(artistic_image)
```

## Troubleshooting

### LM Studio Connection Issues

**Problem:** `Failed to connect to LM Studio`

**Solutions:**
1. Verify LM Studio is running
2. Check the API server is started in LM Studio
3. Confirm the URL matches your LM Studio configuration
4. Check firewall settings

```python
# Test connection
model = HybridPixelLLM("checkpoints/vision_encoder.pt")
if model.check_lm_studio_available():
    print("LM Studio is available")
else:
    print("Cannot connect to LM Studio")
```

### Checkpoint Loading Issues

**Problem:** `Checkpoint not found` or `RuntimeError: Missing keys`

**Solutions:**
1. Verify the checkpoint path is correct
2. Ensure the checkpoint contains `"vision_encoder"` state dict
3. Check if config is included in checkpoint or provide it manually

```python
# Load with explicit config
from geometry_os.systems.pixel_llm.models import PixelLLMConfig

config = PixelLLMConfig(
    image_size=224,
    patch_size=16,
    vision_embed_dim=768,
)

extractor = VisionFeatureExtractor(
    "checkpoints/vision_encoder.pt",
    config=config,
)
```

### Out of Memory Errors

**Problem:** CUDA out of memory

**Solutions:**
1. Use smaller batch sizes
2. Process on CPU instead of GPU
3. Use a smaller vision encoder

```python
# Use CPU for inference
model = HybridPixelLLM(
    checkpoint_path="checkpoints/vision_encoder.pt",
    device="cpu",
)

# Process with smaller batches
extractor = VisionFeatureExtractor("checkpoints/vision_encoder.pt")
features = extractor.extract_features_batch(images, batch_size=2)
```

## Performance Tips

1. **Batch Processing**: Use `generate_batch()` for multiple images to reduce overhead
2. **GPU Acceleration**: Use CUDA for vision encoder when available
3. **Feature Caching**: Cache extracted features if processing the same images multiple times
4. **Temperature Tuning**: Lower temperature (0.3-0.5) for focused output, higher (0.8-1.2) for creative output
5. **Token Limits**: Adjust `max_tokens` based on your needs (shorter = faster)

## Requirements

### Python Dependencies

```
torch>=2.0.0
torchvision>=0.15.0
pillow>=9.0.0
requests>=2.28.0
```

### LM Studio Requirements

- LM Studio desktop application
- At least one loaded language model
- API server enabled
- Recommended: 8GB+ RAM for 7B models, 16GB+ for 70B models

### Hardware Requirements

**Vision Encoder:**
- CPU: Any modern CPU
- GPU: Optional, but recommended for faster inference
- RAM: 4GB minimum, 8GB recommended

**LM Studio:**
- Refer to LM Studio documentation for model-specific requirements

## Related Documentation

- [Pixel LLM Main Documentation](pixel_llm.md)
- [LM Studio Documentation](https://lmstudio.ai/)
- [Vision Encoder Training](pixel_llm.md#training-guide)
- [API Reference](#api-reference)

## License

Part of Geometry OS. See main project license.
