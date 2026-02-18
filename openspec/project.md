# Geometry OS Project Context

## Overview

Geometry OS is a GPU-native operating system that runs RISC-V Linux on WebGPU compute shaders. The system provides AI-controllable VMs via WebMCP, visual spatial storage (Infinite Map), and autonomous evolution capabilities.

## Tech Stack

- **Core**: Python 3.12+, Rust, WebGPU/WGSL
- **Frontend**: PixiJS, JavaScript ES modules
- **GPU**: WebGPU compute shaders, WGSL
- **AI Integration**: WebMCP bridge, Claude Code, LM Studio

## Key Directories

| Directory | Purpose |
|-----------|---------|
| `systems/evolution_daemon/` | Autonomous evolution with safety gates |
| `systems/pixel_compiler/` | RTS format handling, GPU execution |
| `systems/visual_shell/` | WebGPU hypervisor, VM monitoring |
| `apps/openspec/` | OpenSpec CLI tool (npm package) |
| `openspec/` | Spec-driven development artifacts |

## Conventions

- **Testing**: pytest for Python, vitest for JavaScript
- **Commits**: Conventional commits (`feat:`, `fix:`, `docs:`)
- **Specs**: SHALL/MUST requirements with Scenario blocks

## Active OpenSpec Changes

Check `openspec/changes/` for active work before starting new features.
