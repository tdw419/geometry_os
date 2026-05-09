; DESCRIPTION: Draws a red line from (212, 133) to (378, 243).
; PLAN: r0=212(x1), r1=133(y1), r2=378(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 133
LDI r2, 378
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
