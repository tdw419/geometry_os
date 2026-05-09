; DESCRIPTION: Creates a blue circular shape at (339, 109) with radius 67.
; PLAN: r0=339(x), r1=109(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 109
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
