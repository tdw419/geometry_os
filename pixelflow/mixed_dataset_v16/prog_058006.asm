; DESCRIPTION: Composite: Draws a purple rectangle at (281, 173) with width 116 and height 65 then Places a black dot at position (507, 58) then Draws a purple circle centered at (235, 69) with radius 62.
; PLAN: r0=281(x), r1=173(y), r2=116(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=507(x), r6=58(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=235(x), r11=69(y), r12=62(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 281
LDI r1, 173
LDI r2, 116
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 58
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 235
LDI r11, 69
LDI r12, 62
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
