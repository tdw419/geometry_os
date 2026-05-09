; DESCRIPTION: Draws a green circle centered at (176, 181) with radius 67.
; PLAN: r0=176(x), r1=181(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 181
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
