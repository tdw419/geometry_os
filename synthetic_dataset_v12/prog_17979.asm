; DESCRIPTION: Draws a orange line from (246, 170) to (158, 50).
; PLAN: r0=246(x1), r1=170(y1), r2=158(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 170
LDI r2, 158
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
