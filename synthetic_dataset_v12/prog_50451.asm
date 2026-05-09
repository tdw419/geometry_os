; DESCRIPTION: Composite: Sets a single purple pixel at (423, 158) then Draws a orange line from (363, 54) to (305, 172) then Renders a white disk with center (285, 201) and radius 47.
; PLAN: r0=423(x), r1=158(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=363(x1), r6=54(y1), r7=305(x2), r8=172(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=285(x), r11=201(y), r12=47(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 423
LDI r1, 158
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 363
LDI r6, 54
LDI r7, 305
LDI r8, 172
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 201
LDI r12, 47
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
