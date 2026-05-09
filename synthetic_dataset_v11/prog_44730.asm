; DESCRIPTION: Places a yellow line segment connecting (136, 41) to (201, 162).
; PLAN: r0=136(x1), r1=41(y1), r2=201(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 41
LDI r2, 201
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
