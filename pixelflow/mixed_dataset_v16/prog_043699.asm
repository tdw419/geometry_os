; DESCRIPTION: Draws a blue line from (203, 85) to (276, 194).
; PLAN: r0=203(x1), r1=85(y1), r2=276(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 85
LDI r2, 276
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
