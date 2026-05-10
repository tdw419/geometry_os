; DESCRIPTION: Composite: Creates a black rectangular region at (432, 94) spanning 77 by 114 pixels then Draws a black circle centered at (118, 86) with radius 31 then Sets a single green pixel at (47, 172).
; PLAN: r0=432(x), r1=94(y), r2=77(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=86(y), r7=31(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=47(x), r11=172(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 432
LDI r1, 94
LDI r2, 77
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 86
LDI r7, 31
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 47
LDI r11, 172
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
