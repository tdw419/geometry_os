; DESCRIPTION: Composite: Draws a white circle centered at (490, 40) with radius 17 then Sets a single cyan pixel at (332, 249) then Draws a green rectangle at (78, 71) with width 90 and height 113.
; PLAN: r0=490(x), r1=40(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x), r6=249(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=78(x), r11=71(y), r12=90(width), r13=113(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 40
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 249
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 78
LDI r11, 71
LDI r12, 90
LDI r13, 113
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
