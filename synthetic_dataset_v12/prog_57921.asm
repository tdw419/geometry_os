; DESCRIPTION: Creates a blue circular shape at (290, 83) with radius 11.
; PLAN: r0=290(x), r1=83(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 83
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
