; DESCRIPTION: Draws a magenta circle centered at (315, 140) with radius 46.
; PLAN: r0=315(x), r1=140(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 140
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
