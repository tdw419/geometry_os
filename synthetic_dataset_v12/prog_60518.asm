; DESCRIPTION: Composite: Creates a cyan rectangular region at (241, 147) spanning 13 by 41 pixels then Places a black circle of radius 62 at center (70, 156) then Places a purple line segment connecting (307, 26) to (325, 91).
; PLAN: r0=241(x), r1=147(y), r2=13(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=70(x), r6=156(y), r7=62(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=307(x1), r11=26(y1), r12=325(x2), r13=91(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 147
LDI r2, 13
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 156
LDI r7, 62
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 307
LDI r11, 26
LDI r12, 325
LDI r13, 91
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
