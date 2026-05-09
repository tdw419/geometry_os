; DESCRIPTION: Draws a orange line from (174, 217) to (250, 203).
; PLAN: r0=174(x1), r1=217(y1), r2=250(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 217
LDI r2, 250
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
