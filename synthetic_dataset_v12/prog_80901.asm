; DESCRIPTION: Draws a magenta circle centered at (285, 163) with radius 46.
; PLAN: r0=285(x), r1=163(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 163
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
