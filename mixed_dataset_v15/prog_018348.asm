; DESCRIPTION: Draws a orange line from (174, 84) to (478, 85).
; PLAN: r0=174(x1), r1=84(y1), r2=478(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 84
LDI r2, 478
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
