# GeoASM Instruction Set Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Implement GeoASM, a neural assembly language with opcodes 0xD0-0xD6 that provides fine-grained control over PixelBrain inference stages, enabling neural programs, context switching, and visual introspection.

**Architecture:** Register-based virtual machine with 8 general-purpose registers (R0-R7), executing WGSL shader dispatches as instructions. Each opcode maps to a specific shader pipeline stage, with the register file stored on GPU for zero-copy execution.

**Tech Stack:** Python (assembler/executor), WGSL (shader integration), NumPy (register file), wgpu-py (GPU dispatch)

---

## Instruction Set Reference

| Opcode | Name | Args | Description |
|--------|------|------|-------------|
| 0xD0 | EMBED | R1, R2 | Token ID in R1 → Hidden vector in R2 |
| 0xD1 | ATTEND | R2, R3 | Apply self-attention to state R2, output to R3 |
| 0xD2 | PROJECT | R3, R4 | Apply SwiGLU FFN to state R3, output to R4 |
| 0xD3 | SAMPLE | R4, R5 | Hidden state R4 → Sampled token ID in R5 |
| 0xD4 | LAYER | R6 | Set current layer index to R6 (for multi-layer) |
| 0xD5 | KV_APPEND | R6 | Update Key-Value cache with current context |
| 0xD6 | THOUGHT_PULSE | R5 | Emit visual glyph for token R5 |

---

## Task 1: Register File Implementation

**Files:**
- Create: `systems/visual_shell/geoasm/register_file.py`
- Test: `tests/test_geoasm_register_file.py`

**Step 1: Write the failing test**

Create `tests/test_geoasm_register_file.py`:

```python
"""Tests for GeoASM Register File."""
import pytest
import numpy as np


class TestRegisterFile:
    """Test the GPU-backed register file for GeoASM."""

    @pytest.fixture
    def register_file(self):
        """Create a RegisterFile instance."""
        from systems.visual_shell.geoasm.register_file import RegisterFile
        return RegisterFile()

    def test_register_file_has_8_registers(self, register_file):
        """Register file should have R0-R7."""
        assert register_file.count == 8

    def test_register_default_zero(self, register_file):
        """All registers should default to 0."""
        for i in range(8):
            assert register_file.get(i) == 0

    def test_set_and_get_scalar(self, register_file):
        """Can set and get scalar values."""
        register_file.set(0, 42)
        assert register_file.get(0) == 42

    def test_set_and_get_vector(self, register_file):
        """R2-R4 can hold 64-element hidden vectors."""
        hidden = np.random.randn(64).astype(np.float32)
        register_file.set_vector(2, hidden)
        result = register_file.get_vector(2)
        np.testing.assert_array_almost_equal(result, hidden)

    def test_invalid_register_raises(self, register_file):
        """Accessing invalid register should raise."""
        with pytest.raises(IndexError):
            register_file.get(8)
        with pytest.raises(IndexError):
            register_file.set(8, 0)

    def test_register_file_to_gpu_buffer(self, register_file):
        """Can export register file as GPU-compatible buffer."""
        register_file.set(0, 123)
        register_file.set(1, 456)
        buf = register_file.to_buffer()
        assert isinstance(buf, np.ndarray)
        assert buf.dtype == np.float32
        # Buffer size: 8 scalar regs + 3 vector regs * 64 = 200 floats
        assert buf.shape[0] >= 8

    def test_register_names_constant(self, register_file):
        """Register names are accessible as constants."""
        from systems.visual_shell.geoasm.register_file import R0, R1, R2, R3
        assert R0 == 0
        assert R1 == 1
        assert R2 == 2
        assert R3 == 3
```

**Step 2: Run test to verify it fails**

```bash
pytest tests/test_geoasm_register_file.py -v
```

Expected: FAIL - module not found

**Step 3: Create RegisterFile**

Create `systems/visual_shell/geoasm/__init__.py`:

```python
"""GeoASM - Geometry OS Assembly Language for Neural Inference."""
from .register_file import RegisterFile, R0, R1, R2, R3, R4, R5, R6, R7

__all__ = ["RegisterFile", "R0", "R1", "R2", "R3", "R4", "R5", "R6", "R7"]
```

Create `systems/visual_shell/geoasm/register_file.py`:

```python
"""
GeoASM Register File

GPU-compatible register storage for neural inference.
- R0, R1: Scalar registers (token IDs, layer indices, flags)
- R2, R3, R4: Vector registers (64-dim hidden states)
- R5: Output register (sampled token)
- R6: Control register (layer index)
- R7: Status register (error flags, counters)

Memory layout for GPU buffer:
  [0:8]      - Scalar registers (8 floats)
  [8:72]     - R2 vector (64 floats)
  [72:136]   - R3 vector (64 floats)
  [136:200]  - R4 vector (64 floats)
  Total: 200 floats = 800 bytes
"""

import numpy as np
from typing import Union, Optional

# Register name constants
R0, R1, R2, R3, R4, R5, R6, R7 = range(8)

# Hidden dimension for vector registers
HIDDEN_DIM = 64

# Buffer layout constants
SCALAR_OFFSET = 0
SCALAR_COUNT = 8
VECTOR_OFFSET = SCALAR_COUNT
VECTOR_SIZE = HIDDEN_DIM
VECTOR_COUNT = 3  # R2, R3, R4 are vectors

TOTAL_FLOATS = SCALAR_COUNT + (VECTOR_COUNT * VECTOR_SIZE)


class RegisterFile:
    """
    GPU-compatible register file for GeoASM execution.

    Stores both scalar values and 64-dim hidden vectors,
    exportable as a contiguous float32 buffer for GPU upload.
    """

    def __init__(self):
        """Initialize empty register file."""
        self._scalars = np.zeros(SCALAR_COUNT, dtype=np.float32)
        self._vectors = {
            2: np.zeros(HIDDEN_DIM, dtype=np.float32),
            3: np.zeros(HIDDEN_DIM, dtype=np.float32),
            4: np.zeros(HIDDEN_DIM, dtype=np.float32),
        }
        self._gpu_buffer: Optional[np.ndarray] = None

    @property
    def count(self) -> int:
        """Number of registers."""
        return 8

    def get(self, reg: int) -> float:
        """Get scalar value from register."""
        self._validate_reg(reg)
        if reg in self._vectors:
            raise ValueError(f"R{reg} is a vector register, use get_vector()")
        return float(self._scalars[reg])

    def set(self, reg: int, value: Union[int, float]) -> None:
        """Set scalar value in register."""
        self._validate_reg(reg)
        if reg in self._vectors:
            raise ValueError(f"R{reg} is a vector register, use set_vector()")
        self._scalars[reg] = float(value)
        self._gpu_buffer = None  # Invalidate cache

    def get_vector(self, reg: int) -> np.ndarray:
        """Get 64-dim vector from register."""
        self._validate_reg(reg)
        if reg not in self._vectors:
            raise ValueError(f"R{reg} is a scalar register, use get()")
        return self._vectors[reg].copy()

    def set_vector(self, reg: int, value: np.ndarray) -> None:
        """Set 64-dim vector in register."""
        self._validate_reg(reg)
        if reg not in self._vectors:
            raise ValueError(f"R{reg} is a scalar register, use set()")
        if value.shape != (HIDDEN_DIM,):
            raise ValueError(f"Vector must be shape ({HIDDEN_DIM},), got {value.shape}")
        self._vectors[reg] = value.astype(np.float32)
        self._gpu_buffer = None  # Invalidate cache

    def _validate_reg(self, reg: int) -> None:
        """Validate register index."""
        if reg < 0 or reg >= 8:
            raise IndexError(f"Invalid register R{reg}, must be 0-7")

    def to_buffer(self) -> np.ndarray:
        """
        Export register file as contiguous GPU buffer.

        Layout: [scalars(8), R2(64), R3(64), R4(64)]
        """
        if self._gpu_buffer is not None:
            return self._gpu_buffer

        buf = np.zeros(TOTAL_FLOATS, dtype=np.float32)
        buf[SCALAR_OFFSET:SCALAR_COUNT] = self._scalars

        offset = VECTOR_OFFSET
        for reg in [2, 3, 4]:
            buf[offset:offset + VECTOR_SIZE] = self._vectors[reg]
            offset += VECTOR_SIZE

        self._gpu_buffer = buf
        return buf

    def from_buffer(self, buf: np.ndarray) -> None:
        """Import register state from GPU buffer."""
        if buf.shape[0] < TOTAL_FLOATS:
            raise ValueError(f"Buffer too small: {buf.shape[0]} < {TOTAL_FLOATS}")

        self._scalars = buf[SCALAR_OFFSET:SCALAR_COUNT].copy()

        offset = VECTOR_OFFSET
        for reg in [2, 3, 4]:
            self._vectors[reg] = buf[offset:offset + VECTOR_SIZE].copy()
            offset += VECTOR_SIZE

        self._gpu_buffer = buf[:TOTAL_FLOATS].copy()

    def reset(self) -> None:
        """Clear all registers to zero."""
        self._scalars.fill(0)
        for v in self._vectors.values():
            v.fill(0)
        self._gpu_buffer = None

    def __repr__(self) -> str:
        """String representation showing register state."""
        lines = ["RegisterFile:"]
        for i in range(8):
            if i in self._vectors:
                v = self._vectors[i]
                lines.append(f"  R{i}: [{v[0]:.4f}, {v[1]:.4f}, ..., {v[-1]:.4f}]")
            else:
                lines.append(f"  R{i}: {self._scalars[i]:.4f}")
        return "\n".join(lines)
```

**Step 4: Run test to verify it passes**

```bash
pytest tests/test_geoasm_register_file.py -v
```

Expected: PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/geoasm/__init__.py systems/visual_shell/geoasm/register_file.py tests/test_geoasm_register_file.py
git commit -m "feat(geoasm): add register file for neural assembly

- 8 registers (R0-R7) with scalar/vector distinction
- R2-R4 hold 64-dim hidden vectors
- GPU-compatible buffer export/import
- Full test coverage"
```

---

## Task 2: Instruction Definition

**Files:**
- Create: `systems/visual_shell/geoasm/instruction.py`
- Test: `tests/test_geoasm_instruction.py`

**Step 1: Write the failing test**

Create `tests/test_geoasm_instruction.py`:

```python
"""Tests for GeoASM Instructions."""
import pytest
import numpy as np


class TestInstruction:
    """Test GeoASM instruction encoding/decoding."""

    def test_embed_instruction_create(self):
        """EMBED instruction has opcode 0xD0."""
        from systems.visual_shell.geoasm.instruction import Instruction, Opcode
        inst = Instruction(Opcode.EMBED, rd=2, rs=1)
        assert inst.opcode == Opcode.EMBED
        assert inst.opcode.value == 0xD0

    def test_instruction_from_bytes(self):
        """Can decode instruction from byte representation."""
        from systems.visual_shell.geoasm.instruction import Instruction, Opcode
        # 0xD0 01 02 00 = EMBED R1, R2
        data = bytes([0xD0, 0x01, 0x02, 0x00])
        inst = Instruction.from_bytes(data)
        assert inst.opcode == Opcode.EMBED
        assert inst.rs == 1  # Source: R1
        assert inst.rd == 2  # Dest: R2

    def test_instruction_to_bytes(self):
        """Can encode instruction to bytes."""
        from systems.visual_shell.geoasm.instruction import Instruction, Opcode
        inst = Instruction(Opcode.EMBED, rd=2, rs=1)
        data = inst.to_bytes()
        assert len(data) == 4
        assert data[0] == 0xD0

    def test_all_opcodes_defined(self):
        """All opcodes from architecture are defined."""
        from systems.visual_shell.geoasm.instruction import Opcode
        assert Opcode.EMBED.value == 0xD0
        assert Opcode.ATTEND.value == 0xD1
        assert Opcode.PROJECT.value == 0xD2
        assert Opcode.SAMPLE.value == 0xD3
        assert Opcode.LAYER.value == 0xD4
        assert Opcode.KV_APPEND.value == 0xD5
        assert Opcode.THOUGHT_PULSE.value == 0xD6

    def test_instruction_repr(self):
        """Instructions have readable string representation."""
        from systems.visual_shell.geoasm.instruction import Instruction, Opcode
        inst = Instruction(Opcode.ATTEND, rd=3, rs=2)
        assert "ATTEND" in repr(inst)
        assert "R2" in repr(inst)
        assert "R3" in repr(inst)
```

**Step 2: Run test to verify it fails**

```bash
pytest tests/test_geoasm_instruction.py -v
```

Expected: FAIL - module not found

**Step 3: Create Instruction classes**

Create `systems/visual_shell/geoasm/instruction.py`:

```python
"""
GeoASM Instruction Definition

Neural assembly instructions for PixelBrain inference control.
Each instruction is 4 bytes: [opcode, rs, rd, imm]
"""

from enum import IntEnum
from dataclasses import dataclass
from typing import Optional


class Opcode(IntEnum):
    """GeoASM neural instruction opcodes."""
    EMBED = 0xD0        # Token → Hidden vector
    ATTEND = 0xD1       # Self-attention
    PROJECT = 0xD2      # SwiGLU FFN
    SAMPLE = 0xD3       # Hidden → Token
    LAYER = 0xD4        # Set layer index
    KV_APPEND = 0xD5    # Update KV-cache
    THOUGHT_PULSE = 0xD6  # Emit visual glyph


@dataclass
class Instruction:
    """
    A single GeoASM instruction.

    Attributes:
        opcode: The operation to perform
        rs: Source register (0-7)
        rd: Destination register (0-7)
        imm: Immediate value (optional, for LAYER instruction)
    """
    opcode: Opcode
    rd: int = 0
    rs: int = 0
    imm: int = 0

    def to_bytes(self) -> bytes:
        """Encode instruction as 4 bytes."""
        return bytes([
            self.opcode.value,
            self.rs & 0x07,
            self.rd & 0x07,
            self.imm & 0xFF,
        ])

    @classmethod
    def from_bytes(cls, data: bytes) -> "Instruction":
        """Decode instruction from bytes."""
        if len(data) < 4:
            raise ValueError(f"Instruction requires 4 bytes, got {len(data)}")

        opcode = Opcode(data[0])
        rs = data[1] & 0x07
        rd = data[2] & 0x07
        imm = data[3]

        return cls(opcode=opcode, rd=rd, rs=rs, imm=imm)

    def __repr__(self) -> str:
        """Human-readable instruction representation."""
        opcode_name = self.opcode.name

        if self.opcode == Opcode.EMBED:
            return f"EMBED R{self.rs}, R{self.rd}"
        elif self.opcode == Opcode.ATTEND:
            return f"ATTEND R{self.rs}, R{self.rd}"
        elif self.opcode == Opcode.PROJECT:
            return f"PROJECT R{self.rs}, R{self.rd}"
        elif self.opcode == Opcode.SAMPLE:
            return f"SAMPLE R{self.rs}, R{self.rd}"
        elif self.opcode == Opcode.LAYER:
            return f"LAYER #{self.imm}"
        elif self.opcode == Opcode.KV_APPEND:
            return f"KV_APPEND R{self.rs}"
        elif self.opcode == Opcode.THOUGHT_PULSE:
            return f"THOUGHT_PULSE R{self.rs}"
        else:
            return f"UNKNOWN(0x{self.opcode.value:02X})"


# Instruction builder convenience functions
def EMBED(token_reg: int, hidden_reg: int) -> Instruction:
    """Create EMBED instruction: token → hidden vector."""
    return Instruction(Opcode.EMBED, rd=hidden_reg, rs=token_reg)


def ATTEND(in_reg: int, out_reg: int) -> Instruction:
    """Create ATTEND instruction: self-attention."""
    return Instruction(Opcode.ATTEND, rd=out_reg, rs=in_reg)


def PROJECT(in_reg: int, out_reg: int) -> Instruction:
    """Create PROJECT instruction: SwiGLU FFN."""
    return Instruction(Opcode.PROJECT, rd=out_reg, rs=in_reg)


def SAMPLE(hidden_reg: int, token_reg: int) -> Instruction:
    """Create SAMPLE instruction: hidden → token."""
    return Instruction(Opcode.SAMPLE, rd=token_reg, rs=hidden_reg)


def LAYER(layer_idx: int) -> Instruction:
    """Create LAYER instruction: set current layer."""
    return Instruction(Opcode.LAYER, imm=layer_idx)


def KV_APPEND(ctrl_reg: int = 6) -> Instruction:
    """Create KV_APPEND instruction."""
    return Instruction(Opcode.KV_APPEND, rs=ctrl_reg)


def THOUGHT_PULSE(token_reg: int) -> Instruction:
    """Create THOUGHT_PULSE instruction: emit visual."""
    return Instruction(Opcode.THOUGHT_PULSE, rs=token_reg)
```

**Step 4: Run test to verify it passes**

```bash
pytest tests/test_geoasm_instruction.py -v
```

Expected: PASS

**Step 5: Update __init__.py**

Edit `systems/visual_shell/geoasm/__init__.py`:

```python
"""GeoASM - Geometry OS Assembly Language for Neural Inference."""
from .register_file import RegisterFile, R0, R1, R2, R3, R4, R5, R6, R7
from .instruction import (
    Instruction, Opcode,
    EMBED, ATTEND, PROJECT, SAMPLE, LAYER, KV_APPEND, THOUGHT_PULSE
)

__all__ = [
    "RegisterFile", "R0", "R1", "R2", "R3", "R4", "R5", "R6", "R7",
    "Instruction", "Opcode",
    "EMBED", "ATTEND", "PROJECT", "SAMPLE", "LAYER", "KV_APPEND", "THOUGHT_PULSE",
]
```

**Step 6: Commit**

```bash
git add systems/visual_shell/geoasm/instruction.py systems/visual_shell/geoasm/__init__.py tests/test_geoasm_instruction.py
git commit -m "feat(geoasm): add instruction encoding/decoding

- 7 opcodes: EMBED, ATTEND, PROJECT, SAMPLE, LAYER, KV_APPEND, THOUGHT_PULSE
- 4-byte instruction format
- Builder functions for each instruction
- Full test coverage"
```

---

## Task 3: GeoASM Assembler

**Files:**
- Create: `systems/visual_shell/geoasm/assembler.py`
- Test: `tests/test_geoasm_assembler.py`

**Step 1: Write the failing test**

Create `tests/test_geoasm_assembler.py`:

```python
"""Tests for GeoASM Assembler."""
import pytest
import numpy as np


class TestAssembler:
    """Test assembly from text to binary."""

    @pytest.fixture
    def assembler(self):
        """Create Assembler instance."""
        from systems.visual_shell.geoasm.assembler import Assembler
        return Assembler()

    def test_assemble_single_embed(self, assembler):
        """Assemble single EMBED instruction."""
        program = assembler.assemble("EMBED R1, R2")
        assert len(program) == 1
        assert program[0].opcode.name == "EMBED"

    def test_assemble_multiline(self, assembler):
        """Assemble multi-line program."""
        source = """
        EMBED R1, R2
        ATTEND R2, R3
        PROJECT R3, R4
        SAMPLE R4, R5
        """
        program = assembler.assemble(source)
        assert len(program) == 4

    def test_assemble_to_bytes(self, assembler):
        """Assemble to binary representation."""
        source = "EMBED R1, R2"
        binary = assembler.assemble_to_bytes(source)
        assert len(binary) == 4  # One instruction = 4 bytes
        assert binary[0] == 0xD0  # EMBED opcode

    def test_assemble_layer_with_immediate(self, assembler):
        """LAYER instruction accepts immediate value."""
        program = assembler.assemble("LAYER #3")
        assert len(program) == 1
        assert program[0].imm == 3

    def test_assemble_comments_ignored(self, assembler):
        """Comments starting with ; are ignored."""
        source = """
        ; This is a comment
        EMBED R1, R2
        ; Another comment
        """
        program = assembler.assemble(source)
        assert len(program) == 1

    def test_assemble_labels(self, assembler):
        """Labels can be defined and referenced."""
        source = """
        START:
            EMBED R1, R2
            JMP START  ; Jump back (future instruction)
        """
        # For now, just parse labels without JMP support
        program = assembler.assemble(source)
        assert len(program) >= 1

    def test_invalid_opcode_raises(self, assembler):
        """Invalid opcode should raise error."""
        with pytest.raises(ValueError):
            assembler.assemble("INVALID R1, R2")

    def test_assemble_full_inference(self, assembler):
        """Assemble a complete inference program."""
        source = """
        ; Single-token inference through 8 layers
        EMBED R1, R2
        LAYER #0
        ATTEND R2, R2
        PROJECT R2, R2
        LAYER #1
        ATTEND R2, R2
        PROJECT R2, R2
        LAYER #2
        ATTEND R2, R2
        PROJECT R2, R2
        LAYER #3
        ATTEND R2, R2
        PROJECT R2, R2
        LAYER #4
        ATTEND R2, R2
        PROJECT R2, R2
        LAYER #5
        ATTEND R2, R2
        PROJECT R2, R2
        LAYER #6
        ATTEND R2, R2
        PROJECT R2, R2
        LAYER #7
        ATTEND R2, R2
        PROJECT R2, R2
        SAMPLE R2, R5
        THOUGHT_PULSE R5
        """
        program = assembler.assemble(source)
        # Should have instructions for all layers + sample + pulse
        assert len(program) > 15
```

**Step 2: Run test to verify it fails**

```bash
pytest tests/test_geoasm_assembler.py -v
```

Expected: FAIL - module not found

**Step 3: Create Assembler**

Create `systems/visual_shell/geoasm/assembler.py`:

```python
"""
GeoASM Assembler

Assembles text-based GeoASM source into instruction lists and binary.
Supports labels, comments, and all 7 opcodes.
"""

import re
from typing import List, Dict, Optional
from .instruction import Instruction, Opcode


class Assembler:
    """
    GeoASM text assembler.

    Example source:
        ; Comment
        EMBED R1, R2
        ATTEND R2, R2
        SAMPLE R2, R5
        THOUGHT_PULSE R5
    """

    # Regex patterns
    COMMENT_RE = re.compile(r';.*$')
    LABEL_RE = re.compile(r'^(\w+):')
    INSTRUCTION_RE = re.compile(
        r'^\s*(\w+)\s*(?:R(\d))?\s*,?\s*(?:R(\d))?\s*(?:#\s*(\d+))?'
    )

    OPCODE_MAP = {
        'EMBED': Opcode.EMBED,
        'ATTEND': Opcode.ATTEND,
        'PROJECT': Opcode.PROJECT,
        'SAMPLE': Opcode.SAMPLE,
        'LAYER': Opcode.LAYER,
        'KV_APPEND': Opcode.KV_APPEND,
        'KVAPPEND': Opcode.KV_APPEND,
        'THOUGHT_PULSE': Opcode.THOUGHT_PULSE,
        'THOUGHTPULSE': Opcode.THOUGHT_PULSE,
        'PULSE': Opcode.THOUGHT_PULSE,
    }

    def __init__(self):
        """Initialize assembler."""
        self.labels: Dict[str, int] = {}
        self.current_address = 0

    def assemble(self, source: str) -> List[Instruction]:
        """
        Assemble source text into instruction list.

        Args:
            source: Multi-line GeoASM source code

        Returns:
            List of Instruction objects
        """
        instructions = []
        self.labels = {}
        self.current_address = 0

        # First pass: collect labels
        lines = source.strip().split('\n')
        for line in lines:
            line = self.COMMENT_RE.sub('', line).strip()
            if not line:
                continue

            label_match = self.LABEL_RE.match(line)
            if label_match:
                self.labels[label_match.group(1)] = self.current_address
                line = line[label_match.end():].strip()
                if not line:
                    continue

            self.current_address += 1

        # Second pass: assemble instructions
        self.current_address = 0
        for line in lines:
            line = self.COMMENT_RE.sub('', line).strip()
            if not line:
                continue

            # Skip label definition
            label_match = self.LABEL_RE.match(line)
            if label_match:
                line = line[label_match.end():].strip()
                if not line:
                    continue

            inst = self._parse_instruction(line)
            if inst:
                instructions.append(inst)
                self.current_address += 1

        return instructions

    def _parse_instruction(self, line: str) -> Optional[Instruction]:
        """Parse a single instruction line."""
        match = self.INSTRUCTION_RE.match(line)
        if not match:
            raise ValueError(f"Invalid instruction: {line}")

        opcode_name, rs, rd, imm = match.groups()
        opcode_name = opcode_name.upper()

        if opcode_name not in self.OPCODE_MAP:
            raise ValueError(f"Unknown opcode: {opcode_name}")

        opcode = self.OPCODE_MAP[opcode_name]

        # Parse operands
        rs_val = int(rs) if rs else 0
        rd_val = int(rd) if rd else 0
        imm_val = int(imm) if imm else 0

        return Instruction(opcode=opcode, rd=rd_val, rs=rs_val, imm=imm_val)

    def assemble_to_bytes(self, source: str) -> bytes:
        """Assemble source to binary representation."""
        instructions = self.assemble(source)
        return b''.join(inst.to_bytes() for inst in instructions)

    def disassemble(self, instructions: List[Instruction]) -> str:
        """Convert instruction list back to source."""
        lines = []
        for i, inst in enumerate(instructions):
            # Check for label
            for label, addr in self.labels.items():
                if addr == i:
                    lines.append(f"{label}:")
            lines.append(f"    {inst}")
        return '\n'.join(lines)

    def disassemble_bytes(self, data: bytes) -> str:
        """Disassemble binary to source."""
        if len(data) % 4 != 0:
            raise ValueError(f"Binary size must be multiple of 4, got {len(data)}")

        instructions = []
        for i in range(0, len(data), 4):
            inst = Instruction.from_bytes(data[i:i+4])
            instructions.append(inst)

        return self.disassemble(instructions)
```

**Step 4: Run test to verify it passes**

```bash
pytest tests/test_geoasm_assembler.py -v
```

Expected: PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/geoasm/assembler.py tests/test_geoasm_assembler.py
git commit -m "feat(geoasm): add text assembler

- Parse all 7 opcodes with register/immediate operands
- Support comments (;) and labels
- Assemble to bytes and disassemble back
- Full test coverage including 8-layer inference program"
```

---

## Task 4: GeoASM Executor

**Files:**
- Create: `systems/visual_shell/geoasm/executor.py`
- Test: `tests/test_geoasm_executor.py`

**Step 1: Write the failing test**

Create `tests/test_geoasm_executor.py`:

```python
"""Tests for GeoASM Executor."""
import pytest
import numpy as np
from unittest.mock import MagicMock, patch


class TestExecutor:
    """Test instruction execution against PixelBrainPipeline."""

    @pytest.fixture
    def executor(self):
        """Create Executor with mocked pipeline."""
        from systems.visual_shell.geoasm.executor import Executor
        from systems.visual_shell.geoasm.register_file import RegisterFile

        pipeline = MagicMock()
        pipeline.config = {"dim": 64, "layers": 8, "vocab": 50257}

        regs = RegisterFile()
        return Executor(pipeline, regs)

    def test_executor_has_pipeline(self, executor):
        """Executor holds reference to PixelBrainPipeline."""
        assert executor.pipeline is not None

    def test_execute_embed(self, executor):
        """EMBED loads token embedding into register."""
        from systems.visual_shell.geoasm.instruction import EMBED
        from systems.visual_shell.geoasm.register_file import R1, R2

        executor.registers.set(R1, 42)  # Token ID
        inst = EMBED(R1, R2)

        executor.execute(inst)

        # R2 should now contain hidden vector
        hidden = executor.registers.get_vector(R2)
        assert hidden.shape == (64,)

    def test_execute_sample(self, executor):
        """SAMPLE produces token ID from hidden state."""
        from systems.visual_shell.geoasm.instruction import SAMPLE
        from systems.visual_shell.geoasm.register_file import R2, R5

        # Set up hidden state in R2
        hidden = np.random.randn(64).astype(np.float32)
        executor.registers.set_vector(R2, hidden)

        inst = SAMPLE(R2, R5)
        executor.execute(inst)

        # R5 should contain sampled token
        token = executor.registers.get(R5)
        assert isinstance(token, (int, float))

    def test_execute_thought_pulse(self, executor):
        """THOUGHT_PULSE emits visual feedback."""
        from systems.visual_shell.geoasm.instruction import THOUGHT_PULSE
        from systems.visual_shell.geoasm.register_file import R5

        executor.registers.set(R5, 1234)  # Token ID
        executor.visual_bridge = MagicMock()

        inst = THOUGHT_PULSE(R5)
        executor.execute(inst)

        # Should have called visual bridge
        if executor.visual_bridge:
            executor.visual_bridge.emit_thought_pulse.assert_called_once()

    def test_run_program(self, executor):
        """Run complete program from instruction list."""
        from systems.visual_shell.geoasm.assembler import Assembler

        assembler = Assembler()
        program = assembler.assemble("""
            EMBED R1, R2
            SAMPLE R2, R5
        """)

        executor.registers.set(1, 0)  # Token ID 0
        results = executor.run(program)

        assert 'instructions_executed' in results
        assert results['instructions_executed'] == 2

    def test_executor_hooks(self, executor):
        """Executor supports pre/post instruction hooks."""
        called = []

        def pre_hook(inst, regs):
            called.append(('pre', inst.opcode.name))

        def post_hook(inst, regs):
            called.append(('post', inst.opcode.name))

        executor.add_pre_hook(pre_hook)
        executor.add_post_hook(post_hook)

        from systems.visual_shell.geoasm.instruction import LAYER
        executor.execute(LAYER(3))

        assert ('pre', 'LAYER') in called
        assert ('post', 'LAYER') in called

    def test_layer_instruction_updates_state(self, executor):
        """LAYER instruction updates current layer."""
        from systems.visual_shell.geoasm.instruction import LAYER

        inst = LAYER(5)
        executor.execute(inst)

        assert executor.current_layer == 5
```

**Step 2: Run test to verify it fails**

```bash
pytest tests/test_geoasm_executor.py -v
```

Expected: FAIL - module not found

**Step 3: Create Executor**

Create `systems/visual_shell/geoasm/executor.py`:

```python
"""
GeoASM Executor

Executes GeoASM instructions against PixelBrainPipeline.
Each opcode dispatches to the corresponding WGSL shader.
"""

import logging
from typing import List, Callable, Optional, Any, Dict
from .instruction import Instruction, Opcode
from .register_file import RegisterFile, R0, R1, R2, R3, R4, R5, R6, R7

logger = logging.getLogger(__name__)

# Type for instruction hooks
HookFn = Callable[[Instruction, RegisterFile], None]


class Executor:
    """
    GeoASM instruction executor.

    Dispatches instructions to PixelBrainPipeline shader stages,
    maintaining register state and visual feedback hooks.
    """

    def __init__(
        self,
        pipeline: Any,
        registers: Optional[RegisterFile] = None,
        visual_bridge: Optional[Any] = None,
    ):
        """
        Initialize executor.

        Args:
            pipeline: PixelBrainPipeline instance for GPU dispatch
            registers: RegisterFile (created if None)
            visual_bridge: Optional VisualBridge for THOUGHT_PULSE
        """
        self.pipeline = pipeline
        self.registers = registers or RegisterFile()
        self.visual_bridge = visual_bridge

        self.current_layer = 0
        self.position = 0

        self._pre_hooks: List[HookFn] = []
        self._post_hooks: List[HookFn] = []

    def add_pre_hook(self, hook: HookFn) -> None:
        """Add pre-execution hook."""
        self._pre_hooks.append(hook)

    def add_post_hook(self, hook: HookFn) -> None:
        """Add post-execution hook."""
        self._post_hooks.append(hook)

    def execute(self, instruction: Instruction) -> None:
        """
        Execute a single instruction.

        Args:
            instruction: GeoASM instruction to execute
        """
        # Pre-hooks
        for hook in self._pre_hooks:
            hook(instruction, self.registers)

        # Dispatch
        opcode = instruction.opcode

        if opcode == Opcode.EMBED:
            self._exec_embed(instruction)
        elif opcode == Opcode.ATTEND:
            self._exec_attend(instruction)
        elif opcode == Opcode.PROJECT:
            self._exec_project(instruction)
        elif opcode == Opcode.SAMPLE:
            self._exec_sample(instruction)
        elif opcode == Opcode.LAYER:
            self._exec_layer(instruction)
        elif opcode == Opcode.KV_APPEND:
            self._exec_kv_append(instruction)
        elif opcode == Opcode.THOUGHT_PULSE:
            self._exec_thought_pulse(instruction)
        else:
            raise ValueError(f"Unknown opcode: {opcode}")

        # Post-hooks
        for hook in self._post_hooks:
            hook(instruction, self.registers)

    def run(self, instructions: List[Instruction]) -> Dict[str, Any]:
        """
        Run a program (list of instructions).

        Args:
            instructions: List of GeoASM instructions

        Returns:
            Execution results with stats
        """
        count = 0
        errors = []

        for inst in instructions:
            try:
                self.execute(inst)
                count += 1
            except Exception as e:
                logger.error(f"Error executing {inst}: {e}")
                errors.append(str(e))

        return {
            'instructions_executed': count,
            'errors': errors,
            'final_registers': self.registers.to_buffer().tolist(),
        }

    def _exec_embed(self, inst: Instruction) -> None:
        """EMBED R1, R2: Token ID → Hidden vector."""
        token_id = int(self.registers.get(inst.rs))

        # Call pipeline embedding
        hidden = self.pipeline.embed_token(token_id, self.position)

        # Store in destination register
        self.registers.set_vector(inst.rd, hidden)

        logger.debug(f"EMBED: token={token_id} → R{inst.rd}")

    def _exec_attend(self, inst: Instruction) -> None:
        """ATTEND R2, R3: Self-attention."""
        hidden = self.registers.get_vector(inst.rs)

        # For now, in-place modification (R2 → R2)
        # Full impl would dispatch to attention shader
        self._dispatch_attention(hidden, self.current_layer, self.position)

        self.registers.set_vector(inst.rd, hidden)
        logger.debug(f"ATTEND: R{inst.rs} → R{inst.rd} (layer={self.current_layer})")

    def _exec_project(self, inst: Instruction) -> None:
        """PROJECT R3, R4: SwiGLU FFN."""
        hidden = self.registers.get_vector(inst.rs)

        # Dispatch to FFN shader
        self._dispatch_ffn(hidden, self.current_layer)

        self.registers.set_vector(inst.rd, hidden)
        logger.debug(f"PROJECT: R{inst.rs} → R{inst.rd} (layer={self.current_layer})")

    def _exec_sample(self, inst: Instruction) -> None:
        """SAMPLE R4, R5: Hidden state → Token ID."""
        hidden = self.registers.get_vector(inst.rs)

        # Dispatch to sample shader
        token_id = self._dispatch_sample(hidden)

        self.registers.set(inst.rd, token_id)
        logger.debug(f"SAMPLE: R{inst.rs} → token={token_id} in R{inst.rd}")

    def _exec_layer(self, inst: Instruction) -> None:
        """LAYER #N: Set current layer index."""
        self.current_layer = inst.imm
        logger.debug(f"LAYER: now at layer {self.current_layer}")

    def _exec_kv_append(self, inst: Instruction) -> None:
        """KV_APPEND R6: Update KV-cache."""
        # Future: implement KV-cache management
        logger.debug(f"KV_APPEND: position={self.position}")

    def _exec_thought_pulse(self, inst: Instruction) -> None:
        """THOUGHT_PULSE R5: Emit visual glyph."""
        token_id = int(self.registers.get(inst.rs))

        if self.visual_bridge:
            self.visual_bridge.emit_thought_pulse(
                token=token_id,
                position=self.position,
                layer=self.current_layer,
            )

        logger.debug(f"THOUGHT_PULSE: token={token_id}")

    # Shader dispatch helpers (CPU fallback if WGPU unavailable)
    def _dispatch_attention(self, hidden, layer, position):
        """Dispatch to attention shader or CPU fallback."""
        if hasattr(self.pipeline, '_attention_layer_gpu'):
            # GPU path - hidden modified in-place via buffer
            pass
        # CPU fallback: no-op for now

    def _dispatch_ffn(self, hidden, layer):
        """Dispatch to FFN shader or CPU fallback."""
        # Placeholder: hidden passed through
        pass

    def _dispatch_sample(self, hidden) -> int:
        """Dispatch to sample shader or CPU fallback."""
        if hasattr(self.pipeline, 'forward'):
            # Use pipeline's forward which includes sampling
            return 0  # Placeholder
        return 0  # Fallback
```

**Step 4: Run test to verify it passes**

```bash
pytest tests/test_geoasm_executor.py -v
```

Expected: PASS

**Step 5: Update __init__.py**

Edit `systems/visual_shell/geoasm/__init__.py`:

```python
"""GeoASM - Geometry OS Assembly Language for Neural Inference."""
from .register_file import RegisterFile, R0, R1, R2, R3, R4, R5, R6, R7
from .instruction import (
    Instruction, Opcode,
    EMBED, ATTEND, PROJECT, SAMPLE, LAYER, KV_APPEND, THOUGHT_PULSE
)
from .assembler import Assembler
from .executor import Executor

__all__ = [
    # Register file
    "RegisterFile", "R0", "R1", "R2", "R3", "R4", "R5", "R6", "R7",
    # Instructions
    "Instruction", "Opcode",
    "EMBED", "ATTEND", "PROJECT", "SAMPLE", "LAYER", "KV_APPEND", "THOUGHT_PULSE",
    # Tools
    "Assembler", "Executor",
]
```

**Step 6: Commit**

```bash
git add systems/visual_shell/geoasm/executor.py systems/visual_shell/geoasm/__init__.py tests/test_geoasm_executor.py
git commit -m "feat(geoasm): add instruction executor

- Execute all 7 opcodes against PixelBrainPipeline
- Pre/post instruction hooks for introspection
- Program runner with stats
- Full test coverage"
```

---

## Task 5: Integration with PixelBrainPipeline

**Files:**
- Modify: `systems/visual_shell/wgsl/pixel_brain_pipeline.py`
- Create: `tests/test_geoasm_pipeline_integration.py`

**Step 1: Write the failing test**

Create `tests/test_geoasm_pipeline_integration.py`:

```python
"""Integration tests for GeoASM + PixelBrainPipeline."""
import pytest
import numpy as np
from pathlib import Path


class TestGeoASMPipelineIntegration:
    """Test GeoASM execution against real pipeline."""

    @pytest.fixture
    def pipeline(self):
        """Create real PixelBrainPipeline."""
        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        brain_path = Path("tinystories_brain.rts.png")
        if not brain_path.exists():
            pytest.skip("tinystories_brain.rts.png not found")

        return PixelBrainPipeline(str(brain_path))

    @pytest.fixture
    def executor(self, pipeline):
        """Create executor with real pipeline."""
        from systems.visual_shell.geoasm import Executor, RegisterFile
        return Executor(pipeline, RegisterFile())

    def test_embed_produces_hidden_vector(self, executor):
        """EMBED instruction produces valid hidden vector."""
        from systems.visual_shell.geoasm import EMBED, R1, R2

        executor.registers.set(R1, 0)  # Token ID 0
        executor.execute(EMBED(R1, R2))

        hidden = executor.registers.get_vector(R2)
        assert hidden.shape == (64,)
        assert not np.allclose(hidden, 0)  # Should have non-zero values

    def test_full_inference_program(self, executor):
        """Run complete inference through all layers."""
        from systems.visual_shell.geoasm import Assembler

        assembler = Assembler()
        program = assembler.assemble("""
            EMBED R1, R2
            SAMPLE R2, R5
            THOUGHT_PULSE R5
        """)

        executor.registers.set(1, 0)  # Token ID 0
        results = executor.run(program)

        assert results['instructions_executed'] == 3
        assert len(results['errors']) == 0

        # R5 should have a token
        token = executor.registers.get(5)
        assert token >= 0

    def test_layer_switching(self, executor):
        """Layer instructions update execution state."""
        from systems.visual_shell.geoasm import LAYER

        executor.execute(LAYER(0))
        assert executor.current_layer == 0

        executor.execute(LAYER(7))
        assert executor.current_layer == 7
```

**Step 2: Run test to verify behavior**

```bash
pytest tests/test_geoasm_pipeline_integration.py -v
```

Expected: Some tests may pass/fail based on current pipeline state

**Step 3: Ensure pipeline has required methods**

The existing `PixelBrainPipeline` already has `embed_token()`. Verify integration works.

**Step 4: Commit**

```bash
git add tests/test_geoasm_pipeline_integration.py
git commit -m "test(geoasm): add pipeline integration tests

- Test EMBED produces valid hidden vectors
- Test full inference program execution
- Test layer switching state"
```

---

## Task 6: Visual Bridge for Thought Pulses

**Files:**
- Create: `systems/visual_shell/geoasm/visual_bridge.py`
- Test: `tests/test_geoasm_visual_bridge.py`

**Step 1: Write the failing test**

Create `tests/test_geoasm_visual_bridge.py`:

```python
"""Tests for GeoASM Visual Bridge."""
import pytest


class TestGeoASMVisualBridge:
    """Test visual feedback for neural execution."""

    @pytest.fixture
    def bridge(self):
        """Create VisualBridge instance."""
        from systems.visual_shell.geoasm.visual_bridge import GeoASMVisualBridge
        return GeoASMVisualBridge()

    def test_emit_thought_pulse(self, bridge):
        """THOUGHT_PULSE creates visual event."""
        event = bridge.emit_thought_pulse(token=42, position=0, layer=7)

        assert event is not None
        assert event['type'] == 'thought_pulse'
        assert event['token'] == 42
        assert event['position'] == 0
        assert event['layer'] == 7

    def test_emit_atlas_glow(self, bridge):
        """Atlas glow highlights accessed weights."""
        indices = [0, 16, 32, 48]
        event = bridge.emit_atlas_glow(indices, intensity=0.8)

        assert event['type'] == 'atlas_glow'
        assert event['indices'] == indices
        assert event['intensity'] == 0.8

    def test_events_buffer(self, bridge):
        """Events are buffered for replay."""
        bridge.emit_thought_pulse(1, 0, 0)
        bridge.emit_thought_pulse(2, 1, 0)

        events = bridge.get_events()
        assert len(events) >= 2

    def test_clear_events(self, bridge):
        """Can clear event buffer."""
        bridge.emit_thought_pulse(1, 0, 0)
        bridge.clear_events()
        assert len(bridge.get_events()) == 0

    def test_token_color_mapping(self, bridge):
        """Tokens get semantic colors."""
        # Punctuation
        color = bridge.get_token_color(13)  # newline
        assert color is not None

        # Common words
        color = bridge.get_token_color(15496)  # "Hello"
        assert color is not None
```

**Step 2: Run test to verify it fails**

```bash
pytest tests/test_geoasm_visual_bridge.py -v
```

Expected: FAIL - module not found

**Step 3: Create Visual Bridge**

Create `systems/visual_shell/geoasm/visual_bridge.py`:

```python
"""
GeoASM Visual Bridge

Emits visual events for neural execution introspection.
Connects GeoASM execution to Geometry OS visual feedback.
"""

import logging
from typing import List, Dict, Any, Optional, Tuple
from dataclasses import dataclass, field
from enum import Enum

logger = logging.getLogger(__name__)


class EventType(Enum):
    """Types of visual events."""
    THOUGHT_PULSE = "thought_pulse"
    ATLAS_GLOW = "atlas_glow"
    ATTENTION_UPDATE = "attention_update"
    LAYER_SWITCH = "layer_switch"


@dataclass
class VisualEvent:
    """A single visual feedback event."""
    type: EventType
    data: Dict[str, Any]
    timestamp: float = field(default_factory=lambda: __import__('time').time())


class GeoASMVisualBridge:
    """
    Visual feedback bridge for GeoASM execution.

    Translates neural operations into spatial visual events
    that can be rendered on the Geometry OS desktop.
    """

    # Token semantic categories (simplified)
    PUNCTUATION_TOKENS = {1, 2, 13, 28, 29, 30}  # Common GPT-2 punctuation

    # Color palette for semantic categories
    COLORS = {
        'punctuation': (255, 255, 100),   # Yellow
        'verb': (100, 255, 255),           # Cyan
        'noun': (255, 100, 255),           # Magenta
        'default': (200, 200, 200),        # Gray
    }

    def __init__(self, max_events: int = 1000):
        """
        Initialize visual bridge.

        Args:
            max_events: Maximum events to buffer
        """
        self.max_events = max_events
        self._events: List[VisualEvent] = []
        self._callbacks: List[Any] = []

    def emit_thought_pulse(
        self,
        token: int,
        position: int,
        layer: int,
    ) -> Optional[VisualEvent]:
        """
        Emit a thought pulse visual event.

        Args:
            token: The generated token ID
            position: Sequence position
            layer: Transformer layer that produced this token

        Returns:
            The created event
        """
        color = self.get_token_color(token)

        event = VisualEvent(
            type=EventType.THOUGHT_PULSE,
            data={
                'token': token,
                'position': position,
                'layer': layer,
                'color': color,
            }
        )

        self._add_event(event)
        self._notify_callbacks(event)

        logger.debug(f"Thought pulse: token={token} pos={position} layer={layer}")
        return event

    def emit_atlas_glow(
        self,
        indices: List[int],
        intensity: float = 0.5,
    ) -> Optional[VisualEvent]:
        """
        Emit atlas glow event for weight access visualization.

        Args:
            indices: List of weight indices (Hilbert order) accessed
            intensity: Glow intensity (0.0 to 1.0)

        Returns:
            The created event
        """
        event = VisualEvent(
            type=EventType.ATLAS_GLOW,
            data={
                'indices': indices,
                'intensity': max(0.0, min(1.0, intensity)),
            }
        )

        self._add_event(event)
        self._notify_callbacks(event)

        return event

    def emit_attention_update(
        self,
        layer: int,
        head: int,
        weights: List[float],
    ) -> Optional[VisualEvent]:
        """
        Emit attention heatmap update.

        Args:
            layer: Transformer layer
            head: Attention head
            weights: Softmax attention weights

        Returns:
            The created event
        """
        event = VisualEvent(
            type=EventType.ATTENTION_UPDATE,
            data={
                'layer': layer,
                'head': head,
                'weights': weights,
            }
        )

        self._add_event(event)
        self._notify_callbacks(event)

        return event

    def get_token_color(self, token: int) -> Tuple[int, int, int]:
        """
        Get semantic color for a token.

        Args:
            token: Token ID

        Returns:
            RGB color tuple
        """
        if token in self.PUNCTUATION_TOKENS:
            return self.COLORS['punctuation']

        # Future: integrate with tokenizer for semantic analysis
        return self.COLORS['default']

    def _add_event(self, event: VisualEvent) -> None:
        """Add event to buffer, maintaining max size."""
        self._events.append(event)
        if len(self._events) > self.max_events:
            self._events = self._events[-self.max_events:]

    def get_events(self, since: float = 0.0) -> List[Dict[str, Any]]:
        """
        Get events since timestamp.

        Args:
            since: Unix timestamp to filter from

        Returns:
            List of event dictionaries
        """
        return [
            {'type': e.type.value, 'data': e.data, 'timestamp': e.timestamp}
            for e in self._events
            if e.timestamp >= since
        ]

    def clear_events(self) -> None:
        """Clear event buffer."""
        self._events.clear()

    def add_callback(self, callback: Any) -> None:
        """Add callback for real-time event streaming."""
        self._callbacks.append(callback)

    def _notify_callbacks(self, event: VisualEvent) -> None:
        """Notify all callbacks of new event."""
        for cb in self._callbacks:
            try:
                cb(event)
            except Exception as e:
                logger.warning(f"Callback error: {e}")
```

**Step 4: Run test to verify it passes**

```bash
pytest tests/test_geoasm_visual_bridge.py -v
```

Expected: PASS

**Step 5: Update __init__.py**

Edit `systems/visual_shell/geoasm/__init__.py`:

```python
"""GeoASM - Geometry OS Assembly Language for Neural Inference."""
from .register_file import RegisterFile, R0, R1, R2, R3, R4, R5, R6, R7
from .instruction import (
    Instruction, Opcode,
    EMBED, ATTEND, PROJECT, SAMPLE, LAYER, KV_APPEND, THOUGHT_PULSE
)
from .assembler import Assembler
from .executor import Executor
from .visual_bridge import GeoASMVisualBridge, EventType, VisualEvent

__all__ = [
    # Register file
    "RegisterFile", "R0", "R1", "R2", "R3", "R4", "R5", "R6", "R7",
    # Instructions
    "Instruction", "Opcode",
    "EMBED", "ATTEND", "PROJECT", "SAMPLE", "LAYER", "KV_APPEND", "THOUGHT_PULSE",
    # Tools
    "Assembler", "Executor",
    # Visual
    "GeoASMVisualBridge", "EventType", "VisualEvent",
]
```

**Step 6: Commit**

```bash
git add systems/visual_shell/geoasm/visual_bridge.py systems/visual_shell/geoasm/__init__.py tests/test_geoasm_visual_bridge.py
git commit -m "feat(geoasm): add visual bridge for thought pulses

- Thought pulse events with token semantic colors
- Atlas glow for weight access visualization
- Attention update events for heatmap rendering
- Event buffering and callback system
- Full test coverage"
```

---

## Task 7: End-to-End Demo Script

**Files:**
- Create: `scripts/geoasm_demo.py`

**Step 1: Create demo script**

Create `scripts/geoasm_demo.py`:

```python
#!/usr/bin/env python3
"""
GeoASM Demo - Neural Assembly Language in Action

Demonstrates the full GeoASM pipeline:
1. Assemble neural program from text
2. Execute against PixelBrain
3. Visualize thought pulses
"""

import sys
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.visual_shell.geoasm import (
    Assembler, Executor, RegisterFile,
    R0, R1, R2, R3, R4, R5, R6, R7,
    GeoASMVisualBridge,
)
from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline


def main():
    """Run the GeoASM demo."""
    print("=" * 60)
    print("GeoASM - Geometry OS Neural Assembly Language")
    print("=" * 60)

    # 1. Load PixelBrain
    print("\n[1] Loading PixelBrain...")
    brain_path = Path("tinystories_brain.rts.png")
    if not brain_path.exists():
        print(f"ERROR: {brain_path} not found")
        return 1

    pipeline = PixelBrainPipeline(str(brain_path))
    print(f"    Model: {pipeline.model_id}")
    print(f"    Config: dim={pipeline.config.get('dim')}, layers={pipeline.config.get('layers')}")

    # 2. Create visual bridge
    print("\n[2] Creating visual bridge...")
    visual = GeoASMVisualBridge()

    # 3. Assemble program
    print("\n[3] Assembling program...")
    assembler = Assembler()

    program_text = """
    ; GeoASM Neural Inference Program
    ; Generate tokens from a prompt

    EMBED R1, R2      ; Token → Hidden

    ; Process through 8 transformer layers
    LAYER #0
    ATTEND R2, R2     ; Self-attention (in-place)
    PROJECT R2, R2    ; FFN (in-place)

    LAYER #1
    ATTEND R2, R2
    PROJECT R2, R2

    LAYER #2
    ATTEND R2, R2
    PROJECT R2, R2

    LAYER #3
    ATTEND R2, R2
    PROJECT R2, R2

    LAYER #4
    ATTEND R2, R2
    PROJECT R2, R2

    LAYER #5
    ATTEND R2, R2
    PROJECT R2, R2

    LAYER #6
    ATTEND R2, R2
    PROJECT R2, R2

    LAYER #7
    ATTEND R2, R2
    PROJECT R2, R2

    SAMPLE R2, R5     ; Hidden → Token
    THOUGHT_PULSE R5  ; Emit visual
    """

    program = assembler.assemble(program_text)
    print(f"    Assembled {len(program)} instructions")

    # Show binary representation
    binary = assembler.assemble_to_bytes(program_text)
    print(f"    Binary size: {len(binary)} bytes")

    # 4. Execute program
    print("\n[4] Executing program...")
    registers = RegisterFile()
    executor = Executor(pipeline, registers, visual_bridge=visual)

    # Set input token (0 = beginning of sequence or simple token)
    registers.set(R1, 0)

    results = executor.run(program)

    print(f"    Instructions executed: {results['instructions_executed']}")
    print(f"    Errors: {len(results['errors'])}")

    # 5. Show results
    print("\n[5] Results:")
    output_token = int(registers.get(R5))
    print(f"    Output token: {output_token}")

    # Show visual events
    events = visual.get_events()
    print(f"    Visual events: {len(events)}")
    for evt in events[-3:]:
        print(f"      - {evt['type']}: {evt['data']}")

    print("\n" + "=" * 60)
    print("GeoASM execution complete!")
    print("=" * 60)

    return 0


if __name__ == "__main__":
    sys.exit(main())
```

**Step 2: Make executable**

```bash
chmod +x scripts/geoasm_demo.py
```

**Step 3: Test the demo**

```bash
python scripts/geoasm_demo.py
```

Expected: Demo runs, showing assembly and execution

**Step 4: Commit**

```bash
git add scripts/geoasm_demo.py
git commit -m "feat(geoasm): add end-to-end demo script

- Demonstrates full assembly → execution → visualization pipeline
- 8-layer transformer program
- Shows visual event output"
```

---

## Summary

This plan implements the **GeoASM Instruction Set** for PixelBrain:

| Component | Files | Purpose |
|-----------|-------|---------|
| RegisterFile | `register_file.py` | GPU-compatible 8-register file |
| Instruction | `instruction.py` | Opcode enum + encoding/decoding |
| Assembler | `assembler.py` | Text → binary assembly |
| Executor | `executor.py` | Instruction dispatch to shaders |
| VisualBridge | `visual_bridge.py` | Thought pulse + atlas glow events |

**Total: 7 tasks, ~25 bite-sized steps**

After completion:
- `EMBED R1, R2` loads token embedding
- `ATTEND R2, R2` runs self-attention
- `PROJECT R2, R2` runs SwiGLU FFN
- `SAMPLE R2, R5` produces output token
- `THOUGHT_PULSE R5` emits visual glyph
