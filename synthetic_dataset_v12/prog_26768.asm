; DESCRIPTION: Draws a magenta circle centered at (367, 188) with radius 65.
; PLAN: r0=367(x), r1=188(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 188
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
