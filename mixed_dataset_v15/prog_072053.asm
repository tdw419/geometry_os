; DESCRIPTION: Composite: Sets a single blue pixel at (395, 156) then Creates a white circular shape at (126, 123) with radius 18 then Draws a blue rectangle at (391, 71) with width 50 and height 59.
; PLAN: r0=395(x), r1=156(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=123(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=391(x), r11=71(y), r12=50(width), r13=59(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 156
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 126
LDI r6, 123
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 391
LDI r11, 71
LDI r12, 50
LDI r13, 59
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
