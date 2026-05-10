; DESCRIPTION: Draws a purple circle centered at (306, 170) with radius 47.
; PLAN: r0=306(x), r1=170(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 170
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
