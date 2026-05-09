; DESCRIPTION: Composite: Places a purple circle of radius 27 at center (318, 173) then Renders a red line between points (34, 203) and (258, 163).
; PLAN: r0=318(x), r1=173(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x1), r6=203(y1), r7=258(x2), r8=163(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 173
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 203
LDI r7, 258
LDI r8, 163
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
