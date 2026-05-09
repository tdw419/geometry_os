; DESCRIPTION: Draws a magenta circle centered at (147, 114) with radius 24.
; PLAN: r0=147(x), r1=114(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 114
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
