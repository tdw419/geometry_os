; DESCRIPTION: Composite: Places a white 39x76 rectangle at position (453, 147) then Sets a single black pixel at (178, 50) then Creates a cyan circular shape at (165, 137) with radius 56.
; PLAN: r0=453(x), r1=147(y), r2=39(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=50(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=165(x), r11=137(y), r12=56(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 453
LDI r1, 147
LDI r2, 39
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 50
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 165
LDI r11, 137
LDI r12, 56
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
