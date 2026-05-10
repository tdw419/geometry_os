; DESCRIPTION: Composite: Places a purple circle of radius 59 at center (451, 156) then Places a yellow line segment connecting (26, 28) to (24, 187) then Sets a single cyan pixel at (466, 26).
; PLAN: r0=451(x), r1=156(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x1), r6=28(y1), r7=24(x2), r8=187(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=466(x), r11=26(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 451
LDI r1, 156
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 28
LDI r7, 24
LDI r8, 187
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 26
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
