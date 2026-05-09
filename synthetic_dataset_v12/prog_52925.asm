; DESCRIPTION: Creates a black circular shape at (332, 153) with radius 57.
; PLAN: r0=332(x), r1=153(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 153
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
