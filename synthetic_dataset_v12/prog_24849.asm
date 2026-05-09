; DESCRIPTION: Draws a red line from (505, 110) to (497, 111).
; PLAN: r0=505(x1), r1=110(y1), r2=497(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 110
LDI r2, 497
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
