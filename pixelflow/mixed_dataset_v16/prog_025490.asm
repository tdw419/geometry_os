; DESCRIPTION: Composite: Sets a single red pixel at (179, 211) then Creates a yellow circular shape at (309, 198) with radius 41 then Draws a red rectangle at (178, 88) with width 94 and height 110.
; PLAN: r0=179(x), r1=211(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=198(y), r7=41(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=178(x), r11=88(y), r12=94(width), r13=110(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 211
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 309
LDI r6, 198
LDI r7, 41
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 178
LDI r11, 88
LDI r12, 94
LDI r13, 110
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
