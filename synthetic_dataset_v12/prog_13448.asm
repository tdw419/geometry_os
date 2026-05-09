; DESCRIPTION: Creates a blue circular shape at (402, 124) with radius 64.
; PLAN: r0=402(x), r1=124(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 124
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
