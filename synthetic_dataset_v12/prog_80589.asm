; DESCRIPTION: Creates a green circular shape at (152, 118) with radius 73.
; PLAN: r0=152(x), r1=118(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 118
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
