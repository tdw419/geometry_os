; DESCRIPTION: Draws a red line from (40, 26) to (282, 155).
; PLAN: r0=40(x1), r1=26(y1), r2=282(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 26
LDI r2, 282
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
