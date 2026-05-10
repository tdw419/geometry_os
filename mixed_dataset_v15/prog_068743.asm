; DESCRIPTION: Composite: Sets a single orange pixel at (484, 49) then Creates a blue circular shape at (225, 221) with radius 22 then Creates a white rectangular region at (23, 218) spanning 62 by 28 pixels.
; PLAN: r0=484(x), r1=49(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=225(x), r6=221(y), r7=22(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=23(x), r11=218(y), r12=62(width), r13=28(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 49
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 225
LDI r6, 221
LDI r7, 22
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 23
LDI r11, 218
LDI r12, 62
LDI r13, 28
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
