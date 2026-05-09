; DESCRIPTION: Creates a black circular shape at (158, 128) with radius 79.
; PLAN: r0=158(x), r1=128(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 128
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
