; DESCRIPTION: Composite: Places a orange dot at position (195, 175) then Creates a black rectangular region at (291, 30) spanning 110 by 36 pixels then Places a yellow circle of radius 12 at center (236, 97).
; PLAN: r0=195(x), r1=175(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=30(y), r7=110(width), r8=36(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=236(x), r11=97(y), r12=12(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 195
LDI r1, 175
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 291
LDI r6, 30
LDI r7, 110
LDI r8, 36
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 236
LDI r11, 97
LDI r12, 12
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
