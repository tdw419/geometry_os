; DESCRIPTION: Draws a blue circle centered at (145, 195) with radius 30.
; PLAN: r0=145(x), r1=195(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 195
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
