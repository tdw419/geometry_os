#!/usr/bin/env python3
import random
import os
from pathlib import Path

# Geometry OS Constants
SCREEN_W = 512
SCREEN_H = 256

COLORS = {
    "red": "0xFF0000",
    "green": "0x00FF00",
    "blue": "0x0000FF",
    "white": "0xFFFFFF",
    "black": "0x000000",
    "yellow": "0xFFFF00",
    "cyan": "0x00FFFF",
    "magenta": "0xFF00FF"
}

class GeOSProgramSynthesizer:
    def __init__(self):
        self.output_dir = Path("synthetic_dataset_v9")
        self.output_dir.mkdir(exist_ok=True)

    def generate_rectf(self):
        color_name = random.choice(list(COLORS.keys()))
        color_val = COLORS[color_name]
        w = random.randint(10, 100)
        h = random.randint(10, 100)
        x = random.randint(0, SCREEN_W - w)
        y = random.randint(0, SCREEN_H - h)
        
        desc = f"; DESCRIPTION: Draws a {color_name} rectangle at ({x}, {y}) with width {w} and height {h}."
        code = f"""
LDI r0, {x}
LDI r1, {y}
LDI r2, {w}
LDI r3, {h}
LDI r4, {color_val}
RECTF r0, r1, r2, r3, r4
HALT
"""
        return desc, code.strip()

    def generate_circle(self):
        color_name = random.choice(list(COLORS.keys()))
        color_val = COLORS[color_name]
        r = random.randint(10, 50)
        x = random.randint(r, SCREEN_W - r)
        y = random.randint(r, SCREEN_H - r)
        
        desc = f"; DESCRIPTION: Draws a {color_name} circle centered at ({x}, {y}) with radius {r}."
        code = f"""
LDI r0, {x}
LDI r1, {y}
LDI r2, {r}
LDI r3, {color_val}
CIRCLE r0, r1, r2, r3
HALT
"""
        return desc, code.strip()

    def generate_fill(self):
        color_name = random.choice(list(COLORS.keys()))
        color_val = COLORS[color_name]
        
        desc = f"; DESCRIPTION: Fills the entire screen with solid {color_name}."
        code = f"""
LDI r0, {color_val}
FILL r0
HALT
"""
        return desc, code.strip()

    def generate_line(self):
        color_name = random.choice(list(COLORS.keys()))
        color_val = COLORS[color_name]
        x1 = random.randint(0, SCREEN_W - 1)
        y1 = random.randint(0, SCREEN_H - 1)
        x2 = random.randint(0, SCREEN_W - 1)
        y2 = random.randint(0, SCREEN_H - 1)
        
        desc = f"; DESCRIPTION: Draws a {color_name} line from ({x1}, {y1}) to ({x2}, {y2})."
        code = f"""
LDI r0, {x1}
LDI r1, {y1}
LDI r2, {x2}
LDI r3, {y2}
LDI r4, {color_val}
LINE r0, r1, r2, r3, r4
HALT
"""
        return desc, code.strip()

    def generate_gradient(self):
        color_name = random.choice(["red", "green", "blue", "white", "yellow", "cyan", "magenta"])
        color_val = COLORS[color_name]
        
        desc = f"; DESCRIPTION: Fills the screen with a vertical {color_name} gradient."
        code = f"""
; Initialize color and loop counters
LDI r0, {color_val}
LDI r1, 0  ; y coordinate
LDI r2, 0  ; x coordinate
LDI r3, 512 ; width
LDI r4, 256 ; height

y_loop:
  LDI r2, 0
  x_loop:
    PSET r2, r1, r0
    LDI r5, 1
    ADD r2, r5
    LDI r5, 512
    CMP r2, r5
    BLT r0, x_loop
  
  LDI r5, 1
  ADD r1, r5
  LDI r5, 256
  CMP r1, r5
  BLT r0, y_loop
HALT
"""
        return desc, code.strip()

    def generate_loop(self):
        count = random.randint(5, 50)
        desc = f"; DESCRIPTION: A simple program that loads {count} into r1 and decrements it in a loop."
        code = f"""
LDI r1, {count}
loop:
  LDI r2, 1
  SUB r1, r2
  JNZ r1, loop
HALT
"""
        return desc, code.strip()

    def generate_multi(self):
        # Generate 2-3 primitives
        num_prims = random.randint(2, 3)
        descs = []
        codes = []
        
        # We need to use different registers or be careful
        # For simplicity, we just stack them
        for _ in range(num_prims):
            prim_gen = random.choice([self.generate_rectf, self.generate_circle, self.generate_line])
            d, c = prim_gen()
            # Strip HALT from intermediate
            c = c.replace("HALT", "")
            descs.append(d.replace("; DESCRIPTION: ", ""))
            codes.append(c.strip())
            
        desc = "; DESCRIPTION: Composite program: " + " then ".join(descs)
        code = "\n".join(codes) + "\nHALT"
        return desc, code

    def generate_dataset(self, num_samples=50000):

        generators = [
            self.generate_rectf, 
            self.generate_circle, 
            self.generate_fill, 
            self.generate_line,
            self.generate_gradient,
            self.generate_loop,
            self.generate_multi
        ]
        
        print(f"[*] Generating {num_samples} samples (Combinatorial Curriculum)...")
        for i in range(num_samples):
            gen = random.choice(generators)
            desc, code = gen()
            
            content = f"{desc}\n\n{code}\n"
            file_path = self.output_dir / f"prog_{i:05d}.asm"
            file_path.write_text(content)
            
        print(f"[*] Done. Saved to {self.output_dir}/")

if __name__ == "__main__":
    synth = GeOSProgramSynthesizer()
    synth.generate_dataset(10000)
