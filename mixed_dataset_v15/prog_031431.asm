; DESCRIPTION: Places a red line segment connecting (250, 41) to (347, 153).
; PLAN: r0=250(x1), r1=41(y1), r2=347(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 41
LDI r2, 347
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
