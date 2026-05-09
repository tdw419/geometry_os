; DESCRIPTION: Places a red line segment connecting (184, 151) to (129, 111).
; PLAN: r0=184(x1), r1=151(y1), r2=129(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 151
LDI r2, 129
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
