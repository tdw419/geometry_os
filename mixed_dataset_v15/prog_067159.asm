; DESCRIPTION: Composite: Places a purple line segment connecting (66, 237) to (123, 43) then Creates a orange rectangular region at (423, 89) spanning 57 by 18 pixels then Sets a single cyan pixel at (208, 211).
; PLAN: r0=66(x1), r1=237(y1), r2=123(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=89(y), r7=57(width), r8=18(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x), r11=211(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 66
LDI r1, 237
LDI r2, 123
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 89
LDI r7, 57
LDI r8, 18
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 211
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
