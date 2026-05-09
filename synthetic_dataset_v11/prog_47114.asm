; DESCRIPTION: Draws a purple circle centered at (67, 113) with radius 61.
; PLAN: r0=67(x), r1=113(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 113
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
