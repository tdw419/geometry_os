; DESCRIPTION: Composite: Creates a black circular shape at (371, 83) with radius 66 then Creates a magenta rectangular region at (424, 102) spanning 34 by 95 pixels then Places a orange dot at position (490, 107).
; PLAN: r0=371(x), r1=83(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=424(x), r6=102(y), r7=34(width), r8=95(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=490(x), r11=107(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 371
LDI r1, 83
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 424
LDI r6, 102
LDI r7, 34
LDI r8, 95
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 490
LDI r11, 107
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
