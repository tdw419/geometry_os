; DESCRIPTION: Draws a magenta circle centered at (241, 132) with radius 43.
; PLAN: r0=241(x), r1=132(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 132
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
