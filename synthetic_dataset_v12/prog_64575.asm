; DESCRIPTION: Places a black line segment connecting (304, 117) to (97, 111).
; PLAN: r0=304(x1), r1=117(y1), r2=97(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 117
LDI r2, 97
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
