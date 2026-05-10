; DESCRIPTION: Places a yellow line segment connecting (201, 41) to (165, 74).
; PLAN: r0=201(x1), r1=41(y1), r2=165(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 41
LDI r2, 165
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
