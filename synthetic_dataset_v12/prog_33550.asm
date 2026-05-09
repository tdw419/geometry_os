; DESCRIPTION: Draws a orange line from (302, 22) to (419, 159).
; PLAN: r0=302(x1), r1=22(y1), r2=419(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 22
LDI r2, 419
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
