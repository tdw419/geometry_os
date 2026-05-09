; DESCRIPTION: Creates a black circular shape at (181, 87) with radius 40.
; PLAN: r0=181(x), r1=87(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 87
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
