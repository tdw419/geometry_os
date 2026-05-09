; DESCRIPTION: Places a green line segment connecting (120, 75) to (159, 111).
; PLAN: r0=120(x1), r1=75(y1), r2=159(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 75
LDI r2, 159
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
