; DESCRIPTION: Composite: Sets a single orange pixel at (355, 151) then Creates a purple rectangular region at (328, 100) spanning 83 by 53 pixels then Creates a white circular shape at (325, 61) with radius 19.
; PLAN: r0=355(x), r1=151(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=100(y), r7=83(width), r8=53(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=325(x), r11=61(y), r12=19(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 355
LDI r1, 151
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 328
LDI r6, 100
LDI r7, 83
LDI r8, 53
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 61
LDI r12, 19
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
