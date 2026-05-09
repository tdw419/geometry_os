; DESCRIPTION: Draws a magenta circle centered at (249, 174) with radius 71.
; PLAN: r0=249(x), r1=174(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 174
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
