; DESCRIPTION: Composite: Creates a yellow rectangular region at (210, 174) spanning 116 by 72 pixels then Draws a orange circle centered at (199, 125) with radius 61 then Sets a single orange pixel at (289, 183).
; PLAN: r0=210(x), r1=174(y), r2=116(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=125(y), r7=61(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=289(x), r11=183(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 210
LDI r1, 174
LDI r2, 116
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 125
LDI r7, 61
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 289
LDI r11, 183
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
