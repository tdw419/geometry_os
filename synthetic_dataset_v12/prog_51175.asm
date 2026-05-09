; DESCRIPTION: Draws a magenta circle centered at (366, 135) with radius 65.
; PLAN: r0=366(x), r1=135(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 135
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
