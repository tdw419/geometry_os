; DESCRIPTION: Places a black line segment connecting (162, 255) to (227, 111).
; PLAN: r0=162(x1), r1=255(y1), r2=227(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 255
LDI r2, 227
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
