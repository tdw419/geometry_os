; DESCRIPTION: Creates a blue circular shape at (67, 115) with radius 22.
; PLAN: r0=67(x), r1=115(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 115
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
