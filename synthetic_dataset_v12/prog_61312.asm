; DESCRIPTION: Creates a green circular shape at (116, 75) with radius 28.
; PLAN: r0=116(x), r1=75(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 75
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
