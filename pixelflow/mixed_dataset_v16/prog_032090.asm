; DESCRIPTION: Draws a yellow circle centered at (138, 169) with radius 35.
; PLAN: r0=138(x), r1=169(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 169
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
