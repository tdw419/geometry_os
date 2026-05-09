; DESCRIPTION: Draws a red line from (287, 21) to (486, 201).
; PLAN: r0=287(x1), r1=21(y1), r2=486(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 21
LDI r2, 486
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
