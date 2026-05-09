; DESCRIPTION: Composite: Draws a cyan rectangle at (424, 21) with width 76 and height 72 then Places a purple dot at position (43, 102) then Draws a blue circle centered at (459, 45) with radius 11.
; PLAN: r0=424(x), r1=21(y), r2=76(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=43(x), r6=102(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=459(x), r11=45(y), r12=11(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 424
LDI r1, 21
LDI r2, 76
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 102
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 459
LDI r11, 45
LDI r12, 11
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
