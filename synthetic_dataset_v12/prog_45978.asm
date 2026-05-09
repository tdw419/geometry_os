; DESCRIPTION: Draws a orange line from (432, 145) to (333, 106).
; PLAN: r0=432(x1), r1=145(y1), r2=333(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 145
LDI r2, 333
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
