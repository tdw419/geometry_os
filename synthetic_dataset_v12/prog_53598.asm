; DESCRIPTION: Composite: Places a blue circle of radius 43 at center (259, 47) then Creates a red rectangular region at (185, 51) spanning 52 by 63 pixels then Draws a purple line from (44, 191) to (472, 172).
; PLAN: r0=259(x), r1=47(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=185(x), r6=51(y), r7=52(width), r8=63(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=44(x1), r11=191(y1), r12=472(x2), r13=172(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 47
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 185
LDI r6, 51
LDI r7, 52
LDI r8, 63
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 44
LDI r11, 191
LDI r12, 472
LDI r13, 172
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
