#!/usr/bin/env python3
"""
Executable Thought Demo - Geometry OS
======================================

Combines LLM visual thoughts with executable RISC-V glyph encoding.

The LLM generates text, and each token is encoded as:
1. A holographic visual pattern (for Neural City)
2. A RISC-V instruction representation (for Visual CPU execution)

This demonstrates the core Geometry OS concept: LLM thoughts are literally
executable instructions.

Usage:
    python executable_thought_demo.py --prompt "Write a simple program"
    python executable_thought_demo.py --chat
"""

import asyncio
import time
import numpy as np
import argparse
import sys
import json
import requests
from pathlib import Path
from typing import Optional, Generator, List
from dataclasses import dataclass

# Add project root to path
PROJECT_ROOT = Path(__file__).parent
sys.path.insert(0, str(PROJECT_ROOT))

from visual_thought_demo import GeometricOutputAdapter, VisualThoughtDemo
from systems.pixel_compiler.holographic_encoder import generate_2d_basis, encode_instruction


# RISC-V opcode mappings for executable glyphs
RISCV_OPCODES = {
    'ALU': 0x33,
    'ALU_IMM': 0x13,
    'LOAD': 0x03,
    'STORE': 0x23,
    'BRANCH': 0x63,
    'JAL': 0x6F,
    'JALR': 0x67,
    'SYSTEM': 0x73,
}

# Map semantic concepts to RISC-V instruction types
CONCEPT_TO_OPCODE = {
    'compute': 'ALU',
    'calculate': 'ALU',
    'add': 'ALU',
    'process': 'ALU_IMM',
    'think': 'ALU_IMM',
    'load': 'LOAD',
    'read': 'LOAD',
    'get': 'LOAD',
    'fetch': 'LOAD',
    'store': 'STORE',
    'save': 'STORE',
    'write': 'STORE',
    'put': 'STORE',
    'if': 'BRANCH',
    'when': 'BRANCH',
    'check': 'BRANCH',
    'compare': 'BRANCH',
    'goto': 'JAL',
    'jump': 'JAL',
    'call': 'JAL',
    'return': 'JALR',
    'exit': 'SYSTEM',
    'system': 'SYSTEM',
    'halt': 'SYSTEM',
}


@dataclass
class ExecutableThought:
    """A thought that is both visual AND executable."""
    token: str
    signature: int
    pattern_16x16: np.ndarray
    riscv_opcode: int
    riscv_instruction: int
    is_executable: bool


class ExecutableThoughtEngine:
    """
    Generates executable thoughts - each token becomes a RISC-V instruction
    encoded as a holographic glyph.
    """

    def __init__(self, model: str = "tinyllama", latent_dim: int = 4096):
        self.model = model
        self.base_url = "http://localhost:11434"
        self.adapter = GeometricOutputAdapter(latent_dim=latent_dim)
        self.basis = generate_2d_basis(size=16, count=64)[:32]
        self.n_embd = latent_dim
        self.token_count = 0

        # Check Ollama connection
        try:
            resp = requests.get(f"{self.base_url}/api/tags", timeout=2)
            if resp.status_code == 200:
                models = resp.json().get('models', [])
                print(f"🧠 Executable Thought Engine")
                print(f"   Model: {model}")
                print(f"   Available: {[m['name'] for m in models]}")
        except Exception as e:
            raise ConnectionError(f"Cannot connect to Ollama: {e}")

    def _token_to_riscv(self, token: str, signature: int) -> tuple:
        """
        Convert a token + signature to a RISC-V instruction.

        Returns (opcode_type, instruction_32bit)
        """
        token_lower = token.lower().strip()

        # Determine instruction type from token semantics
        inst_type = 'ALU_IMM'  # Default
        for concept, op_type in CONCEPT_TO_OPCODE.items():
            if concept in token_lower:
                inst_type = op_type
                break

        opcode = RISCV_OPCODES.get(inst_type, 0x13)

        # Build 32-bit instruction using signature bits
        # Format: [31:25] funct7 [24:20] rs2 [19:15] rs1 [14:12] funct3 [11:7] rd [6:0] opcode

        rd = (signature >> 0) & 0x1F       # Destination register
        rs1 = (signature >> 5) & 0x1F      # Source register 1
        rs2 = (signature >> 10) & 0x1F     # Source register 2
        funct3 = (signature >> 15) & 0x07  # Function code
        funct7 = (signature >> 18) & 0x7F  # Extended function

        # Construct instruction based on type
        if inst_type in ['ALU', 'ALU_IMM']:
            if inst_type == 'ALU':
                # R-type: funct7[31:25] | rs2[24:20] | rs1[19:15] | funct3[14:12] | rd[11:7] | opcode[6:0]
                instruction = (funct7 << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | opcode
            else:
                # I-type: imm[31:20] | rs1[19:15] | funct3[14:12] | rd[11:7] | opcode[6:0]
                imm = (signature >> 12) & 0xFFF
                instruction = (imm << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | opcode

        elif inst_type == 'LOAD':
            # I-type load
            imm = (signature >> 12) & 0xFFF
            instruction = (imm << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | opcode

        elif inst_type == 'STORE':
            # S-type: imm[11:5][31:25] | rs2[24:20] | rs1[19:15] | funct3[14:12] | imm[4:0][11:7] | opcode[6:0]
            imm = (signature >> 12) & 0xFFF
            instruction = ((imm >> 5) << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) | ((imm & 0x1F) << 7) | opcode

        elif inst_type == 'BRANCH':
            # B-type: complex encoding
            imm = (signature >> 12) & 0xFFF
            instruction = opcode  # Simplified
            instruction |= (rs2 << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7)

        else:
            # Default I-type
            imm = signature & 0xFFF
            instruction = (imm << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | opcode

        return inst_type, instruction

    def _token_to_thought(self, token: str, context: str) -> ExecutableThought:
        """Convert a token to an executable thought."""
        # Generate signature from token
        np.random.seed(hash(token) % (2**31))
        thought_vec = np.random.randn(self.n_embd)
        context_seed = hash(context[-100:]) % (2**31)
        np.random.seed(context_seed)
        thought_vec += np.random.randn(self.n_embd) * 0.3

        # Get visual pattern
        pattern, signature, _ = self.adapter.adapt(thought_vec)

        # Get RISC-V encoding
        inst_type, riscv_inst = self._token_to_riscv(token, signature)
        opcode = RISCV_OPCODES.get(inst_type, 0x13)

        return ExecutableThought(
            token=token,
            signature=signature,
            pattern_16x16=pattern,
            riscv_opcode=opcode,
            riscv_instruction=riscv_inst,
            is_executable=True
        )

    def generate_executable_stream(
        self,
        prompt: str,
        on_thought: callable = None
    ) -> Generator:
        """
        Generate executable thoughts from LLM output.

        Yields ExecutableThought objects.
        """
        # Prompt understanding
        prompt_thought = self._token_to_thought("[PROMPT]", prompt)
        yield prompt_thought

        # Stream from Ollama
        response = requests.post(
            f"{self.base_url}/api/generate",
            json={"model": self.model, "prompt": prompt, "stream": True},
            stream=True
        )

        full_response = ""
        for line in response.iter_lines():
            if line:
                data = json.loads(line)
                token = data.get("response", "")
                done = data.get("done", False)

                if token:
                    full_response += token
                    self.token_count += 1

                    thought = self._token_to_thought(token, full_response)

                    if on_thought:
                        on_thought(thought)

                    yield thought

                if done:
                    break

        print(f"\n✅ Generated {self.token_count} executable thoughts")


def render_executable_glyph(thought: ExecutableThought) -> str:
    """Render an executable thought as ASCII art."""
    chars = " .:-=+*#%@"
    pattern = thought.pattern_16x16

    # Normalize for display
    normalized = ((pattern - pattern.min()) / (pattern.max() - pattern.min() + 1e-8) * (len(chars) - 1)).astype(int)

    # Build ASCII representation
    lines = []
    for row in normalized[:8]:  # 8x8 preview
        lines.append("".join(chars[c] for c in row))

    return "\n".join(lines)


def disassemble_instruction(instruction: int) -> str:
    """Simple RISC-V disassembly for display."""
    opcode = instruction & 0x7F
    rd = (instruction >> 7) & 0x1F
    funct3 = (instruction >> 12) & 0x07
    rs1 = (instruction >> 15) & 0x1F
    rs2 = (instruction >> 20) & 0x1F

    # Simplified mnemonic lookup
    if opcode == 0x33:
        mnemonics = {0: 'add', 0x20: 'sub', 0x04: 'xor', 0x06: 'or', 0x07: 'and'}
        mnemonic = mnemonics.get(funct3 | (0x20 if (instruction >> 30) & 1 else 0), 'alu')
        return f"{mnemonic} x{rd}, x{rs1}, x{rs2}"
    elif opcode == 0x13:
        imm = (instruction >> 20) & 0xFFF
        if imm & 0x800:
            imm = imm - 0x1000  # Sign extend
        mnemonics = {0: 'addi', 0x04: 'xori', 0x06: 'ori', 0x07: 'andi'}
        mnemonic = mnemonics.get(funct3, 'opimm')
        return f"{mnemonic} x{rd}, x{rs1}, {imm}"
    elif opcode == 0x03:
        imm = (instruction >> 20) & 0xFFF
        loads = {0: 'lb', 1: 'lh', 2: 'lw'}
        return f"{loads.get(funct3, 'load')} x{rd}, {imm}(x{rs1})"
    elif opcode == 0x23:
        imm = ((instruction >> 25) << 5) | ((instruction >> 7) & 0x1F)
        stores = {0: 'sb', 1: 'sh', 2: 'sw'}
        return f"{stores.get(funct3, 'store')} x{rs2}, {imm}(x{rs1})"
    elif opcode == 0x63:
        imm = 0  # Simplified
        branches = {0: 'beq', 1: 'bne', 4: 'blt', 5: 'bge'}
        return f"{branches.get(funct3, 'branch')} x{rs1}, x{rs2}, {imm}"
    elif opcode == 0x6F:
        return f"jal x{rd}, <addr>"
    elif opcode == 0x67:
        return f"jalr x{rd}, x{rs1}, 0"
    elif opcode == 0x73:
        return "ecall" if instruction == 0x00000073 else "system"
    else:
        return f"unknown (0x{opcode:02x})"


async def run_with_visualization(engine: ExecutableThoughtEngine, prompt: str):
    """Run with Neural City visualization."""
    demo = VisualThoughtDemo(ws_url="ws://localhost:8768", latent_dim=engine.n_embd)
    connected = await demo.connect()

    print(f"\n🧠 Executable Thought Stream")
    print(f"   Prompt: {prompt[:50]}...")
    print("="*60)

    program_lines = []
    response_text = ""

    for thought in engine.generate_executable_stream(prompt):
        if thought.token == "[PROMPT]":
            print(f"\n📍 PROMPT UNDERSTOOD")
            print(f"   Signature: 0x{thought.signature:08X}")
            continue

        response_text += thought.token
        print(thought.token, end="", flush=True)

        # Every 30 tokens, show executable state
        if engine.token_count % 30 == 0:
            asm = disassemble_instruction(thought.riscv_instruction)
            glyph = '▓░▒█'[thought.signature % 4]
            print(f"\n   [{glyph}][0x{thought.signature:06X}] {asm}", end=" ", flush=True)
            program_lines.append(asm)

        # Send to Neural City
        if connected:
            await demo.send_thought_pulse(
                thought.pattern_16x16.flatten()[:256],
                label=thought.token[:10]
            )

    print("\n")
    print("="*60)
    print("📜 GENERATED PROGRAM (RISC-V):")
    print("-"*40)
    for i, line in enumerate(program_lines[:10]):
        print(f"   {i:3d}: {line}")
    if len(program_lines) > 10:
        print(f"   ... ({len(program_lines) - 10} more instructions)")

    print("-"*40)
    print(f"   Total executable thoughts: {engine.token_count}")

    if connected:
        await demo.disconnect()

    return response_text, program_lines


def main():
    parser = argparse.ArgumentParser(description="Executable Thought Demo")
    parser.add_argument("--model", "-m", default="tinyllama", help="Ollama model")
    parser.add_argument("--prompt", "-p", default=None, help="Prompt to process")
    parser.add_argument("--chat", "-c", action="store_true", help="Interactive mode")

    args = parser.parse_args()

    engine = ExecutableThoughtEngine(model=args.model)

    if args.prompt:
        asyncio.run(run_with_visualization(engine, args.prompt))
    else:
        # Default demo
        prompt = "Write a simple program that computes the sum of numbers"
        asyncio.run(run_with_visualization(engine, prompt))


if __name__ == "__main__":
    sys.exit(main())
