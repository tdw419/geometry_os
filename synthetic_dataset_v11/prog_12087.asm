; DESCRIPTION: Composite: . Then Renders a orange line between points (44, 218) and (61, 111). Then Sets a single blue pixel at (155, 97).
; PLAN: r0=44(x1), r1=218(y1), r2=61(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=155(x), r1=97(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (44, 218) and (61, 111).
; PLAN: r0=44(x1), r1=218(y1), r2=61(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 218
LDI r2, 61
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (155, 97).
; PLAN: r0=155(x), r1=97(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 97
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
