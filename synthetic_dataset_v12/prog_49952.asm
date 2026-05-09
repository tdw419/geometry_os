; DESCRIPTION: Draws a orange line from (185, 202) to (109, 98).
; PLAN: r0=185(x1), r1=202(y1), r2=109(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 202
LDI r2, 109
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
