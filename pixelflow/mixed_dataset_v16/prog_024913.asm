; DESCRIPTION: Draws a yellow circle centered at (287, 165) with radius 73.
; PLAN: r0=287(x), r1=165(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 165
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
