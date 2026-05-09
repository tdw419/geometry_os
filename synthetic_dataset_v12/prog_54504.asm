; DESCRIPTION: Draws a red line from (9, 119) to (378, 218).
; PLAN: r0=9(x1), r1=119(y1), r2=378(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 119
LDI r2, 378
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
