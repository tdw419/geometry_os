; DESCRIPTION: Draws a blue circle centered at (161, 174) with radius 53.
; PLAN: r0=161(x), r1=174(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 174
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
