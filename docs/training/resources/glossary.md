# Glossary: Native Glyph Shell

> Definitions of key terms and concepts

---

## A

### Agent
An AI entity that inhabits the Geometry OS visual substrate. Agents have avatars, negotiate for territory, and can modify system state.

### Alias
A shortcut for a longer command. Created with `alias` command and saved in `aliases.yaml`.

### ASCII Scene Graph
A hierarchical representation of visual elements using ASCII characters for structure and layout.

---

## B

### Background Process
A process that runs without blocking the shell. Started with `&` suffix.

### Brain
A neural network model stored in visual (RTS PNG) format. Can be loaded and run for inference.

---

## C

### Command Palette
A searchable list of all available commands. Opened with `Ctrl+P`.

### Configuration
Settings stored in `~/.glyph_shell/config.yaml` that control shell behavior.

### Control Flow
The order in which commands are executed. Includes loops (↻), conditionals (if/else), and jumps (⤻).

### CPU Limit
A restriction on how much CPU time a process can use. Set with `cpulimit` command.

---

## D

### Daemon
A background process that provides services. Examples: evolution_daemon, visual_shell.

### District
A region of the visual substrate controlled by an agent or group of agents.

---

## E

### Environment Variable
A named value that affects shell behavior. Set with `export` command.

### Evolution
The process of automatic improvement through the evolution daemon. Uses mutation and selection.

---

## F

### Foveated Rendering
An optimization that renders high detail only where the user is looking.

### Function
A reusable block of code. Defined with `fn` keyword in Geometry Script.

---

## G

### GeoASM
Geometry Assembly language. Low-level instructions for the Geometry OS virtual machine.

### Geometry Script
The scripting language of Geometry OS. Uses .gs extension.

### Glyph
A visual symbol representing an operation. Examples: ⊕ (add), → (store).

### GPU-Native
Running directly on the GPU without CPU intervention.

---

## H

### Hilbert Curve
A space-filling fractal pattern used for memory layout. Preserves spatial locality.

### History
A record of previously executed commands. Navigated with ↑/↓ arrows.

---

## I

### Infinite Map
The visual substrate of Geometry OS. A potentially infinite 2D surface.

### IPC (Inter-Process Communication)
Mechanisms for processes to exchange data. Includes channels, shared memory, and pipes.

---

## K

### Kernel
The core of Geometry OS. Manages processes, memory, and hardware.

### Keybinding
A keyboard shortcut mapped to an action. Stored in `keybindings.yaml`.

---

## L

### Load (←)
Reading a value from memory. Represented by the ← glyph.

---

## M

### Memory Region
A contiguous block of memory with a specific purpose. Examples: KERNEL, SHELL, FILES.

### Morphological Glyph
A visual symbol that represents an operation. Part of the visual programming language.

---

## P

### PCB (Process Control Block)
Data structure containing process information: PID, state, registers, etc.

### PID (Process ID)
A unique number identifying a process.

### PixelBrain
An AI entity that inhabits the visual substrate. Neural networks stored as images.

### Process
A running program. Has state, memory, and resources.

### Process State
The current condition of a process: CREATED, RUNNING, WAITING, DONE, ERROR.

---

## R

### RTS (Real-Time System)
A file format for storing binary data in PNG images. Allows visual inspection of data.

### Region
A named memory area with specific purpose. See Memory Region.

---

## S

### Shell
The command-line interface to Geometry OS. Interprets and executes commands.

### SPIR-V
The binary intermediate language for GPU shaders.

### Stack
A LIFO (Last In, First Out) data structure. Used for function calls and temporary storage.

### Store (→)
Writing a value to memory. Represented by the → glyph.

### Substrate
The visual surface where computation happens. See Infinite Map.

---

## T

### Terminal
The text-based interface for entering commands and viewing output.

### Theme
A collection of visual settings: colors, fonts, effects. Stored in `theme.yaml`.

### Tectonic Bridge
The connection between file system state and visual representation.

---

## V

### Visual Mode
An operating mode where computation is rendered as visual geometry.

### Visual Shell
The visual interface to Geometry OS. Combines terminal with visual substrate.

---

## W

### WebGPU
A modern graphics API for GPU access in web browsers and applications.

### WGSL (WebGPU Shading Language)
The shader language for WebGPU. Used for GPU compute and rendering.

### Workspace
A saved configuration of windows, processes, and settings.

---

## Glyph Reference

| Glyph | Name | Category | Description |
|-------|------|----------|-------------|
| ⊕ | Plus | Arithmetic | Addition |
| ⊖ | Minus | Arithmetic | Subtraction |
| ⊗ | Times | Arithmetic | Multiplication |
| ⊘ | Divide | Arithmetic | Division |
| → | Store | Memory | Write to address |
| ← | Load | Memory | Read from address |
| ⇒ | Push | Memory | Push to stack |
| ⇐ | Pop | Memory | Pop from stack |
| ↻ | Loop | Control | Repeat |
| ↺ | Return | Control | Exit function |
| ⤻ | Jump | Control | Unconditional branch |

---

## Memory Regions

| Region | Address | Purpose |
|--------|---------|---------|
| KERNEL | 0x0000-0x03FF | Process Control Blocks |
| MAILBOX | 0x0400-0x05FF | IPC Message Queues |
| SHELL | 0x0800-0x17FF | Process RAM |
| FILES | 0x2000-0x5FFF | Filesystem |
| MEMORY | 0x8000-0xFFFF | Visual Substrate |
| AGENTS | 0x10000+ | Agent Space |

---

## Process States

| State | Description | Visual |
|-------|-------------|--------|
| CREATED | Initializing | Yellow pulse |
| RUNNING | Active | Green glow |
| WAITING | Blocked | Blue dim |
| DONE | Completed | Gray static |
| ERROR | Failed | Red flash |

---

## Color Meanings

| Color | Meaning |
|-------|---------|
| Green | Success |
| Red | Error |
| Yellow | Warning |
| Cyan | Info |
| White | Data |
| Gray | Metadata |

---

## Acronyms

| Acronym | Full Name |
|---------|-----------|
| API | Application Programming Interface |
| CLI | Command Line Interface |
| CPU | Central Processing Unit |
| GPU | Graphics Processing Unit |
| GUI | Graphical User Interface |
| IPC | Inter-Process Communication |
| JSON | JavaScript Object Notation |
| LLM | Large Language Model |
| PCB | Process Control Block |
| PID | Process ID |
| RAM | Random Access Memory |
| RTS | Real-Time System |
| SPIR-V | Standard Portable Intermediate Representation |
| UI | User Interface |
| URL | Uniform Resource Locator |
| UTF-8 | Unicode Transformation Format 8-bit |
| VM | Virtual Machine |
| WGSL | WebGPU Shading Language |
| YAML | YAML Ain't Markup Language |

---

*Glossary v1.0*
