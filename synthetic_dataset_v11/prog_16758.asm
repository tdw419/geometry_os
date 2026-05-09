; DESCRIPTION: Draws a orange line from (233, 163) to (155, 90).
; PLAN: r0=233(x1), r1=163(y1), r2=155(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 163
LDI r2, 155
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
