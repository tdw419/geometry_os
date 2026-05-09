; DESCRIPTION: Composite: Sets a single black pixel at (286, 48) then Creates a black circular shape at (179, 170) with radius 46 then Creates a yellow rectangular region at (258, 32) spanning 46 by 117 pixels.
; PLAN: r0=286(x), r1=48(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=179(x), r6=170(y), r7=46(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=258(x), r11=32(y), r12=46(width), r13=117(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 286
LDI r1, 48
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 179
LDI r6, 170
LDI r7, 46
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 258
LDI r11, 32
LDI r12, 46
LDI r13, 117
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
