; DESCRIPTION: Draws a orange line from (149, 115) to (140, 158).
; PLAN: r0=149(x1), r1=115(y1), r2=140(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 115
LDI r2, 140
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
