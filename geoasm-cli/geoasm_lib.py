#!/usr/bin/env python3
"""
GeoASM CLI - Tooling for Geometry OS Assembly Language

Usage:
    geoasm run <file.geoasm>        Run a GeoASM program
    geoasm build <file.geoasm>      Compile to binary
    geoasm debug <file.geoasm>      Interactive debugger
    geoasm profile <file.geoasm>    Hot path analysis
    geoasm validate <file.geoasm>   Check for errors
    geoasm disasm <file.bin>        Disassemble binary
    geoasm opcodes                  List available opcodes
"""

import sys
import os
import re
import argparse
from pathlib import Path
from dataclasses import dataclass
from typing import Optional, Dict, List, Tuple

# Add parent directory for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

# Opcode definitions (from geometry_os.wgsl)
OPCODES = {
    0x00: ("NOP", 0, "No operation"),
    0x02: ("HALT", 0, "Stop execution"),
    0x04: ("JMP", 1, "Jump to address"),
    0x05: ("JEQ", 3, "Jump if equal"),
    0x06: ("JNE", 3, "Jump if not equal"),
    0x07: ("JLT", 3, "Jump if less than"),
    0x0B: ("JGT", 3, "Jump if greater than"),
    0x0C: ("JLE", 3, "Jump if less or equal"),
    0x0D: ("JGE", 3, "Jump if greater or equal"),
    0x08: ("CALL", 1, "Call function"),
    0x09: ("RET", 0, "Return from function"),
    0x0A: ("CALLR", 1, "Call indirect"),
    0x10: ("PUSH", 1, "Push register to stack"),
    0x11: ("POP", 1, "Pop from stack to register"),
    0x40: ("LDR", 2, "Load from memory"),
    0x41: ("STR", 2, "Store to memory"),
    0x42: ("LDR_IMM", 2, "Load from immediate address"),
    0x43: ("STR_IMM", 2, "Store to immediate address"),
    0x49: ("MOVI", 2, "Move immediate"),
    0x80: ("ADD", 3, "Add registers"),
    0x82: ("SUB", 3, "Subtract registers"),
    0x84: ("MUL", 3, "Multiply registers"),
    0x86: ("DIV", 3, "Divide registers"),
    0xA0: ("AND", 3, "Bitwise AND"),
    0xA1: ("OR", 3, "Bitwise OR"),
    0xA2: ("XOR", 3, "Bitwise XOR"),
    0xA3: ("NOT", 1, "Bitwise NOT"),
    0xC0: ("SET_COLOR", 3, "Set draw color"),
    0xC1: ("DRAW_CHAR", 3, "Draw character"),
    0xC2: ("DRAW_LINE", 3, "Draw line"),
    0xC3: ("DRAW_RECT", 3, "Draw rectangle"),
    0xC4: ("FILL_RECT", 3, "Fill rectangle"),
    # Glyph Primitives (Screen is the Hard Drive architecture)
    0xC5: ("GLYPH_DEFINE", 4, "Register glyph bitmap"),
    0xC6: ("GLYPH_BLIT", 3, "Render glyph to framebuffer"),
    0xC7: ("GLYPH_TRANSFORM", 2, "Apply rotation/scale matrix"),
    0xC8: ("GLYPH_COMPOSITE", 2, "Layer multiple glyphs"),
    0xC9: ("GLYPH_CACHE_EVICT", 1, "Evict oldest glyph from cache"),
    0xCA: ("ORB", 4, "Draw orb (file visualization)"),
    0xCB: ("PANEL", 5, "Draw glass panel"),
    0xCC: ("PANEL_TITLE", 2, "Set panel title bar"),
    0xCD: ("PANEL_BORDER", 1, "Draw panel border"),
    0xCE: ("HEATMAP_CELL", 3, "Draw heatmap cell"),
    0xDF: ("KERNEL_REWRITE", 2, "Highlight kernel rewrite event"),
    # Neural Extension Opcodes (PixelBrain)
    0xD0: ("EMBED", 2, "Lookup token embedding from weight atlas"),
    0xD1: ("ATTEND", 2, "Self-attention via WGSL kernel"),
    0xD2: ("PROJECT", 2, "FFN projection via WGSL kernel"),
    0xD3: ("SAMPLE", 2, "Sample token from logits"),
    0xD4: ("LLM_PROMPT", 0, "Call external LLM"),
    0xD5: ("KV_APPEND", 1, "Append to KV-cache texture"),
    0xD6: ("THOUGHT_PULSE", 1, "Emit visual glyph pulse"),
    # Timer and Profiling Opcodes (shifted from D5-D7 to D7-D9)
    0xD7: ("START_TIMER", 1, "Start timer"),
    0xD8: ("STOP_TIMER", 0, "Stop timer"),
    0xD9: ("GET_TIMER", 2, "Get timer value"),
    0xDA: ("ANALYZE_HOT_PATHS", 0, "Analyze hot paths"),
    # System Opcodes
    0xDB: ("SYS_MEMORY_VERIFY", 0, "Verify memory"),
    0xDC: ("SYS_CLEANUP_LOGS", 0, "Cleanup logs"),
    0xDE: ("SYS_MEMORY_PRESSURE", 0, "Check memory pressure"),
    0xE0: ("SYS_DISK_SPACE", 0, "Check disk space"),
    0xE3: ("GET_STATE", 2, "Get system state"),
    0xE4: ("CROSS_LANG_VERIFY", 0, "Cross-language verify"),
    0xEE: ("EVOLVE", 0, "Trigger evolution"),
    0xEF: ("DEBUG_BREAK", 0, "Debugger breakpoint"),
    # FFI Bridge Opcodes
    0xF8: ("PY_CALL", 3, "Call Python function"),
    0xF9: ("PY_MAP", 3, "Map Hilbert region to numpy"),
    0xFA: ("PY_REQ", 3, "Async Python request"),
    0xFB: ("PY_POLL", 3, "Poll async result"),
}

# Reverse lookup: name -> opcode
OPCODE_NAMES = {name: code for code, (name, _, _) in OPCODES.items()}


@dataclass
class Instruction:
    """A parsed GeoASM instruction."""

    opcode: int
    operands: List[int]
    label: Optional[str] = None
    comment: Optional[str] = None
    line_num: int = 0
    address: int = 0


@dataclass
class AssembledProgram:
    """A fully assembled program."""

    binary: bytes
    labels: Dict[str, int]
    instructions: List[Instruction]
    source_map: Dict[int, int]  # address -> line_num
    errors: List[str]
    warnings: List[str]


class GeoASMAssembler:
    """Assembles GeoASM source to binary."""

    def __init__(self):
        self.labels: Dict[str, int] = {}
        self.instructions: List[Instruction] = []
        self.errors: List[str] = []
        self.warnings: List[str] = []
        self.current_address = 0
        self.includes: set = set()

    def assemble_file(self, filepath: str) -> AssembledProgram:
        """Assemble a GeoASM file."""
        path = Path(filepath)
        if not path.exists():
            raise FileNotFoundError(f"File not found: {filepath}")

        source = path.read_text()
        return self.assemble(source, filepath)

    def assemble(self, source: str, filename: str = "<stdin>") -> AssembledProgram:
        """Assemble GeoASM source code."""
        self.labels = {}
        self.instructions = []
        self.errors = []
        self.warnings = []
        self.current_address = 0

        # First pass: collect labels and parse instructions
        lines = source.split("\n")
        for line_num, line in enumerate(lines, 1):
            self._parse_line(line, line_num, filename)

        # Second pass: resolve labels to addresses
        binary = self._generate_binary()

        source_map = {inst.address: inst.line_num for inst in self.instructions}

        return AssembledProgram(
            binary=binary,
            labels=self.labels,
            instructions=self.instructions,
            source_map=source_map,
            errors=self.errors,
            warnings=self.warnings,
        )

    def _parse_line(self, line: str, line_num: int, filename: str):
        """Parse a single line of GeoASM."""
        # Remove comments
        comment = None
        if ";" in line:
            line, comment = line.split(";", 1)
            comment = comment.strip()

        line = line.strip()
        if not line:
            return

        # Check for label
        if ":" in line and not line.startswith(";"):
            parts = line.split(":", 1)
            label = parts[0].strip()
            self.labels[label] = self.current_address
            line = parts[1].strip() if len(parts) > 1 else ""
            if not line:
                return

        # Check for include
        if line.startswith("#include"):
            match = re.match(r'#include\s+"([^"]+)"', line)
            if match:
                include_file = match.group(1)
                self.warnings.append(f"{filename}:{line_num}: #include not yet implemented: {include_file}")
            return

        # Parse instruction
        parts = line.split()
        if not parts:
            return

        mnemonic = parts[0].upper()

        # Lookup opcode
        if mnemonic not in OPCODE_NAMES:
            self.errors.append(f"{filename}:{line_num}: Unknown opcode: {mnemonic}")
            return

        opcode = OPCODE_NAMES[mnemonic]
        _, operand_count, _ = OPCODES[opcode]

        # Parse operands
        operands = []
        for i, part in enumerate(parts[1:]):
            # Remove commas
            part = part.rstrip(",").strip()

            # Register reference (R0-R7, SP)
            if part.upper().startswith("R") and part[1:].isdigit():
                reg = int(part[1:])
                if reg > 255:
                    self.errors.append(f"{filename}:{line_num}: Register out of range: {part}")
                operands.append(reg)
            elif part.upper() == "SP":
                operands.append(254)
            # Hex number
            elif part.startswith("0x") or part.startswith("0X"):
                operands.append(int(part, 16))
            # Decimal number
            elif part.lstrip("-").isdigit():
                operands.append(int(part))
            # Label reference
            else:
                # Will be resolved in second pass
                operands.append(part)

        inst = Instruction(
            opcode=opcode, operands=operands, comment=comment, line_num=line_num, address=self.current_address
        )
        self.instructions.append(inst)
        self.current_address += 1

    def _generate_binary(self) -> bytes:
        """Generate binary output."""
        binary = bytearray()

        for inst in self.instructions:
            _, operand_count, _ = OPCODES[inst.opcode]

            # Build instruction bytes [opcode, dst, src1, src2]
            opcode_byte = inst.opcode
            dst = 0
            src1 = 0
            src2 = 0

            # Resolve operands
            resolved = []
            for op in inst.operands:
                if isinstance(op, str):
                    # Label reference
                    if op in self.labels:
                        resolved.append(self.labels[op])
                    else:
                        self.errors.append(f"Line {inst.line_num}: Unknown label: {op}")
                        resolved.append(0)
                else:
                    resolved.append(op)

            # Pad to 3 operands
            while len(resolved) < 3:
                resolved.append(0)

            dst, src1, src2 = resolved[:3]

            binary.extend([opcode_byte, dst & 0xFF, src1 & 0xFF, src2 & 0xFF])

        return bytes(binary)


class GeoASMValidator:
    """Validates GeoASM programs."""

    def validate(self, program: AssembledProgram) -> List[str]:
        """Return list of validation issues."""
        issues = []

        # Check for HALT instruction
        has_halt = any(inst.opcode == 0x02 for inst in program.instructions)
        if not has_halt:
            issues.append("Warning: Program has no HALT instruction (may run forever)")

        # Check for unreachable code (after HALT, but only if no labels follow)
        # Code after HALT is reachable if it has a label (it's a function)
        halt_address = None
        for inst in program.instructions:
            if inst.opcode == 0x02:  # HALT
                halt_address = inst.address
                break

        if halt_address is not None:
            # Check if any instructions after HALT are unreachable
            # Code after HALT is reachable if it's part of a labeled function
            # A function starts at a label and continues until next label or RET
            labeled_addresses = set(program.labels.values())
            for inst in program.instructions:
                if inst.address > halt_address:
                    # Check if this instruction is part of a function
                    # It's part of a function if there's a label at or before it
                    is_in_function = any(addr <= inst.address for addr in labeled_addresses)
                    if not is_in_function and inst.opcode != 0x00:
                        issues.append(f"Warning: Unreachable code at address {inst.address}")
                        break  # Only report first instance

        # Check for undefined labels
        issues.extend(program.errors)

        return issues


class GeoASMVM:
    """Simple GeoASM Virtual Machine for testing."""

    def __init__(self, program: AssembledProgram = None, max_steps: int = 10000000):
        self.max_steps = max_steps
        self.program = program
        self.reset()
        if program:
            self.load(program)

    def reset(self):
        """Reset VM state."""
        self.registers = [0] * 8
        self.sp = 0xFF00  # Stack pointer
        self.pc = 0       # Program counter
        self.memory = [0] * 0x10000  # 64KB memory
        self.halted = False
        self.steps = 0
        self.color = (0, 0, 0)  # Current draw color
        self.pixels = []  # List of (x, y, r, g, b) drawn
        self.lines = []   # List of (x1, y1, x2, y2, r, g, b) drawn
        # Glyph state (Screen is the Hard Drive architecture)
        self.glyphs = {}  # glyph_id -> (width, height, data_ptr)
        self.glyph_cache_order = []  # LRU tracking
        self.glyph_blits = []  # List of (glyph_id, x, y) renders
        self.orbs = []  # List of (x, y, radius, r, g, b, a) visualizations
        self.panels = []  # List of (x, y, w, h, r, g, b, a) panels
        self.heatmap_cells = []  # List of (x, y, value, r, g, b)

    def load(self, program: AssembledProgram):
        """Load a program into memory."""
        self.reset()
        self.program = program
        for i, byte in enumerate(program.binary):
            if i < len(self.memory):
                self.memory[i] = byte

    def get_reg(self, reg: int) -> int:
        """Get register value (alias for _get_reg)."""
        return self._get_reg(reg)

    def run(self, max_steps: int = None) -> bool:
        """Run the program until HALT or max_steps."""
        if max_steps:
            self.max_steps = max_steps

        while not self.halted and self.steps < self.max_steps:
            self.step()
            self.steps += 1

        return self.halted

    def run_until_break(self, max_steps: int = None) -> str:
        """Run until HALT and return result status."""
        if max_steps:
            self.max_steps = max_steps
        
        halted = self.run()
        if halted:
            return "HALT"
        return "MAX_STEPS"

    def step(self):
        """Execute one instruction."""
        if self.halted:
            return

        # Fetch instruction (4 bytes)
        if self.pc * 4 + 3 >= len(self.memory):
            self.halted = True
            return

        opcode = self.memory[self.pc * 4]
        dst = self.memory[self.pc * 4 + 1]
        src1 = self.memory[self.pc * 4 + 2]
        src2 = self.memory[self.pc * 4 + 3]

        self.pc += 1

        # Execute
        if opcode == 0x00:  # NOP
            pass
        elif opcode == 0x02:  # HALT
            self.halted = True
        elif opcode == 0x04:  # JMP
            self.pc = dst | (src1 << 8) | (src2 << 16)
        elif opcode == 0x05:  # JEQ
            if self._get_reg(dst) == self._get_reg(src1):
                self.pc = src2
        elif opcode == 0x06:  # JNE
            if self._get_reg(dst) != self._get_reg(src1):
                self.pc = src2
        elif opcode == 0x07:  # JLT
            if self._get_reg(dst) < self._get_reg(src1):
                self.pc = src2
        elif opcode == 0x0B:  # JGT
            if self._get_reg(dst) > self._get_reg(src1):
                self.pc = src2
        elif opcode == 0x0C:  # JLE
            if self._get_reg(dst) <= self._get_reg(src1):
                self.pc = src2
        elif opcode == 0x0D:  # JGE
            if self._get_reg(dst) >= self._get_reg(src1):
                self.pc = src2
        elif opcode == 0x08:  # CALL
            self.sp -= 1
            self.memory[self.sp] = self.pc & 0xFF
            self.sp -= 1
            self.memory[self.sp] = (self.pc >> 8) & 0xFF
            self.pc = dst | (src1 << 8) | (src2 << 16)
        elif opcode == 0x09:  # RET
            hi = self.memory[self.sp]
            self.sp += 1
            lo = self.memory[self.sp]
            self.sp += 1
            self.pc = (hi << 8) | lo
        elif opcode == 0x10:  # PUSH
            self.sp -= 1
            self.memory[self.sp] = self._get_reg(dst) & 0xFF
        elif opcode == 0x11:  # POP
            val = self.memory[self.sp]
            self.sp += 1
            self._set_reg(dst, val)
        elif opcode == 0x40:  # LDR
            addr = self._get_reg(src1)
            self._set_reg(dst, self.memory[addr & 0xFFFF])
        elif opcode == 0x41:  # STR
            addr = self._get_reg(dst)
            self.memory[addr & 0xFFFF] = self._get_reg(src1)
        elif opcode == 0x49:  # MOVI
            self._set_reg(dst, src1 | (src2 << 8))
        elif opcode == 0x80:  # ADD
            self._set_reg(dst, self._get_reg(src1) + self._get_reg(src2))
        elif opcode == 0x82:  # SUB
            self._set_reg(dst, self._get_reg(src1) - self._get_reg(src2))
        elif opcode == 0x84:  # MUL
            self._set_reg(dst, self._get_reg(src1) * self._get_reg(src2))
        elif opcode == 0x86:  # DIV
            divisor = self._get_reg(src2)
            if divisor != 0:
                self._set_reg(dst, self._get_reg(src1) // divisor)
            else:
                self._set_reg(dst, 0)
        elif opcode == 0xA0:  # AND
            self._set_reg(dst, self._get_reg(src1) & self._get_reg(src2))
        elif opcode == 0xA1:  # OR
            self._set_reg(dst, self._get_reg(src1) | self._get_reg(src2))
        elif opcode == 0xA2:  # XOR
            self._set_reg(dst, self._get_reg(src1) ^ self._get_reg(src2))
        elif opcode == 0xA3:  # NOT
            self._set_reg(dst, ~self._get_reg(src1) & 0xFFFF)
        elif opcode == 0xC0:  # SET_COLOR
            self.color = (dst, src1, src2)
        elif opcode == 0xC2:  # DRAW_LINE
            x1 = self._get_reg(dst)
            y1 = self._get_reg(src1)
            x2 = src2 & 0xFF
            y2 = (src2 >> 8) & 0xFF
            self.lines.append((x1, y1, x2, y2, *self.color))
        # Glyph Primitives (Screen is the Hard Drive architecture)
        elif opcode == 0xC5:  # GLYPH_DEFINE
            glyph_id = dst
            width = src1
            height = src2 >> 4
            data_ptr = (src2 & 0x0F) << 8 | self._get_reg(0)  # Extended addressing
            self.glyphs[glyph_id] = (width, height, data_ptr)
            self.glyph_cache_order.append(glyph_id)
        elif opcode == 0xC6:  # GLYPH_BLIT
            glyph_id = dst
            x = self._get_reg(src1)
            y = src2
            if glyph_id in self.glyphs:
                self.glyph_blits.append((glyph_id, x, y))
        elif opcode == 0xC7:  # GLYPH_TRANSFORM
            glyph_id = dst
            matrix_ptr = src1 | (src2 << 8)
            # Transform matrix stored at memory[matrix_ptr]
            # For now, just mark the glyph as transformed
            if glyph_id in self.glyphs:
                w, h, data = self.glyphs[glyph_id]
                self.glyphs[glyph_id] = (w, h, data | 0x8000)  # Flag as transformed
        elif opcode == 0xC8:  # GLYPH_COMPOSITE
            dst_id = dst
            src_count = src1
            src_ptr = src2 << 8
            # Read source glyph IDs from memory
            src_ids = [self.memory[src_ptr + i] for i in range(min(src_count, 8))]
            # Composite into destination
            if dst_id not in self.glyphs:
                self.glyphs[dst_id] = (0, 0, 0)
        elif opcode == 0xC9:  # GLYPH_CACHE_EVICT
            count = dst
            for _ in range(min(count, len(self.glyph_cache_order))):
                if self.glyph_cache_order:
                    old_id = self.glyph_cache_order.pop(0)
                    self.glyphs.pop(old_id, None)
        elif opcode == 0xCA:  # ORB (file visualization)
            x = self._get_reg(dst)
            y = self._get_reg(src1)
            radius = src2 & 0x1F
            r, g, b = self.color
            self.orbs.append((x, y, radius, r, g, b, 200))
        elif opcode == 0xCB:  # PANEL (glass panel)
            x = self._get_reg(dst)
            y = self._get_reg(src1)
            w = src2  # Width in src2 (8-bit)
            h = int(w * 0.75)  # Default aspect ratio
            r, g, b = self.color
            self.panels.append((x, y, w, h, r, g, b, 180))
        elif opcode == 0xCC:  # PANEL_TITLE
            panel_id = dst
            title_ptr = src1 | (src2 << 8)
            # Read title string from memory (null-terminated)
            title = []
            for i in range(32):
                c = self.memory[title_ptr + i]
                if c == 0:
                    break
                title.append(chr(c))
        elif opcode == 0xCD:  # PANEL_BORDER
            panel_id = dst
            style = src1
            # Border style: 0=none, 1=solid, 2=rounded, 3=shadow
        elif opcode == 0xCE:  # HEATMAP_CELL
            x = self._get_reg(dst)
            y = self._get_reg(src1)
            value = src2 / 255.0  # Normalize to 0-1
            r = int(255 * value)
            g = int(50 * (1 - abs(value - 0.5) * 2))
            b = int(255 * (1 - value))
            self.heatmap_cells.append((x, y, value, r, g, b))
        elif opcode == 0xCF:  # DRAW_PIXEL
            x = self._get_reg(dst)
            y = self._get_reg(src1)
            self.pixels.append((x, y, *self.color))
        # FFI Bridge Opcodes - delegate to host
        elif opcode == 0xF8:  # PY_CALL
            print(f"PY_CALL: func_id={dst}, args_ptr={src1}, ret_ptr={src2}")
        elif opcode == 0xF9:  # PY_MAP
            print(f"PY_MAP: hilbert_start={dst}, size={src1}, flags={src2}")
        elif opcode == 0xFA:  # PY_REQ
            print(f"PY_REQ: func_id={dst}, args_ptr={src1}")
        elif opcode == 0xFB:  # PY_POLL
            print(f"PY_POLL: req_id={dst}")

    def _get_reg(self, reg: int) -> int:
        """Get register value."""
        if reg < 8:
            return self.registers[reg]
        elif reg == 254:
            return self.sp
        return 0

    def _set_reg(self, reg: int, value: int):
        """Set register value."""
        if reg < 8:
            self.registers[reg] = value & 0xFFFF
        elif reg == 254:
            self.sp = value & 0xFFFF


class GeoASMDebugger:
    """Interactive debugger for GeoASM."""

    def __init__(self, vm: GeoASMVM = None):
        self.vm = vm or GeoASMVM()
        self.breakpoints = set()

    def set_breakpoint(self, address: int):
        """Set a breakpoint at address."""
        self.breakpoints.add(address)

    def clear_breakpoint(self, address: int):
        """Clear a breakpoint."""
        self.breakpoints.discard(address)

    def step(self):
        """Execute one instruction."""
        self.vm.step()

    def continue_exec(self) -> bool:
        """Run until breakpoint or HALT."""
        while not self.vm.halted:
            if self.vm.pc in self.breakpoints:
                return True
            self.vm.step()
        return False


class GeoASMDisassembler:
    """Disassembles binary to GeoASM."""

    def disassemble(self, binary: bytes) -> str:
        """Disassemble binary to GeoASM source."""
        lines = []

        for i in range(0, len(binary), 4):
            if i + 3 >= len(binary):
                break

            opcode = binary[i]
            dst = binary[i + 1]
            src1 = binary[i + 2]
            src2 = binary[i + 3]

            if opcode not in OPCODES:
                lines.append(f"    DB 0x{opcode:02X}, 0x{dst:02X}, 0x{src1:02X}, 0x{src2:02X}  ; Unknown")
                continue

            name, operand_count, desc = OPCODES[opcode]

            # Format operands
            if opcode == 0x00:  # NOP
                lines.append(f"    NOP")
            elif operand_count == 0:
                lines.append(f"    {name}")
            elif operand_count == 1:
                if opcode == 0x04:  # JMP
                    addr = dst | (src1 << 8) | (src2 << 16)
                    lines.append(f"    {name} 0x{addr:04X}")
                else:
                    reg = f"R{dst}" if dst != 254 else "SP"
                    lines.append(f"    {name} {reg}")
            elif operand_count == 2:
                reg1 = f"R{dst}" if dst != 254 else "SP"
                reg2 = f"R{src1}" if src1 != 254 else "SP"
                if opcode == 0x49:  # MOVI
                    lines.append(f"    {name} {reg1}, {src1}")
                else:
                    lines.append(f"    {name} {reg1}, {reg2}")
            else:  # 3 operands
                reg1 = f"R{dst}" if dst != 254 else "SP"
                reg2 = f"R{src1}" if src1 != 254 else "SP"
                reg3 = f"R{src2}" if src2 != 254 else "SP"
                if opcode == 0x05:  # JEQ
                    addr = src2
                    lines.append(f"    {name} {reg1}, {reg2}, 0x{addr:04X}")
                else:
                    lines.append(f"    {name} {reg1}, {reg2}, {reg3}")

        return "\n".join(lines)


# ============================================================================
# ORB FILE VISUALIZATION
# ============================================================================

class GlyphSubstrate:
    """
    Python implementation of Hilbert-indexed pixel buffer for file visualization.

    Uses the native Hilbert library if available, falls back to HilbertEngine,
    then to inline Python implementation.
    """

    def __init__(self, order: int = 8):
        """
        Create a glyph substrate with grid size 2^order.

        Args:
            order: Hilbert curve order (default 8 = 256x256 grid)
        """
        self.order = order
        self.n = 1 << order  # Grid size (2^order)
        self.buffer = [0] * (self.n * self.n)

        # Initialize HilbertEngine (always available for property access)
        try:
            from systems.evolution.HilbertEngine import HilbertEngine
            self._hilbert_engine = HilbertEngine()
        except ImportError:
            self._hilbert_engine = None

        # Try to use native Hilbert library for faster operations
        try:
            from systems.sisyphus.native_hilbert import NativeHilbertLUT
            self._hilbert = NativeHilbertLUT()
            self._use_native = True
        except ImportError:
            self._hilbert = None
            self._use_native = False

    @property
    def hilbert_engine(self):
        """Return the HilbertEngine instance if available."""
        return self._hilbert_engine

    def xy2d(self, x: int, y: int) -> int:
        """Convert 2D coordinates to Hilbert distance."""
        if self._use_native:
            return self._hilbert.xy2d(self.n, x, y)
        if self._hilbert_engine:
            return self._hilbert_engine.xy2d(self.n, x, y)
        return self._xy2d_python(x, y)

    def d2xy(self, d: int) -> tuple:
        """Convert Hilbert distance to 2D coordinates."""
        if self._use_native:
            return self._hilbert.d2xy(self.n, d)
        if self._hilbert_engine:
            return self._hilbert_engine.d2xy(self.n, d)
        return self._d2xy_python(d)

    def _rot(self, n, x, y, rx, ry):
        """Hilbert rotation helper."""
        if ry == 0:
            if rx == 1:
                x = n - 1 - x
                y = n - 1 - y
            return y, x
        return x, y

    def _xy2d_python(self, x: int, y: int) -> int:
        """Python fallback for xy2d."""
        d = 0
        s = self.n // 2
        xx, yy = x, y
        while s > 0:
            rx = 1 if (xx & s) else 0
            ry = 1 if (yy & s) else 0
            d += s * s * ((3 * rx) ^ ry)
            xx, yy = self._rot(s, xx, yy, rx, ry)
            s //= 2
        return d

    def _d2xy_python(self, d: int) -> tuple:
        """Python fallback for d2xy."""
        x = y = 0
        t = d
        s = 1
        while s < self.n:
            rx = 1 & (t // 2)
            ry = 1 & (t ^ rx)
            x, y = self._rot(s, x, y, rx, ry)
            x += s * rx
            y += s * ry
            t //= 4
            s *= 2
        return x, y

    def set_pixel(self, x: int, y: int, color: int):
        """Set pixel at (x, y) to color (RGBA as u32)."""
        if 0 <= x < self.n and 0 <= y < self.n:
            d = self.xy2d(x, y)
            self.buffer[d] = color

    def get_pixel(self, x: int, y: int) -> int:
        """Get pixel color at (x, y)."""
        if 0 <= x < self.n and 0 <= y < self.n:
            d = self.xy2d(x, y)
            return self.buffer[d]
        return 0


def orb_visualize(path: str, order: int = 8) -> GlyphSubstrate:
    """
    Visualize a file using Hilbert curve color mapping.

    Loads file bytes and maps them to colors on a Hilbert-indexed substrate.
    Each byte becomes one pixel, with color derived from byte value.

    Args:
        path: Path to file to visualize
        order: Hilbert curve order (default 8 = 256x256 = 65536 pixels max)

    Returns:
        GlyphSubstrate with file visualization

    Example:
        >>> substrate = orb_visualize('/etc/hostname')
        >>> substrate.n  # Grid size
        256
    """
    import os

    # Read file bytes
    with open(path, 'rb') as f:
        data = f.read()

    # Create substrate
    substrate = GlyphSubstrate(order)
    max_pixels = substrate.n * substrate.n

    # Map bytes to pixels along Hilbert curve
    for i, byte in enumerate(data[:max_pixels]):
        # Convert byte to color using HSV-like mapping
        # Hue from byte value, full saturation, full value
        hue = byte / 255.0

        # Simple color mapping: byte -> RGB
        if byte < 32:
            # Low bytes: blue tones
            r = byte * 2
            g = byte * 4
            b = 128 + byte * 4
        elif byte < 128:
            # Mid-low bytes: cyan/green tones
            r = byte
            g = 128 + (byte - 32) * 2
            b = 255 - byte
        elif byte < 200:
            # Mid-high bytes: yellow/orange tones
            r = 255
            g = 255 - (byte - 128) * 2
            b = 0
        else:
            # High bytes: red/magenta tones
            r = 255
            g = (byte - 200) * 3
            b = (byte - 200) * 4

        # Pack RGBA (alpha = 255)
        color = ((r & 0xFF) << 24) | ((g & 0xFF) << 16) | ((b & 0xFF) << 8) | 0xFF

        # Get 2D coordinates from Hilbert distance
        x, y = substrate.d2xy(i)
        substrate.set_pixel(x, y, color)

    return substrate


# ============================================================================
# GLYPH BLIT RENDERING
# ============================================================================

# Global glyph registry for the Native Glyph Shell
_glyph_registry: Dict[str, tuple] = {}  # glyph_id -> (width, height, pixel_data)
_glyph_substrate: Optional[GlyphSubstrate] = None


def _get_substrate() -> GlyphSubstrate:
    """Get or create the global glyph substrate."""
    global _glyph_substrate
    if _glyph_substrate is None:
        _glyph_substrate = GlyphSubstrate(order=8)  # 256x256
    return _glyph_substrate


def glyph_define(glyph_id: str, width: int, height: int, pixel_data: list = None) -> bool:
    """
    Register a glyph in the glyph registry.

    Args:
        glyph_id: Unique identifier for the glyph
        width: Width of glyph in pixels
        height: Height of glyph in pixels
        pixel_data: Optional list of RGBA color values (u32). If None, creates a solid white glyph.

    Returns:
        True if glyph was registered successfully

    Example:
        >>> glyph_define('test_glyph', 64, 64)
        True
    """
    if pixel_data is None:
        # Create a solid white glyph
        pixel_data = [0xFFFFFFFF] * (width * height)

    _glyph_registry[glyph_id] = (width, height, pixel_data)
    return True


def glyph_blit(glyph_id: str, x: int, y: int, width: int = None, height: int = None) -> bool:
    """
    Blit a glyph to the glyph substrate at position (x, y).

    This is the Python implementation of the GLYPH_BLIT opcode (0xC6).
    Uses Hilbert-indexed GlyphSubstrate for cache-efficient rendering.

    Args:
        glyph_id: Identifier of the glyph to blit
        x: X position on substrate
        y: Y position on substrate
        width: Optional width override (defaults to glyph's width)
        height: Optional height override (defaults to glyph's height)

    Returns:
        True if blit was successful, False if glyph not found or out of bounds

    Raises:
        ValueError: If coordinates are negative

    Example:
        >>> glyph_define('test_glyph', 64, 64)
        True
        >>> glyph_blit('test_glyph', 0, 0, 64, 64)
        True
        >>> glyph_blit('nonexistent', 0, 0)
        False
    """
    if x < 0 or y < 0:
        raise ValueError(f"Coordinates must be non-negative: ({x}, {y})")

    # Check if glyph exists
    if glyph_id not in _glyph_registry:
        # Auto-define if not found (for testing convenience)
        if width is not None and height is not None:
            glyph_define(glyph_id, width, height)
        else:
            return False

    gw, gh, pixel_data = _glyph_registry[glyph_id]

    # Use provided dimensions or glyph's dimensions
    blit_w = width if width is not None else gw
    blit_h = height if height is not None else gh

    substrate = _get_substrate()

    # Bounds check
    if x >= substrate.n or y >= substrate.n:
        return False

    # Blit the glyph to the substrate
    for py in range(min(blit_h, substrate.n - y)):
        for px in range(min(blit_w, substrate.n - x)):
            src_idx = py * gw + px
            if src_idx < len(pixel_data):
                color = pixel_data[src_idx]
                substrate.set_pixel(x + px, y + py, color)

    return True


def glyph_get_substrate() -> GlyphSubstrate:
    """Get the current glyph substrate for rendering."""
    return _get_substrate()


def glyph_clear_substrate():
    """Clear the glyph substrate."""
    global _glyph_substrate
    if _glyph_substrate is not None:
        _glyph_substrate.buffer = [0] * (_glyph_substrate.n * _glyph_substrate.n)


def cmd_run(args):
    """Run a GeoASM program."""
    print(f"Running {args.file}...")
    print("Note: Full VM execution requires the visual-vm environment.")
    print("This command validates and shows what would execute.\n")

    assembler = GeoASMAssembler()
    program = assembler.assemble_file(args.file)

    if program.errors:
        print("Errors:")
        for err in program.errors:
            print(f"  {err}")
        return 1

    print(f"Program assembled successfully:")
    print(f"  Instructions: {len(program.instructions)}")
    print(f"  Labels: {len(program.labels)}")
    print(f"  Binary size: {len(program.binary)} bytes")

    if program.warnings:
        print("\nWarnings:")
        for warn in program.warnings:
            print(f"  {warn}")

    # Show disassembly
    print("\nDisassembly:")
    print("-" * 40)
    disasm = GeoASMDisassembler()
    print(disasm.disassemble(program.binary))

    return 0


def cmd_build(args):
    """Build GeoASM to binary."""
    assembler = GeoASMAssembler()
    program = assembler.assemble_file(args.input)

    if program.errors:
        print("Assembly failed:", file=sys.stderr)
        for err in program.errors:
            print(f"  {err}", file=sys.stderr)
        return 1

    output_path = args.output or args.input.replace(".geoasm", ".bin")
    Path(output_path).write_bytes(program.binary)

    print(f"Built {args.input} -> {output_path}")
    print(f"  {len(program.instructions)} instructions")
    print(f"  {len(program.binary)} bytes")

    return 0


def cmd_validate(args):
    """Validate a GeoASM program."""
    assembler = GeoASMAssembler()
    program = assembler.assemble_file(args.file)

    validator = GeoASMValidator()
    issues = validator.validate(program)

    if not issues:
        print(f"✓ {args.file} is valid")
        return 0

    print(f"Issues in {args.file}:")
    for issue in issues:
        print(f"  {issue}")
    return 1


def cmd_disasm(args):
    """Disassemble binary to GeoASM."""
    binary = Path(args.file).read_bytes()
    disasm = GeoASMDisassembler()
    source = disasm.disassemble(binary)
    print(source)
    return 0


def cmd_opcodes(args):
    """List all available opcodes."""
    print("GeoASM Opcodes")
    print("=" * 60)
    print(f"{'Opcode':<8} {'Name':<15} {'Operands':<10} Description")
    print("-" * 60)

    for code in sorted(OPCODES.keys()):
        name, operands, desc = OPCODES[code]
        print(f"0x{code:02X}     {name:<15} {operands:<10} {desc}")

    print()
    print(f"Total: {len(OPCODES)} opcodes")
    return 0


def main():
    parser = argparse.ArgumentParser(
        description="GeoASM CLI - Geometry OS Assembly Tooling", formatter_class=argparse.RawDescriptionHelpFormatter
    )
    subparsers = parser.add_subparsers(dest="command", help="Commands")

    # run
    p_run = subparsers.add_parser("run", help="Run a GeoASM program")
    p_run.add_argument("file", help="GeoASM file to run")
    p_run.set_defaults(func=cmd_run)

    # build
    p_build = subparsers.add_parser("build", help="Build to binary")
    p_build.add_argument("input", help="Input GeoASM file")
    p_build.add_argument("-o", "--output", help="Output binary file")
    p_build.set_defaults(func=cmd_build)

    # validate
    p_val = subparsers.add_parser("validate", help="Validate program")
    p_val.add_argument("file", help="GeoASM file to validate")
    p_val.set_defaults(func=cmd_validate)

    # disasm
    p_dis = subparsers.add_parser("disasm", help="Disassemble binary")
    p_dis.add_argument("file", help="Binary file to disassemble")
    p_dis.set_defaults(func=cmd_disasm)

    # opcodes
    p_op = subparsers.add_parser("opcodes", help="List available opcodes")
    p_op.set_defaults(func=cmd_opcodes)

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        return 1

    return args.func(args)


if __name__ == "__main__":
    sys.exit(main())
