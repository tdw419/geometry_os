; DESCRIPTION: Composite: Places a purple line segment connecting (122, 51) to (255, 97) then Places a green 32x41 rectangle at position (340, 139) then Draws a blue circle centered at (334, 182) with radius 15.
; PLAN: r0=122(x1), r1=51(y1), r2=255(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=139(y), r7=32(width), r8=41(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=334(x), r11=182(y), r12=15(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 51
LDI r2, 255
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 139
LDI r7, 32
LDI r8, 41
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 182
LDI r12, 15
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
