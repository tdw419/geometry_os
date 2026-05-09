; DESCRIPTION: Draws a magenta circle centered at (137, 111) with radius 62.
; PLAN: r0=137(x), r1=111(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 111
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
