; DESCRIPTION: Draws a blue circle centered at (112, 148) with radius 59.
; PLAN: r0=112(x), r1=148(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 148
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
