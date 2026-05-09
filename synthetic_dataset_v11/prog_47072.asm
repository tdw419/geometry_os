; DESCRIPTION: Creates a blue circular shape at (227, 217) with radius 21.
; PLAN: r0=227(x), r1=217(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 217
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
