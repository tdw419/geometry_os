; DESCRIPTION: Draws a orange line from (93, 188) to (438, 127).
; PLAN: r0=93(x1), r1=188(y1), r2=438(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 188
LDI r2, 438
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
