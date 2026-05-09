; DESCRIPTION: Places a red line segment connecting (124, 43) to (239, 111).
; PLAN: r0=124(x1), r1=43(y1), r2=239(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 43
LDI r2, 239
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
