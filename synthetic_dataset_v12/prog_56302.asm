; DESCRIPTION: Composite: Renders a orange disk with center (278, 170) and radius 70 then Renders a green line between points (396, 92) and (357, 36).
; PLAN: r0=278(x), r1=170(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x1), r6=92(y1), r7=357(x2), r8=36(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 170
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 92
LDI r7, 357
LDI r8, 36
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
