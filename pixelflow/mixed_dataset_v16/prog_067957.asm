; DESCRIPTION: Draws a orange line from (448, 46) to (252, 160).
; PLAN: r0=448(x1), r1=46(y1), r2=252(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 46
LDI r2, 252
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
