; DESCRIPTION: Places a red line segment connecting (78, 84) to (54, 232).
; PLAN: r0=78(x1), r1=84(y1), r2=54(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 84
LDI r2, 54
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
