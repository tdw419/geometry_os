; DESCRIPTION: Draws a magenta circle centered at (184, 162) with radius 50.
; PLAN: r0=184(x), r1=162(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 162
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
