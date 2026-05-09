; DESCRIPTION: Draws a red line from (379, 4) to (97, 153).
; PLAN: r0=379(x1), r1=4(y1), r2=97(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 4
LDI r2, 97
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
