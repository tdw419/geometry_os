; DESCRIPTION: Composite: Places a black dot at position (314, 89) then Places a green line segment connecting (411, 182) to (2, 132) then Renders a yellow disk with center (97, 192) and radius 12.
; PLAN: r0=314(x), r1=89(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=411(x1), r6=182(y1), r7=2(x2), r8=132(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=97(x), r11=192(y), r12=12(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 314
LDI r1, 89
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 411
LDI r6, 182
LDI r7, 2
LDI r8, 132
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 192
LDI r12, 12
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
