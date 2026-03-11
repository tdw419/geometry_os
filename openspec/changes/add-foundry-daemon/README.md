# Foundry Daemon - OpenSpec Proposal

**Change ID**: `add-foundry-daemon`
**Status**: Implemented / Proposed
**Created**: 2026-01-19

## Overview
This proposal implements the **Foundry Daemon**, a bridge between natural language intents and the Geometry OS executable builder queue. It leverages a local **LM Studio** instance to generate Python code for Hybrid DNA Bricks.

## Architecture
- **Input**: Markdown files in `systems/foundry/intents/`
- **Processing**: Local LLM (OpenAI API) -> Code Extraction -> PNG Encoding
- **Output**: Valid `.rts.png` bricks in `systems/builder/queue/`

## Quick Start
```bash
# 1. Verify LM Studio is running (Port 1234)
python3 check_lm_studio.py

# 2. Start the Daemon
python3 systems/foundry/foundry_daemon.py
```

## Status
- Core logic implemented in `systems/foundry/foundry_daemon.py`.
- Sample intent provided in `systems/foundry/intents/hello_foundry.md`.
- Validated against OpenSpec.
