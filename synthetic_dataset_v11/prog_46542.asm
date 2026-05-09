; DESCRIPTION: Renders a orange line between points (205, 190) and (188, 30).
; PLAN: r0=205(x1), r1=190(y1), r2=188(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 190
LDI r2, 188
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
