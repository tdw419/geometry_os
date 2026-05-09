; DESCRIPTION: Composite: . Then Renders a purple line between points (61, 131) and (26, 111). Then Places a white dot at position (129, 179).
; PLAN: r0=61(x1), r1=131(y1), r2=26(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=129(x), r1=179(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple line between points (61, 131) and (26, 111).
; PLAN: r0=61(x1), r1=131(y1), r2=26(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 131
LDI r2, 26
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (129, 179).
; PLAN: r0=129(x), r1=179(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 129
LDI r1, 179
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
