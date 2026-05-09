; DESCRIPTION: Composite: Places a purple line segment connecting (91, 128) to (464, 139) then Creates a blue rectangular region at (139, 99) spanning 41 by 86 pixels then Draws a cyan circle centered at (384, 203) with radius 50.
; PLAN: r0=91(x1), r1=128(y1), r2=464(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=99(y), r7=41(width), r8=86(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=384(x), r11=203(y), r12=50(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 91
LDI r1, 128
LDI r2, 464
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 99
LDI r7, 41
LDI r8, 86
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 384
LDI r11, 203
LDI r12, 50
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
