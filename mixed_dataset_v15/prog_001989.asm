; DESCRIPTION: Composite: Draws a black rectangle at (276, 102) with width 110 and height 57 then Sets a single green pixel at (353, 215) then Draws a cyan circle centered at (438, 225) with radius 31.
; PLAN: r0=276(x), r1=102(y), r2=110(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x), r6=215(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=438(x), r11=225(y), r12=31(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 276
LDI r1, 102
LDI r2, 110
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 215
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 438
LDI r11, 225
LDI r12, 31
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
