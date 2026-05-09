; DESCRIPTION: Composite: Creates a cyan circular shape at (351, 159) with radius 35 then Creates a cyan rectangular region at (264, 147) spanning 54 by 54 pixels then Sets a single green pixel at (325, 4).
; PLAN: r0=351(x), r1=159(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=264(x), r6=147(y), r7=54(width), r8=54(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=325(x), r11=4(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 351
LDI r1, 159
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 264
LDI r6, 147
LDI r7, 54
LDI r8, 54
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 4
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
