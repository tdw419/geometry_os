; DESCRIPTION: Creates a blue circular shape at (88, 157) with radius 30.
; PLAN: r0=88(x), r1=157(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 157
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
