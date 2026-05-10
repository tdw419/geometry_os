; DESCRIPTION: Draws a orange line from (158, 132) to (325, 23).
; PLAN: r0=158(x1), r1=132(y1), r2=325(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 132
LDI r2, 325
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
