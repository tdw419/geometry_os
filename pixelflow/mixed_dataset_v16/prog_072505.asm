; DESCRIPTION: Composite: Renders a white box of size 24x17 starting at (229, 215) then Renders a yellow disk with center (490, 77) and radius 21 then Draws a purple line from (84, 77) to (147, 201).
; PLAN: r0=229(x), r1=215(y), r2=24(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=77(y), r7=21(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=84(x1), r11=77(y1), r12=147(x2), r13=201(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 215
LDI r2, 24
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 77
LDI r7, 21
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 84
LDI r11, 77
LDI r12, 147
LDI r13, 201
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
