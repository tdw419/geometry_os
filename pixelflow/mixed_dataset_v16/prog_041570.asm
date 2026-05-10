; DESCRIPTION: Draws a white line from (81, 246) to (323, 138).
; PLAN: r0=81(x1), r1=246(y1), r2=323(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 246
LDI r2, 323
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
