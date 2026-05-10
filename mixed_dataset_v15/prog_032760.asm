; DESCRIPTION: Draws a blue circle centered at (313, 165) with radius 21.
; PLAN: r0=313(x), r1=165(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 165
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
