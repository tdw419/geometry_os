; DESCRIPTION: Composite: Renders a green box of size 91x118 starting at (341, 91) then Draws a blue circle centered at (119, 178) with radius 38 then Renders a green line between points (256, 50) and (449, 137).
; PLAN: r0=341(x), r1=91(y), r2=91(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x), r6=178(y), r7=38(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=256(x1), r11=50(y1), r12=449(x2), r13=137(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 91
LDI r2, 91
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 178
LDI r7, 38
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 256
LDI r11, 50
LDI r12, 449
LDI r13, 137
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
