; DESCRIPTION: Draws a magenta circle centered at (212, 112) with radius 36.
; PLAN: r0=212(x), r1=112(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 112
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
