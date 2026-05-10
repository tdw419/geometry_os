; DESCRIPTION: Draws a orange line from (155, 14) to (177, 205).
; PLAN: r0=155(x1), r1=14(y1), r2=177(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 14
LDI r2, 177
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
