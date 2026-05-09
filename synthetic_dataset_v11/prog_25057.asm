; DESCRIPTION: Draws a blue circle centered at (184, 149) with radius 70.
; PLAN: r0=184(x), r1=149(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 149
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
