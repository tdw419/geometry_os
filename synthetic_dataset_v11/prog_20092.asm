; DESCRIPTION: Creates a green circular shape at (116, 138) with radius 18.
; PLAN: r0=116(x), r1=138(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 138
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
