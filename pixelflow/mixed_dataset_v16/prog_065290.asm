; DESCRIPTION: Places a purple line segment connecting (69, 160) to (176, 111).
; PLAN: r0=69(x1), r1=160(y1), r2=176(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 160
LDI r2, 176
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
