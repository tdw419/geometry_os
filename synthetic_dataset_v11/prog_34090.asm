; DESCRIPTION: Draws a blue circle centered at (85, 149) with radius 56.
; PLAN: r0=85(x), r1=149(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 149
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
