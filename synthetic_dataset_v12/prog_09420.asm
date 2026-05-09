; DESCRIPTION: Draws a blue circle centered at (384, 119) with radius 53.
; PLAN: r0=384(x), r1=119(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 119
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
