; DESCRIPTION: Draws a orange line from (501, 145) to (229, 24).
; PLAN: r0=501(x1), r1=145(y1), r2=229(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 145
LDI r2, 229
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
