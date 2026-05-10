; DESCRIPTION: Draws a orange line from (156, 97) to (117, 106).
; PLAN: r0=156(x1), r1=97(y1), r2=117(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 97
LDI r2, 117
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
