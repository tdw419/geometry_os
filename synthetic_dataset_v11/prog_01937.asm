; DESCRIPTION: Draws a yellow circle centered at (137, 141) with radius 55.
; PLAN: r0=137(x), r1=141(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 141
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
