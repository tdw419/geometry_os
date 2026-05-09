; DESCRIPTION: Composite: Creates a orange circular shape at (188, 40) with radius 20 then Creates a orange rectangular region at (347, 237) spanning 104 by 11 pixels then Places a blue dot at position (85, 132).
; PLAN: r0=188(x), r1=40(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x), r6=237(y), r7=104(width), r8=11(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=85(x), r11=132(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 188
LDI r1, 40
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 237
LDI r7, 104
LDI r8, 11
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 132
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
