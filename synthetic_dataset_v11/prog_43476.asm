; DESCRIPTION: Renders a orange line between points (212, 49) and (80, 188).
; PLAN: r0=212(x1), r1=49(y1), r2=80(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 49
LDI r2, 80
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
