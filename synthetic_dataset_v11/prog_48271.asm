; DESCRIPTION: Draws a yellow circle centered at (111, 136) with radius 70.
; PLAN: r0=111(x), r1=136(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 136
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
