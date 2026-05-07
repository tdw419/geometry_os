#!/usr/bin/env python3
import random
import os
import numpy as np
from pathlib import Path

# --- GeOS ISA Configuration ---

REGISTERS = [f"r{i}" for i in range(32)]
OPCODES = {
    "LDI": ("reg", "imm"),
    "ADD": ("reg", "reg", "reg"),
    "SUB": ("reg", "reg", "reg"),
    "CMP": ("reg", "reg"),
    "CMPI": ("reg", "imm"),
    "JZ": ("reg", "label"),
    "JNZ": ("reg", "label"),
    "JMP": ("label",),
    "HALT": (),
    "PSET": ("reg", "reg", "reg"),
    "FILL": ("reg",),
    "RECTF": ("reg", "reg", "reg", "reg", "reg"),
    "CIRCLE": ("reg", "reg", "reg", "reg"),
    "LINE": ("reg", "reg", "reg", "reg", "reg"),
    "TEXT": ("reg", "reg", "reg", "str"),
    "SCROLL": ("reg", "reg"),
    "IKEY": ("reg",),
    "MOUSEQ": ("reg", "reg", "reg"),
    "STORE": ("reg", "reg"),
    "LOAD": ("reg", "reg"),
    "FRAME": (),
    "PUSH": ("reg",),
    "POP": ("reg",),
    "CALL": ("label",),
    "RET": (),
}

# Values for randomization
COLORS = [0xFFFFFF, 0xFF0000, 0x00FF00, 0x0000FF, 0xFFFF00, 0xFF00FF, 0x00FFFF, 0x000000, 0x888888]
COORDS = list(range(0, 256))
IMMEDIATES = list(range(0, 1024))

# --- Generator Helpers ---

class ASMGenerator:
    def __init__(self):
        self.labels = []
        self.lines = []
        self.indent = "  "

    def add_line(self, line):
        self.lines.append(line)

    def add_comment(self, text):
        self.add_line(f"; {text}")

    def add_label(self, name):
        self.add_line(f"{name}:")
        self.labels.append(name)

    def get_random_reg(self, exclude=None):
        regs = [r for r in REGISTERS if r != exclude]
        return random.choice(regs)

    def get_random_imm(self):
        if random.random() < 0.2:
            return f"0x{random.choice(COLORS):06X}"
        return str(random.choice(IMMEDIATES))

    def generate_instruction(self, opcode, target_label=None):
        fmt = OPCODES[opcode]
        args = []
        for f in fmt:
            if f == "reg":
                args.append(self.get_random_reg())
            elif f == "imm":
                args.append(self.get_random_imm())
            elif f == "label":
                if target_label:
                    args.append(target_label)
                else:
                    args.append("todo_label")
            elif f == "str":
                args.append('"SYNTHETIC"')
        
        arg_str = ", ".join(args)
        return f"{self.indent}{opcode} {arg_str}".strip()

    def idiom_init(self):
        self.add_comment("initialization")
        num_vars = random.randint(2, 6)
        for _ in range(num_vars):
            self.add_line(self.generate_instruction("LDI"))

    def idiom_draw_loop(self):
        label = f"loop_{len(self.labels)}"
        self.add_comment("main loop")
        self.add_label(label)
        
        # Clear screen
        reg_color = self.get_random_reg()
        self.add_line(f"{self.indent}LDI {reg_color}, {random.choice(COLORS)}")
        self.add_line(f"{self.indent}FILL {reg_color}")
        
        # Draw something
        draw_ops = ["RECTF", "CIRCLE", "LINE", "PSET"]
        for _ in range(random.randint(1, 3)):
            self.add_line(self.generate_instruction(random.choice(draw_ops)))
            
        # Optional logic
        if random.random() < 0.5:
            r1 = self.get_random_reg()
            r2 = self.get_random_reg()
            self.add_line(f"{self.indent}CMP {r1}, {r2}")
            self.add_line(f"{self.indent}JZ r0, {label}")
            
        self.add_line(f"{self.indent}FRAME")
        self.add_line(f"{self.indent}JMP {label}")

    def idiom_math_block(self):
        self.add_comment("arithmetic section")
        for _ in range(random.randint(3, 8)):
            op = random.choice(["ADD", "SUB", "LDI"])
            self.add_line(self.generate_instruction(op))

    def generate_program(self):
        self.lines = []
        self.labels = []
        
        self.add_comment("Synthetic GeOS Program")
        
        # Structure: Init -> [Math | Draw] -> Halt/Loop
        self.idiom_init()
        
        structure = random.choice(["math", "draw", "mixed"])
        if structure == "math":
            self.idiom_math_block()
            self.add_line(f"{self.indent}HALT")
        elif structure == "draw":
            self.idiom_draw_loop()
        else:
            self.idiom_math_block()
            self.idiom_draw_loop()
            
        return "\n".join(self.lines)

def generate_bulk(count, output_dir):
    os.makedirs(output_dir, exist_ok=True)
    gen = ASMGenerator()
    for i in range(count):
        prog = gen.generate_program()
        with open(os.path.join(output_dir, f"synthetic_{i:04d}.asm"), "w") as f:
            f.write(prog)
    print(f"Generated {count} programs in {output_dir}")

if __name__ == "__main__":
    generate_bulk(1000, "synthetic_programs")
