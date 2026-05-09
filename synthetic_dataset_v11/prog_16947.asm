; DESCRIPTION: Draws a orange line from (78, 155) to (236, 222).
; PLAN: r0=78(x1), r1=155(y1), r2=236(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 155
LDI r2, 236
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
