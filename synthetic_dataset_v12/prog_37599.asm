; DESCRIPTION: Draws a purple line from (119, 108) to (73, 111).
; PLAN: r0=119(x1), r1=108(y1), r2=73(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 108
LDI r2, 73
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
