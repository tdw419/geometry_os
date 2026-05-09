; DESCRIPTION: Composite: Places a cyan line segment connecting (368, 80) to (185, 119) then Places a green circle of radius 68 at center (149, 150) then Sets a single white pixel at (318, 199).
; PLAN: r0=368(x1), r1=80(y1), r2=185(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=150(y), r7=68(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=318(x), r11=199(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 368
LDI r1, 80
LDI r2, 185
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 150
LDI r7, 68
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 318
LDI r11, 199
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
