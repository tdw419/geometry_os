; DESCRIPTION: Places a red line segment connecting (223, 192) to (199, 111).
; PLAN: r0=223(x1), r1=192(y1), r2=199(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 192
LDI r2, 199
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
