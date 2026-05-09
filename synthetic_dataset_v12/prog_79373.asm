; DESCRIPTION: Creates a blue circular shape at (425, 156) with radius 79.
; PLAN: r0=425(x), r1=156(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 156
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
