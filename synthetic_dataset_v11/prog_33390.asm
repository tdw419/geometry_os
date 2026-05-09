; DESCRIPTION: Places a white line segment connecting (62, 246) to (119, 111).
; PLAN: r0=62(x1), r1=246(y1), r2=119(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 246
LDI r2, 119
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
