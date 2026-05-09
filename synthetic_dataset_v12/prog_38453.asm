; DESCRIPTION: Draws a magenta circle centered at (276, 113) with radius 76.
; PLAN: r0=276(x), r1=113(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 113
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
