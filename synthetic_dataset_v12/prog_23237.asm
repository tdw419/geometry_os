; DESCRIPTION: Draws a green circle centered at (67, 101) with radius 26.
; PLAN: r0=67(x), r1=101(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 101
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
