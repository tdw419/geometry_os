; DESCRIPTION: Draws a magenta circle centered at (212, 169) with radius 19.
; PLAN: r0=212(x), r1=169(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 169
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
