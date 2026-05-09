; DESCRIPTION: Renders a magenta disk with center (257, 140) and radius 57.
; PLAN: r0=257(x), r1=140(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 140
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
