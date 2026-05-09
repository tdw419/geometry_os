; DESCRIPTION: Creates a blue circular shape at (119, 200) with radius 56.
; PLAN: r0=119(x), r1=200(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 200
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
