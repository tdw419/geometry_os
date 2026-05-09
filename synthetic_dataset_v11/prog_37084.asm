; DESCRIPTION: Draws a black circle centered at (67, 192) with radius 49.
; PLAN: r0=67(x), r1=192(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 192
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
