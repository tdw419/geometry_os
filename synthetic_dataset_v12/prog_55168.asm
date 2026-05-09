; DESCRIPTION: Draws a magenta circle centered at (287, 76) with radius 38.
; PLAN: r0=287(x), r1=76(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 76
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
