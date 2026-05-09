; DESCRIPTION: Draws a magenta circle centered at (76, 150) with radius 55.
; PLAN: r0=76(x), r1=150(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 150
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
