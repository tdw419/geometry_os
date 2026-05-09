; DESCRIPTION: Creates a blue circular shape at (123, 101) with radius 67.
; PLAN: r0=123(x), r1=101(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 101
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
