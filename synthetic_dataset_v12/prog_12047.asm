; DESCRIPTION: Creates a white circular shape at (290, 37) with radius 14.
; PLAN: r0=290(x), r1=37(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 37
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
