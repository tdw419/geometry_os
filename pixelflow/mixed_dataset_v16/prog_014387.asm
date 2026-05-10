; DESCRIPTION: Composite: Renders a red line between points (303, 58) and (62, 158) then Sets a single purple pixel at (26, 157).
; PLAN: r0=303(x1), r1=58(y1), r2=62(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=26(x), r6=157(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 303
LDI r1, 58
LDI r2, 62
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 157
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
