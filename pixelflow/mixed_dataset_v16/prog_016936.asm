; DESCRIPTION: Places a red line segment connecting (122, 41) to (245, 218).
; PLAN: r0=122(x1), r1=41(y1), r2=245(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 41
LDI r2, 245
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
