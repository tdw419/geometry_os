; DESCRIPTION: Renders a magenta disk with center (292, 118) and radius 63.
; PLAN: r0=292(x), r1=118(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 118
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
