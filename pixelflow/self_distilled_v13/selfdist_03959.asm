; DESCRIPTION: Renders a orange line segment connecting (342, 34) to (374, 37).
; PLAN: r0=342(x1), r1=34(y1), r2=374(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 34
LDI r2, 374
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
