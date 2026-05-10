; DESCRIPTION: Draws a yellow circle centered at (462, 90) with radius 34.
; PLAN: r0=462(x), r1=90(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 462
LDI r1, 90
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
