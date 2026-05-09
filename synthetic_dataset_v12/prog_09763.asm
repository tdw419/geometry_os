; DESCRIPTION: Composite: Sets a single orange pixel at (408, 23) then Creates a green rectangular region at (56, 95) spanning 119 by 62 pixels then Creates a yellow circular shape at (159, 109) with radius 49.
; PLAN: r0=408(x), r1=23(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=56(x), r6=95(y), r7=119(width), r8=62(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=159(x), r11=109(y), r12=49(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 408
LDI r1, 23
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 56
LDI r6, 95
LDI r7, 119
LDI r8, 62
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 109
LDI r12, 49
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
