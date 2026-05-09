; DESCRIPTION: Draws a orange line from (246, 158) to (244, 159).
; PLAN: r0=246(x1), r1=158(y1), r2=244(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 158
LDI r2, 244
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
