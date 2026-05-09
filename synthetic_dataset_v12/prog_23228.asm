; DESCRIPTION: Composite: Draws a orange circle centered at (376, 109) with radius 50 then Creates a black rectangular region at (211, 34) spanning 72 by 118 pixels then Sets a single cyan pixel at (181, 88).
; PLAN: r0=376(x), r1=109(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=34(y), r7=72(width), r8=118(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=181(x), r11=88(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 109
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 34
LDI r7, 72
LDI r8, 118
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 181
LDI r11, 88
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
