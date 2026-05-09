; DESCRIPTION: Draws a orange line from (414, 193) to (250, 198).
; PLAN: r0=414(x1), r1=193(y1), r2=250(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 193
LDI r2, 250
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
