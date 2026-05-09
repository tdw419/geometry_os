; DESCRIPTION: Draws a red line from (7, 11) to (89, 102).
; PLAN: r0=7(x1), r1=11(y1), r2=89(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 11
LDI r2, 89
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
