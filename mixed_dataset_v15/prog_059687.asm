; DESCRIPTION: Creates a green circular shape at (101, 67) with radius 15.
; PLAN: r0=101(x), r1=67(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 67
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
