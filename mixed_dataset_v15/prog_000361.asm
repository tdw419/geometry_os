; DESCRIPTION: Composite: Draws a green rectangle at (329, 109) with width 53 and height 31 then Sets a single black pixel at (482, 123) then Draws a green circle centered at (368, 46) with radius 35.
; PLAN: r0=329(x), r1=109(y), r2=53(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x), r6=123(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=368(x), r11=46(y), r12=35(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 329
LDI r1, 109
LDI r2, 53
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 123
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 368
LDI r11, 46
LDI r12, 35
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
