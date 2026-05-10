; DESCRIPTION: Draws a purple circle centered at (296, 86) with radius 66.
; PLAN: r0=296(x), r1=86(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 86
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
