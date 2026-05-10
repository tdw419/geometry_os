; DESCRIPTION: Composite: Places a yellow circle of radius 41 at center (147, 174) then Sets a single yellow pixel at (173, 68) then Draws a magenta rectangle at (209, 69) with width 70 and height 119.
; PLAN: r0=147(x), r1=174(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=68(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=209(x), r11=69(y), r12=70(width), r13=119(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 174
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 68
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 209
LDI r11, 69
LDI r12, 70
LDI r13, 119
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
