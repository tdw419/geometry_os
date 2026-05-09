; DESCRIPTION: Draws a red line from (59, 236) to (501, 147).
; PLAN: r0=59(x1), r1=236(y1), r2=501(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 236
LDI r2, 501
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
