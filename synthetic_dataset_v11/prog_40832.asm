; DESCRIPTION: Draws a orange line from (27, 133) to (147, 11).
; PLAN: r0=27(x1), r1=133(y1), r2=147(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 133
LDI r2, 147
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
