; DESCRIPTION: Draws a blue circle centered at (157, 150) with radius 53.
; PLAN: r0=157(x), r1=150(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 150
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
