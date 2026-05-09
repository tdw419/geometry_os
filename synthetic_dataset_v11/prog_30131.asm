; DESCRIPTION: Creates a green circular shape at (165, 116) with radius 75.
; PLAN: r0=165(x), r1=116(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 116
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
