; DESCRIPTION: Composite: Creates a black circular shape at (71, 105) with radius 22 then Draws a red rectangle at (95, 154) with width 75 and height 33 then Places a orange dot at position (270, 109).
; PLAN: r0=71(x), r1=105(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x), r6=154(y), r7=75(width), r8=33(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=270(x), r11=109(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 71
LDI r1, 105
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 154
LDI r7, 75
LDI r8, 33
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 109
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
