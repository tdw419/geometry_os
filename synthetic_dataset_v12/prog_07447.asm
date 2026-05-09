; DESCRIPTION: Places a purple line segment connecting (41, 210) to (57, 201).
; PLAN: r0=41(x1), r1=210(y1), r2=57(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 210
LDI r2, 57
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
