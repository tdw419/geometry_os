; DESCRIPTION: Creates a blue circular shape at (421, 109) with radius 22.
; PLAN: r0=421(x), r1=109(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 109
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
