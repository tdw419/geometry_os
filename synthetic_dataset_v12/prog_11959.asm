; DESCRIPTION: Draws a orange line from (125, 158) to (494, 203).
; PLAN: r0=125(x1), r1=158(y1), r2=494(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 158
LDI r2, 494
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
