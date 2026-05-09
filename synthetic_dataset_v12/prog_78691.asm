; DESCRIPTION: Draws a orange line from (110, 158) to (319, 155).
; PLAN: r0=110(x1), r1=158(y1), r2=319(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 158
LDI r2, 319
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
