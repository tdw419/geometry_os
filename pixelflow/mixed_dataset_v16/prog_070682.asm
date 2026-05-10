; DESCRIPTION: Draws a purple circle centered at (430, 50) with radius 35.
; PLAN: r0=430(x), r1=50(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 50
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
