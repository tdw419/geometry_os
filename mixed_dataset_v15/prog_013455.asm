; DESCRIPTION: Draws a yellow circle centered at (58, 188) with radius 25.
; PLAN: r0=58(x), r1=188(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 188
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
