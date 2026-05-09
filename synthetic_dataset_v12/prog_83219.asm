; DESCRIPTION: Places a red line segment connecting (332, 17) to (142, 41).
; PLAN: r0=332(x1), r1=17(y1), r2=142(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 17
LDI r2, 142
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
