; DESCRIPTION: Draws a blue circle centered at (53, 46) with radius 19.
; PLAN: r0=53(x), r1=46(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 46
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
