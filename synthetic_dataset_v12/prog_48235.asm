; DESCRIPTION: Composite: Draws a white circle centered at (356, 157) with radius 19 then Places a green line segment connecting (426, 232) to (379, 14) then Draws a red rectangle at (283, 85) with width 28 and height 116.
; PLAN: r0=356(x), r1=157(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x1), r6=232(y1), r7=379(x2), r8=14(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=283(x), r11=85(y), r12=28(width), r13=116(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 157
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 232
LDI r7, 379
LDI r8, 14
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 283
LDI r11, 85
LDI r12, 28
LDI r13, 116
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
