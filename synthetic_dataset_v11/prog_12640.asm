; DESCRIPTION: Renders a orange line between points (94, 190) and (161, 252).
; PLAN: r0=94(x1), r1=190(y1), r2=161(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 190
LDI r2, 161
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
