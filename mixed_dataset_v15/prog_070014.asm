; DESCRIPTION: Draws a purple circle centered at (172, 150) with radius 25.
; PLAN: r0=172(x), r1=150(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 150
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
