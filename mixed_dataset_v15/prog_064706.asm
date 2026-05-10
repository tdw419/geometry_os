; DESCRIPTION: Composite: Places a yellow line segment connecting (136, 172) to (252, 57) then Draws a orange circle centered at (279, 158) with radius 75 then Sets a single cyan pixel at (352, 231).
; PLAN: r0=136(x1), r1=172(y1), r2=252(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=158(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=352(x), r11=231(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 136
LDI r1, 172
LDI r2, 252
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 158
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 352
LDI r11, 231
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
