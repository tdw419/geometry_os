; DESCRIPTION: Places a green line segment connecting (363, 176) to (156, 159).
; PLAN: r0=363(x1), r1=176(y1), r2=156(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 176
LDI r2, 156
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
