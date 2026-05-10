; DESCRIPTION: Draws a purple circle centered at (245, 149) with radius 25.
; PLAN: r0=245(x), r1=149(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 149
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
