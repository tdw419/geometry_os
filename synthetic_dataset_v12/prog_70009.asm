; DESCRIPTION: Creates a black circular shape at (96, 109) with radius 69.
; PLAN: r0=96(x), r1=109(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 109
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
