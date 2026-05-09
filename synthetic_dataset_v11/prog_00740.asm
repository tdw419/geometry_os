; DESCRIPTION: Creates a white circular shape at (152, 18) with radius 13.
; PLAN: r0=152(x), r1=18(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 18
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
