; DESCRIPTION: Draws a purple line from (142, 76) to (5, 111).
; PLAN: r0=142(x1), r1=76(y1), r2=5(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 76
LDI r2, 5
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
