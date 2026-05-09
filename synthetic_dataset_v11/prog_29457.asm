; DESCRIPTION: Places a green line segment connecting (232, 54) to (109, 111).
; PLAN: r0=232(x1), r1=54(y1), r2=109(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 54
LDI r2, 109
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
