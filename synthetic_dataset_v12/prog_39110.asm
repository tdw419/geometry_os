; DESCRIPTION: Composite: Places a yellow circle of radius 55 at center (248, 122) then Sets a single white pixel at (117, 203) then Draws a cyan rectangle at (325, 112) with width 50 and height 70.
; PLAN: r0=248(x), r1=122(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x), r6=203(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=325(x), r11=112(y), r12=50(width), r13=70(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 122
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 203
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 325
LDI r11, 112
LDI r12, 50
LDI r13, 70
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
