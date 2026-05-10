; DESCRIPTION: Draws a blue circle centered at (122, 135) with radius 43.
; PLAN: r0=122(x), r1=135(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 135
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
