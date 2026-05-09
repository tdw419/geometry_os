#!/usr/bin/env python3
"""
CoT-Augmented GeOS Program Synthesizer (V11).

Generates training samples with explicit Chain-of-Thought PLAN headers.
Each sample follows the format:
    ; DESCRIPTION: <natural language description>
    ; PLAN: <register-to-meaning mapping>
    <assembly code>

The PLAN forces the transformer to attend to register assignments
before emitting code, creating a "scratchpad" in the context window.
"""

import random
import os
from pathlib import Path

# GeOS screen dimensions (256x256 framebuffer)
SCREEN_W = 256
SCREEN_H = 256

COLORS = {
    "red": "0xFF0000",
    "green": "0x00FF00",
    "blue": "0x0000FF",
    "white": "0xFFFFFF",
    "black": "0x000000",
    "yellow": "0xFFFF00",
    "cyan": "0x00FFFF",
    "magenta": "0xFF00FF",
    "orange": "0xFF8800",
    "purple": "0xAA00FF",
}

# Phrasings for DESCRIPTION variety
RECT_PHRASINGS = [
    "Draws a {color} rectangle at ({x}, {y}) with width {w} and height {h}.",
    "Places a {color} {w}x{h} rectangle at position ({x}, {y}).",
    "Renders a {color} box of size {w}x{h} starting at ({x}, {y}).",
    "Creates a {color} rectangular region at ({x}, {y}) spanning {w} by {h} pixels.",
]

CIRCLE_PHRASINGS = [
    "Draws a {color} circle centered at ({x}, {y}) with radius {r}.",
    "Places a {color} circle of radius {r} at center ({x}, {y}).",
    "Renders a {color} disk with center ({x}, {y}) and radius {r}.",
    "Creates a {color} circular shape at ({x}, {y}) with radius {r}.",
]

LINE_PHRASINGS = [
    "Draws a {color} line from ({x1}, {y1}) to ({x2}, {y2}).",
    "Places a {color} line segment connecting ({x1}, {y1}) to ({x2}, {y2}).",
    "Renders a {color} line between points ({x1}, {y1}) and ({x2}, {y2}).",
]

FILL_PHRASINGS = [
    "Fills the entire screen with solid {color}.",
    "Clears the screen to {color}.",
    "Sets the background to {color}.",
    "Paints the whole screen {color}.",
]

PSET_PHRASINGS = [
    "Sets a single {color} pixel at ({x}, {y}).",
    "Places a {color} dot at position ({x}, {y}).",
]


class CoTSynthesizer:
    def __init__(self, output_dir="synthetic_dataset_v11"):
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(exist_ok=True)
        self.counts = {"rectf": 0, "circle": 0, "fill": 0, "line": 0,
                       "pset": 0, "loop": 0, "multi": 0, "gradient": 0}

    def _desc(self, template, **kwargs):
        return "; DESCRIPTION: " + template.format(**kwargs)

    # ─── Primitive generators ────────────────────────────────────────────

    def generate_rectf(self):
        color_name = random.choice(list(COLORS.keys()))
        color_val = COLORS[color_name]
        w = random.randint(10, 120)
        h = random.randint(10, 120)
        x = random.randint(0, max(0, SCREEN_W - w))
        y = random.randint(0, max(0, SCREEN_H - h))

        desc = self._desc(random.choice(RECT_PHRASINGS),
                          color=color_name, x=x, y=y, w=w, h=h)
        plan = f"; PLAN: r0={x}(x), r1={y}(y), r2={w}(width), r3={h}(height), r4={color_val}(color). Op: RECTF r0, r1, r2, r3, r4."
        code = f"LDI r0, {x}\nLDI r1, {y}\nLDI r2, {w}\nLDI r3, {h}\nLDI r4, {color_val}\nRECTF r0, r1, r2, r3, r4\nHALT"
        self.counts["rectf"] += 1
        return f"{desc}\n{plan}\n{code}"

    def generate_circle(self):
        color_name = random.choice(list(COLORS.keys()))
        color_val = COLORS[color_name]
        r = random.randint(10, 80)
        x = random.randint(r, SCREEN_W - r) if r < SCREEN_W // 2 else SCREEN_W // 2
        y = random.randint(r, SCREEN_H - r) if r < SCREEN_H // 2 else SCREEN_H // 2

        desc = self._desc(random.choice(CIRCLE_PHRASINGS),
                          color=color_name, x=x, y=y, r=r)
        plan = f"; PLAN: r0={x}(x), r1={y}(y), r2={r}(radius), r3={color_val}(color). Op: CIRCLE r0, r1, r2, r3."
        code = f"LDI r0, {x}\nLDI r1, {y}\nLDI r2, {r}\nLDI r3, {color_val}\nCIRCLE r0, r1, r2, r3\nHALT"
        self.counts["circle"] += 1
        return f"{desc}\n{plan}\n{code}"

    def generate_fill(self):
        color_name = random.choice(list(COLORS.keys()))
        color_val = COLORS[color_name]

        desc = self._desc(random.choice(FILL_PHRASINGS), color=color_name)
        plan = f"; PLAN: r0={color_val}(color). Op: FILL r0."
        code = f"LDI r0, {color_val}\nFILL r0\nHALT"
        self.counts["fill"] += 1
        return f"{desc}\n{plan}\n{code}"

    def generate_line(self):
        color_name = random.choice(list(COLORS.keys()))
        color_val = COLORS[color_name]
        x1 = random.randint(0, SCREEN_W - 1)
        y1 = random.randint(0, SCREEN_H - 1)
        x2 = random.randint(0, SCREEN_W - 1)
        y2 = random.randint(0, SCREEN_H - 1)

        desc = self._desc(random.choice(LINE_PHRASINGS),
                          color=color_name, x1=x1, y1=y1, x2=x2, y2=y2)
        plan = f"; PLAN: r0={x1}(x1), r1={y1}(y1), r2={x2}(x2), r3={y2}(y2), r4={color_val}(color). Op: LINE r0, r1, r2, r3, r4."
        code = f"LDI r0, {x1}\nLDI r1, {y1}\nLDI r2, {x2}\nLDI r3, {y2}\nLDI r4, {color_val}\nLINE r0, r1, r2, r3, r4\nHALT"
        self.counts["line"] += 1
        return f"{desc}\n{plan}\n{code}"

    def generate_pset(self):
        color_name = random.choice(list(COLORS.keys()))
        color_val = COLORS[color_name]
        x = random.randint(0, SCREEN_W - 1)
        y = random.randint(0, SCREEN_H - 1)

        desc = self._desc(random.choice(PSET_PHRASINGS), color=color_name, x=x, y=y)
        plan = f"; PLAN: r0={x}(x), r1={y}(y), r2={color_val}(color). Op: PSET r0, r1, r2."
        code = f"LDI r0, {x}\nLDI r1, {y}\nLDI r2, {color_val}\nPSET r0, r1, r2\nHALT"
        self.counts["pset"] += 1
        return f"{desc}\n{plan}\n{code}"

    def generate_loop(self):
        count = random.randint(3, 50)
        # Simple counter decrement loop
        desc = f"; DESCRIPTION: Loads {count} into r1 and decrements it in a loop until zero."
        plan = f"; PLAN: r1={count}(counter), r2=1(step). Loop: SUB r1, r2 then JNZ r1, loop."
        code = f"LDI r1, {count}\nloop:\nLDI r2, 1\nSUB r1, r2\nJNZ r1, loop\nHALT"
        self.counts["loop"] += 1
        return f"{desc}\n{plan}\n{code}"

    def generate_gradient(self):
        """Vertical gradient: scanlines from top to bottom with shifting color."""
        color_name = random.choice(["red", "green", "blue", "white"])
        color_val = COLORS[color_name]

        desc = f"; DESCRIPTION: Fills the screen with a vertical {color_name} gradient from dark to bright."
        plan = (f"; PLAN: r0={color_val}(base color), r1=0(y start), r2=0(x), "
                f"r3={SCREEN_W}(width), r4={SCREEN_H}(height), r5=1(inc), r6={SCREEN_H}(limit). "
                f"Loop: PSET r2, r1, r0 across x, then INC r1.")
        code = f"""LDI r0, {color_val}
LDI r1, 0
y_loop:
LDI r2, 0
x_loop:
PSET r2, r1, r0
LDI r5, 1
ADD r2, r5
LDI r6, {SCREEN_W}
CMP r2, r6
BLT r0, x_loop
LDI r5, 1
ADD r1, r5
LDI r6, {SCREEN_H}
CMP r1, r6
BLT r0, y_loop
HALT"""
        self.counts["gradient"] += 1
        return f"{desc}\n{plan}\n{code.strip()}"

    def generate_multi(self):
        """Composite: 2 primitives drawn sequentially."""
        generators = [
            self.generate_rectf, self.generate_circle,
            self.generate_line, self.generate_pset
        ]
        chosen = random.sample(generators, min(2, len(generators)))
        parts = []
        for gen in chosen:
            text = gen()
            # Remove HALT from intermediate parts
            lines = text.strip().split('\n')
            filtered = [l for l in lines if l.strip() != 'HALT']
            parts.append('\n'.join(filtered))

        combined_code = '\n'.join(parts) + '\nHALT'

        # Build combined desc/plan
        desc_lines = []
        plan_lines = []
        for part in parts:
            for line in part.split('\n'):
                if line.startswith('; DESCRIPTION:'):
                    desc_lines.append(line.replace('; DESCRIPTION: ', '').rstrip('.'))
                elif line.startswith('; PLAN:'):
                    plan_lines.append(line)

        desc = "; DESCRIPTION: Composite: " + ". Then " + ". Then ".join(desc_lines) + "."
        plan = "; PLAN: " + " Next: ".join(
            p.replace('; PLAN: ', '').rstrip('.') for p in plan_lines
        ) + "."

        self.counts["multi"] += 1
        return f"{desc}\n{plan}\n{combined_code}"

    # ─── Dataset generation ──────────────────────────────────────────────

    def generate_dataset(self, num_samples=50000):
        # Weighted distribution: more primitives, fewer complex
        generators = [
            (self.generate_rectf, 20),
            (self.generate_circle, 20),
            (self.generate_fill, 10),
            (self.generate_line, 20),
            (self.generate_pset, 5),
            (self.generate_loop, 5),
            (self.generate_multi, 10),
            (self.generate_gradient, 10),
        ]
        pool = []
        for gen, weight in generators:
            pool.extend([gen] * weight)

        print(f"[*] Generating {num_samples} CoT-augmented samples...")
        for i in range(num_samples):
            gen = random.choice(pool)
            content = gen()
            file_path = self.output_dir / f"prog_{i:05d}.asm"
            file_path.write_text(content + "\n")

            if (i + 1) % 10000 == 0:
                print(f"    {i+1}/{num_samples} generated")

        print(f"[*] Done. Saved to {self.output_dir}/")
        print(f"[*] Distribution: {self.counts}")


if __name__ == "__main__":
    synth = CoTSynthesizer()
    synth.generate_dataset(50000)
