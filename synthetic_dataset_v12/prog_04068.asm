; DESCRIPTION: Draws a red line from (58, 203) to (377, 216).
; PLAN: r0=58(x1), r1=203(y1), r2=377(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 203
LDI r2, 377
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
