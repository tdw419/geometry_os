; DESCRIPTION: Composite: Creates a green rectangular region at (332, 206) spanning 66 by 19 pixels then Draws a white circle centered at (417, 147) with radius 53 then Sets a single cyan pixel at (140, 126).
; PLAN: r0=332(x), r1=206(y), r2=66(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=417(x), r6=147(y), r7=53(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=140(x), r11=126(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 332
LDI r1, 206
LDI r2, 66
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 147
LDI r7, 53
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 140
LDI r11, 126
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
