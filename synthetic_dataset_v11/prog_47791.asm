; DESCRIPTION: Places a red line segment connecting (244, 41) to (222, 62).
; PLAN: r0=244(x1), r1=41(y1), r2=222(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 41
LDI r2, 222
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
