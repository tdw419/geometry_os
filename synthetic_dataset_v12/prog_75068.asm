; DESCRIPTION: Composite: Draws a magenta rectangle at (192, 100) with width 97 and height 18 then Draws a green circle centered at (451, 104) with radius 20 then Sets a single cyan pixel at (29, 155).
; PLAN: r0=192(x), r1=100(y), r2=97(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=451(x), r6=104(y), r7=20(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=29(x), r11=155(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 192
LDI r1, 100
LDI r2, 97
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 104
LDI r7, 20
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 29
LDI r11, 155
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
