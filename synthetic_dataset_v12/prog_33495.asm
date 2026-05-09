; DESCRIPTION: Places a black line segment connecting (258, 114) to (20, 41).
; PLAN: r0=258(x1), r1=114(y1), r2=20(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 114
LDI r2, 20
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
