; DESCRIPTION: Draws a orange line from (390, 236) to (11, 203).
; PLAN: r0=390(x1), r1=236(y1), r2=11(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 236
LDI r2, 11
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
