; DESCRIPTION: Draws a magenta circle centered at (199, 153) with radius 18.
; PLAN: r0=199(x), r1=153(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 153
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
