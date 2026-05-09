; DESCRIPTION: Draws a yellow circle centered at (88, 206) with radius 36.
; PLAN: r0=88(x), r1=206(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 206
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
