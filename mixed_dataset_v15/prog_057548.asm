; DESCRIPTION: Composite: Places a purple 54x95 rectangle at position (137, 123) then Places a blue circle of radius 17 at center (206, 140) then Places a magenta line segment connecting (326, 251) to (347, 189).
; PLAN: r0=137(x), r1=123(y), r2=54(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=140(y), r7=17(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=326(x1), r11=251(y1), r12=347(x2), r13=189(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 137
LDI r1, 123
LDI r2, 54
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 140
LDI r7, 17
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 326
LDI r11, 251
LDI r12, 347
LDI r13, 189
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
