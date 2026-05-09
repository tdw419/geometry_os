; DESCRIPTION: Places a purple line segment connecting (146, 81) to (100, 41).
; PLAN: r0=146(x1), r1=81(y1), r2=100(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 81
LDI r2, 100
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
