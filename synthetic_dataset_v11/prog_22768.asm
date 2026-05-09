; DESCRIPTION: Creates a green circular shape at (152, 104) with radius 33.
; PLAN: r0=152(x), r1=104(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 104
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
