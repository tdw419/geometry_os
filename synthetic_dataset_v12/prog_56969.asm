; DESCRIPTION: Draws a purple circle centered at (65, 133) with radius 43.
; PLAN: r0=65(x), r1=133(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 133
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
