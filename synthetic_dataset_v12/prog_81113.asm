; DESCRIPTION: Draws a magenta circle centered at (177, 148) with radius 79.
; PLAN: r0=177(x), r1=148(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 148
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
