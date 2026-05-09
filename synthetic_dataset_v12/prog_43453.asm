; DESCRIPTION: Composite: Sets a single black pixel at (110, 201) then Renders a white box of size 104x86 starting at (211, 35) then Creates a white circular shape at (84, 122) with radius 58.
; PLAN: r0=110(x), r1=201(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=35(y), r7=104(width), r8=86(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=84(x), r11=122(y), r12=58(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 110
LDI r1, 201
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 211
LDI r6, 35
LDI r7, 104
LDI r8, 86
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 84
LDI r11, 122
LDI r12, 58
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
