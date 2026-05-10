; DESCRIPTION: Composite: Draws a orange circle centered at (378, 105) with radius 68 then Draws a yellow line from (98, 170) to (66, 130) then Sets a single purple pixel at (217, 96).
; PLAN: r0=378(x), r1=105(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x1), r6=170(y1), r7=66(x2), r8=130(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=217(x), r11=96(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 378
LDI r1, 105
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 170
LDI r7, 66
LDI r8, 130
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 217
LDI r11, 96
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
