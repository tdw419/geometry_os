; DESCRIPTION: Draws a magenta circle centered at (98, 163) with radius 52.
; PLAN: r0=98(x), r1=163(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 163
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
