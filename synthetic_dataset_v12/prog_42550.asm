; DESCRIPTION: Composite: Draws a white rectangle at (119, 28) with width 15 and height 99 then Creates a yellow circular shape at (241, 224) with radius 28 then Places a orange dot at position (221, 21).
; PLAN: r0=119(x), r1=28(y), r2=15(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x), r6=224(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=221(x), r11=21(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 119
LDI r1, 28
LDI r2, 15
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 224
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 221
LDI r11, 21
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
