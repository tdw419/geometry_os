; DESCRIPTION: Draws a purple circle centered at (282, 127) with radius 63.
; PLAN: r0=282(x), r1=127(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 127
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
