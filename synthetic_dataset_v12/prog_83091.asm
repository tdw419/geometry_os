; DESCRIPTION: Composite: Sets a single blue pixel at (389, 12) then Places a yellow line segment connecting (306, 119) to (350, 71) then Creates a red circular shape at (297, 198) with radius 38.
; PLAN: r0=389(x), r1=12(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=306(x1), r6=119(y1), r7=350(x2), r8=71(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=297(x), r11=198(y), r12=38(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 389
LDI r1, 12
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 306
LDI r6, 119
LDI r7, 350
LDI r8, 71
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 198
LDI r12, 38
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
