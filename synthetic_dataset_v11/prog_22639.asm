; DESCRIPTION: Creates a black circular shape at (158, 156) with radius 59.
; PLAN: r0=158(x), r1=156(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 156
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
