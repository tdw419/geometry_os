; DESCRIPTION: Creates a yellow circular shape at (98, 110) with radius 67.
; PLAN: r0=98(x), r1=110(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 110
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
