; DESCRIPTION: Composite: Creates a white rectangular region at (385, 29) spanning 38 by 21 pixels then Places a purple dot at position (316, 237) then Creates a black circular shape at (206, 62) with radius 33.
; PLAN: r0=385(x), r1=29(y), r2=38(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x), r6=237(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=206(x), r11=62(y), r12=33(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 29
LDI r2, 38
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 237
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 206
LDI r11, 62
LDI r12, 33
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
