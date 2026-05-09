; DESCRIPTION: Draws a red line from (163, 123) to (207, 102).
; PLAN: r0=163(x1), r1=123(y1), r2=207(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 123
LDI r2, 207
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
