; DESCRIPTION: Draws a magenta circle centered at (199, 163) with radius 72.
; PLAN: r0=199(x), r1=163(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 163
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
