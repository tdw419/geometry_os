; DESCRIPTION: Composite: Sets a single orange pixel at (15, 202) then Creates a yellow rectangular region at (235, 132) spanning 67 by 83 pixels then Draws a orange circle centered at (97, 86) with radius 36.
; PLAN: r0=15(x), r1=202(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=132(y), r7=67(width), r8=83(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=97(x), r11=86(y), r12=36(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 15
LDI r1, 202
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 235
LDI r6, 132
LDI r7, 67
LDI r8, 83
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 86
LDI r12, 36
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
