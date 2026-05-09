; DESCRIPTION: Composite: Creates a white circular shape at (351, 114) with radius 78 then Sets a single purple pixel at (16, 113) then Creates a blue rectangular region at (39, 2) spanning 97 by 97 pixels.
; PLAN: r0=351(x), r1=114(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=16(x), r6=113(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=39(x), r11=2(y), r12=97(width), r13=97(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 114
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 16
LDI r6, 113
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 39
LDI r11, 2
LDI r12, 97
LDI r13, 97
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
