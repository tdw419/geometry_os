; DESCRIPTION: Composite: Renders a orange line between points (259, 34) and (251, 233) then Sets a single blue pixel at (473, 159) then Creates a blue circular shape at (303, 36) with radius 19.
; PLAN: r0=259(x1), r1=34(y1), r2=251(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=473(x), r6=159(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=303(x), r11=36(y), r12=19(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 34
LDI r2, 251
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 159
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 303
LDI r11, 36
LDI r12, 19
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
