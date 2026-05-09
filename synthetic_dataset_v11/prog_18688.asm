; DESCRIPTION: Creates a black circular shape at (116, 116) with radius 30.
; PLAN: r0=116(x), r1=116(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 116
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
