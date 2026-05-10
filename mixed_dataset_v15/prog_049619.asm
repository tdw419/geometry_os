; DESCRIPTION: Draws a red line from (276, 190) to (355, 206).
; PLAN: r0=276(x1), r1=190(y1), r2=355(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 190
LDI r2, 355
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
