; DESCRIPTION: Composite: . Then Draws a orange circle centered at (152, 145) with radius 60. Then Places a purple line segment connecting (216, 106) to (70, 35).
; PLAN: r0=152(x), r1=145(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=216(x1), r1=106(y1), r2=70(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (152, 145) with radius 60.
; PLAN: r0=152(x), r1=145(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 145
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple line segment connecting (216, 106) to (70, 35).
; PLAN: r0=216(x1), r1=106(y1), r2=70(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 106
LDI r2, 70
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
