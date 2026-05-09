; DESCRIPTION: Draws a purple line from (212, 203) to (59, 95).
; PLAN: r0=212(x1), r1=203(y1), r2=59(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 203
LDI r2, 59
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
