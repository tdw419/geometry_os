; DESCRIPTION: Draws a orange line from (163, 227) to (117, 216).
; PLAN: r0=163(x1), r1=227(y1), r2=117(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 227
LDI r2, 117
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
