; DESCRIPTION: Places a black line segment connecting (23, 22) to (463, 41).
; PLAN: r0=23(x1), r1=22(y1), r2=463(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 22
LDI r2, 463
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
