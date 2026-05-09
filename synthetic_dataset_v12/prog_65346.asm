; DESCRIPTION: Draws a red line from (379, 11) to (322, 188).
; PLAN: r0=379(x1), r1=11(y1), r2=322(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 11
LDI r2, 322
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
