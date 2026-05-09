; DESCRIPTION: Composite: Sets a single blue pixel at (9, 175) then Draws a black circle centered at (205, 173) with radius 33 then Creates a yellow rectangular region at (391, 25) spanning 98 by 91 pixels.
; PLAN: r0=9(x), r1=175(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=173(y), r7=33(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=391(x), r11=25(y), r12=98(width), r13=91(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 9
LDI r1, 175
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 205
LDI r6, 173
LDI r7, 33
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 391
LDI r11, 25
LDI r12, 98
LDI r13, 91
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
