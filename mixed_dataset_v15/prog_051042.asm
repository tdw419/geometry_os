; DESCRIPTION: Draws a magenta circle centered at (303, 169) with radius 65.
; PLAN: r0=303(x), r1=169(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 169
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
