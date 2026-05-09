; DESCRIPTION: Composite: Creates a black circular shape at (342, 68) with radius 53 then Creates a purple rectangular region at (494, 13) spanning 11 by 92 pixels then Sets a single blue pixel at (376, 142).
; PLAN: r0=342(x), r1=68(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x), r6=13(y), r7=11(width), r8=92(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=376(x), r11=142(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 342
LDI r1, 68
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 13
LDI r7, 11
LDI r8, 92
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 376
LDI r11, 142
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
