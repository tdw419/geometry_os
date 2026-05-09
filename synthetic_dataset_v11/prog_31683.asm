; DESCRIPTION: Draws a orange line from (5, 119) to (91, 136).
; PLAN: r0=5(x1), r1=119(y1), r2=91(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 119
LDI r2, 91
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
