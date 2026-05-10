; DESCRIPTION: Composite: Creates a orange rectangular region at (119, 141) spanning 104 by 21 pixels then Renders a yellow disk with center (381, 152) and radius 18 then Sets a single black pixel at (139, 236).
; PLAN: r0=119(x), r1=141(y), r2=104(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=152(y), r7=18(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=139(x), r11=236(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 119
LDI r1, 141
LDI r2, 104
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 152
LDI r7, 18
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 139
LDI r11, 236
LDI r12, 0x000000
PSET r10, r11, r12
HALT
