; DESCRIPTION: Draws a blue circle centered at (186, 108) with radius 33.
; PLAN: r0=186(x), r1=108(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 108
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
