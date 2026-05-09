; DESCRIPTION: Composite: Draws a orange circle centered at (283, 71) with radius 33 then Places a white line segment connecting (310, 104) to (8, 203) then Draws a green rectangle at (264, 95) with width 41 and height 49.
; PLAN: r0=283(x), r1=71(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x1), r6=104(y1), r7=8(x2), r8=203(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=264(x), r11=95(y), r12=41(width), r13=49(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 71
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 104
LDI r7, 8
LDI r8, 203
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 95
LDI r12, 41
LDI r13, 49
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
