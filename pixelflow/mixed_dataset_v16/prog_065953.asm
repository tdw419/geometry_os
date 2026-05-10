; DESCRIPTION: Draws a magenta circle centered at (3, 135) with radius 50.
; PLAN: r0=3(x), r1=135(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 3
LDI r1, 135
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
