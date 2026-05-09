; DESCRIPTION: Composite: Places a blue dot at position (410, 156) then Renders a orange disk with center (41, 158) and radius 41 then Renders a green line between points (314, 216) and (414, 199).
; PLAN: r0=410(x), r1=156(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=41(x), r6=158(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=314(x1), r11=216(y1), r12=414(x2), r13=199(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 156
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 41
LDI r6, 158
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 314
LDI r11, 216
LDI r12, 414
LDI r13, 199
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
