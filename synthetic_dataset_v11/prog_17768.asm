; DESCRIPTION: Draws a orange line from (94, 89) to (20, 127).
; PLAN: r0=94(x1), r1=89(y1), r2=20(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 89
LDI r2, 20
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
