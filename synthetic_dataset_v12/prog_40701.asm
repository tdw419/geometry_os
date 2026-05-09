; DESCRIPTION: Draws a red line from (457, 203) to (37, 249).
; PLAN: r0=457(x1), r1=203(y1), r2=37(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 203
LDI r2, 37
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
