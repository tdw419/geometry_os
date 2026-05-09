; DESCRIPTION: Composite: Draws a purple rectangle at (430, 110) with width 81 and height 54 then Places a green line segment connecting (334, 99) to (115, 24) then Sets a single cyan pixel at (508, 156).
; PLAN: r0=430(x), r1=110(y), r2=81(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=334(x1), r6=99(y1), r7=115(x2), r8=24(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=508(x), r11=156(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 430
LDI r1, 110
LDI r2, 81
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 99
LDI r7, 115
LDI r8, 24
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 508
LDI r11, 156
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
