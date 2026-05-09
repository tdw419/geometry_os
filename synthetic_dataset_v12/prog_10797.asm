; DESCRIPTION: Draws a red line from (318, 141) to (231, 105).
; PLAN: r0=318(x1), r1=141(y1), r2=231(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 141
LDI r2, 231
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
