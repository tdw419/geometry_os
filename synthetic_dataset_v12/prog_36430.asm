; DESCRIPTION: Composite: Sets a single yellow pixel at (222, 221) then Creates a green circular shape at (278, 148) with radius 62 then Draws a orange rectangle at (359, 76) with width 79 and height 94.
; PLAN: r0=222(x), r1=221(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=148(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=359(x), r11=76(y), r12=79(width), r13=94(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 221
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 278
LDI r6, 148
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 359
LDI r11, 76
LDI r12, 79
LDI r13, 94
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
