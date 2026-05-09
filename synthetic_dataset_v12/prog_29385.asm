; DESCRIPTION: Composite: Creates a white rectangular region at (351, 18) spanning 112 by 93 pixels then Sets a single cyan pixel at (115, 195) then Creates a white circular shape at (332, 77) with radius 20.
; PLAN: r0=351(x), r1=18(y), r2=112(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x), r6=195(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=332(x), r11=77(y), r12=20(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 351
LDI r1, 18
LDI r2, 112
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 195
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 332
LDI r11, 77
LDI r12, 20
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
