; DESCRIPTION: Draws a red line from (203, 158) to (56, 153).
; PLAN: r0=203(x1), r1=158(y1), r2=56(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 158
LDI r2, 56
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
