; DESCRIPTION: Draws a orange line from (241, 229) to (85, 155).
; PLAN: r0=241(x1), r1=229(y1), r2=85(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 229
LDI r2, 85
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
