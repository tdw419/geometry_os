; DESCRIPTION: Composite: Renders a purple line between points (253, 234) and (455, 36) then Creates a blue circular shape at (424, 110) with radius 73 then Renders a blue box of size 113x114 starting at (18, 135).
; PLAN: r0=253(x1), r1=234(y1), r2=455(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=110(y), r7=73(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=18(x), r11=135(y), r12=113(width), r13=114(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 234
LDI r2, 455
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 110
LDI r7, 73
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 18
LDI r11, 135
LDI r12, 113
LDI r13, 114
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
