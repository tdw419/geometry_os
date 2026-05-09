; DESCRIPTION: Draws a red line from (232, 203) to (156, 175).
; PLAN: r0=232(x1), r1=203(y1), r2=156(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 203
LDI r2, 156
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
