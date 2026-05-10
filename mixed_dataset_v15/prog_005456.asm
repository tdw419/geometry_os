; DESCRIPTION: Draws a red line from (236, 97) to (47, 58).
; PLAN: r0=236(x1), r1=97(y1), r2=47(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 97
LDI r2, 47
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
