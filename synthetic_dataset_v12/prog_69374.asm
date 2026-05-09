; DESCRIPTION: Draws a magenta circle centered at (413, 199) with radius 29.
; PLAN: r0=413(x), r1=199(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 199
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
