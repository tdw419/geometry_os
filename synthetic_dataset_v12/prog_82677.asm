; DESCRIPTION: Places a purple line segment connecting (115, 47) to (41, 145).
; PLAN: r0=115(x1), r1=47(y1), r2=41(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 47
LDI r2, 41
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
