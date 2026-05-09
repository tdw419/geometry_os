; DESCRIPTION: Draws a red line from (55, 230) to (508, 0).
; PLAN: r0=55(x1), r1=230(y1), r2=508(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 230
LDI r2, 508
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
