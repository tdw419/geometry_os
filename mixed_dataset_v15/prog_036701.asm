; DESCRIPTION: Draws a orange line from (454, 156) to (147, 236).
; PLAN: r0=454(x1), r1=156(y1), r2=147(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 156
LDI r2, 147
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
