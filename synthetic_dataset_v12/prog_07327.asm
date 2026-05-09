; DESCRIPTION: Draws a blue circle centered at (210, 198) with radius 14.
; PLAN: r0=210(x), r1=198(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 198
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
