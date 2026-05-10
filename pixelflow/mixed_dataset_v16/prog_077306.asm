; DESCRIPTION: Composite: Creates a cyan circular shape at (415, 176) with radius 62 then Draws a blue rectangle at (31, 9) with width 100 and height 113 then Sets a single blue pixel at (318, 197).
; PLAN: r0=415(x), r1=176(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x), r6=9(y), r7=100(width), r8=113(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=318(x), r11=197(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 415
LDI r1, 176
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 9
LDI r7, 100
LDI r8, 113
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 318
LDI r11, 197
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
