; DESCRIPTION: Composite: Renders a purple disk with center (376, 170) and radius 71 then Renders a orange line between points (29, 56) and (303, 236).
; PLAN: r0=376(x), r1=170(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x1), r6=56(y1), r7=303(x2), r8=236(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 170
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 56
LDI r7, 303
LDI r8, 236
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
