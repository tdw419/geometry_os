; DESCRIPTION: Composite: Draws a white rectangle at (170, 91) with width 109 and height 67 then Places a purple dot at position (332, 176) then Creates a magenta circular shape at (235, 65) with radius 12.
; PLAN: r0=170(x), r1=91(y), r2=109(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x), r6=176(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=235(x), r11=65(y), r12=12(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 170
LDI r1, 91
LDI r2, 109
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 176
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 235
LDI r11, 65
LDI r12, 12
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
