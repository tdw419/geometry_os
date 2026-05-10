; DESCRIPTION: Draws a yellow circle centered at (233, 90) with radius 69.
; PLAN: r0=233(x), r1=90(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 90
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
