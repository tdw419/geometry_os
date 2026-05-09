; DESCRIPTION: Draws a orange line from (161, 252) to (71, 145).
; PLAN: r0=161(x1), r1=252(y1), r2=71(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 252
LDI r2, 71
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
