; DESCRIPTION: Draws a purple circle centered at (87, 114) with radius 78.
; PLAN: r0=87(x), r1=114(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 114
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
