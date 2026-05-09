; DESCRIPTION: Composite: Creates a cyan rectangular region at (239, 11) spanning 54 by 77 pixels then Creates a cyan circular shape at (407, 52) with radius 21 then Sets a single blue pixel at (476, 241).
; PLAN: r0=239(x), r1=11(y), r2=54(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x), r6=52(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=476(x), r11=241(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 239
LDI r1, 11
LDI r2, 54
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 52
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 476
LDI r11, 241
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
