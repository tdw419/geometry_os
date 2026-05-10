; DESCRIPTION: Composite: Creates a orange rectangular region at (315, 41) spanning 87 by 110 pixels then Creates a magenta circular shape at (468, 80) with radius 31 then Places a white dot at position (316, 17).
; PLAN: r0=315(x), r1=41(y), r2=87(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x), r6=80(y), r7=31(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=316(x), r11=17(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 315
LDI r1, 41
LDI r2, 87
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 80
LDI r7, 31
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 316
LDI r11, 17
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
