; DESCRIPTION: Draws a purple line from (157, 75) to (124, 111).
; PLAN: r0=157(x1), r1=75(y1), r2=124(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 75
LDI r2, 124
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
