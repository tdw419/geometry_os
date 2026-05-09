; DESCRIPTION: Composite: Renders a yellow disk with center (166, 118) and radius 38 then Renders a white line between points (366, 207) and (126, 17).
; PLAN: r0=166(x), r1=118(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=366(x1), r6=207(y1), r7=126(x2), r8=17(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 166
LDI r1, 118
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 366
LDI r6, 207
LDI r7, 126
LDI r8, 17
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
