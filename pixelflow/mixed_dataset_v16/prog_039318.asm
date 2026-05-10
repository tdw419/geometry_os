; DESCRIPTION: Creates a black circular shape at (246, 61) with radius 56.
; PLAN: r0=246(x), r1=61(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 61
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
