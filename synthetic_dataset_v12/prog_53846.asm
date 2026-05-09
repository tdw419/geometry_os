; DESCRIPTION: Draws a orange line from (162, 30) to (323, 89).
; PLAN: r0=162(x1), r1=30(y1), r2=323(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 30
LDI r2, 323
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
