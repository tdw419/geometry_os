; DESCRIPTION: Creates a blue circular shape at (67, 69) with radius 45.
; PLAN: r0=67(x), r1=69(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 69
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
