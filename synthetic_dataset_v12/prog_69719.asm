; DESCRIPTION: Places a purple line segment connecting (172, 29) to (373, 111).
; PLAN: r0=172(x1), r1=29(y1), r2=373(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 29
LDI r2, 373
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
