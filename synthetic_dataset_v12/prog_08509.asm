; DESCRIPTION: Draws a red line from (10, 76) to (319, 169).
; PLAN: r0=10(x1), r1=76(y1), r2=319(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 76
LDI r2, 319
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
