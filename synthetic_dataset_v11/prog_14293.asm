; DESCRIPTION: Creates a black circular shape at (172, 81) with radius 72.
; PLAN: r0=172(x), r1=81(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 81
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
