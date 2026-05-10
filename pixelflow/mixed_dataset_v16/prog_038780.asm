; DESCRIPTION: Composite: Draws a blue line from (256, 89) to (242, 74) then Creates a purple rectangular region at (152, 137) spanning 87 by 19 pixels then Creates a black circular shape at (287, 158) with radius 59.
; PLAN: r0=256(x1), r1=89(y1), r2=242(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=137(y), r7=87(width), r8=19(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=287(x), r11=158(y), r12=59(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 256
LDI r1, 89
LDI r2, 242
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 137
LDI r7, 87
LDI r8, 19
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 158
LDI r12, 59
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
