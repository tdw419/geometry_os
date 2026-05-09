; DESCRIPTION: Composite: Places a white dot at position (338, 246) then Draws a black circle centered at (183, 141) with radius 75 then Draws a red rectangle at (415, 203) with width 56 and height 10.
; PLAN: r0=338(x), r1=246(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=141(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=415(x), r11=203(y), r12=56(width), r13=10(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 246
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 183
LDI r6, 141
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 415
LDI r11, 203
LDI r12, 56
LDI r13, 10
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
