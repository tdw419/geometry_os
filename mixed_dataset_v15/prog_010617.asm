; DESCRIPTION: Draws a magenta circle centered at (367, 169) with radius 75.
; PLAN: r0=367(x), r1=169(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 169
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
