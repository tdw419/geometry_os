; DESCRIPTION: Renders a magenta disk with center (236, 179) and radius 58.
; PLAN: r0=236(x), r1=179(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 179
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
