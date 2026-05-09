; DESCRIPTION: Draws a magenta circle centered at (138, 31) with radius 29.
; PLAN: r0=138(x), r1=31(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 31
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
