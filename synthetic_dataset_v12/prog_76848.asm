; DESCRIPTION: Creates a black circular shape at (304, 152) with radius 75.
; PLAN: r0=304(x), r1=152(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 152
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
