; DESCRIPTION: Renders a orange line between points (339, 252) and (374, 78).
; PLAN: r0=339(x1), r1=252(y1), r2=374(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 252
LDI r2, 374
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
