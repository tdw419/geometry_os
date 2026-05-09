; DESCRIPTION: Composite: Creates a orange circular shape at (212, 101) with radius 67 then Draws a white rectangle at (357, 73) with width 119 and height 23 then Sets a single black pixel at (236, 6).
; PLAN: r0=212(x), r1=101(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=73(y), r7=119(width), r8=23(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=236(x), r11=6(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 212
LDI r1, 101
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 73
LDI r7, 119
LDI r8, 23
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 236
LDI r11, 6
LDI r12, 0x000000
PSET r10, r11, r12
HALT
