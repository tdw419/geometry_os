; DESCRIPTION: Draws a orange line from (188, 199) to (164, 133).
; PLAN: r0=188(x1), r1=199(y1), r2=164(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 199
LDI r2, 164
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
