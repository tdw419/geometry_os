; DESCRIPTION: Composite: Places a yellow line segment connecting (368, 160) to (394, 121) then Creates a purple rectangular region at (284, 41) spanning 89 by 37 pixels then Renders a green disk with center (147, 135) and radius 80.
; PLAN: r0=368(x1), r1=160(y1), r2=394(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=41(y), r7=89(width), r8=37(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=147(x), r11=135(y), r12=80(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 368
LDI r1, 160
LDI r2, 394
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 41
LDI r7, 89
LDI r8, 37
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 135
LDI r12, 80
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
