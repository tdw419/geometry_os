; DESCRIPTION: Composite: Draws a red circle centered at (263, 134) with radius 41 then Sets a single purple pixel at (225, 248) then Draws a blue rectangle at (203, 72) with width 116 and height 109.
; PLAN: r0=263(x), r1=134(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=248(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=203(x), r11=72(y), r12=116(width), r13=109(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 134
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 248
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 203
LDI r11, 72
LDI r12, 116
LDI r13, 109
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
