; DESCRIPTION: Composite: Draws a black circle centered at (173, 175) with radius 20 then Sets a single blue pixel at (122, 226) then Draws a green rectangle at (335, 42) with width 118 and height 70.
; PLAN: r0=173(x), r1=175(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=226(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=335(x), r11=42(y), r12=118(width), r13=70(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 175
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 226
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 335
LDI r11, 42
LDI r12, 118
LDI r13, 70
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
