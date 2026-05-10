; DESCRIPTION: Draws a purple line from (30, 181) to (444, 111).
; PLAN: r0=30(x1), r1=181(y1), r2=444(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 181
LDI r2, 444
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
