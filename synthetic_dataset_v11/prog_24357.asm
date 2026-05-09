; DESCRIPTION: Composite: . Then Draws a blue circle centered at (76, 217) with radius 29. Then Places a green line segment connecting (211, 127) to (105, 85).
; PLAN: r0=76(x), r1=217(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=211(x1), r1=127(y1), r2=105(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (76, 217) with radius 29.
; PLAN: r0=76(x), r1=217(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 217
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green line segment connecting (211, 127) to (105, 85).
; PLAN: r0=211(x1), r1=127(y1), r2=105(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 127
LDI r2, 105
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
