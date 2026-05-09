; DESCRIPTION: Draws a magenta circle centered at (451, 186) with radius 19.
; PLAN: r0=451(x), r1=186(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 186
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
