; DESCRIPTION: Composite: Sets a single white pixel at (87, 58) then Renders a orange box of size 118x57 starting at (368, 52) then Draws a white circle centered at (314, 198) with radius 15.
; PLAN: r0=87(x), r1=58(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=368(x), r6=52(y), r7=118(width), r8=57(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=314(x), r11=198(y), r12=15(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 87
LDI r1, 58
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 368
LDI r6, 52
LDI r7, 118
LDI r8, 57
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 198
LDI r12, 15
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
