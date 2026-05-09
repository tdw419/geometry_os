; DESCRIPTION: Draws a orange line from (81, 88) to (250, 155).
; PLAN: r0=81(x1), r1=88(y1), r2=250(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 88
LDI r2, 250
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
