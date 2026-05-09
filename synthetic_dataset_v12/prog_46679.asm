; DESCRIPTION: Draws a purple circle centered at (229, 108) with radius 70.
; PLAN: r0=229(x), r1=108(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 108
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
