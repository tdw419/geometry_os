; DESCRIPTION: Draws a orange line from (227, 63) to (63, 169).
; PLAN: r0=227(x1), r1=63(y1), r2=63(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 63
LDI r2, 63
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
