; DESCRIPTION: Draws a orange line from (55, 67) to (147, 149).
; PLAN: r0=55(x1), r1=67(y1), r2=147(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 67
LDI r2, 147
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
