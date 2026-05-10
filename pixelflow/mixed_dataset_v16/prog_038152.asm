; DESCRIPTION: Composite: Places a purple circle of radius 39 at center (73, 126) then Creates a black rectangular region at (166, 36) spanning 115 by 44 pixels then Places a yellow line segment connecting (347, 86) to (466, 173).
; PLAN: r0=73(x), r1=126(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x), r6=36(y), r7=115(width), r8=44(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=347(x1), r11=86(y1), r12=466(x2), r13=173(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 73
LDI r1, 126
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 36
LDI r7, 115
LDI r8, 44
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 86
LDI r12, 466
LDI r13, 173
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
