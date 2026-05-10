; DESCRIPTION: Draws a magenta circle centered at (181, 134) with radius 77.
; PLAN: r0=181(x), r1=134(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 134
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
