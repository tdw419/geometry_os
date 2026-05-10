; DESCRIPTION: Draws a purple circle centered at (50, 149) with radius 54.
; PLAN: r0=50(x), r1=149(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 149
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
