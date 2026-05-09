; DESCRIPTION: Renders a magenta disk with center (62, 179) and radius 15.
; PLAN: r0=62(x), r1=179(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 179
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
