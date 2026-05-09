; DESCRIPTION: Draws a blue circle centered at (113, 62) with radius 40.
; PLAN: r0=113(x), r1=62(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 62
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
