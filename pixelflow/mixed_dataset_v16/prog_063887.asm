; DESCRIPTION: Composite: Sets a single green pixel at (180, 48) then Creates a green rectangular region at (289, 49) spanning 45 by 108 pixels then Draws a orange circle centered at (148, 96) with radius 74.
; PLAN: r0=180(x), r1=48(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=49(y), r7=45(width), r8=108(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=148(x), r11=96(y), r12=74(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 180
LDI r1, 48
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 289
LDI r6, 49
LDI r7, 45
LDI r8, 108
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 96
LDI r12, 74
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
