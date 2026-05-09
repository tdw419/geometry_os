; DESCRIPTION: Creates a blue circular shape at (201, 90) with radius 64.
; PLAN: r0=201(x), r1=90(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 90
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
