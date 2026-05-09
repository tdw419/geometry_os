; DESCRIPTION: Draws a purple circle centered at (189, 113) with radius 67.
; PLAN: r0=189(x), r1=113(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 113
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
