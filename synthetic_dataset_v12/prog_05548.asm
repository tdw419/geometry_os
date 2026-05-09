; DESCRIPTION: Draws a blue circle centered at (424, 127) with radius 26.
; PLAN: r0=424(x), r1=127(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 127
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
