; DESCRIPTION: Draws a red line from (373, 122) to (302, 211).
; PLAN: r0=373(x1), r1=122(y1), r2=302(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 122
LDI r2, 302
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
