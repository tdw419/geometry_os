; DESCRIPTION: Draws a magenta circle centered at (306, 89) with radius 71.
; PLAN: r0=306(x), r1=89(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 89
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
