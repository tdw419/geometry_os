; DESCRIPTION: Composite: Creates a purple circular shape at (289, 136) with radius 40 then Places a blue line segment connecting (192, 234) to (47, 101) then Sets a single red pixel at (186, 95).
; PLAN: r0=289(x), r1=136(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x1), r6=234(y1), r7=47(x2), r8=101(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=186(x), r11=95(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 136
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 234
LDI r7, 47
LDI r8, 101
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 186
LDI r11, 95
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
