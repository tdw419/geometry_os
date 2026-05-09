; DESCRIPTION: Composite: Places a yellow 70x66 rectangle at position (364, 157) then Sets a single black pixel at (171, 11) then Draws a red circle centered at (466, 154) with radius 15.
; PLAN: r0=364(x), r1=157(y), r2=70(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x), r6=11(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=466(x), r11=154(y), r12=15(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 364
LDI r1, 157
LDI r2, 70
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 11
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 466
LDI r11, 154
LDI r12, 15
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
