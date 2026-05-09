; DESCRIPTION: Composite: Places a blue circle of radius 23 at center (155, 118) then Places a blue line segment connecting (363, 78) to (129, 85).
; PLAN: r0=155(x), r1=118(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x1), r6=78(y1), r7=129(x2), r8=85(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 155
LDI r1, 118
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 78
LDI r7, 129
LDI r8, 85
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
