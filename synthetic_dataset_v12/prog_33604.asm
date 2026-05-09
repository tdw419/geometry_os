; DESCRIPTION: Composite: Draws a blue circle centered at (292, 137) with radius 78 then Draws a purple line from (334, 129) to (486, 192) then Sets a single black pixel at (200, 183).
; PLAN: r0=292(x), r1=137(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x1), r6=129(y1), r7=486(x2), r8=192(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=200(x), r11=183(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 292
LDI r1, 137
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 129
LDI r7, 486
LDI r8, 192
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 183
LDI r12, 0x000000
PSET r10, r11, r12
HALT
