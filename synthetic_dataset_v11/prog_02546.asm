; DESCRIPTION: Draws a magenta circle centered at (94, 163) with radius 65.
; PLAN: r0=94(x), r1=163(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 163
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
