; DESCRIPTION: Composite: Sets a single red pixel at (23, 101) then Creates a orange circular shape at (217, 89) with radius 72 then Draws a green rectangle at (209, 199) with width 19 and height 38.
; PLAN: r0=23(x), r1=101(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=89(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=209(x), r11=199(y), r12=19(width), r13=38(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 23
LDI r1, 101
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 217
LDI r6, 89
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 209
LDI r11, 199
LDI r12, 19
LDI r13, 38
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
