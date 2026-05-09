; DESCRIPTION: Places a green line segment connecting (319, 113) to (462, 111).
; PLAN: r0=319(x1), r1=113(y1), r2=462(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 113
LDI r2, 462
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
