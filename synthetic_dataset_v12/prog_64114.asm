; DESCRIPTION: Composite: Places a red line segment connecting (411, 255) to (222, 88) then Sets a single red pixel at (382, 6) then Renders a cyan disk with center (390, 147) and radius 53.
; PLAN: r0=411(x1), r1=255(y1), r2=222(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=6(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=390(x), r11=147(y), r12=53(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 411
LDI r1, 255
LDI r2, 222
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 6
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 390
LDI r11, 147
LDI r12, 53
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
