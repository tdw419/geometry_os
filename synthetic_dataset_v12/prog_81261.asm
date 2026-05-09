; DESCRIPTION: Composite: Places a orange line segment connecting (105, 70) to (427, 37) then Sets a single green pixel at (365, 202) then Creates a green rectangular region at (319, 156) spanning 36 by 90 pixels.
; PLAN: r0=105(x1), r1=70(y1), r2=427(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=202(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=319(x), r11=156(y), r12=36(width), r13=90(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 70
LDI r2, 427
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 202
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 319
LDI r11, 156
LDI r12, 36
LDI r13, 90
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
