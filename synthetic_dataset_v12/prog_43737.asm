; DESCRIPTION: Creates a black circular shape at (372, 109) with radius 75.
; PLAN: r0=372(x), r1=109(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 109
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
