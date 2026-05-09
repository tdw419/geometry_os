; DESCRIPTION: Draws a red line from (143, 110) to (355, 198).
; PLAN: r0=143(x1), r1=110(y1), r2=355(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 110
LDI r2, 355
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
