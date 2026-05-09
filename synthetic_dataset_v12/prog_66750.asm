; DESCRIPTION: Composite: Places a white 78x115 rectangle at position (96, 140) then Sets a single black pixel at (318, 64) then Creates a white circular shape at (468, 58) with radius 44.
; PLAN: r0=96(x), r1=140(y), r2=78(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=318(x), r6=64(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=468(x), r11=58(y), r12=44(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 96
LDI r1, 140
LDI r2, 78
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 64
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 468
LDI r11, 58
LDI r12, 44
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
