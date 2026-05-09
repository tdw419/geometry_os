; DESCRIPTION: Places a orange line segment connecting (349, 230) to (321, 111).
; PLAN: r0=349(x1), r1=230(y1), r2=321(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 230
LDI r2, 321
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
