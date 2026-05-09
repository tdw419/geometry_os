; DESCRIPTION: Draws a black line from (312, 11) to (200, 111).
; PLAN: r0=312(x1), r1=11(y1), r2=200(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 11
LDI r2, 200
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
