; DESCRIPTION: Draws a orange line from (84, 89) to (15, 176).
; PLAN: r0=84(x1), r1=89(y1), r2=15(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 89
LDI r2, 15
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
