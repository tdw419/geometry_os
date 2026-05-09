; DESCRIPTION: Draws a purple circle centered at (127, 39) with radius 22.
; PLAN: r0=127(x), r1=39(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 39
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
