; DESCRIPTION: Composite: Places a black 74x17 rectangle at position (222, 234) then Draws a purple circle centered at (56, 158) with radius 11 then Sets a single black pixel at (203, 143).
; PLAN: r0=222(x), r1=234(y), r2=74(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=158(y), r7=11(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=203(x), r11=143(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 222
LDI r1, 234
LDI r2, 74
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 158
LDI r7, 11
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 203
LDI r11, 143
LDI r12, 0x000000
PSET r10, r11, r12
HALT
