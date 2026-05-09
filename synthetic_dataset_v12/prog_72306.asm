; DESCRIPTION: Draws a yellow circle centered at (396, 163) with radius 78.
; PLAN: r0=396(x), r1=163(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 163
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
