; DESCRIPTION: Draws a blue circle centered at (117, 142) with radius 80.
; PLAN: r0=117(x), r1=142(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 142
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
