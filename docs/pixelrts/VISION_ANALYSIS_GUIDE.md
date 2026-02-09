# PixelRTS Vision Analysis Guide

## Overview

PixelRTS Vision Analysis enables AI-powered visual inspection of PixelRTS container images (`.rts.png` files). Using vision-language models, you can analyze the visual patterns, entropy distribution, and structural characteristics of binary data encoded in the PixelRTS format.

### What Vision Models Can Detect

When analyzing a PixelRTS artifact, vision models can identify:

1. **Structural Patterns**
   - Repeated blocks and sections
   - Data regions and boundaries
   - Regular patterns indicating specific file types
   - Segment transitions and boundaries

2. **Entropy Distribution**
   - High-entropy areas (compressed/encrypted data)
   - Low-entropy areas (structured data, headers)
   - Data density variations across the image
   - Visual complexity patterns

3. **Anomalies**
   - Unexpected visual artifacts
   - Data corruption indicators
   - Unusual patterns that may indicate issues
   - Encoding errors or data inconsistencies

4. **Binary Format Characteristics**
   - ELF header signatures (for kernels/binaries)
   - Section headers and boundaries
   - Architecture-specific patterns
   - File type identification hints

## Quick Start

### Prerequisites

1. **Install dependencies:**
   ```bash
   pip install Pillow numpy matplotlib requests
   ```

2. **Ensure LM Studio is running:**
   - Download LM Studio from https://lmstudio.ai/
   - Start LM Studio
   - Load a vision-capable model (e.g., `llava-phi-3`, `bakllava`)
   - Start the API server (usually on `http://localhost:1234/v1`)

### Basic Usage

#### Using the CLI Tool

```bash
# Analyze a PixelRTS image
python -m systems.pixel_compiler.pixelrts_vision_analyzer analyze ubuntu_kernel.rts.png

# Generate entropy overlay
python -m systems.pixel_compiler.pixelrts_vision_analyzer entropy ubuntu_kernel.rts.png

# Get visual summary
python -m systems.pixel_compiler.pixelrts_vision_analyzer summary ubuntu_kernel.rts.png
```

#### Using the Python API

```python
from systems.pixel_compiler.pixelrts_vision_analyzer import PixelRTSVisionAnalyzer

# Load an artifact
analyzer = PixelRTSVisionAnalyzer("ubuntu_kernel.rts.png")

# Get visual summary
summary = analyzer.get_visual_summary()
print(f"Dimensions: {summary['width']}x{summary['height']}")
print(f"Total pixels: {summary['total_pixels']}")
print(f"Aspect ratio: {summary['aspect_ratio']:.2f}")

# Generate entropy overlay
overlay_path = analyzer.generate_entropy_overlay("./output")
print(f"Entropy overlay saved to: {overlay_path}")

# Analyze with vision model (requires LM Studio running)
vision_response = analyzer.analyze_with_vision_model()
print(vision_response)

# Parse findings from vision response
findings = analyzer.parse_vision_findings(vision_response)
print(f"Structural patterns: {findings['structural_patterns']}")
print(f"Anomalies: {findings['anomalies']}")

# Generate findings overlay
findings_overlay = analyzer.generate_findings_overlay(findings)
print(f"Findings overlay saved to: {findings_overlay}")
```

## API Reference

### PixelRTSVisionAnalyzer

#### `__init__(rts_path: str)`

Initialize the analyzer with a PixelRTS PNG file.

**Parameters:**
- `rts_path`: Path to `.rts.png` file

**Raises:**
- `FileNotFoundError`: If file doesn't exist
- `ValueError`: If file is not a valid PNG

#### `get_visual_summary() -> Dict[str, Any]`

Get visual summary of the PixelRTS image.

**Returns:**
- `width`: Image width in pixels
- `height`: Image height in pixels
- `total_pixels`: Total number of pixels
- `channels`: Number of color channels (typically 4 for RGBA)
- `aspect_ratio`: Width/height ratio
- `grid_size`: Grid size if available in metadata
- `format`: Format identifier from metadata
- `data_size`: Data size if available in metadata

#### `generate_entropy_overlay(output_dir: str, colormap: str = "viridis") -> str`

Generate entropy heatmap overlay visualization.

**Parameters:**
- `output_dir`: Directory to save output image
- `colormap`: Matplotlib colormap name (default: "viridis")

**Returns:**
- Path to generated overlay image

#### `prepare_for_vision_model(max_size: int = 512) -> Tuple[Image.Image, str]`

Prepare image for vision model input.

**Parameters:**
- `max_size`: Maximum dimension (width or height)

**Returns:**
- Tuple of (PIL Image, base64_encoded_string)

#### `analyze_with_vision_model(provider: ModelProvider = None, api_key: str = None) -> str`

Perform vision model analysis on the PixelRTS artifact.

**Parameters:**
- `provider`: Vision model provider (defaults to LM Studio)
- `api_key`: Optional API key for the provider

**Returns:**
- Vision model's analysis text

#### `parse_vision_findings(vision_response: str) -> Dict[str, List[str]]`

Parse structured findings from vision model response.

**Parameters:**
- `vision_response`: Raw text response from vision model

**Returns:**
- Dictionary with categorized findings:
  - `structural_patterns`: List of detected patterns
  - `entropy_distribution`: List of entropy observations
  - `anomalies`: List of detected anomalies
  - `binary_format`: List of format characteristics

#### `generate_findings_overlay(findings: Dict[str, List[str]], output_dir: str = None) -> Path`

Generate visual overlay with vision model findings annotated.

**Parameters:**
- `findings`: Parsed findings from vision model
- `output_dir`: Directory to save overlay (default: same as input)

**Returns:**
- Path to annotated overlay PNG

### VisionModelClient

#### `__init__(provider: ModelProvider, endpoint: str = None, api_key: str = None, model: str = None)`

Initialize vision model client.

**Parameters:**
- `provider`: Model provider (LM_STUDIO, OPENAI, ANTHROPIC)
- `endpoint`: Override default endpoint URL
- `api_key`: API key (for OpenAI/Anthropic)
- `model`: Override default model name

**Default Endpoints:**
- LM Studio: `http://localhost:1234/v1`
- OpenAI: `https://api.openai.com/v1`
- Anthropic: `https://api.anthropic.com/v1`

#### `build_analysis_prompt(artifact_type: str, metadata: Dict[str, Any]) -> str`

Build structured prompt for vision analysis.

**Parameters:**
- `artifact_type`: Type of artifact (kernel, initrd, wasm, etc.)
- `metadata`: PixelRTS metadata dictionary

**Returns:**
- Structured prompt string

#### `analyze(prompt: str, image_base64: str, max_tokens: int = 2048) -> Optional[str]`

Send analysis request to vision model.

**Parameters:**
- `prompt`: Text prompt
- `image_base64`: Base64-encoded image
- `max_tokens`: Maximum tokens in response

**Returns:**
- Model's text response, or None if failed

## Troubleshooting

### LM Studio Connection Issues

**Problem:** `Connection refused` or `Request failed`

**Solutions:**
1. Verify LM Studio is running
2. Check the API server is started (look for the server icon in LM Studio)
3. Verify the port (default: 1234)
4. Test the endpoint: `curl http://localhost:1234/v1/models`

### Model Loading Issues

**Problem:** Vision model not responding

**Solutions:**
1. Ensure you're using a vision-capable model:
   - LLaVA models (`llava-phi-3`, `llava-v1.5`)
   - BakLLaVA (`bakllava`)
   - Other multimodal models
2. Check model is fully loaded in LM Studio
3. Try a smaller vision model if memory is limited

### Import Errors

**Problem:** `ModuleNotFoundError: No module named 'PIL'`

**Solution:**
```bash
pip install Pillow numpy matplotlib requests
```

### API Response Issues

**Problem:** Empty response or parsing errors

**Solutions:**
1. Check LM Studio's console for errors
2. Verify the model supports vision input
3. Try increasing `max_tokens` parameter
4. Check if the image size is too large (try reducing `max_size`)

## Examples

### Batch Analysis

```python
from systems.pixel_compiler.pixelrts_vision_analyzer import analyze_rts_directory

# Analyze all RTS files in a directory
results = analyze_rts_directory("./artifacts", "*.rts.png")
for filename, summary in results.items():
    print(f"{filename}: {summary}")
```

### Custom Provider

```python
from systems.pixel_compiler.vision_model_client import VisionModelClient, ModelProvider

# Use OpenAI instead of LM Studio
client = VisionModelClient(
    provider=ModelProvider.OPENAI,
    api_key="your-api-key"
)

analyzer = PixelRTSVisionAnalyzer("ubuntu_kernel.rts.png")
_, img_b64 = analyzer.prepare_for_vision_model()

prompt = client.build_analysis_prompt("kernel", analyzer.metadata)
response = client.analyze(prompt, img_b64)
print(response)
```

### Entropy Analysis

```python
import matplotlib.pyplot as plt
from systems.pixel_compiler.pixelrts_vision_analyzer import PixelRTSVisionAnalyzer

analyzer = PixelRTSVisionAnalyzer("ubuntu_kernel.rts.png")

# Get raw entropy map
entropy = analyzer.get_entropy_map()

# Get channel histograms
histograms = analyzer.get_channel_histograms()

# Plot entropy distribution
fig, ax = plt.subplots(figsize=(10, 6))
ax.hist(entropy.flatten(), bins=100)
ax.set_title('Entropy Distribution')
ax.set_xlabel('Entropy Value')
ax.set_ylabel('Frequency')
plt.savefig('entropy_distribution.png')
```

## Advanced Usage

### Custom Analysis Prompts

```python
from systems.pixel_compiler.vision_model_client import VisionModelClient, ModelProvider

client = VisionModelClient(provider=ModelProvider.LM_STUDIO)

# Build custom prompt
custom_prompt = """Analyze this PixelRTS kernel image focusing on:
1. ELF header location and structure
2. Section boundaries and their characteristics
3. Any signs of compression or encryption
4. Potential bootloader signatures
"""

_, img_b64 = analyzer.prepare_for_vision_model()
response = client.analyze(custom_prompt, img_b64)
```

### Multi-Provider Comparison

```python
providers = [
    (ModelProvider.LM_STUDIO, None),
    (ModelProvider.OPENAI, os.getenv("OPENAI_API_KEY")),
    (ModelProvider.ANTHROPIC, os.getenv("ANTHROPIC_API_KEY")),
]

for provider, api_key in providers:
    if api_key or provider == ModelProvider.LM_STUDIO:
        try:
            response = analyzer.analyze_with_vision_model(
                provider=provider,
                api_key=api_key
            )
            print(f"\n{provider.value} analysis:")
            print(response)
        except Exception as e:
            print(f"{provider.value} failed: {e}")
```

## File Format Reference

### PixelRTS Metadata Structure

```json
{
  "format": "PixelRTS-2.0",
  "format_version": 2,
  "grid_size": 2048,
  "encoding": {
    "type": "RGBA-dense",
    "bytes_per_pixel": 4,
    "mapping": "Hilbert space-filling curve"
  },
  "type": "kernel",
  "name": "Ubuntu Kernel",
  "data_size": 15341960,
  "segments": {
    "Ubuntu Kernel": {
      "type": "kernel",
      "size": 15341960,
      "sha256": "..."
    }
  }
}
```

### Artifact Type Detection

The analyzer automatically detects artifact types from:
1. Metadata `type` field
2. Segment type information
3. Filename patterns

Supported types:
- `kernel`: Linux kernels, vmlinuz, bzImage
- `initrd`: Initial ramdisks, initramfs
- `wasm`: WebAssembly modules
- `binary`: Generic binary data

## Related Documentation

- [PixelRTS Architecture](PIXELRTS_ARCHITECTURE.md)
- [PixelRTS v2 Architecture](PIXELRTS_V2_ARCHITECTURE.md)
- [Spatial Software Guide](SPATIAL_SOFTWARE_GUIDE.md)
- [Universal Converter](UNIVERSAL_CONVERTER.md)
