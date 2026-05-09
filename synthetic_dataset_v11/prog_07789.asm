; DESCRIPTION: Places a black line segment connecting (41, 129) to (200, 9).
; PLAN: r0=41(x1), r1=129(y1), r2=200(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 129
LDI r2, 200
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
