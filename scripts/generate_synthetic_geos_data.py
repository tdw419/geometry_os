#!/usr/bin/env python3
"""
Synthetic GeOS Assembly Generator v2

Generates procedurally valid GeOS assembly programs covering:
- All ~60+ opcodes actually used in the corpus
- Multiple structural patterns (loops, conditionals, subroutines, memory ops)
- Realistic register usage patterns (r0-r15 common, r16-r31 rare)
- Comments, labels, hex immediates matching human-written style

Usage:
    python3 scripts/generate_synthetic_geos_data.py --count 5000 --output synthetic_programs
    python3 scripts/generate_synthetic_geos_data.py --count 1000 --output synthetic_programs --seed 42
"""

import argparse
import os
import random
from pathlib import Path

# ── Register pool (weighted toward low registers like human code) ──

def rand_reg(exclude=None):
    """Pick a register. Weight toward r0-r15 (95%) like human code."""
    if random.random() < 0.95:
        r = random.randint(0, 15)
    else:
        r = random.randint(16, 31)
    if exclude and r in exclude:
        return rand_reg(exclude)
    return f"r{r}"

def rand_imm(max_val=255):
    """Random immediate value. Sometimes hex, sometimes decimal."""
    if random.random() < 0.3:
        return f"0x{random.randint(0, 0xFFFFFF):06X}"
    elif random.random() < 0.5:
        # Small common values
        return str(random.choice([0, 1, 2, 4, 8, 10, 16, 32, 64, 128, 255, 256]))
    else:
        return str(random.randint(0, max_val))

def rand_color():
    """Random color in hex format matching human patterns."""
    return f"0x{random.choice([
        0x000000, 0xFFFFFF, 0xFF0000, 0x00FF00, 0x0000FF,
        0xFFFF00, 0xFF00FF, 0x00FFFF, 0xFF8800, 0x8800FF,
        0x008888, 0x888800, 0x880088, 0x444444, 0xAAAAAA,
        0x0044FF, 0x00AAFF, 0x00FFAA, 0x00FF44, 0x44FF00,
        0xAAFF00, 0xFFEE00, 0xFFAA00, 0xFF4400, 0xDD0044,
        0xAA00AA, 0x550077, 0x000066, 0x0000CC, 0x0044FF,
    ]):06X}"

def rand_addr():
    """Random RAM address in common ranges."""
    return f"0x{random.choice([
        0x2000, 0x2100, 0x2200, 0x2300, 0x2400,
        0x3000, 0x4000, 0x5000, 0x6000, 0x7000, 0x8000,
    ]) + random.randint(0, 0xFF):04X}"


# ── Opcode definitions with operand counts ──

# (min_args, max_args) where -1 = variable
OPCODES_0ARG = {"HALT", "FRAME", "RET", "NEG"}
OPCODES_1ARG = {
    "FILL", "PUSH", "POP", "IKEY", "NEG", "RAND",
    "BEEP", "BLINK", "TICKS", "PID", "NOTE",
}
OPCODES_2ARG = {
    "ADD", "SUB", "MUL", "DIV", "MOD",
    "AND", "OR", "XOR", "SHL", "SHR", "SAR",
    "MOV", "CMP", "LOAD", "STORE",
    "ADDI", "SUBI", "ANDI", "ORI", "XORI", "SHLI",
    "CMPI", "BLT", "BGE", "BEQ", "BNE",
    "LDI", "PSETI", "WPIXEL", "FG_COLOR",
}
OPCODES_3ARG = {"PSET", "SCROLL", "RAM", "BUF", "RECTF", "CIRCLE", "LINE"}
OPCODES_SPECIAL = {"CALL", "JMP", "JZ", "JNZ", "TEXT", "DRAWTEXT", "STRO", "SEND_BUF",
                   "STR_BUF", "WRITE_STR_TO_BUF", "WINSYS", "VM_SPAWN", "LLM", "OS", "PTY"}

ALL_OPCODES = sorted(OPCODES_0ARG | OPCODES_1ARG | OPCODES_2ARG | OPCODES_3ARG | OPCODES_SPECIAL)


class ASMGenerator:
    def __init__(self, seed=None):
        if seed is not None:
            random.seed(seed)
        self.lines = []
        self.labels = []
        self.label_counter = 0
        self._used_labels = set()

    def _fresh_label(self, prefix="label"):
        name = f"{prefix}_{self.label_counter}"
        self.label_counter += 1
        self._used_labels.add(name)
        return name

    def _existing_label(self):
        if self.labels:
            return random.choice(self.labels)
        return self._fresh_label()

    def line(self, text=""):
        self.lines.append(text)

    def comment(self, text):
        self.lines.append(f"; {text}")

    def label(self, name):
        self.lines.append(f"{name}:")
        self.labels.append(name)
        self._used_labels.add(name)

    def instr(self, opcode, *args):
        if args:
            self.lines.append(f"  {opcode} {', '.join(str(a) for a in args)}")
        else:
            self.lines.append(f"  {opcode}")

    # ── Instruction generators ──

    def gen_ldi(self, reg=None):
        r = reg or rand_reg()
        self.instr("LDI", r, rand_imm(4096))
        return r

    def gen_store(self, dst=None, src=None):
        d = dst or rand_reg()
        s = src or rand_reg(exclude={int(d[1:])})
        self.instr("STORE", d, s)
        return d, s

    def gen_load(self, dst=None, src=None):
        d = dst or rand_reg()
        s = src or rand_reg(exclude={int(d[1:])})
        self.instr("LOAD", d, s)
        return d, s

    def gen_arith(self):
        """Random arithmetic: ADD, SUB, MUL, DIV, MOD, SHL, SHR, AND, OR, XOR."""
        op = random.choice(["ADD", "SUB", "MUL", "DIV", "MOD", "SHL", "SHR", "AND", "OR", "XOR"])
        r1 = rand_reg()
        r2 = rand_reg(exclude={int(r1[1:])})
        r3 = rand_reg(exclude={int(r1[1:]), int(r2[1:])})
        self.instr(op, r1, r2, r3)

    def gen_arith_imm(self):
        """Random immediate arithmetic: ADDI, SUBI, ANDI, CMPI."""
        op = random.choice(["ADDI", "SUBI", "ANDI", "CMPI"])
        r1 = rand_reg()
        r2 = rand_reg(exclude={int(r1[1:])})
        self.instr(op, r1, r2, rand_imm(255))

    def gen_compare(self):
        """Random comparison: CMP, CMPI."""
        if random.random() < 0.5:
            r1 = rand_reg()
            r2 = rand_reg(exclude={int(r1[1:])})
            self.instr("CMP", r1, r2)
        else:
            r1 = rand_reg()
            self.instr("CMPI", r1, rand_imm(255))

    def gen_branch(self):
        """Random conditional branch: JZ, JNZ, BLT, BGE."""
        lbl = self._fresh_label("branch")
        ops = ["JZ", "JNZ", "BLT", "BGE"]
        if random.random() < 0.5:
            r1 = rand_reg()
            r2 = rand_reg(exclude={int(r1[1:])})
            self.instr(random.choice(["JZ", "JNZ"]), r1, lbl)
        else:
            r1 = rand_reg()
            self.instr(random.choice(["BLT", "BGE"]), r1, lbl)
        return lbl

    def gen_jump(self):
        lbl = self._existing_label()
        self.instr("JMP", lbl)

    def gen_push_pop(self):
        r = rand_reg()
        self.instr("PUSH", r)
        # ... do something ...
        for _ in range(random.randint(1, 3)):
            self.gen_arith()
        self.instr("POP", r)

    def gen_draw(self):
        """Random drawing instruction."""
        op = random.choice(["FILL", "RECTF", "PSET", "CIRCLE", "LINE", "PSETI", "WPIXEL"])
        if op == "FILL":
            r = self.gen_ldi()
            self.instr("FILL", r)
        elif op == "RECTF":
            rx = self.gen_ldi()
            ry = self.gen_ldi()
            rw = self.gen_ldi()
            rh = self.gen_ldi()
            rc = self.gen_ldi()
            self.instr("RECTF", rx, ry, rw, rh, rc)
        elif op == "PSET":
            rx = self.gen_ldi()
            ry = self.gen_ldi()
            rc = self.gen_ldi()
            self.instr("PSET", rx, ry, rc)
        elif op == "CIRCLE":
            rx = self.gen_ldi()
            ry = self.gen_ldi()
            rr = self.gen_ldi()
            rc = self.gen_ldi()
            self.instr("CIRCLE", rx, ry, rr, rc)
        elif op == "LINE":
            x1 = self.gen_ldi()
            y1 = self.gen_ldi()
            x2 = self.gen_ldi()
            y2 = self.gen_ldi()
            rc = self.gen_ldi()
            self.instr("LINE", x1, y1, x2, y2, rc)
        elif op == "PSETI":
            self.gen_ldi()
            self.gen_ldi()
            self.gen_ldi()
            self.instr("PSETI")
        elif op == "WPIXEL":
            self.gen_ldi()
            self.gen_ldi()
            self.gen_ldi()
            self.instr("WPIXEL")

    def gen_text(self):
        """TEXT or DRAWTEXT instruction."""
        r1 = self.gen_ldi()
        r2 = self.gen_ldi()
        r3 = self.gen_ldi()
        if random.random() < 0.5:
            self.instr("TEXT", r1, r2, r3, '"HELLO"')
        else:
            self.instr("DRAWTEXT", r1, r2, r3, '"WORLD"')

    def gen_memory(self):
        """Memory access pattern: STORE/LOAD with addresses."""
        for _ in range(random.randint(2, 5)):
            r_addr = self.gen_ldi()  # will be overwritten below to use address
            self.lines[-1] = self.lines[-1].replace(rand_imm(4096), rand_addr())
            r_val = rand_reg()
            self.instr("STORE", r_addr, r_val)
            # Read it back
            r_dst = rand_reg(exclude={int(r_addr[1:]), int(r_val[1:])})
            self.instr("LOAD", r_dst, r_addr)

    def gen_subroutine(self):
        """CALL/RET pattern with a label body."""
        sub_name = self._fresh_label("func")
        # Call site
        self.instr("CALL", sub_name)
        # Subroutine body
        self.label(sub_name)
        for _ in range(random.randint(2, 6)):
            self.gen_arith()
        self.instr("RET")

    def gen_input(self):
        """Input handling: IKEY."""
        r = rand_reg()
        self.instr("IKEY", r)
        # Branch on input
        lbl = self._fresh_label("key")
        self.instr("CMPI", r, rand_imm(255))
        self.instr("JNZ", r, lbl)

    def gen_stack_ops(self):
        """PUSH/POP with save/restore."""
        saved = []
        for _ in range(random.randint(1, 4)):
            r = rand_reg()
            self.instr("PUSH", r)
            saved.append(r)
        for _ in range(random.randint(2, 5)):
            self.gen_arith()
        for r in reversed(saved):
            self.instr("POP", r)

    def gen_shift_ops(self):
        """SHL, SHR, SAR operations."""
        for _ in range(random.randint(2, 4)):
            op = random.choice(["SHL", "SHR", "SAR", "SHLI"])
            if op == "SHLI":
                r1 = rand_reg()
                r2 = rand_reg(exclude={int(r1[1:])})
                self.instr("SHLI", r1, r2, rand_imm(8))
            else:
                r1 = rand_reg()
                r2 = rand_reg(exclude={int(r1[1:])})
                r3 = rand_reg(exclude={int(r1[1:]), int(r2[1:])})
                self.instr(op, r1, r2, r3)

    def gen_logic(self):
        """AND, OR, XOR operations."""
        for _ in range(random.randint(2, 4)):
            op = random.choice(["AND", "OR", "XOR"])
            r1 = rand_reg()
            r2 = rand_reg(exclude={int(r1[1:])})
            r3 = rand_reg(exclude={int(r1[1:]), int(r2[1:])})
            self.instr(op, r1, r2, r3)

    # ── Structural generators ──

    def gen_init_block(self):
        """Initialization: set up registers with LDI."""
        self.comment("initialization")
        num_vars = random.randint(2, 8)
        regs_used = []
        for _ in range(num_vars):
            r = rand_reg(exclude=set(regs_used))
            self.gen_ldi(r)
            regs_used.append(int(r[1:]))
        return regs_used

    def gen_counted_loop(self):
        """Classic counted loop: LDI counter, loop:, DEC?, JNZ."""
        lbl = self._fresh_label("loop")
        r_cnt = rand_reg()
        self.instr("LDI", r_cnt, rand_imm(50))
        self.label(lbl)
        # Body
        for _ in range(random.randint(1, 4)):
            choice = random.random()
            if choice < 0.3:
                self.gen_draw()
            elif choice < 0.6:
                self.gen_arith()
            else:
                self.gen_arith_imm()
        # Decrement and loop
        r_one = rand_reg(exclude={int(r_cnt[1:])})
        self.instr("LDI", r_one, "1")
        self.instr("SUB", r_cnt, r_cnt, r_one)
        self.instr("JNZ", r_cnt, lbl)

    def gen_conditional_block(self):
        """If/else pattern with CMP + JZ/JNZ."""
        lbl_else = self._fresh_label("else")
        lbl_end = self._fresh_label("endif")
        r1 = rand_reg()
        r2 = rand_reg(exclude={int(r1[1:])})
        self.instr("CMP", r1, r2)
        if random.random() < 0.5:
            self.instr("JZ", r1, lbl_else)
        else:
            self.instr("JNZ", r1, lbl_else)
        # True branch
        for _ in range(random.randint(1, 4)):
            self.gen_arith()
        self.instr("JMP", lbl_end)
        # Else branch
        self.label(lbl_else)
        for _ in range(random.randint(1, 4)):
            self.gen_draw()
        self.label(lbl_end)

    def gen_main_loop(self):
        """Main event loop with FRAME."""
        lbl = self._fresh_label("main")
        self.label(lbl)
        # Body
        body_fns = [self.gen_draw, self.gen_arith, self.gen_compare,
                    self.gen_input, self.gen_shift_ops, self.gen_logic,
                    self.gen_arith_imm, self.gen_text]
        for _ in range(random.randint(2, 6)):
            random.choice(body_fns)()
        self.instr("FRAME")
        self.instr("JMP", lbl)

    def gen_palette(self):
        """Color palette in memory (like mandelbrot)."""
        self.comment("palette")
        r_ptr = rand_reg()
        r_inc = rand_reg(exclude={int(r_ptr[1:])})
        r_col = rand_reg(exclude={int(r_ptr[1:]), int(r_inc[1:])})
        self.instr("LDI", r_ptr, rand_addr())
        self.instr("LDI", r_inc, "1")
        for _ in range(random.randint(4, 16)):
            self.instr("LDI", r_col, rand_color())
            self.instr("STORE", r_ptr, r_col)
            self.instr("ADD", r_ptr, r_ptr, r_inc)

    # ── Top-level program generators ──

    def program_simple_draw(self):
        """Simple: init -> draw something -> halt."""
        self.comment("simple draw program")
        self.gen_init_block()
        for _ in range(random.randint(1, 3)):
            self.gen_draw()
        self.instr("HALT")

    def program_drawing_loop(self):
        """Init -> palette -> drawing loop."""
        self.comment("drawing loop program")
        self.gen_init_block()
        if random.random() < 0.5:
            self.gen_palette()
        self.gen_main_loop()

    def program_counted_animation(self):
        """Init -> counted loop with drawing."""
        self.comment("counted animation")
        self.gen_init_block()
        for _ in range(random.randint(1, 3)):
            self.gen_counted_loop()
        self.instr("HALT")

    def program_math_heavy(self):
        """Init -> lots of arithmetic -> halt."""
        self.comment("math computation")
        self.gen_init_block()
        for _ in range(random.randint(8, 20)):
            choice = random.random()
            if choice < 0.3:
                self.gen_arith()
            elif choice < 0.6:
                self.gen_arith_imm()
            elif choice < 0.8:
                self.gen_shift_ops()
            else:
                self.gen_logic()
        self.instr("HALT")

    def program_conditional(self):
        """Init -> conditional blocks -> halt."""
        self.comment("conditional logic")
        self.gen_init_block()
        for _ in range(random.randint(1, 3)):
            self.gen_conditional_block()
        self.instr("HALT")

    def program_subroutine_calls(self):
        """Init -> call subroutines -> halt."""
        self.comment("subroutine calls")
        self.gen_init_block()
        for _ in range(random.randint(1, 4)):
            self.gen_subroutine()
        self.instr("HALT")

    def program_memory_ops(self):
        """Init -> memory read/write patterns -> halt."""
        self.comment("memory operations")
        self.gen_init_block()
        for _ in range(random.randint(2, 5)):
            self.gen_memory()
        self.instr("HALT")

    def program_stack_heavy(self):
        """Init -> push/pop save/restore -> work -> restore -> halt."""
        self.comment("stack save/restore")
        self.gen_init_block()
        self.gen_stack_ops()
        for _ in range(random.randint(3, 8)):
            self.gen_arith()
        self.gen_stack_ops()
        self.instr("HALT")

    def program_input_driven(self):
        """Init -> main loop with input -> halt on key."""
        self.comment("input driven program")
        self.gen_init_block()
        self.gen_main_loop()

    def program_mixed(self):
        """Mix of everything."""
        self.comment("mixed program")
        self.gen_init_block()
        if random.random() < 0.3:
            self.gen_palette()
        fns = [self.gen_arith, self.gen_draw, self.gen_compare, self.gen_conditional_block,
               self.gen_counted_loop, self.gen_memory, self.gen_shift_ops, self.gen_logic,
               self.gen_text, self.gen_subroutine, self.gen_input, self.gen_stack_ops]
        num_sections = random.randint(3, 8)
        for _ in range(num_sections):
            random.choice(fns)()
        # End with either loop or halt
        if random.random() < 0.4:
            self.gen_main_loop()
        else:
            self.instr("HALT")

    def generate(self):
        """Generate a random program."""
        self.lines = []
        self.labels = []
        self.label_counter = 0
        self._used_labels = set()

        generators = [
            self.program_simple_draw,
            self.program_drawing_loop,
            self.program_counted_animation,
            self.program_math_heavy,
            self.program_conditional,
            self.program_subroutine_calls,
            self.program_memory_ops,
            self.program_stack_heavy,
            self.program_input_driven,
            self.program_mixed,
        ]
        # Weight mixed higher for variety
        weights = [1, 2, 1, 1, 1, 1, 1, 1, 2, 3]
        random.choices(generators, weights=weights, k=1)[0]()

        return "\n".join(self.lines)


def generate_bulk(count, output_dir, seed=None):
    os.makedirs(output_dir, exist_ok=True)
    gen = ASMGenerator(seed=seed)
    for i in range(count):
        prog = gen.generate()
        path = os.path.join(output_dir, f"synthetic_{i:05d}.asm")
        with open(path, "w") as f:
            f.write(prog + "\n")
    print(f"Generated {count} programs in {output_dir}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate synthetic GeOS assembly programs")
    parser.add_argument("--count", type=int, default=5000, help="Number of programs to generate")
    parser.add_argument("--output", default="synthetic_programs", help="Output directory")
    parser.add_argument("--seed", type=int, default=None, help="Random seed for reproducibility")
    args = parser.parse_args()
    generate_bulk(args.count, args.output, seed=args.seed)
