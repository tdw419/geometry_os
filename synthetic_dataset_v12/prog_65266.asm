; DESCRIPTION: Renders a magenta disk with center (93, 175) and radius 63.
; PLAN: r0=93(x), r1=175(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 175
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
