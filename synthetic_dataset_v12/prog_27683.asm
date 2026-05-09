; DESCRIPTION: Draws a yellow circle centered at (91, 155) with radius 34.
; PLAN: r0=91(x), r1=155(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 155
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
