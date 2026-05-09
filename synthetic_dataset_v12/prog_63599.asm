; DESCRIPTION: Draws a red line from (341, 177) to (315, 203).
; PLAN: r0=341(x1), r1=177(y1), r2=315(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 177
LDI r2, 315
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
