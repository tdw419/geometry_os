; DESCRIPTION: Creates a black circular shape at (88, 81) with radius 25.
; PLAN: r0=88(x), r1=81(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 81
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
