; DESCRIPTION: Creates a blue circular shape at (370, 227) with radius 22.
; PLAN: r0=370(x), r1=227(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 227
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
