; DESCRIPTION: Composite: Sets a single blue pixel at (201, 241) then Renders a yellow line between points (319, 25) and (76, 197) then Creates a purple circular shape at (179, 43) with radius 29.
; PLAN: r0=201(x), r1=241(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=319(x1), r6=25(y1), r7=76(x2), r8=197(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=179(x), r11=43(y), r12=29(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 201
LDI r1, 241
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 25
LDI r7, 76
LDI r8, 197
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 43
LDI r12, 29
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
