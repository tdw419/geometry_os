; DESCRIPTION: Renders a magenta disk with center (267, 156) and radius 52.
; PLAN: r0=267(x), r1=156(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 156
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
