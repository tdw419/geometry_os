; DESCRIPTION: Composite: . Then Draws a blue line from (78, 46) to (4, 67). Then Draws a purple circle centered at (160, 88) with radius 70.
; PLAN: r0=78(x1), r1=46(y1), r2=4(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=160(x), r1=88(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue line from (78, 46) to (4, 67).
; PLAN: r0=78(x1), r1=46(y1), r2=4(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 46
LDI r2, 4
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (160, 88) with radius 70.
; PLAN: r0=160(x), r1=88(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 88
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
