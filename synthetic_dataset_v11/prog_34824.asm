; DESCRIPTION: Places a yellow line segment connecting (41, 104) to (32, 34).
; PLAN: r0=41(x1), r1=104(y1), r2=32(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 104
LDI r2, 32
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
