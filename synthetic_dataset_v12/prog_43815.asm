; DESCRIPTION: Draws a orange line from (221, 91) to (163, 80).
; PLAN: r0=221(x1), r1=91(y1), r2=163(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 91
LDI r2, 163
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
