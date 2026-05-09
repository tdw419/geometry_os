; DESCRIPTION: Draws a red line from (312, 175) to (35, 111).
; PLAN: r0=312(x1), r1=175(y1), r2=35(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 175
LDI r2, 35
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
