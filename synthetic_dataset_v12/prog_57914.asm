; DESCRIPTION: Draws a magenta circle centered at (102, 198) with radius 40.
; PLAN: r0=102(x), r1=198(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 198
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
