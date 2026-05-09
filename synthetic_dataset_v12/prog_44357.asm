; DESCRIPTION: Draws a magenta circle centered at (421, 147) with radius 56.
; PLAN: r0=421(x), r1=147(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 147
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
