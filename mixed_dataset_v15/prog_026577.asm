; DESCRIPTION: Composite: Creates a yellow rectangular region at (375, 98) spanning 48 by 45 pixels then Creates a black circular shape at (65, 201) with radius 15 then Sets a single orange pixel at (234, 202).
; PLAN: r0=375(x), r1=98(y), r2=48(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x), r6=201(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=234(x), r11=202(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 375
LDI r1, 98
LDI r2, 48
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 201
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 234
LDI r11, 202
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
