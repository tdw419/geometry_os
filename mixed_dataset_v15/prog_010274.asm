; DESCRIPTION: Composite: Places a orange circle of radius 21 at center (195, 78) then Places a purple line segment connecting (416, 182) to (473, 84) then Sets a single blue pixel at (215, 177).
; PLAN: r0=195(x), r1=78(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x1), r6=182(y1), r7=473(x2), r8=84(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=215(x), r11=177(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 195
LDI r1, 78
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 182
LDI r7, 473
LDI r8, 84
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 177
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
