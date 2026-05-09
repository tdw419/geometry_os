; DESCRIPTION: Places a green line segment connecting (246, 163) to (238, 111).
; PLAN: r0=246(x1), r1=163(y1), r2=238(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 163
LDI r2, 238
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
