; DESCRIPTION: Composite: Sets a single red pixel at (203, 25) then Places a black line segment connecting (10, 254) to (379, 22) then Draws a black rectangle at (76, 10) with width 13 and height 103.
; PLAN: r0=203(x), r1=25(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=10(x1), r6=254(y1), r7=379(x2), r8=22(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=76(x), r11=10(y), r12=13(width), r13=103(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 203
LDI r1, 25
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 10
LDI r6, 254
LDI r7, 379
LDI r8, 22
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 10
LDI r12, 13
LDI r13, 103
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
