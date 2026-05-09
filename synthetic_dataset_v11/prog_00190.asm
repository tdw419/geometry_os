; DESCRIPTION: Draws a black circle centered at (113, 185) with radius 63.
; PLAN: r0=113(x), r1=185(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 185
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
