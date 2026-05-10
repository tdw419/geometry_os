; DESCRIPTION: Composite: Draws a purple line from (240, 5) to (353, 142) then Renders a green box of size 36x114 starting at (469, 70) then Places a blue circle of radius 45 at center (296, 64).
; PLAN: r0=240(x1), r1=5(y1), r2=353(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=70(y), r7=36(width), r8=114(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=296(x), r11=64(y), r12=45(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 240
LDI r1, 5
LDI r2, 353
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 70
LDI r7, 36
LDI r8, 114
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 64
LDI r12, 45
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
