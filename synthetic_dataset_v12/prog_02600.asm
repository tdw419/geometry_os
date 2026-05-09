; DESCRIPTION: Composite: Places a orange circle of radius 52 at center (88, 185) then Draws a yellow rectangle at (117, 95) with width 52 and height 21 then Sets a single black pixel at (482, 81).
; PLAN: r0=88(x), r1=185(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x), r6=95(y), r7=52(width), r8=21(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=482(x), r11=81(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 88
LDI r1, 185
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 95
LDI r7, 52
LDI r8, 21
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 482
LDI r11, 81
LDI r12, 0x000000
PSET r10, r11, r12
HALT
