; DESCRIPTION: Composite: Sets a single blue pixel at (38, 207) then Draws a white circle centered at (491, 86) with radius 15 then Creates a purple rectangular region at (368, 22) spanning 11 by 40 pixels.
; PLAN: r0=38(x), r1=207(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=491(x), r6=86(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=368(x), r11=22(y), r12=11(width), r13=40(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 207
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 491
LDI r6, 86
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 368
LDI r11, 22
LDI r12, 11
LDI r13, 40
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
