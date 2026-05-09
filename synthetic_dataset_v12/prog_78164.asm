; DESCRIPTION: Places a purple line segment connecting (500, 155) to (41, 41).
; PLAN: r0=500(x1), r1=155(y1), r2=41(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 155
LDI r2, 41
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
