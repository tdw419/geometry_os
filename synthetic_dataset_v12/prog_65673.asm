; DESCRIPTION: Composite: Draws a white circle centered at (255, 55) with radius 41 then Places a orange line segment connecting (121, 107) to (483, 250) then Draws a purple rectangle at (78, 64) with width 56 and height 27.
; PLAN: r0=255(x), r1=55(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x1), r6=107(y1), r7=483(x2), r8=250(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=78(x), r11=64(y), r12=56(width), r13=27(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 55
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 107
LDI r7, 483
LDI r8, 250
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 78
LDI r11, 64
LDI r12, 56
LDI r13, 27
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
