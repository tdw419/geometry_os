; DESCRIPTION: Draws a blue circle centered at (166, 165) with radius 59.
; PLAN: r0=166(x), r1=165(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 165
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
