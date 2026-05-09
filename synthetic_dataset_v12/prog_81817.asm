; DESCRIPTION: Composite: Creates a white rectangular region at (310, 168) spanning 45 by 87 pixels then Draws a red circle centered at (438, 66) with radius 65 then Sets a single orange pixel at (104, 116).
; PLAN: r0=310(x), r1=168(y), r2=45(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x), r6=66(y), r7=65(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x), r11=116(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 310
LDI r1, 168
LDI r2, 45
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 66
LDI r7, 65
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 116
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
