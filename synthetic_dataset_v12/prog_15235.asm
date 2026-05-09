; DESCRIPTION: Creates a black circular shape at (105, 82) with radius 72.
; PLAN: r0=105(x), r1=82(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 82
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
