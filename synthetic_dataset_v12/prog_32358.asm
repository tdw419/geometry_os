; DESCRIPTION: Draws a yellow circle centered at (396, 169) with radius 56.
; PLAN: r0=396(x), r1=169(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 169
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
