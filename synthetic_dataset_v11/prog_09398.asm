; DESCRIPTION: Places a black line segment connecting (47, 217) to (208, 41).
; PLAN: r0=47(x1), r1=217(y1), r2=208(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 217
LDI r2, 208
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
