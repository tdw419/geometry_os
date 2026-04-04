"""
Synthetic training data generator for Pixel LLM.

Generates valid glyph assembly programs using templates.
Each program is a sequence of instructions that the model learns to predict.

Templates cover:
  1. Simple sequences (LDI + HALT)
  2. Memory operations (LOAD/STORE pairs)
  3. Arithmetic (ADD, SUB, MUL chains)
  4. Loops (counter + branch)
  5. Copy programs (load/store loops -- like the self-replicator)
  6. Call/return patterns
  7. Multi-register patterns
"""

import random
from dataclasses import dataclass

from model import encode, decode, BOS_ID, EOS_ID, PAD_ID


@dataclass
class ProgramTemplate:
    """A template that generates a valid assembly program."""
    name: str
    weight: float  # relative frequency

    def generate(self) -> str:
        raise NotImplementedError


class LoadStoreSequence(ProgramTemplate):
    """LDI r0, val; LDI r1, addr; STORE r1, r0; HALT"""
    def __init__(self):
        super().__init__(name="load_store", weight=3.0)

    def generate(self) -> str:
        val = random.randint(0, 255)
        addr = random.choice([0, 50, 100, 150, 200])
        r_val = random.randint(0, 7)
        r_addr = random.choice([r for r in range(8) if r != r_val])
        return (
            f"LDI r{r_val} {val}\n"
            f"LDI r{r_addr} {addr}\n"
            f"STORE r{r_addr} r{r_val}\n"
            f"HALT\n"
        )


class ArithmeticChain(ProgramTemplate):
    """LDI; LDI; ADD/SUB; HALT"""
    def __init__(self):
        super().__init__(name="arithmetic", weight=2.0)

    def generate(self) -> str:
        a = random.randint(0, 100)
        b = random.randint(0, 100)
        op = random.choice(['ADD', 'SUB'])
        ra, rb, rc = random.sample(range(8), 3)
        lines = [
            f"LDI r{ra} {a}",
            f"LDI r{rb} {b}",
            f"MOV r{rc} r{ra}",
            f"{op} r{rc} r{rb}",
            "HALT",
        ]
        return '\n'.join(lines) + '\n'


class CopyLoop(ProgramTemplate):
    """Copy N words from src to dst -- the core of self-replication."""
    def __init__(self):
        super().__init__(name="copy_loop", weight=4.0)

    def generate(self) -> str:
        src = random.choice([0, 50, 100, 200])
        length = random.randint(5, 30)
        dst = src + length + random.randint(10, 50)
        lines = [
            f"LDI r0 {src}",
            f"LDI r1 {dst}",
            f"LDI r2 0",
            f"LDI r3 1",
            f"LDI r4 {length}",
            "LOAD r5 r0",
            "STORE r1 r5",
            "ADD r0 r3",
            "ADD r1 r3",
            "ADD r2 r3",
            f"BNE r2 r4 -7",
            "HALT",
        ]
        return '\n'.join(lines) + '\n'


class CountLoop(ProgramTemplate):
    """Count from 0 to N, storing each value."""
    def __init__(self):
        super().__init__(name="count_loop", weight=2.0)

    def generate(self) -> str:
        n = random.randint(5, 50)
        base_addr = random.choice([100, 200, 300])
        lines = [
            f"LDI r0 {base_addr}",
            "LDI r1 0",
            f"LDI r2 {n}",
            "LDI r3 1",
            "STORE r0 r1",
            "ADD r0 r3",
            "ADD r1 r3",
            "BNE r1 r2 -4",
            "HALT",
        ]
        return '\n'.join(lines) + '\n'


class FillMemory(ProgramTemplate):
    """Fill a range of memory with a constant value."""
    def __init__(self):
        super().__init__(name="fill_memory", weight=2.0)

    def generate(self) -> str:
        val = random.randint(1, 255)
        start = random.choice([100, 200, 300])
        count = random.randint(5, 30)
        lines = [
            f"LDI r0 {start}",
            f"LDI r1 {val}",
            f"LDI r2 {count}",
            "LDI r3 1",
            "STORE r0 r1",
            "ADD r0 r3",
            "SUB r2 r3",
            "BNE r2 r3 -4",
            "HALT",
        ]
        return '\n'.join(lines) + '\n'


class CallReturn(ProgramTemplate):
    """CALL a subroutine, RET back."""
    def __init__(self):
        super().__init__(name="call_return", weight=1.5)

    def generate(self) -> str:
        val = random.randint(1, 100)
        # Main: set value, call subroutine at addr 20, halt
        # Subroutine: add 1, return
        lines = [
            f"LDI r0 {val}",
            "LDI r1 1",
            "CALL 20",
            "HALT",
            "NOP",
            "NOP",
            "NOP",
            "NOP",
            "NOP",
            "NOP",
            "NOP",
            "NOP",
            "NOP",
            "NOP",
            "NOP",
            "NOP",
            "NOP",
            "NOP",
            "NOP",
            "NOP",
            "ADD r0 r1",
            "RET",
        ]
        return '\n'.join(lines) + '\n'


class LoadComputeStore(ProgramTemplate):
    """Load two values, compute, store result."""
    def __init__(self):
        super().__init__(name="load_compute_store", weight=3.0)

    def generate(self) -> str:
        a_addr = random.randint(0, 50)
        b_addr = a_addr + 1
        result_addr = random.choice([100, 200])
        op = random.choice(['ADD', 'SUB'])
        lines = [
            f"LDI r0 {a_addr}",
            f"LDI r1 {b_addr}",
            f"LDI r4 {result_addr}",
            "LOAD r2 r0",
            "LOAD r3 r1",
            f"{op} r2 r3",
            "STORE r4 r2",
            "HALT",
        ]
        return '\n'.join(lines) + '\n'


class SelfReplicator(ProgramTemplate):
    """The actual self-replicator from the codebase."""
    def __init__(self):
        super().__init__(name="self_replicator", weight=5.0)

    def generate(self) -> str:
        dst = random.choice([100, 200, 300])
        length = random.randint(10, 30)
        lines = [
            "LDI r0 0",
            f"LDI r1 {dst}",
            "LDI r2 0",
            "LDI r3 1",
            f"LDI r4 {length}",
            "LOAD r5 r0",
            "STORE r1 r5",
            "ADD r0 r3",
            "ADD r1 r3",
            "ADD r2 r3",
            "BNE r2 r4 -7",
            "HALT",
        ]
        return '\n'.join(lines) + '\n'


# All templates
TEMPLATES = [
    LoadStoreSequence(),
    ArithmeticChain(),
    CopyLoop(),
    CountLoop(),
    FillMemory(),
    CallReturn(),
    LoadComputeStore(),
    SelfReplicator(),
]


def generate_program() -> str:
    """Generate a random valid assembly program."""
    weights = [t.weight for t in TEMPLATES]
    template = random.choices(TEMPLATES, weights=weights, k=1)[0]
    return template.generate()


def generate_dataset(n: int = 10000) -> list[list[int]]:
    """Generate n tokenized programs for training."""
    programs = []
    for _ in range(n):
        text = generate_program()
        tokens = encode(text)
        if len(tokens) > 2:  # More than just BOS + EOS
            programs.append(tokens)
    return programs


def batch_programs(programs: list[list[int]], block_size: int = 128):
    """
    Convert programs into (x, y) pairs for training.
    Each program is padded to block_size. x = tokens[:-1], y = tokens[1:]
    """
    import torch

    batch_x = []
    batch_y = []
    for tokens in programs:
        # Truncate or pad
        if len(tokens) > block_size:
            tokens = tokens[:block_size]
        padded = tokens + [PAD_ID] * (block_size - len(tokens))

        x = padded[:-1]
        y = padded[1:]
        batch_x.append(x)
        batch_y.append(y)

    return torch.tensor(batch_x, dtype=torch.long), torch.tensor(batch_y, dtype=torch.long)


if __name__ == '__main__':
    # Quick test
    for _ in range(5):
        prog = generate_program()
        tokens = encode(prog)
        decoded = decode(tokens)
        print(f"--- {len(tokens)} tokens ---")
        print(decoded)
        print()
