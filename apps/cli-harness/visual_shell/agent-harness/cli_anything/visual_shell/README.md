# g-visual: Geometry OS Visual Shell CLI

CLI for managing the Geometry OS Visual Shell - the PixiJS-powered infinite desktop environment.

## Installation

```bash
# From source
cd apps/cli-harness/visual_shell/agent-harness
pip install -e .

# Or publish to PyPI
python -m build && twine upload dist/*
```

## Usage

```bash
# Show visual shell status
g-visual status
g-visual --json status  # JSON output for AI agents

# List display layers
g-visual layers

# Create a new display layer
g-visual create-layer --name "my_layer" --type "static" --z-index 50

# Remove a display layer
g-visual remove-layer layer_001

# Set desktop wallpaper
g-visual set-wallpaper /path/to/image.jpg

# List active widgets
g-visual widgets

# Add a widget to desktop
g-visual add-widget --name "clock" --type "clock" --x 100 --y 100

# Remove a widget from desktop
g-visual remove-widget widget_001
```

## Commands

- `g-visual status` - Show visual shell status
- `g-visual layers` - List display layers
- `g-visual create-layer` - Create a new display layer
- `g-visual remove-layer` - Remove a display layer
- `g-visual set-wallpaper` - Set desktop wallpaper
- `g-visual widgets` - List active widgets
- `g-visual add-widget` - Add a widget to desktop
- `g-visual remove-widget` - Remove a widget from desktop

All commands support `--json` flag for AI agent compatibility.

## Development

```bash
# Run tests
python -m pytest cli_anything/visual_shell/tests/
```