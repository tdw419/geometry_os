; DESCRIPTION: Draws a blue circle centered at (198, 188) with radius 53.
; PLAN: r0=198(x), r1=188(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 188
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
