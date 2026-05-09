; DESCRIPTION: Draws a purple circle centered at (159, 186) with radius 70.
; PLAN: r0=159(x), r1=186(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 186
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
