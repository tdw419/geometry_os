; DESCRIPTION: Places a blue line segment connecting (458, 160) to (15, 111).
; PLAN: r0=458(x1), r1=160(y1), r2=15(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 160
LDI r2, 15
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
