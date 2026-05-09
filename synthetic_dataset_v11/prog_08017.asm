; DESCRIPTION: Draws a purple circle centered at (91, 159) with radius 74.
; PLAN: r0=91(x), r1=159(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 159
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
