; DESCRIPTION: Draws a orange line from (147, 142) to (272, 92).
; PLAN: r0=147(x1), r1=142(y1), r2=272(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 142
LDI r2, 272
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
