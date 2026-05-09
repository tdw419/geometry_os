; DESCRIPTION: Composite: . Then Draws a green circle centered at (159, 136) with radius 66. Then Places a purple line segment connecting (244, 92) to (84, 29).
; PLAN: r0=159(x), r1=136(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=244(x1), r1=92(y1), r2=84(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (159, 136) with radius 66.
; PLAN: r0=159(x), r1=136(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 136
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple line segment connecting (244, 92) to (84, 29).
; PLAN: r0=244(x1), r1=92(y1), r2=84(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 92
LDI r2, 84
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
