; DESCRIPTION: Draws a magenta circle centered at (135, 167) with radius 12.
; PLAN: r0=135(x), r1=167(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 167
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
