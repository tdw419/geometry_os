; DESCRIPTION: Places a purple line segment connecting (119, 200) to (91, 41).
; PLAN: r0=119(x1), r1=200(y1), r2=91(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 200
LDI r2, 91
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
