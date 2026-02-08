# Pixel LLM - Vision-Language Model for Geometry OS

Pixel LLM is a pixel-level image-to-text model that processes images and generates natural language descriptions using a vision encoder + language decoder architecture.

## Architecture Overview

Pixel LLM combines two main components:

### Vision Encoder
- **Patch Embedding**: Converts images into patch embeddings (ViT-style)
- **Transformer Layers**: Processes patches with self-attention
- **Output**: Visual feature representations

### Language Decoder
- **Token Embedding**: Converts text tokens to embeddings
- **Self-Attention**: Causal attention for autoregressive generation
- **Cross-Attention**: Attends to vision features from encoder
- **FFN**: Feed-forward network for transformation
- **Output**: Next token predictions

```
Image → [Vision Encoder] → Visual Features
                                    ↓
Token IDs → [Language Decoder] ← Cross-Attention
                                    ↓
                              Logits → Tokens
```

## Installation

### Requirements
```bash
pip install torch torchvision pillow
```

### Optional Dependencies
```bash
# For testing
pip install pytest

# For visualization
pip install matplotlib
```

## Usage

### Basic Usage

```python
from geometry_os.systems.pixel_llm import create_pixel_llm, generate_caption
import torch

# Create model
model = create_pixel_llm(vocab_size=50000)

# Generate caption for an image
images = torch.randn(1, 3, 224, 224)  # [batch, channels, height, width]
captions = model.generate(images, max_length=50)
```

### Custom Configuration

```python
from geometry_os.systems.pixel_llm import PixelLLM, PixelLLMConfig

config = PixelLLMConfig(
    image_size=256,           # Input image size
    patch_size=16,            # Patch size for ViT
    vision_embed_dim=768,     # Vision embedding dimension
    vision_num_layers=6,      # Number of vision encoder layers
    vocab_size=50000,         # Vocabulary size
    text_embed_dim=768,       # Text embedding dimension
    text_num_layers=12,       # Number of decoder layers
    max_seq_len=512,          # Maximum sequence length
)

model = PixelLLM(config)
```

### Training

```python
from geometry_os.systems.pixel_llm import PixelLLMTrainer, PixelLLMConfig as TrainerConfig
from geometry_os.systems.pixel_llm.data import ImageTextDataset, create_dataloader

# Create dataset
dataset = ImageTextDataset("data/captions.json")
train_loader = create_dataloader(dataset, batch_size=32, shuffle=True)

# Create trainer
trainer_config = TrainerConfig(
    learning_rate=1e-4,
    num_epochs=10,
    use_amp=True,  # Automatic mixed precision
    checkpoint_dir="./checkpoints",
)

trainer = PixelLLMTrainer(
    model=model,
    config=trainer_config,
    train_dataloader=train_loader,
)

# Train
trainer.train()
```

### Inference

```python
from geometry_os.systems.pixel_llm.inference import generate_caption, GenerationConfig

# Configure generation
gen_config = GenerationConfig(
    max_length=100,
    temperature=0.7,        # Sampling temperature
    do_sample=True,         # Use sampling vs greedy
    top_k=50,               # Top-k sampling
    top_p=0.95,             # Nucleus sampling
)

# Generate with configuration
caption_ids = generate_caption(model, images, config=gen_config)
```

## API Reference

### Model Classes

#### `PixelLLM`
Main vision-language model class.

**Parameters:**
- `config` (PixelLLMConfig): Model configuration

**Methods:**
- `forward(images, input_ids, attention_mask=None)`: Forward pass
- `generate(images, max_length=100, temperature=1.0, do_sample=False, ...)`: Generate captions

#### `VisionEncoder`
CNN/ViT-based image encoder.

**Parameters:**
- `image_size` (int): Input image size
- `patch_size` (int): Patch size
- `embed_dim` (int): Embedding dimension
- `num_layers` (int): Number of transformer layers
- `num_heads` (int): Number of attention heads

#### `LanguageDecoder`
Transformer decoder with cross-attention.

**Parameters:**
- `vocab_size` (int): Vocabulary size
- `embed_dim` (int): Embedding dimension
- `num_layers` (int): Number of decoder layers
- `cross_attention_dim` (int): Cross-attention dimension
- `num_cross_attention_layers` (int): Number of cross-attention layers

### Training Classes

#### `PixelLLMTrainer`
Trainer with AMP support and checkpointing.

**Parameters:**
- `model` (PixelLLM): Model to train
- `config` (PixelLLMConfig): Training configuration
- `train_dataloader` (DataLoader): Training data
- `val_dataloader` (DataLoader): Validation data (optional)

**Methods:**
- `train()`: Run full training loop
- `train_epoch()`: Train for one epoch
- `validate()`: Run validation
- `save_checkpoint(name)`: Save checkpoint
- `load_checkpoint(path)`: Load checkpoint

### Data Classes

#### `ImageTextDataset`
Dataset for image-text pairs.

**Parameters:**
- `data_path` (str): Path to JSON file
- `tokenizer` (Callable): Tokenizer function
- `config` (DatasetConfig): Dataset configuration
- `image_root` (str): Root directory for images

**Expected JSON Format:**
```json
[
  {"image": "path/to/image1.jpg", "caption": "Description 1"},
  {"image": "path/to/image2.jpg", "caption": "Description 2"}
]
```

### Inference Functions

#### `generate_caption(model, images, config=None)`
Generate caption for images.

#### `beam_search_decode(model, images, num_beams=5)`
Generate captions using beam search.

## Training Guide

### Data Preparation

1. Prepare your image-text pairs in JSON format:
```json
[
  {"image": "images/cat.jpg", "caption": "A cat sitting on a couch"},
  {"image": "images/dog.jpg", "caption": "A dog playing in the park"}
]
```

2. Create a tokenizer (or use a simple vocabulary):
```python
from geometry_os.systems.pixel_llm.models import SimpleVocabulary

texts = ["caption 1", "caption 2", ...]
vocab = SimpleVocabulary(texts)
```

3. Create the dataset:
```python
dataset = ImageTextDataset(
    "data/captions.json",
    tokenizer=vocab.encode,
    image_root="data/images",
)
```

### Training Tips

1. **Start with a small model** for debugging:
```python
config = PixelLLMConfig(
    vision_embed_dim=256,
    text_num_layers=4,
    vocab_size=5000,
)
```

2. **Use AMP for faster training**:
```python
trainer_config = TrainerConfig(use_amp=True)
```

3. **Monitor validation loss** to prevent overfitting:
```python
trainer_config = TrainerConfig(
    val_interval=500,
)
```

4. **Save checkpoints regularly**:
```python
trainer_config = TrainerConfig(
    checkpoint_interval=1000,
    save_total_limit=3,
)
```

### Evaluation

Generate captions and compare with references:
```python
model.eval()
with torch.no_grad():
    captions = model.generate(images, max_length=50)
```

## Examples

See `demo_pixel_llm.py` for a complete example demonstrating:
- Model creation
- Forward pass
- Training loop
- Caption generation
- Inference API

Run the demo:
```bash
cd geometry_os/systems/pixel_llm
python demo_pixel_llm.py
```

## Running Tests

```bash
cd geometry_os/systems/pixel_llm
pytest tests/test_pixel_llm.py -v
```

For coverage:
```bash
pytest tests/test_pixel_llm.py --cov=. --cov-report=html
```

## License

Part of Geometry OS. See main project license.

## Contributing

When adding features:
1. Add tests to `tests/test_pixel_llm.py`
2. Update this documentation
3. Follow existing code style (type hints, docstrings)
4. Ensure tests pass before submitting
