; DESCRIPTION: Draws a magenta circle centered at (84, 171) with radius 63.
; PLAN: r0=84(x), r1=171(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 171
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
