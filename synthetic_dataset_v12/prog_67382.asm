; DESCRIPTION: Draws a magenta circle centered at (74, 121) with radius 48.
; PLAN: r0=74(x), r1=121(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 121
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
