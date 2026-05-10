; DESCRIPTION: Composite: Sets a single purple pixel at (207, 40) then Creates a white rectangular region at (438, 100) spanning 19 by 83 pixels then Creates a orange circular shape at (467, 175) with radius 36.
; PLAN: r0=207(x), r1=40(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=438(x), r6=100(y), r7=19(width), r8=83(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=467(x), r11=175(y), r12=36(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 207
LDI r1, 40
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 438
LDI r6, 100
LDI r7, 19
LDI r8, 83
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 467
LDI r11, 175
LDI r12, 36
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
