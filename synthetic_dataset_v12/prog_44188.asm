; DESCRIPTION: Draws a red line from (351, 76) to (508, 15).
; PLAN: r0=351(x1), r1=76(y1), r2=508(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 76
LDI r2, 508
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
