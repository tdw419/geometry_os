; DESCRIPTION: Draws a magenta circle centered at (184, 171) with radius 20.
; PLAN: r0=184(x), r1=171(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 171
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
