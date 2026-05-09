; DESCRIPTION: Places a yellow line segment connecting (227, 9) to (41, 10).
; PLAN: r0=227(x1), r1=9(y1), r2=41(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 9
LDI r2, 41
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
