; DESCRIPTION: Draws a white line from (155, 133) to (246, 7).
; PLAN: r0=155(x1), r1=133(y1), r2=246(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 133
LDI r2, 246
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
