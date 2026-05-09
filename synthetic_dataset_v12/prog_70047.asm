; DESCRIPTION: Composite: Places a green circle of radius 62 at center (163, 104) then Places a blue line segment connecting (498, 156) to (484, 129) then Sets a single black pixel at (226, 95).
; PLAN: r0=163(x), r1=104(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=498(x1), r6=156(y1), r7=484(x2), r8=129(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=226(x), r11=95(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 163
LDI r1, 104
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 498
LDI r6, 156
LDI r7, 484
LDI r8, 129
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 95
LDI r12, 0x000000
PSET r10, r11, r12
HALT
