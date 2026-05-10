; DESCRIPTION: Composite: Creates a black rectangular region at (372, 9) spanning 39 by 32 pixels then Sets a single green pixel at (249, 141) then Creates a blue circular shape at (151, 222) with radius 33.
; PLAN: r0=372(x), r1=9(y), r2=39(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x), r6=141(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=151(x), r11=222(y), r12=33(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 372
LDI r1, 9
LDI r2, 39
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 141
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 151
LDI r11, 222
LDI r12, 33
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
