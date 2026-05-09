; DESCRIPTION: Draws a magenta circle centered at (369, 195) with radius 52.
; PLAN: r0=369(x), r1=195(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 195
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
