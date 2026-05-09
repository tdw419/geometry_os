; DESCRIPTION: Composite: Renders a cyan disk with center (263, 91) and radius 65 then Creates a white rectangular region at (179, 59) spanning 88 by 101 pixels then Places a purple line segment connecting (479, 58) to (138, 3).
; PLAN: r0=263(x), r1=91(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x), r6=59(y), r7=88(width), r8=101(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=479(x1), r11=58(y1), r12=138(x2), r13=3(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 91
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 59
LDI r7, 88
LDI r8, 101
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 58
LDI r12, 138
LDI r13, 3
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
