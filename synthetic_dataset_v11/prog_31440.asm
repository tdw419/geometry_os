; DESCRIPTION: Draws a yellow circle centered at (136, 99) with radius 73.
; PLAN: r0=136(x), r1=99(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 99
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
