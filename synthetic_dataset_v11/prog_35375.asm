; DESCRIPTION: Renders a purple line between points (5, 246) and (13, 111).
; PLAN: r0=5(x1), r1=246(y1), r2=13(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 246
LDI r2, 13
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
