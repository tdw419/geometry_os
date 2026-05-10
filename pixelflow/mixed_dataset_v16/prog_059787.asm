; DESCRIPTION: Composite: Places a yellow line segment connecting (281, 234) to (114, 172) then Creates a black rectangular region at (391, 108) spanning 93 by 105 pixels then Sets a single red pixel at (343, 209).
; PLAN: r0=281(x1), r1=234(y1), r2=114(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=108(y), r7=93(width), r8=105(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x), r11=209(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 281
LDI r1, 234
LDI r2, 114
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 108
LDI r7, 93
LDI r8, 105
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 209
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
