; DESCRIPTION: Draws a yellow circle centered at (184, 163) with radius 46.
; PLAN: r0=184(x), r1=163(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 163
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
