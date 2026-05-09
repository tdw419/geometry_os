; DESCRIPTION: Composite: Creates a black circular shape at (201, 124) with radius 14 then Draws a orange rectangle at (123, 102) with width 46 and height 17 then Places a green dot at position (76, 224).
; PLAN: r0=201(x), r1=124(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=123(x), r6=102(y), r7=46(width), r8=17(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x), r11=224(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 201
LDI r1, 124
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 123
LDI r6, 102
LDI r7, 46
LDI r8, 17
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 224
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
