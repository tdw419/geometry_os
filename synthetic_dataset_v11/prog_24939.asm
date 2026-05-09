; DESCRIPTION: Creates a black circular shape at (145, 109) with radius 76.
; PLAN: r0=145(x), r1=109(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 109
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
