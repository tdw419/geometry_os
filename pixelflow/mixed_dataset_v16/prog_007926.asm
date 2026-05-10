; DESCRIPTION: Draws a blue circle centered at (63, 79) with radius 43.
; PLAN: r0=63(x), r1=79(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 79
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
