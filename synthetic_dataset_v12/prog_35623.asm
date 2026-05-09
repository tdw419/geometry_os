; DESCRIPTION: Creates a green circular shape at (412, 110) with radius 14.
; PLAN: r0=412(x), r1=110(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 110
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
