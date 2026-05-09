; DESCRIPTION: Composite: . Then Renders a purple line between points (132, 119) and (49, 44). Then Draws a black circle centered at (62, 172) with radius 19.
; PLAN: r0=132(x1), r1=119(y1), r2=49(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=62(x), r1=172(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (132, 119) and (49, 44).
; PLAN: r0=132(x1), r1=119(y1), r2=49(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 119
LDI r2, 49
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (62, 172) with radius 19.
; PLAN: r0=62(x), r1=172(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 172
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
