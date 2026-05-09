; DESCRIPTION: Draws a magenta circle centered at (138, 174) with radius 45.
; PLAN: r0=138(x), r1=174(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 174
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
