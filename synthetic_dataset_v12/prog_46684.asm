; DESCRIPTION: Draws a red line from (353, 137) to (77, 232).
; PLAN: r0=353(x1), r1=137(y1), r2=77(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 137
LDI r2, 77
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
