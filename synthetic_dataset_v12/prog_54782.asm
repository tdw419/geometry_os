; DESCRIPTION: Composite: Renders a green disk with center (239, 116) and radius 45 then Draws a red rectangle at (279, 103) with width 67 and height 71 then Places a purple line segment connecting (177, 23) to (505, 188).
; PLAN: r0=239(x), r1=116(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=103(y), r7=67(width), r8=71(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=177(x1), r11=23(y1), r12=505(x2), r13=188(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 239
LDI r1, 116
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 103
LDI r7, 67
LDI r8, 71
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 23
LDI r12, 505
LDI r13, 188
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
