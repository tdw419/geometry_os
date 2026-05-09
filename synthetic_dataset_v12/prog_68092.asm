; DESCRIPTION: Composite: Places a red circle of radius 72 at center (145, 74) then Renders a red line between points (144, 126) and (170, 140).
; PLAN: r0=145(x), r1=74(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x1), r6=126(y1), r7=170(x2), r8=140(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 74
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 126
LDI r7, 170
LDI r8, 140
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
