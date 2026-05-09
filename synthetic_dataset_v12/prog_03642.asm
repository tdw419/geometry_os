; DESCRIPTION: Composite: Places a magenta line segment connecting (211, 144) to (427, 203) then Sets a single yellow pixel at (301, 245) then Places a white circle of radius 29 at center (255, 211).
; PLAN: r0=211(x1), r1=144(y1), r2=427(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=245(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=255(x), r11=211(y), r12=29(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 211
LDI r1, 144
LDI r2, 427
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 245
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 255
LDI r11, 211
LDI r12, 29
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
