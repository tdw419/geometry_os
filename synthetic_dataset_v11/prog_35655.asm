; DESCRIPTION: Draws a orange line from (133, 231) to (211, 245).
; PLAN: r0=133(x1), r1=231(y1), r2=211(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 231
LDI r2, 211
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
