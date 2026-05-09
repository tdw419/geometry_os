; DESCRIPTION: Composite: Sets a single blue pixel at (151, 3) then Draws a purple circle centered at (178, 181) with radius 57 then Creates a purple rectangular region at (204, 224) spanning 12 by 26 pixels.
; PLAN: r0=151(x), r1=3(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=178(x), r6=181(y), r7=57(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=204(x), r11=224(y), r12=12(width), r13=26(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 151
LDI r1, 3
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 178
LDI r6, 181
LDI r7, 57
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 204
LDI r11, 224
LDI r12, 12
LDI r13, 26
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
