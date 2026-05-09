; DESCRIPTION: Draws a red line from (163, 205) to (222, 206).
; PLAN: r0=163(x1), r1=205(y1), r2=222(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 205
LDI r2, 222
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
