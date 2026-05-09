; DESCRIPTION: Draws a green circle centered at (67, 159) with radius 30.
; PLAN: r0=67(x), r1=159(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 159
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
