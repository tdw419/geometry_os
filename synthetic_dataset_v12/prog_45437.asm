; DESCRIPTION: Composite: Draws a white rectangle at (97, 11) with width 71 and height 15 then Draws a yellow circle centered at (426, 118) with radius 79 then Sets a single green pixel at (359, 136).
; PLAN: r0=97(x), r1=11(y), r2=71(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=426(x), r6=118(y), r7=79(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=359(x), r11=136(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 97
LDI r1, 11
LDI r2, 71
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 118
LDI r7, 79
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 359
LDI r11, 136
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
