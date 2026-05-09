; DESCRIPTION: Composite: Draws a orange line from (425, 14) to (105, 245) then Creates a white rectangular region at (99, 155) spanning 101 by 97 pixels then Sets a single green pixel at (222, 51).
; PLAN: r0=425(x1), r1=14(y1), r2=105(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=99(x), r6=155(y), r7=101(width), r8=97(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=222(x), r11=51(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 425
LDI r1, 14
LDI r2, 105
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 155
LDI r7, 101
LDI r8, 97
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 51
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
