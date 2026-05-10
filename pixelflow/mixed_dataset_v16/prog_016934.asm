; DESCRIPTION: Composite: Sets a single purple pixel at (462, 44) then Creates a black rectangular region at (348, 43) spanning 71 by 45 pixels then Creates a black circular shape at (434, 123) with radius 12.
; PLAN: r0=462(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=348(x), r6=43(y), r7=71(width), r8=45(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=434(x), r11=123(y), r12=12(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 462
LDI r1, 44
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 348
LDI r6, 43
LDI r7, 71
LDI r8, 45
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 123
LDI r12, 12
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
