; DESCRIPTION: Draws a magenta circle centered at (147, 72) with radius 53.
; PLAN: r0=147(x), r1=72(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 72
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
