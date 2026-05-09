; DESCRIPTION: Draws a blue circle centered at (100, 198) with radius 25.
; PLAN: r0=100(x), r1=198(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 198
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
