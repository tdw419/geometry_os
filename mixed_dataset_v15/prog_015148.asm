; DESCRIPTION: Draws a orange line from (110, 150) to (246, 133).
; PLAN: r0=110(x1), r1=150(y1), r2=246(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 150
LDI r2, 246
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
