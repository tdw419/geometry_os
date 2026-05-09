; DESCRIPTION: Draws a orange line from (205, 190) to (109, 35).
; PLAN: r0=205(x1), r1=190(y1), r2=109(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 190
LDI r2, 109
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
