; DESCRIPTION: Draws a magenta circle centered at (389, 121) with radius 28.
; PLAN: r0=389(x), r1=121(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 121
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
