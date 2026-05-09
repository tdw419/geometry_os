; DESCRIPTION: Composite: Places a purple circle of radius 29 at center (51, 87) then Renders a purple line between points (363, 149) and (54, 93).
; PLAN: r0=51(x), r1=87(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x1), r6=149(y1), r7=54(x2), r8=93(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 87
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 149
LDI r7, 54
LDI r8, 93
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
