; DESCRIPTION: Composite: Creates a yellow rectangular region at (203, 104) spanning 31 by 100 pixels then Places a orange dot at position (391, 85) then Creates a blue circular shape at (128, 111) with radius 37.
; PLAN: r0=203(x), r1=104(y), r2=31(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=85(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=128(x), r11=111(y), r12=37(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 203
LDI r1, 104
LDI r2, 31
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 85
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 128
LDI r11, 111
LDI r12, 37
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
