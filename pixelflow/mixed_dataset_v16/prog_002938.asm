; DESCRIPTION: Composite: Creates a white circular shape at (229, 130) with radius 43 then Creates a cyan rectangular region at (424, 115) spanning 19 by 106 pixels then Places a blue line segment connecting (476, 163) to (176, 13).
; PLAN: r0=229(x), r1=130(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=424(x), r6=115(y), r7=19(width), r8=106(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=476(x1), r11=163(y1), r12=176(x2), r13=13(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 130
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 424
LDI r6, 115
LDI r7, 19
LDI r8, 106
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 476
LDI r11, 163
LDI r12, 176
LDI r13, 13
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
