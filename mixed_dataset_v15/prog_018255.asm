; DESCRIPTION: Composite: Places a green circle of radius 51 at center (457, 65) then Places a purple line segment connecting (311, 239) to (324, 119) then Sets a single cyan pixel at (170, 133).
; PLAN: r0=457(x), r1=65(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x1), r6=239(y1), r7=324(x2), r8=119(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=170(x), r11=133(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 457
LDI r1, 65
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 239
LDI r7, 324
LDI r8, 119
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 133
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
