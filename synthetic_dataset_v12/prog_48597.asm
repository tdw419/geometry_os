; DESCRIPTION: Draws a orange line from (505, 81) to (211, 203).
; PLAN: r0=505(x1), r1=81(y1), r2=211(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 81
LDI r2, 211
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
