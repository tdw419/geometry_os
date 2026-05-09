; DESCRIPTION: Draws a orange line from (468, 24) to (155, 21).
; PLAN: r0=468(x1), r1=24(y1), r2=155(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 24
LDI r2, 155
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
