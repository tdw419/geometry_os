; DESCRIPTION: Creates a green circular shape at (424, 154) with radius 75.
; PLAN: r0=424(x), r1=154(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 154
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
