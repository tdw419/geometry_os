; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (78, 160) with radius 70. Then Places a purple line segment connecting (63, 183) to (35, 163).
; PLAN: r0=78(x), r1=160(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=63(x1), r1=183(y1), r2=35(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (78, 160) with radius 70.
; PLAN: r0=78(x), r1=160(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 160
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple line segment connecting (63, 183) to (35, 163).
; PLAN: r0=63(x1), r1=183(y1), r2=35(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 183
LDI r2, 35
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
