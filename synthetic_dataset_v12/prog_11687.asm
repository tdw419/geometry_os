; DESCRIPTION: Draws a orange line from (318, 123) to (449, 158).
; PLAN: r0=318(x1), r1=123(y1), r2=449(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 123
LDI r2, 449
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
